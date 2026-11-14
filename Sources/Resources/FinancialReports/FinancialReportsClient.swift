import Foundation

public final class FinancialReportsClient: Sendable {
    public let breakdown: BreakdownClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.breakdown = BreakdownClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a financial report — balance activity, income statement, or balance summary — for an account over a date range.
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
    ///     _ = try await client.financialReports.retrieve(
    ///         accountId: "account_id",
    ///         reportType: .balanceSummary
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The account that owns the report, prefixed `biz_`.
    /// - Parameter reportType: The type of financial report to generate.
    /// - Parameter currency: Filter rows to this currency, for example `usd`. Defaults to `usd` unless `in_currency` is provided.
    /// - Parameter inCurrency: Aggregate all activity into this display currency via FX conversion.
    /// - Parameter from: Start of the report window as an ISO 8601 timestamp.
    /// - Parameter to: Exclusive end of the report window as an ISO 8601 timestamp.
    /// - Parameter groupBy: Grouping granularity for report rows. Hourly grouping is supported for account-level balance activity reports only; hourly periods are timestamps in the requested timezone.
    /// - Parameter timezone: IANA timezone (for example `America/New_York`) used to bucket report periods. Defaults to UTC. `from` and `to` remain exact instants.
    /// - Parameter lineTypes: Account-level balance activity only: ledger line categories to include.
    /// - Parameter direction: Account-level balance activity only: include money moving in or money moving out.
    /// - Parameter includePaymentFeeBreakdown: Balance activity only: include payment costs grouped by payment method and provider.
    /// - Parameter periodOnlyCurrencies: Account-level balance activity only: return only currencies with cashflow in the exact requested window. Requires `from` and `to`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(accountId: String, reportType: RetrieveFinancialReportsRequestReportType, currency: String? = nil, inCurrency: String? = nil, from: Date? = nil, to: Date? = nil, groupBy: RetrieveFinancialReportsRequestGroupBy? = nil, timezone: String? = nil, lineTypes: [RetrieveFinancialReportsRequestLineTypesItem]? = nil, direction: RetrieveFinancialReportsRequestDirection? = nil, includePaymentFeeBreakdown: Bool? = nil, periodOnlyCurrencies: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> RetrieveFinancialReportsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/financial_reports",
            queryParams: [
                "account_id": .string(accountId), 
                "report_type": .string(reportType.rawValue), 
                "currency": currency.map { .string($0) }, 
                "in_currency": inCurrency.map { .string($0) }, 
                "from": from.map { .date($0) }, 
                "to": to.map { .date($0) }, 
                "group_by": groupBy.map { .string($0.rawValue) }, 
                "timezone": timezone.map { .string($0) }, 
                "line_types": lineTypes.map { .unknown($0) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "include_payment_fee_breakdown": includePaymentFeeBreakdown.map { .bool($0) }, 
                "period_only_currencies": periodOnlyCurrencies.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: RetrieveFinancialReportsResponse.self
        )
    }
}