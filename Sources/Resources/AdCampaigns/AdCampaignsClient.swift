import Foundation

public final class AdCampaignsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the ad campaigns for an account, with stats over the requested window.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adCampaigns.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The account the campaigns belong to. Defaults to the account-scoped key's own account.
    /// - Parameter status: Only return campaigns with this status.
    /// - Parameter query: Filter campaigns by a title or ID substring.
    /// - Parameter order: The field to sort by. Defaults to created_at. Stat columns (spend, impressions, …) rank over the stats_from/stats_to window across the whole list, not just the current page. results, cost_per_result and return_on_ad_spend rank by the same Whop pixel-attributed values the response reports.
    /// - Parameter direction: The sort direction. Defaults to desc.
    /// - Parameter createdBefore: Only return campaigns created before this timestamp.
    /// - Parameter createdAfter: Only return campaigns created after this timestamp.
    /// - Parameter statsFrom: Start of the stats window. Defaults to all-time.
    /// - Parameter statsTo: End of the stats window. Defaults to now.
    /// - Parameter timeZone: IANA timezone (e.g. America/New_York) the stats window is interpreted in. Bare stats_from/stats_to dates resolve to day boundaries on this clock. Defaults to UTC.
    /// - Parameter attributionModel: Attribution model the conversion stats count under (defaults to last_touch). Under both models a journey with any whop ad touch attributes to whop; the model picks which whop touch credits the entity and which non-whop source wins otherwise.
    /// - Parameter first: The number of campaigns to return.
    /// - Parameter after: Cursor to fetch the page after (from page_info.end_cursor).
    /// - Parameter last: The number of campaigns to return from the end of the range.
    /// - Parameter before: Cursor to fetch the page before (from page_info.start_cursor).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, status: ListAdCampaignsRequestStatus? = nil, query: String? = nil, order: ListAdCampaignsRequestOrder? = nil, direction: ListAdCampaignsRequestDirection? = nil, createdBefore: String? = nil, createdAfter: String? = nil, statsFrom: String? = nil, statsTo: String? = nil, timeZone: String? = nil, attributionModel: ListAdCampaignsRequestAttributionModel? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAdCampaignsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/ad_campaigns",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
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
            responseType: ListAdCampaignsResponse.self
        )
    }

    /// Creates an ad campaign for an account.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adCampaigns.create(request: .init(
    ///         objective: .awareness,
    ///         platform: .meta,
    ///         title: "Now hiring mobile detailers — Austin"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateAdCampaignsRequest, requestOptions: RequestOptions? = nil) async throws -> AdCampaign {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ad_campaigns",
            body: request,
            requestOptions: requestOptions,
            responseType: AdCampaign.self
        )
    }

    /// Retrieves a single ad campaign with stats over the requested window.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adCampaigns.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad campaign ID.
    /// - Parameter statsFrom: Start of the stats window.
    /// - Parameter statsTo: End of the stats window.
    /// - Parameter timeZone: IANA timezone the stats window is interpreted in. Defaults to UTC.
    /// - Parameter attributionModel: Attribution model the conversion stats count under (defaults to last_touch). Under both models a journey with any whop ad touch attributes to whop; the model picks which whop touch credits the entity and which non-whop source wins otherwise.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, statsFrom: String? = nil, statsTo: String? = nil, timeZone: String? = nil, attributionModel: RetrieveAdCampaignsRequestAttributionModel? = nil, requestOptions: RequestOptions? = nil) async throws -> AdCampaign {
        return try await httpClient.performRequest(
            method: .get,
            path: "/ad_campaigns/\(id)",
            queryParams: [
                "stats_from": statsFrom.map { .string($0) }, 
                "stats_to": statsTo.map { .string($0) }, 
                "time_zone": timeZone.map { .string($0) }, 
                "attribution_model": attributionModel.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: AdCampaign.self
        )
    }

    /// Deletes an ad campaign and archives it on the ad platform (cascades to ad groups and ads).
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adCampaigns.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad campaign ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteAdCampaignsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/ad_campaigns/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteAdCampaignsResponse.self
        )
    }

    /// Updates an ad campaign's editable fields (title, budget, schedule, bid strategy, special ad categories, and, before launch, budget optimization), and launches a draft campaign by setting status to active. Objective, budget type and desired cost per result are fixed at creation and cannot be changed.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adCampaigns.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad campaign ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateAdCampaignsRequest, requestOptions: RequestOptions? = nil) async throws -> AdCampaign {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/ad_campaigns/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: AdCampaign.self
        )
    }

    /// Creates copies of the campaign in `duplicating` status and returns them; each copy transitions to `draft` once duplication completes. Poll each returned campaign until it leaves `duplicating` — a copy that could not be completed is deleted and returns 404.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adCampaigns.duplicate(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad campaign ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func duplicate(id: String, request: Requests.DuplicateAdCampaignsRequest, requestOptions: RequestOptions? = nil) async throws -> DuplicateAdCampaignsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ad_campaigns/\(id)/duplicate",
            body: request,
            requestOptions: requestOptions,
            responseType: DuplicateAdCampaignsResponse.self
        )
    }

    /// Pauses an active ad campaign.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adCampaigns.pause(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad campaign ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pause(id: String, requestOptions: RequestOptions? = nil) async throws -> AdCampaign {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ad_campaigns/\(id)/pause",
            requestOptions: requestOptions,
            responseType: AdCampaign.self
        )
    }

    /// Retries billing for an ad campaign whose payment previously failed.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adCampaigns.retryPayment(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad campaign ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retryPayment(id: String, requestOptions: RequestOptions? = nil) async throws -> AdCampaign {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ad_campaigns/\(id)/retry_payment",
            requestOptions: requestOptions,
            responseType: AdCampaign.self
        )
    }

    /// Resumes a paused ad campaign.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.adCampaigns.unpause(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ad campaign ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func unpause(id: String, requestOptions: RequestOptions? = nil) async throws -> AdCampaign {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ad_campaigns/\(id)/unpause",
            requestOptions: requestOptions,
            responseType: AdCampaign.self
        )
    }
}