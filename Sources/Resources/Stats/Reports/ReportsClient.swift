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

    /// Retrieves payments across all of Whop for up to four windows at once. Pass `breakdown_by` to split them by business type, industry type, product category, account country or customer country. The report covers the whole platform, so it takes no `account_id`. Only users with Trends access can read it, from whop.com, the Whop apps, the Whop CLI or the Whop MCP.
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
    ///     _ = try await client.stats.reports.platformTrends()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter breakdownBy: What each row is. Omit it for one row per window, holding the window's total.
    /// - Parameter columns: Comma-separated properties and metrics to return on each row. `business_type` can ride along on `industry_type` rows. Defaults to `gross_revenue,businesses`.
    /// - Parameter windows: Comma-separated windows, at most four: `1d`, `7d`, `30d`, `90d`, `365d`, `mtd`, `qtd`, `ytd`, `all_time`, an explicit `2026-09-01..2026-10-01`, any of these prefixed `prev:` for the equal-length period before, or suffixed `@2026-09-01` to end earlier. Defaults to `30d`.
    /// - Parameter timeZone: IANA zone that day, month, quarter and year boundaries fall in. Defaults to `Etc/UTC`.
    /// - Parameter order: The requested metric that ranks rows, by its value in the first window. Defaults to the first requested metric.
    /// - Parameter direction: Ranking direction. Defaults to `desc`.
    /// - Parameter convertTo: Currency every money metric is converted into. Defaults to `usd`.
    /// - Parameter businessType: Only counts payments to businesses of these comma-separated business types, such as `education`.
    /// - Parameter industryType: Only counts payments to businesses in these comma-separated industry types, such as `options_trading`.
    /// - Parameter productCategory: Only counts payments for products in these comma-separated product categories, such as `algo_trading_course`.
    /// - Parameter accountCountry: Only counts payments to accounts located in these comma-separated countries, as ISO 3166-1 alpha-2 codes such as `US`.
    /// - Parameter customerCountry: Only counts payments from customers in these comma-separated countries, as ISO 3166-1 alpha-2 codes such as `US`.
    /// - Parameter blueprint: Only counts payments to businesses with an app created from one of these comma-separated blueprint app IDs, such as `app_xxxxxxxxxxxxxx`.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func platformTrends(breakdownBy: PlatformTrendsReportsRequestBreakdownBy? = nil, columns: String? = nil, windows: String? = nil, timeZone: String? = nil, order: PlatformTrendsReportsRequestOrder? = nil, direction: PlatformTrendsReportsRequestDirection? = nil, convertTo: String? = nil, businessType: String? = nil, industryType: String? = nil, productCategory: String? = nil, accountCountry: String? = nil, customerCountry: String? = nil, blueprint: String? = nil, first: Int? = nil, after: String? = nil, requestOptions: RequestOptions? = nil) async throws -> PlatformTrendsReportsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/stats/reports/platform_trends",
            queryParams: [
                "breakdown_by": breakdownBy.map { .string($0.rawValue) }, 
                "columns": columns.map { .string($0) }, 
                "windows": windows.map { .string($0) }, 
                "time_zone": timeZone.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "convert_to": convertTo.map { .string($0) }, 
                "business_type": businessType.map { .string($0) }, 
                "industry_type": industryType.map { .string($0) }, 
                "product_category": productCategory.map { .string($0) }, 
                "account_country": accountCountry.map { .string($0) }, 
                "customer_country": customerCountry.map { .string($0) }, 
                "blueprint": blueprint.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: PlatformTrendsReportsResponse.self
        )
    }
}