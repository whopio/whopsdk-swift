import Foundation

public final class LedgersClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a financial report — balance activity, income statement, or balance summary — for an account over a date range.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.ledgers.getFinancialReport(
    ///         accountId: "account_id",
    ///         reportType: .balanceSummary
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The owning account ID (a biz_ identifier), or `global` for a platform-wide report across all ledger accounts (requires internal admin access).
    /// - Parameter reportType: The type of financial report to generate.
    /// - Parameter currency: Filter rows to this currency, for example `usd`. Defaults to `usd` unless `in_currency` is provided.
    /// - Parameter inCurrency: Aggregate all activity into this display currency via FX conversion.
    /// - Parameter fromDate: Start of the report window as an ISO 8601 timestamp (UTC). Required for platform-wide (global) reports.
    /// - Parameter toDate: End of the report window as an ISO 8601 timestamp (UTC). Required for platform-wide (global) reports.
    /// - Parameter groupBy: Grouping granularity for report rows.
    /// - Parameter timezone: IANA timezone (for example `America/New_York`) used to bucket report periods and to interpret calendar-day boundaries for balance snapshots. Defaults to UTC. from_date/to_date remain exact instants regardless of this setting.
    /// - Parameter cumulative: Platform-wide (global) reports only: when true, return cumulative balances as of to_date (all history, no lower bound) instead of activity within the period.
    /// - Parameter scopeAccountId: Platform-wide (global) reports only: narrow the report to ledger lines on the ledger account owned by this account ID (a biz_ identifier). Ignored unless account_id is `global`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getFinancialReport(accountId: String, reportType: GetFinancialReportRequestReportType, currency: String? = nil, inCurrency: String? = nil, fromDate: String? = nil, toDate: String? = nil, groupBy: GetFinancialReportRequestGroupBy? = nil, timezone: String? = nil, cumulative: Bool? = nil, scopeAccountId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> GetFinancialReportResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/financial_reports",
            queryParams: [
                "account_id": .string(accountId), 
                "report_type": .string(reportType.rawValue), 
                "currency": currency.map { .string($0) }, 
                "in_currency": inCurrency.map { .string($0) }, 
                "from_date": fromDate.map { .string($0) }, 
                "to_date": toDate.map { .string($0) }, 
                "group_by": groupBy.map { .string($0.rawValue) }, 
                "timezone": timezone.map { .string($0) }, 
                "cumulative": cumulative.map { .bool($0) }, 
                "scope_account_id": scopeAccountId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: GetFinancialReportResponse.self
        )
    }
}