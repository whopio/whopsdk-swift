import Foundation

public final class AdPixelsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List the pixels you added for businesses whose campaigns you claimed.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.adPixels.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only return the pixels for this business, prefixed `biz_`.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListAdPixelsRequestOrder? = nil, direction: ListAdPixelsRequestDirection? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAdPixelsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/ad_pixels",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListAdPixelsResponse.self
        )
    }

    /// Add your pixel for a business whose campaigns you claimed. Whop checks the access token with the ad platform, then sends the pixel the conversions credited to your claimed campaigns for that business. Each business takes one pixel per ad platform, and each pixel can serve one business. On Google, the pixel is your Google Ads account, which can serve several businesses, and Whop creates its conversion actions there with your service account key.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.adPixels.create(request: .init(
    ///         accessToken: "new-token",
    ///         accountId: "biz_xxxxxxxxxxxxxx",
    ///         externalId: "998877665544",
    ///         platform: .meta
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateAdPixelsRequest, requestOptions: RequestOptions? = nil) async throws -> AdPixel {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ad_pixels",
            body: request,
            requestOptions: requestOptions,
            responseType: AdPixel.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.adPixels.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Ad pixel ID, prefixed `adpx_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> AdPixel {
        return try await httpClient.performRequest(
            method: .get,
            path: "/ad_pixels/\(id)",
            requestOptions: requestOptions,
            responseType: AdPixel.self
        )
    }

    /// Remove the pixel and its access token. Whop stops sending it conversions.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.adPixels.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Ad pixel ID, prefixed `adpx_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteAdPixelsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/ad_pixels/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteAdPixelsResponse.self
        )
    }

    /// Replace the pixel's access token. Whop checks the new token with the ad platform and resumes deliveries to an `errored` pixel.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.adPixels.update(
    ///         id: "id",
    ///         request: .init(accessToken: "new-token")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Ad pixel ID, prefixed `adpx_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateAdPixelsRequest, requestOptions: RequestOptions? = nil) async throws -> AdPixel {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/ad_pixels/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: AdPixel.self
        )
    }
}