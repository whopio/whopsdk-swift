import Foundation

public final class AdsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Reports why one of a runner's ads or ad groups can't deliver yet, and replaces what the runner reported for it before. The account running the campaign sees each issue, with what to change when it can fix it. An empty `issues` list clears the object's issues, and they also clear when the runner stops holding the campaign. Takes the runner's Whop session, a user API key, or a user OAuth token with `ad_campaign:update`. A token without that scope gets a 403, and anyone not holding the whole campaign gets a 404.
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
    ///     _ = try await client.ads.reportIssues(request: .init(issues: [
    ///         ReportIssuesAdsRequestIssuesItem(
    ///             reason: .contentRejected
    ///         )
    ///     ]))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func reportIssues(request: Requests.ReportIssuesAdsRequest, requestOptions: RequestOptions? = nil) async throws -> ReportIssuesAdsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ad_issues",
            body: request,
            requestOptions: requestOptions,
            responseType: ReportIssuesAdsResponse.self
        )
    }

    /// Records a runner's stats for one of their ads in one hour, and pays them for the spend. Send the ad's totals so far for an hour that has started; they replace what the ad held for that hour, and its ad group's and campaign's hours are rebuilt from their ads. The spend can go up but never down. Hours before the runner's first report on the campaign can be reported too. The spend is recorded and paid exactly as sent, with no markup added, so send it with the runner's markup already applied. Takes the runner's Whop session, a user API key, or a user OAuth token with `ad_campaign:update`. A token without that scope gets a 403, and anyone not holding the ad's campaign gets a 404.
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
    ///     _ = try await client.ads.reportStats(request: .init(
    ///         adId: "ad_xxxxxxxxxxxxxx",
    ///         hourStartedAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
    ///         spend: ReportStatsAdsRequestSpend.double(
    ///             1.1
    ///         )
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func reportStats(request: Requests.ReportStatsAdsRequest, requestOptions: RequestOptions? = nil) async throws -> AdStat {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ad_stats",
            body: request,
            requestOptions: requestOptions,
            responseType: AdStat.self
        )
    }

    /// Lists the ads for an account, with stats over the requested window.
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
    ///     _ = try await client.ads.list(
    ///         adCampaignIds: [
    ///             "adcamp_xxxxxxxxxxxxxx"
    ///         ],
    ///         adGroupIds: [
    ///             "adgrp_xxxxxxxxxxxxxx"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The account the ads belong to. Defaults to the account-scoped key's own account.
    /// - Parameter adCampaignId: Only return ads in this ad campaign.
    /// - Parameter adCampaignIds: Only return ads in these ad campaigns (max 100). Repeat the parameter for each id (ad_campaign_ids=a&ad_campaign_ids=b).
    /// - Parameter adGroupId: Only return ads in this ad group.
    /// - Parameter adGroupIds: Only return ads in these ad groups (max 100). Repeat the parameter for each id (ad_group_ids=a&ad_group_ids=b).
    /// - Parameter status: Only return ads with this status.
    /// - Parameter query: Filter ads by a title or ID substring.
    /// - Parameter order: The field to sort by. Defaults to created_at. Stat columns (spend, impressions, …) rank over the stats_from/stats_to window across the whole list, not just the current page. results, cost_per_result and return_on_ad_spend rank by the same Whop pixel-attributed values the response reports, and link_clicks by the same Whop pixel page views.
    /// - Parameter direction: The sort direction. Defaults to desc.
    /// - Parameter createdBefore: Only return ads created before this timestamp.
    /// - Parameter createdAfter: Only return ads created after this timestamp.
    /// - Parameter statsFrom: Start of the stats window. Defaults to all-time.
    /// - Parameter statsTo: End of the stats window. Defaults to now.
    /// - Parameter timeZone: IANA timezone (e.g. America/New_York) the stats window is interpreted in. Bare stats_from/stats_to dates resolve to day boundaries on this clock. Defaults to UTC.
    /// - Parameter attributionModel: Attribution model the conversion stats count under (defaults to last_touch). Under both models a journey with any whop ad touch attributes to whop; the model picks which whop touch credits the entity and which non-whop source wins otherwise.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, adCampaignId: String? = nil, adCampaignIds: [String]? = nil, adGroupId: String? = nil, adGroupIds: [String]? = nil, status: ListAdsRequestStatus? = nil, query: String? = nil, order: ListAdsRequestOrder? = nil, direction: ListAdsRequestDirection? = nil, createdBefore: String? = nil, createdAfter: String? = nil, statsFrom: String? = nil, statsTo: String? = nil, timeZone: String? = nil, attributionModel: ListAdsRequestAttributionModel? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAdsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/ads",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "ad_campaign_id": adCampaignId.map { .string($0) }, 
                "ad_campaign_ids": adCampaignIds.map { .stringArray($0) }, 
                "ad_group_id": adGroupId.map { .string($0) }, 
                "ad_group_ids": adGroupIds.map { .stringArray($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "query": query.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "stats_from": statsFrom.map { .string($0) }, 
                "stats_to": statsTo.map { .string($0) }, 
                "time_zone": timeZone.map { .string($0) }, 
                "attribution_model": attributionModel.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListAdsResponse.self
        )
    }

    /// Creates an ad in an ad group. Any campaign status other than `draft` launches the campaign, which requires an ads payment method on the account.
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
    ///     _ = try await client.ads.create(request: .init())
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateAdsRequest, requestOptions: RequestOptions? = nil) async throws -> Ad {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ads",
            body: request,
            requestOptions: requestOptions,
            responseType: Ad.self
        )
    }

    /// Retrieves a single ad with stats over the requested window.
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
    ///     _ = try await client.ads.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad ID.
    /// - Parameter statsFrom: Start of the stats window.
    /// - Parameter statsTo: End of the stats window.
    /// - Parameter timeZone: IANA timezone the stats window is interpreted in. Defaults to UTC.
    /// - Parameter attributionModel: Attribution model the conversion stats count under (defaults to last_touch). Under both models a journey with any whop ad touch attributes to whop; the model picks which whop touch credits the entity and which non-whop source wins otherwise.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, statsFrom: String? = nil, statsTo: String? = nil, timeZone: String? = nil, attributionModel: RetrieveAdsRequestAttributionModel? = nil, requestOptions: RequestOptions? = nil) async throws -> Ad {
        return try await httpClient.performRequest(
            method: .get,
            path: "/ads/\(id)",
            queryParams: [
                "stats_from": statsFrom.map { .string($0) }, 
                "stats_to": statsTo.map { .string($0) }, 
                "time_zone": timeZone.map { .string($0) }, 
                "attribution_model": attributionModel.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: Ad.self
        )
    }

    /// Deletes an ad.
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
    ///     _ = try await client.ads.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteAdsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/ads/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteAdsResponse.self
        )
    }

    /// Updates an ad's editable fields.
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
    ///     _ = try await client.ads.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateAdsRequest, requestOptions: RequestOptions? = nil) async throws -> Ad {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/ads/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Ad.self
        )
    }

    /// Copies an ad into its own ad group or into another one. Copies keep the source ad's active or paused state.
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
    ///     _ = try await client.ads.duplicate(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func duplicate(id: String, request: Requests.DuplicateAdsRequest, requestOptions: RequestOptions? = nil) async throws -> DuplicateAdsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ads/\(id)/duplicate",
            body: request,
            requestOptions: requestOptions,
            responseType: DuplicateAdsResponse.self
        )
    }

    /// Pauses an active ad.
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
    ///     _ = try await client.ads.pause(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pause(id: String, requestOptions: RequestOptions? = nil) async throws -> Ad {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ads/\(id)/pause",
            requestOptions: requestOptions,
            responseType: Ad.self
        )
    }

    /// Resumes a paused ad.
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
    ///     _ = try await client.ads.unpause(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func unpause(id: String, requestOptions: RequestOptions? = nil) async throws -> Ad {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ads/\(id)/unpause",
            requestOptions: requestOptions,
            responseType: Ad.self
        )
    }
}