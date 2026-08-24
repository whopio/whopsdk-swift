import Foundation

final class HTTPClient: Swift.Sendable {
    private let clientConfig: ClientConfig
    private let jsonEncoder = Serde.jsonEncoder
    private let jsonDecoder = Serde.jsonDecoder

    private static let initialRetryDelay: Foundation.TimeInterval = 1.0  // 1 second
    private static let maxRetryDelay: Foundation.TimeInterval = 60.0  // 60 seconds
    private static let jitterFactor: Swift.Double = 0.2  // 20% jitter

    private static let apiVersionDateHeader = "Api-Version-Date"

    /// The newest Api-Version-Date this SDK was generated against.
    ///
    /// Read off a generated enum rather than written down, so a regeneration carries it
    /// forward on its own and it can never drift from the models in the same tree. An
    /// unversioned request is served the API's OLDEST contract, which no generated model
    /// matches, so the SDK has to send one.
    private static let generatedAgainstApiVersionDate: Swift.String? =
        ApiKeyApiVersionDate.allCases.last?.rawValue

    private static let platformHeaders: [Swift.String: Swift.String] = [
        "User-Agent": "WhopSDK/\(sdkVersion) (Swift)",
        "X-Fern-Language": "Swift",
        "X-Fern-SDK-Name": "WhopSDK",
        "X-Fern-SDK-Version": sdkVersion,
    ]

    init(config: ClientConfig) {
        self.clientConfig = config
    }

    /// Performs a request with no response.
    func performRequest(
        method: HTTP.Method,
        path: Swift.String,
        contentType requestContentType: HTTP.ContentType = .applicationJson,
        headers requestHeaders: [Swift.String: Swift.String?] = [:],
        queryParams requestQueryParams: [Swift.String: QueryParameter?] = [:],
        body requestBody: Any? = nil,
        requestOptions: RequestOptions? = nil
    ) async throws {
        _ = try await performRequest(
            method: method,
            path: path,
            contentType: requestContentType,
            headers: requestHeaders,
            queryParams: requestQueryParams,
            body: requestBody,
            requestOptions: requestOptions,
            responseType: Foundation.Data.self
        )
    }

    /// Performs a request with the specified response type.
    func performRequest<T: Swift.Decodable>(
        method: HTTP.Method,
        path: Swift.String,
        contentType requestContentType: HTTP.ContentType = .applicationJson,
        headers requestHeaders: [Swift.String: Swift.String?] = [:],
        queryParams requestQueryParams: [Swift.String: QueryParameter?] = [:],
        body requestBody: Any? = nil,
        requestOptions: RequestOptions? = nil,
        responseType: T.Type
    ) async throws -> T {
        let requestBody: HTTP.RequestBody? = requestBody.map { body in
            if let multipartData = body as? MultipartFormData {
                return .multipartFormData(multipartData)
            } else if let data = body as? Foundation.Data {
                return .data(data)
            } else if let encodable = body as? any Swift.Encodable {
                return .jsonEncodable(encodable)
            } else {
                preconditionFailure("Unsupported body type: \(type(of: body))")
            }
        }

        let request = try await buildRequest(
            method: method,
            path: path,
            requestContentType: requestContentType,
            requestHeaders: requestHeaders,
            requestQueryParams: requestQueryParams,
            requestBody: requestBody,
            requestOptions: requestOptions
        )

        let (data, _) = try await executeRequestWithURLSession(
            request,
            requestOptions: requestOptions
        )

        if responseType == Foundation.Data.self {
            if let data = data as? T {
                return data
            } else {
                throw WhopSDKError.invalidResponse
            }
        }

        if responseType == Swift.String.self {
            if let string = Swift.String(data: data, encoding: .utf8) as? T {
                return string
            } else {
                throw WhopSDKError.invalidResponse
            }
        }

        do {
            return try jsonDecoder.decode(responseType, from: data)
        } catch {
            throw WhopSDKError.decodingError(error)
        }
    }

    private func buildRequest(
        method: HTTP.Method,
        path: Swift.String,
        requestContentType: HTTP.ContentType,
        requestHeaders: [Swift.String: Swift.String?],
        requestQueryParams: [Swift.String: QueryParameter?],
        requestBody: HTTP.RequestBody? = nil,
        requestOptions: RequestOptions? = nil
    ) async throws -> Networking.URLRequest {
        // Init with URL
        let url = buildRequestURL(
            path: path, requestQueryParams: requestQueryParams, requestOptions: requestOptions
        )
        var request = Networking.URLRequest(url: url)

        // Set timeout
        if let timeout = requestOptions?.timeout {
            request.timeoutInterval = Foundation.TimeInterval(timeout)
        }

        // Set method
        request.httpMethod = method.rawValue

        // Set headers
        let headers = try await buildRequestHeaders(
            requestBody: requestBody,
            requestContentType: requestContentType,
            requestHeaders: requestHeaders,
            requestOptions: requestOptions
        )
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }

        // Set body
        if let requestBody = requestBody {
            request.httpBody = buildRequestBody(
                requestBody: requestBody,
                requestOptions: requestOptions
            )
        }

        return request
    }

    private func buildRequestURL(
        path: Swift.String,
        requestQueryParams: [Swift.String: QueryParameter?],
        requestOptions: RequestOptions? = nil
    ) -> URL {
        let endpointURL = "\(clientConfig.baseURL)\(path)"
        guard var components = Foundation.URLComponents(string: endpointURL) else {
            preconditionFailure(
                "Invalid URL '\(endpointURL)' - this indicates an unexpected error in the SDK."
            )
        }
        if !requestQueryParams.isEmpty {
            let baseItems: [Foundation.URLQueryItem] = requestQueryParams.sorted {
                $0.key < $1.key
            }.flatMap { key, value -> [Foundation.URLQueryItem] in
                guard let unwrapped = value else { return [] }
                // An array filter has to reach the server as repeated bare keys.
                // QueryParameter.toString() renders `.stringArray` as one comma-joined
                // value, which is lossy the moment a value can itself contain a comma.
                if case .stringArray(let values) = unwrapped {
                    return values.filter { !$0.isEmpty }.map {
                        Foundation.URLQueryItem(name: key, value: $0)
                    }
                }
                let stringValue = unwrapped.toString()
                guard !stringValue.isEmpty else { return [] }
                return [Foundation.URLQueryItem(name: key, value: stringValue)]
            }
            if !baseItems.isEmpty {
                components.queryItems = baseItems
            }
        }
        if let additionalQueryParams = requestOptions?.additionalQueryParameters {
            let extraItems = additionalQueryParams.compactMap { key, value in
                value.isEmpty ? nil : Foundation.URLQueryItem(name: key, value: value)
            }
            if components.queryItems == nil {
                components.queryItems = extraItems
            } else {
                components.queryItems?.append(contentsOf: extraItems)
            }
        }
        guard let url = components.url else {
            preconditionFailure(
                "Failed to construct URL from components - this indicates an unexpected error in the SDK."
            )
        }
        return url
    }

    private func buildRequestHeaders(
        requestBody: HTTP.RequestBody?,
        requestContentType: HTTP.ContentType,
        requestHeaders: [Swift.String: Swift.String?],
        requestOptions: RequestOptions? = nil
    ) async throws -> [Swift.String: Swift.String] {
        var headers = Self.platformHeaders
        if let generatedAgainst = Self.generatedAgainstApiVersionDate {
            headers[Self.apiVersionDateHeader] = generatedAgainst
        }
        for (key, value) in clientConfig.headers ?? [:] {
            headers[key] = value
        }

        headers["Content-Type"] = buildContentTypeHeader(
            requestBody: requestBody,
            requestContentType: requestContentType
        )

        if let headerAuth = clientConfig.headerAuth {
            headers[headerAuth.header] = requestOptions?.apiKey ?? headerAuth.key
        }
        if let basicAuthToken = clientConfig.basicAuth?.token {
            headers["Authorization"] = "Basic \(basicAuthToken)"
        }
        if let bearerAuthToken = try await getBearerAuthToken(requestOptions) {
            headers["Authorization"] = "Bearer \(bearerAuthToken)"
        }
        for (key, value) in requestHeaders {
            if let value = value {
                headers[key] = value
            }
        }
        for (key, value) in requestOptions?.additionalHeaders ?? [:] {
            headers[key] = value
        }

        return headers
    }

    private func buildContentTypeHeader(
        requestBody: HTTP.RequestBody?,
        requestContentType: HTTP.ContentType,
    ) -> Swift.String {
        var contentType = requestContentType.rawValue
        if let requestBody, case .multipartFormData(let multipartData) = requestBody {
            if contentType != HTTP.ContentType.multipartFormData.rawValue {
                preconditionFailure(
                    "The content type for multipart form data requests must be multipart/form-data - this indicates an unexpected error in the SDK."
                )
            }
            // Multipart form data content type must include the boundary
            contentType = "\(contentType); boundary=\(multipartData.boundary)"
        }
        return contentType
    }

    private func getBearerAuthToken(_ requestOptions: RequestOptions?) async throws -> Swift.String?
    {
        if let tokenString = requestOptions?.token {
            return tokenString
        }
        if let bearerAuth = clientConfig.bearerAuth {
            return try await bearerAuth.token.retrieve()
        }
        return nil
    }

    private func buildRequestBody(
        requestBody: HTTP.RequestBody,
        requestOptions: RequestOptions? = nil
    ) -> Foundation.Data {
        switch requestBody {
        case .jsonEncodable(let encodableBody):
            do {
                let encoded = try jsonEncoder.encode(encodableBody)
                guard let additional = requestOptions?.additionalBodyParameters,
                    !additional.isEmpty
                else {
                    return encoded
                }
                return merging(additional, into: encoded)
            } catch {
                preconditionFailure(
                    "Failed to encode request body: \(error) - this indicates an unexpected error in the SDK."
                )
            }
        case .data(let dataBody):
            return dataBody
        case .multipartFormData(let multipartData):
            return multipartData.data()
        }
    }

    private func merging(
        _ additional: [Swift.String: Swift.String], into encoded: Foundation.Data
    ) -> Foundation.Data {
        guard
            var object = (try? Foundation.JSONSerialization.jsonObject(with: encoded))
                as? [Swift.String: Any]
        else {
            return encoded
        }
        for (key, value) in additional {
            object[key] = value
        }
        guard
            let merged = try? Foundation.JSONSerialization.data(
                withJSONObject: object, options: [.sortedKeys])
        else {
            return encoded
        }
        return merged
    }

    private func executeRequestWithURLSession(
        _ request: Networking.URLRequest,
        requestOptions: RequestOptions? = nil
    ) async throws -> (Foundation.Data, Swift.String?) {
        let maxRetries = requestOptions?.maxRetries ?? clientConfig.maxRetries
        var lastResponse: (Foundation.Data, Networking.HTTPURLResponse)?

        for attempt in 0...maxRetries {
            do {
                let (data, response) = try await clientConfig.urlSession.data(for: request)

                guard let httpResponse = response as? Networking.HTTPURLResponse else {
                    throw WhopSDKError.invalidResponse
                }

                // Handle successful responses
                if 200...299 ~= httpResponse.statusCode {
                    let contentType = httpResponse.value(forHTTPHeaderField: "Content-Type")
                    return (data, contentType)
                }

                lastResponse = (data, httpResponse)

                if attempt < maxRetries && shouldRetry(statusCode: httpResponse.statusCode) {
                    let delay = getRetryDelay(response: httpResponse, retryAttempt: attempt)
                    try await sleepBetweenRetries(seconds: delay)
                    continue
                }

                throw makeErrorFromResponse(
                    statusCode: httpResponse.statusCode,
                    data: data
                )
            } catch {
                // Cancellation is the caller's own decision, so it is never retried and
                // always leaves through WhopSDKError. Without this it escapes as
                // URLError.cancelled wrapped in .networkError on the last attempt and as a
                // bare CancellationError out of the retry sleep on every earlier one, so
                // what a caller catches depends on maxRetries.
                if Self.isCancellation(error) {
                    throw WhopSDKError.networkError(error)
                }

                let clientError: WhopSDKError?

                // Treat timeouts as a first-class, non-retryable error
                if let urlError = error as? Foundation.URLError, urlError.code == .timedOut {
                    clientError = .timeout(error)
                } else if let existingClientError = error as? WhopSDKError {
                    clientError = existingClientError
                } else {
                    clientError = nil
                }

                if attempt >= maxRetries || clientError != nil {
                    if let clientError {
                        throw clientError
                    } else {
                        throw WhopSDKError.networkError(error)
                    }
                }
                let delay = Self.initialRetryDelay * pow(2.0, Swift.Double(attempt))
                let cappedDelay = min(delay, Self.maxRetryDelay)
                try await sleepBetweenRetries(seconds: addSymmetricJitter(to: cappedDelay))
            }
        }

        if let (data, httpResponse) = lastResponse {
            throw makeErrorFromResponse(statusCode: httpResponse.statusCode, data: data)
        }
        throw WhopSDKError.invalidResponse
    }

    private static func isCancellation(_ error: Swift.Error) -> Swift.Bool {
        if error is _Concurrency.CancellationError {
            return true
        }
        if let urlError = error as? Foundation.URLError, urlError.code == .cancelled {
            return true
        }
        return false
    }

    private func sleepBetweenRetries(seconds: Foundation.TimeInterval) async throws {
        do {
            try await _Concurrency.Task.sleep(nanoseconds: Swift.UInt64(seconds * 1_000_000_000))
        } catch {
            throw WhopSDKError.networkError(error)
        }
    }

    private func shouldRetry(statusCode: Swift.Int) -> Swift.Bool {
        return statusCode == 408 || statusCode == 429 || statusCode >= 500
    }

    private func getRetryDelay(response: Networking.HTTPURLResponse, retryAttempt: Swift.Int)
        -> Foundation.TimeInterval
    {
        if let retryAfter = response.value(forHTTPHeaderField: "Retry-After") {
            if let seconds = Swift.Double(retryAfter), seconds > 0 {
                return min(seconds, Self.maxRetryDelay)
            }

            if let date = parseHTTPDate(retryAfter) {
                let delay = date.timeIntervalSinceNow
                if delay > 0 {
                    return min(delay, Self.maxRetryDelay)
                }
            }
        }

        if let rateLimitReset = response.value(forHTTPHeaderField: "X-RateLimit-Reset") {
            if let resetTimeSeconds = Swift.Double(rateLimitReset) {
                let resetDate = Foundation.Date(timeIntervalSince1970: resetTimeSeconds)
                let delay = resetDate.timeIntervalSinceNow
                if delay > 0 {
                    let cappedDelay = min(delay, Self.maxRetryDelay)
                    return addPositiveJitter(to: cappedDelay)
                }
            }
        }

        let baseDelay = Self.initialRetryDelay * pow(2.0, Swift.Double(retryAttempt))
        let cappedDelay = min(baseDelay, Self.maxRetryDelay)
        return addSymmetricJitter(to: cappedDelay)
    }

    private func parseHTTPDate(_ dateString: Swift.String) -> Foundation.Date? {
        let formatter = Foundation.DateFormatter()
        formatter.locale = Foundation.Locale(identifier: "en_US_POSIX")
        formatter.timeZone = Foundation.TimeZone(abbreviation: "GMT")
        formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
        return formatter.date(from: dateString)
    }

    private func addPositiveJitter(to delay: Foundation.TimeInterval) -> Foundation.TimeInterval {
        let jitterMultiplier = 1.0 + Swift.Double.random(in: 0...Self.jitterFactor)
        return delay * jitterMultiplier
    }

    private func addSymmetricJitter(to delay: Foundation.TimeInterval) -> Foundation.TimeInterval {
        let jitterMultiplier =
            1.0 + Swift.Double.random(in: -Self.jitterFactor / 2...Self.jitterFactor / 2)
        return delay * jitterMultiplier
    }

    private func makeErrorFromResponse(statusCode: Swift.Int, data: Foundation.Data) -> WhopSDKError
    {
        let httpError = HTTPError.from(
            statusCode: statusCode,
            data: data,
            jsonDecoder: jsonDecoder
        )
        return WhopSDKError.httpError(httpError)
    }
}
