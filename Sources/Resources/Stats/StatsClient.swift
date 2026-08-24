import Foundation

public final class StatsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists every metric you can query, with its unit and the properties you can filter or break it down by.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.stats.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(requestOptions: RequestOptions? = nil) async throws -> ListStatsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/stats",
            requestOptions: requestOptions,
            responseType: ListStatsResponse.self
        )
    }

    /// Describe available stats schema. Without resource returns root nodes and metrics. With resource returns node columns, associations, and available metrics.
    ///
    /// Required permissions:
    ///  - `stats:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.stats.describeStats(
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         userId: "user_xxxxxxxxxxxxx"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter resource: Resource path using : as separator (e.g., 'receipts', 'payments:membership', 'receipts:gross_revenue').
    /// - Parameter companyId: Scope query to a specific company.
    /// - Parameter userId: Scope query to a specific user.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func describeStats(resource: String? = nil, companyId: String? = nil, userId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> DescribeStatsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/stats/describe",
            queryParams: [
                "resource": resource.map { .string($0) }, 
                "company_id": companyId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: DescribeStatsResponse.self
        )
    }

    /// Query an aggregated metric. Returns data grouped by period with optional breakdowns.
    ///
    /// Required permissions:
    ///  - `stats:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.stats.metricStats(
    ///         resource: "resource",
    ///         from: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
    ///         to: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         userId: "user_xxxxxxxxxxxxx"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter resource: Metric resource using : as separator (e.g., 'receipts:gross_revenue', 'members:new_users').
    /// - Parameter granularity: Time granularity (daily, weekly, monthly).
    /// - Parameter breakdowns: Columns to break down the metric by.
    /// - Parameter filters: Key-value pairs to filter the data.
    /// - Parameter timeZone: IANA timezone for period bucketing (e.g. 'America/New_York'). Defaults to UTC. Only applies to ClickHouse metrics.
    /// - Parameter from: Start of time range (unix timestamp).
    /// - Parameter to: End of time range (unix timestamp).
    /// - Parameter companyId: Scope query to a specific company.
    /// - Parameter userId: Scope query to a specific user.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func metricStats(resource: String, granularity: String? = nil, breakdowns: [String]? = nil, filters: [String: JSONValue]? = nil, timeZone: String? = nil, from: Date? = nil, to: Date? = nil, companyId: String? = nil, userId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> MetricStatsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/stats/metric",
            queryParams: [
                "resource": .string(resource), 
                "granularity": granularity.map { .string($0) }, 
                "breakdowns": breakdowns.map { .stringArray($0) }, 
                "filters": filters.map { .unknown($0) }, 
                "time_zone": timeZone.map { .string($0) }, 
                "from": from.map { .date($0) }, 
                "to": to.map { .date($0) }, 
                "company_id": companyId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: MetricStatsResponse.self
        )
    }

    /// Query raw data from a resource. Returns paginated rows with all columns.
    ///
    /// Required permissions:
    ///  - `stats:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.stats.rawStats(
    ///         resource: "resource",
    ///         from: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
    ///         to: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
    ///         limit: 42,
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         userId: "user_xxxxxxxxxxxxx"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter resource: Resource path using : as separator (e.g., 'members', 'payments:membership').
    /// - Parameter from: Start of time range (unix timestamp).
    /// - Parameter to: End of time range (unix timestamp).
    /// - Parameter limit: Number of records to return (max 10000).
    /// - Parameter cursor: Pagination cursor for next page.
    /// - Parameter sort: Column to sort by.
    /// - Parameter companyId: Scope query to a specific company.
    /// - Parameter userId: Scope query to a specific user.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func rawStats(resource: String, from: Date? = nil, to: Date? = nil, limit: Int? = nil, cursor: String? = nil, sort: String? = nil, sortDirection: Direction? = nil, companyId: String? = nil, userId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> RawStatsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/stats/raw",
            queryParams: [
                "resource": .string(resource), 
                "from": from.map { .date($0) }, 
                "to": to.map { .date($0) }, 
                "limit": limit.map { .int($0) }, 
                "cursor": cursor.map { .string($0) }, 
                "sort": sort.map { .string($0) }, 
                "sort_direction": sortDirection.map { .string($0.rawValue) }, 
                "company_id": companyId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: RawStatsResponse.self
        )
    }

    /// Retrieves a metric as a time series of points for an account or user over a time range. The `market_prices` metric is public and requires no authentication.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.stats.retrieve(
    ///         metric: "metric",
    ///         from: "from",
    ///         to: "to",
    ///         adCampaignIds: [
    ///             "adcamp_xxxxxxxxxxxxxx"
    ///         ],
    ///         adGroupIds: [
    ///             "adgrp_xxxxxxxxxxxxxx"
    ///         ],
    ///         adIds: [
    ///             "ad_xxxxxxxxxxxxxx"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter metric: The metric to retrieve, for example net_revenue. Use GET /stats to see every metric key. The metric sets the unit and the properties you can filter or break down by.
    /// - Parameter accountId: The account this query concerns, for example biz_AbC123.
    /// - Parameter userId: The user this query concerns, for example user_AbC123. Available on metrics that support user subjects, such as account_balance.
    /// - Parameter from: Start of the range — a date (YYYY-MM-DD), expanded to the start of that day, or an ISO 8601 timestamp (for example 2026-07-16T16:37:00Z), used exactly.
    /// - Parameter to: End of the range — a date (YYYY-MM-DD), expanded to the end of that day, or an ISO 8601 timestamp (for example 2026-07-17T16:37:00Z), used exactly.
    /// - Parameter interval: How wide each point is. Defaults to day. Snapshot metrics are day-only.
    /// - Parameter breakdownBy: Split the metric out by one of its properties — each point gets a breakdown array. For example breakdown_by=currency returns an entry for usd, an entry for eur, and so on.
    /// - Parameter convertTo: Display currency for money metrics — every amount is converted into this ISO currency using the exchange rate on each period's date. Defaults to usd. For the ads metrics (ad_spend, ad_delivery), pass the account's ads reporting currency to match the ad entity endpoints. On transaction metrics, it is ignored when you filter or break down by currency (those report the original transaction currency, unconverted).
    /// - Parameter currency: Select the source currency or asset on metrics that list currency. For transaction metrics, for example currency=eur, values are reported without conversion. For market_prices, use btc or xaut and convert_to=usd. Pair with breakdown_by=currency to split a metric by currency.
    /// - Parameter timeZone: IANA time zone to bucket the series in, for example America/New_York. Defaults to UTC. Not accepted by snapshot metrics, which are UTC only.
    /// - Parameter paymentMethod: Filter to a single payment method, for example card or crypto. Available on metrics that list payment_method.
    /// - Parameter cardNetwork: Filter to a single card brand, for example visa. A refinement of payment_method=card. Available on metrics that list card_network.
    /// - Parameter disputeReason: Filter disputes to a normalized reason, for example product_not_received. Pair with breakdown_by=dispute_reason to split dispute counts by reason.
    /// - Parameter source: Filter to a single GMV source, for example payments — or, on the traffic metrics, a visit source (whop_ads, direct, or a utm_source value). Pair with breakdown_by=source to split by source. Available on metrics that list source.
    /// - Parameter hostname: Filter traffic metrics to one website hostname, for example shop.example.com. Pair with breakdown_by=hostname to split by website.
    /// - Parameter page: Filter traffic metrics to one page — a hostname plus normalized path, for example shop.example.com/pricing. Pair with breakdown_by=page to split by page.
    /// - Parameter deviceType: Filter traffic metrics to one device type: desktop, mobile, tablet, or unknown. Pair with breakdown_by=device_type to split by device.
    /// - Parameter countryCode: Filter traffic metrics to one visitor country (uppercase ISO 3166-1 alpha-2, for example US). Pair with breakdown_by=country_code to split by country.
    /// - Parameter eventName: Filter the events metric to one tracked event name, for example pixel.page or pixel.custom. Pair with breakdown_by=event_name to split by event.
    /// - Parameter eventType: Filter the events metric to a canonical group of events: page_view (pixel page views plus whop.com store views), checkout_start (hosted and embedded checkout views), or other. Pair with breakdown_by=event_type to split by group.
    /// - Parameter customName: Filter the events metric to one merchant-defined custom event name. Only valid alongside event_name=pixel.custom. Pair with breakdown_by=custom_name to split custom events by name.
    /// - Parameter segment: Filter to a single wallet-balance segment, for example available. Pair with breakdown_by=segment to split the balance. Available on metrics that list segment.
    /// - Parameter category: Filter to a single balance-activity category, for example payments. Pair with breakdown_by=category to split the activity. Available on metrics that list category.
    /// - Parameter merchant: Filter to a single cashback merchant bucket, for example whop-ads. Pair with breakdown_by=merchant to split cashback by merchant. Available on metrics that list merchant.
    /// - Parameter feeType: Filter to a single fee type. Pair with breakdown_by=fee_type to split fees by type. Available on metrics that list fee_type.
    /// - Parameter product: Filter to a single product (access pass id), for example prod_AbC123. Pair with breakdown_by=product. Available on metrics that list product.
    /// - Parameter status: Filter to a single membership status. Pair with breakdown_by=status. Available on metrics that list status.
    /// - Parameter accessLevel: Filter to a single access level. Pair with breakdown_by=access_level. Available on metrics that list access_level.
    /// - Parameter mostRecentAction: Filter to a single most-recent member action. Pair with breakdown_by=most_recent_action. Available on metrics that list most_recent_action.
    /// - Parameter referredUserId: Filter a referral metric to the businesses attributed to one person you referred, for example user_AbC123. Available on metrics that list referred_user_id.
    /// - Parameter adCampaignIds: Ad campaign ids (adcamp_...) to scope the report to; stats are summed across them. Available on metrics that list ad_campaign_ids.
    /// - Parameter adGroupIds: Ad group ids (adgrp_...) to scope the report to; stats are summed across them. Available on metrics that list ad_group_ids.
    /// - Parameter adIds: Ad ids (ad_...) to scope the report to; stats are summed across them. Available on metrics that list ad_ids.
    /// - Parameter snapshotWindow: Window used by a snapshot metric. Ordinary snapshots accept 30d as their trailing activity window. Cohorted dispute metrics accept 7d or 28d as the sales-transaction pool; their attribution window is fixed in the metric name. Each metric lists its accepted values in the catalog.
    /// - Parameter event: Filter the events metric to one or more full event names, for example payment.completed or pixel.lead. Comma-separate several to break the metric down by each event. Available on metrics that list event.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(metric: String, accountId: String? = nil, userId: String? = nil, from: String, to: String, interval: RetrieveStatsRequestInterval? = nil, breakdownBy: String? = nil, convertTo: String? = nil, currency: String? = nil, timeZone: String? = nil, paymentMethod: String? = nil, cardNetwork: String? = nil, disputeReason: String? = nil, source: String? = nil, hostname: String? = nil, page: String? = nil, deviceType: String? = nil, countryCode: String? = nil, eventName: String? = nil, eventType: RetrieveStatsRequestEventType? = nil, customName: String? = nil, segment: String? = nil, category: String? = nil, merchant: String? = nil, feeType: String? = nil, product: String? = nil, status: String? = nil, accessLevel: String? = nil, mostRecentAction: String? = nil, referredUserId: String? = nil, adCampaignIds: [String]? = nil, adGroupIds: [String]? = nil, adIds: [String]? = nil, snapshotWindow: RetrieveStatsRequestSnapshotWindow? = nil, event: String? = nil, requestOptions: RequestOptions? = nil) async throws -> RetrieveStatsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/stats/\(metric)",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "from": .string(from), 
                "to": .string(to), 
                "interval": interval.map { .string($0.rawValue) }, 
                "breakdown_by": breakdownBy.map { .string($0) }, 
                "convert_to": convertTo.map { .string($0) }, 
                "currency": currency.map { .string($0) }, 
                "time_zone": timeZone.map { .string($0) }, 
                "payment_method": paymentMethod.map { .string($0) }, 
                "card_network": cardNetwork.map { .string($0) }, 
                "dispute_reason": disputeReason.map { .string($0) }, 
                "source": source.map { .string($0) }, 
                "hostname": hostname.map { .string($0) }, 
                "page": page.map { .string($0) }, 
                "device_type": deviceType.map { .string($0) }, 
                "country_code": countryCode.map { .string($0) }, 
                "event_name": eventName.map { .string($0) }, 
                "event_type": eventType.map { .string($0.rawValue) }, 
                "custom_name": customName.map { .string($0) }, 
                "segment": segment.map { .string($0) }, 
                "category": category.map { .string($0) }, 
                "merchant": merchant.map { .string($0) }, 
                "fee_type": feeType.map { .string($0) }, 
                "product": product.map { .string($0) }, 
                "status": status.map { .string($0) }, 
                "access_level": accessLevel.map { .string($0) }, 
                "most_recent_action": mostRecentAction.map { .string($0) }, 
                "referred_user_id": referredUserId.map { .string($0) }, 
                "ad_campaign_ids": adCampaignIds.map { .stringArray($0) }, 
                "ad_group_ids": adGroupIds.map { .stringArray($0) }, 
                "ad_ids": adIds.map { .stringArray($0) }, 
                "snapshot_window": snapshotWindow.map { .string($0.rawValue) }, 
                "event": event.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: RetrieveStatsResponse.self
        )
    }
}