import Foundation

public final class AdGroupsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists ad groups for the account, newest first.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adGroups.list(adCampaignIds: [
    ///         "adcamp_xxxxxxxxxxxxxx"
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account whose ad groups to list. Defaults to the authenticated account.
    /// - Parameter adCampaignId: Filter to ad groups in this campaign.
    /// - Parameter adCampaignIds: Filter to ad groups in these campaigns (max 100). Repeat the parameter for each id (ad_campaign_ids=a&ad_campaign_ids=b).
    /// - Parameter status: Filter to ad groups with this status.
    /// - Parameter query: Filter ad groups by a title or ID substring.
    /// - Parameter order: The field to sort by. Defaults to created_at. Stat columns (spend, impressions, …) rank over the stats_from/stats_to window across the whole list, not just the current page. results, cost_per_result and return_on_ad_spend rank by the same Whop pixel-attributed values the response reports.
    /// - Parameter direction: The sort direction. Defaults to desc.
    /// - Parameter createdBefore: Only return ad groups created before this timestamp.
    /// - Parameter createdAfter: Only return ad groups created after this timestamp.
    /// - Parameter statsFrom: Start of the stats window. Defaults to all-time.
    /// - Parameter statsTo: End of the stats window. Defaults to now.
    /// - Parameter timeZone: IANA timezone (e.g. America/New_York) the stats window is interpreted in. Bare stats_from/stats_to dates resolve to day boundaries on this clock. Defaults to UTC.
    /// - Parameter attributionModel: Attribution model the conversion stats count under (defaults to last_touch). Under both models a journey with any whop ad touch attributes to whop; the model picks which whop touch credits the entity and which non-whop source wins otherwise.
    /// - Parameter first: The number of ad groups to return.
    /// - Parameter after: Cursor to fetch the page after (from page_info.end_cursor).
    /// - Parameter last: The number of ad groups to return from the end of the range.
    /// - Parameter before: Cursor to fetch the page before (from page_info.start_cursor).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, adCampaignId: String? = nil, adCampaignIds: [String]? = nil, status: ListAdGroupsRequestStatus? = nil, query: String? = nil, order: ListAdGroupsRequestOrder? = nil, direction: ListAdGroupsRequestDirection? = nil, createdBefore: String? = nil, createdAfter: String? = nil, statsFrom: String? = nil, statsTo: String? = nil, timeZone: String? = nil, attributionModel: ListAdGroupsRequestAttributionModel? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAdGroupsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/ad_groups",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "ad_campaign_id": adCampaignId.map { .string($0) }, 
                "ad_campaign_ids": adCampaignIds.map { .stringArray($0) }, 
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
            responseType: ListAdGroupsResponse.self
        )
    }

    /// Creates an ad group (ad set) in a campaign.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adGroups.create(request: .init(adCampaignId: "adcamp_xxxxxxxxxxxxxx"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateAdGroupsRequest, requestOptions: RequestOptions? = nil) async throws -> AdGroup {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ad_groups",
            body: request,
            requestOptions: requestOptions,
            responseType: AdGroup.self
        )
    }

    /// Estimates how many people a draft targeting spec can reach, before an ad group is created. The body takes the same targeting fields as creating an ad group — `regions`, `demographics`, `detailed_targeting`, `audiences`, `languages`, and `devices` — and nothing is persisted.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adGroups.estimateReach(request: .init(platform: .meta))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func estimateReach(request: Requests.EstimateReachAdGroupsRequest, requestOptions: RequestOptions? = nil) async throws -> ReachEstimate {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ad_groups/estimate_reach",
            body: request,
            requestOptions: requestOptions,
            responseType: ReachEstimate.self
        )
    }

    /// Searches the ad platform's targeting taxonomy for options to target an ad group with. Each result comes back in the exact shape the ad-group body accepts for its `type`, so it can be used in `detailed_targeting`, `regions`, or `languages` as-is. A blank `query` browses the small fixed lists (behaviors, browse demographic categories, languages); interests, work employers, job titles, schools, majors, and locations need a search term.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adGroups.searchTargetingOptions(platform: .meta)
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account to search on behalf of. Defaults to the authenticated account.
    /// - Parameter platform: The ad network whose targeting taxonomy to search.
    /// - Parameter query: The search term. Blank browses the fixed lists; interests, work employers, job titles, schools, majors, and locations return nothing without one.
    /// - Parameter types: Kinds of targeting options to search. Defaults to all of them.
    /// - Parameter locationTypes: Narrow location results to these kinds of places. Only applies when `types` includes `locations`.
    /// - Parameter country: Narrow location results to one country, as an ISO 3166-1 code such as `US`. Only applies when `types` includes `locations`.
    /// - Parameter limit: Maximum number of results per requested type.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func searchTargetingOptions(accountId: String? = nil, platform: SearchTargetingOptionsAdGroupsRequestPlatform, query: String? = nil, types: [SearchTargetingOptionsAdGroupsRequestTypesItem]? = nil, locationTypes: [SearchTargetingOptionsAdGroupsRequestLocationTypesItem]? = nil, country: String? = nil, limit: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> SearchTargetingOptionsAdGroupsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/ad_groups/targeting_options",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "platform": .string(platform.rawValue), 
                "query": query.map { .string($0) }, 
                "types": types.map { .unknown($0) }, 
                "location_types": locationTypes.map { .unknown($0) }, 
                "country": country.map { .string($0) }, 
                "limit": limit.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: SearchTargetingOptionsAdGroupsResponse.self
        )
    }

    /// Retrieves a single ad group.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adGroups.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad group ID.
    /// - Parameter statsFrom: Start of the stats window.
    /// - Parameter statsTo: End of the stats window.
    /// - Parameter timeZone: IANA timezone the stats window is interpreted in. Defaults to UTC.
    /// - Parameter attributionModel: Attribution model the conversion stats count under (defaults to last_touch). Under both models a journey with any whop ad touch attributes to whop; the model picks which whop touch credits the entity and which non-whop source wins otherwise.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, statsFrom: String? = nil, statsTo: String? = nil, timeZone: String? = nil, attributionModel: RetrieveAdGroupsRequestAttributionModel? = nil, requestOptions: RequestOptions? = nil) async throws -> AdGroup {
        return try await httpClient.performRequest(
            method: .get,
            path: "/ad_groups/\(id)",
            queryParams: [
                "stats_from": statsFrom.map { .string($0) }, 
                "stats_to": statsTo.map { .string($0) }, 
                "time_zone": timeZone.map { .string($0) }, 
                "attribution_model": attributionModel.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: AdGroup.self
        )
    }

    /// Deletes an ad group.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adGroups.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad group ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteAdGroupsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/ad_groups/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteAdGroupsResponse.self
        )
    }

    /// Updates an ad group's editable fields. Only the keys you send are changed.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adGroups.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad group ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateAdGroupsRequest, requestOptions: RequestOptions? = nil) async throws -> AdGroup {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/ad_groups/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: AdGroup.self
        )
    }

    /// Creates copies of the ad group in `duplicating` status and returns them — into its own campaign, or into target_ad_campaign_id (which must belong to the same account and be compatible with the ad group's targeting and goals); each copy transitions to its final status (matching the source's active/paused state) once duplication completes. Poll each returned ad group until it leaves `duplicating` — a copy that could not be completed is deleted and returns 404.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adGroups.duplicate(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad group ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func duplicate(id: String, request: Requests.DuplicateAdGroupsRequest, requestOptions: RequestOptions? = nil) async throws -> DuplicateAdGroupsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ad_groups/\(id)/duplicate",
            body: request,
            requestOptions: requestOptions,
            responseType: DuplicateAdGroupsResponse.self
        )
    }

    /// Pauses delivery of an ad group.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adGroups.pause(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad group ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pause(id: String, requestOptions: RequestOptions? = nil) async throws -> AdGroup {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ad_groups/\(id)/pause",
            requestOptions: requestOptions,
            responseType: AdGroup.self
        )
    }

    /// Resumes delivery of a paused ad group.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adGroups.unpause(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad group ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func unpause(id: String, requestOptions: RequestOptions? = nil) async throws -> AdGroup {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ad_groups/\(id)/unpause",
            requestOptions: requestOptions,
            responseType: AdGroup.self
        )
    }
}