import Foundation

public final class ReportsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists every report: the aggregates that are not bucketed over time, with the breakdowns and columns each one accepts. Use it to discover what a report can return before you retrieve it. For a bucketed series, use `GET /stats/time_series`.
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
    ///     _ = try await client.stats.reports.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(requestOptions: RequestOptions? = nil) async throws -> ListReportsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/stats/reports",
            requestOptions: requestOptions,
            responseType: ListReportsResponse.self
        )
    }
}