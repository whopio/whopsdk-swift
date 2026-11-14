import Foundation

public final class ApiLogsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the requests served by Whop's API with the account's API keys, newest first — every surface (GraphQL, REST, and native /api/v1), reads and failed requests included.
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
    ///     _ = try await client.apiLogs.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The account (biz_*) whose API logs to list. Defaults to the authenticated account.
    /// - Parameter createdAfter: Only return requests served at or after this ISO 8601 timestamp. Defaults to 7 days before created_before, or 7 days ago.
    /// - Parameter createdBefore: Only return requests served before this ISO 8601 timestamp.
    /// - Parameter operationName: Only return requests for this operation, matched exactly against the operation_name shown on each log row (for example api/v1/products#create).
    /// - Parameter httpMethod: Only return requests made with this HTTP method.
    /// - Parameter status: Only return requests that finished with this status.
    /// - Parameter apiKeyId: Only return requests made with this API key (apik_…).
    /// - Parameter minDurationMs: Only return requests that took at least this many milliseconds.
    /// - Parameter maxDurationMs: Only return requests that took at most this many milliseconds.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, createdAfter: String? = nil, createdBefore: String? = nil, operationName: String? = nil, httpMethod: ListApiLogsRequestHttpMethod? = nil, status: ListApiLogsRequestStatus? = nil, apiKeyId: String? = nil, minDurationMs: Int? = nil, maxDurationMs: Int? = nil, first: Int? = nil, after: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListApiLogsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api_logs",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "operation_name": operationName.map { .string($0) }, 
                "http_method": httpMethod.map { .string($0.rawValue) }, 
                "status": status.map { .string($0.rawValue) }, 
                "api_key_id": apiKeyId.map { .string($0) }, 
                "min_duration_ms": minDurationMs.map { .int($0) }, 
                "max_duration_ms": maxDurationMs.map { .int($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListApiLogsResponse.self
        )
    }
}