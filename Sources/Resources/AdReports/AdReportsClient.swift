import Foundation

public final class AdReportsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Performance report for a company, ad campaigns, ad groups, or ads. Always returns aggregate `summary` totals summed across the scope. Set `granularity` to additionally get a time series, or set `breakdown` (`campaign`/`ad_group`/`ad`) to additionally get per-entity rows inside the requested scope. Exactly one of `companyId`, `adCampaignIds`, `adGroupIds`, or `adIds` must be provided.
    ///
    /// Required permissions:
    ///  - `ad_campaign:stats:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adReports.retrieve(
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         from: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
    ///         to: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter adCampaignIds: Scope the report to these ad campaigns (max 100); stats are summed across them. Mutually exclusive with `companyId`, `adGroupIds`, and `adIds`.
    /// - Parameter adGroupIds: Scope the report to these ad groups (max 100); stats are summed across them. Mutually exclusive with `companyId`, `adCampaignIds`, and `adIds`.
    /// - Parameter adIds: Scope the report to these ads (max 100); stats are summed across them. Mutually exclusive with `companyId`, `adCampaignIds`, and `adGroupIds`.
    /// - Parameter companyId: The unique identifier of a company. Mutually exclusive with `adCampaignIds`, `adGroupIds`, and `adIds`. Use with `breakdown` to fan out across every campaign, ad group, or ad in the company without paging.
    /// - Parameter currency: ISO 4217 currency code to report `spend` in. Defaults to the company's ads reporting currency.
    /// - Parameter from: Inclusive start of the reporting window.
    /// - Parameter to: Inclusive end of the reporting window.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(adCampaignIds: [String]? = nil, adGroupIds: [String]? = nil, adIds: [String]? = nil, breakdown: AdReportBreakdownLevels? = nil, companyId: String? = nil, currency: String? = nil, from: Date, granularity: Granularities? = nil, to: Date, requestOptions: RequestOptions? = nil) async throws -> AdReport {
        return try await httpClient.performRequest(
            method: .get,
            path: "/ad_reports",
            queryParams: [
                "ad_campaign_ids": adCampaignIds.map { .stringArray($0) }, 
                "ad_group_ids": adGroupIds.map { .stringArray($0) }, 
                "ad_ids": adIds.map { .stringArray($0) }, 
                "breakdown": breakdown.map { .string($0.rawValue) }, 
                "company_id": companyId.map { .string($0) }, 
                "currency": currency.map { .string($0) }, 
                "from": .date(from), 
                "granularity": granularity.map { .string($0.rawValue) }, 
                "to": .date(to)
            ],
            requestOptions: requestOptions,
            responseType: AdReport.self
        )
    }
}