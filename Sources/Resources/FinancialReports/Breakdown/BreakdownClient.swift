import Foundation

public final class BreakdownClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Breaks one bucket of a financial report, such as payments received or card spend, into the customers, accounts, merchants, or campaigns that contributed most, with the rest summed as a remainder. Use it to explain a total from `GET /financial_reports`.
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
    ///     _ = try await client.financialReports.breakdown.retrieve(
    ///         accountId: "account_id",
    ///         bucket: .transfers,
    ///         direction: .moneyIn,
    ///         currency: "currency",
    ///         from: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
    ///         to: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The owning account ID (a biz_ identifier).
    /// - Parameter bucket: The high-level report bucket to explain.
    /// - Parameter direction: Whether to explain money received or money sent.
    /// - Parameter currency: The report currency to explain.
    /// - Parameter from: Start of the report window as an ISO 8601 timestamp.
    /// - Parameter to: Exclusive end of the report window as an ISO 8601 timestamp.
    /// - Parameter groupBy: Period grouping used by the parent report.
    /// - Parameter timezone: IANA timezone used by the parent report to bucket periods. Defaults to UTC.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(accountId: String, bucket: RetrieveBreakdownRequestBucket, direction: RetrieveBreakdownRequestDirection, currency: String, from: Date, to: Date, groupBy: RetrieveBreakdownRequestGroupBy? = nil, timezone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> RetrieveBreakdownResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/financial_reports/breakdown",
            queryParams: [
                "account_id": .string(accountId), 
                "bucket": .string(bucket.rawValue), 
                "direction": .string(direction.rawValue), 
                "currency": .string(currency), 
                "from": .date(from), 
                "to": .date(to), 
                "group_by": groupBy.map { .string($0.rawValue) }, 
                "timezone": timezone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: RetrieveBreakdownResponse.self
        )
    }
}