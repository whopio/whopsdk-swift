import Foundation

public final class LogsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists activity for a member and all of their non-drafted memberships, most recent first.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.members.logs.list(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Member ID (`mber_` tag).
    /// - Parameter first: Number of log entries to return from the start of the window.
    /// - Parameter after: Cursor to paginate forwards from.
    /// - Parameter last: Number of log entries to return from the end of the window.
    /// - Parameter before: Cursor to paginate backwards from.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(id: String, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListLogsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/members/\(id)/logs",
            queryParams: [
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListLogsResponse.self
        )
    }
}