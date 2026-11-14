import Foundation

public final class TimeSeriesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the metrics you can chart over time, with the unit each reports and the properties you can filter or break it down by. Aggregates that are not bucketed over time are reports, listed at `GET /stats/reports`.
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
    ///     _ = try await client.stats.timeSeries.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(requestOptions: RequestOptions? = nil) async throws -> ListTimeSeriesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/stats/time_series",
            requestOptions: requestOptions,
            responseType: ListTimeSeriesResponse.self
        )
    }

    /// Retrieves a metric as a series of points over a time range for an account or user. For an aggregate that is not bucketed over time, use a report from `GET /stats/reports`. The `market_prices` metric is public and requires no authentication. Each metric takes its own scope: most need `stats:read`, the earnings, markup revenue and `platform_markup_amount` metrics need `company:balance:read`, `markup_earning_estimate` needs `company:update_child_fees`, and `ad_delivery`, `ad_campaign_score`, `people` and `events` also accept `ad_campaign:read`.
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
    ///     _ = try await client.stats.timeSeries.retrieve(
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
    /// - Parameter metric: The metric to retrieve, for example net_revenue. Use GET /stats/time_series to see every metric key. The metric sets the unit and the properties you can filter or break down by.
    /// - Parameter accountId: Account this query concerns, prefixed `biz_`, or `platform` for all of Whop.
    /// - Parameter userId: The user this query concerns, for example user_AbC123. Available on metrics that support user subjects, such as account_balance.
    /// - Parameter from: Start of the range — a date (YYYY-MM-DD), expanded to the start of that day, or an ISO 8601 timestamp (for example 2026-07-16T16:37:00Z), used exactly.
    /// - Parameter to: End of the range — a date (YYYY-MM-DD), expanded to the end of that day, or an ISO 8601 timestamp (for example 2026-07-17T16:37:00Z), used exactly. Funnel entry ranges cannot exceed 90 days.
    /// - Parameter interval: How wide each point is. Defaults to day. Snapshot metrics are day-only. Funnels support at most 2,000 first-entry cohort buckets.
    /// - Parameter breakdownBy: Split the metric out by one of its properties — each point gets a breakdown array. For example breakdown_by=currency returns an entry for usd, an entry for eur, and so on. Funnels use a property of the first matched event, with at most 300 groups. experiment_id and variant require an exposure as step 1. For funnel source breakdowns, steps[1][source]=whop:* groups by campaign, whop:<campaign>:* by ad group, and whop:<campaign>:<group>:* by ad. See the metric catalog for supported breakdowns.
    /// - Parameter convertTo: Display currency for money metrics — every amount is converted into this ISO currency using the exchange rate on each period's date. Defaults to usd. For the ads metrics (ad_spend, ad_delivery), pass the account's ads reporting currency to match the ad entity endpoints. On transaction metrics, it is ignored when you filter or break down by currency (those report the original transaction currency, unconverted).
    /// - Parameter currency: Select the source currency or asset on metrics that list currency. For transaction metrics, for example currency=eur, values are reported without conversion. For market_prices, use btc or xaut and convert_to=usd. Pair with breakdown_by=currency to split a metric by currency.
    /// - Parameter timeZone: IANA time zone to bucket the series in, for example America/New_York. Defaults to UTC. Not accepted by snapshot metrics, which are UTC only.
    /// - Parameter paymentMethod: Filter to a single payment method, for example card or crypto. Available on metrics that list payment_method.
    /// - Parameter cardNetwork: Filter to a single card brand, for example visa. A refinement of payment_method=card. Available on metrics that list card_network.
    /// - Parameter disputeReason: Filter disputes to a normalized reason, for example product_not_received. Pair with breakdown_by=dispute_reason to split dispute counts by reason.
    /// - Parameter source: Filter to a single GMV source, for example payments — or, on the traffic metrics, a visit source (whop_ads, direct, or a utm_source value). Pair with breakdown_by=source to split by source. Available on metrics that list source.
    /// - Parameter hostname: Filter traffic metrics to one website hostname, for example shop.example.com. On the events and people metrics, comma-separated hostnames match any listed hostname. Pair with breakdown_by=hostname to split by website.
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
    /// - Parameter snapshotWindow: Window used by a snapshot metric. Ordinary snapshots accept 30d as their trailing activity window. Cohorted dispute metrics accept 7d or 28d as the sales-transaction pool; their attribution window is fixed in the metric name. Card network program metrics accept 7d, 14d, 28d, or 56d. Each metric lists its accepted values in the catalog.
    /// - Parameter event: Filter the events metric to one or more full event names, for example payment.completed or pixel.lead. Comma-separated names match any listed event. Use group_by=event for separate groups. Available on metrics that list event.
    /// - Parameter businessType: Filter to one business type, for example `education`. Pair with `breakdown_by=business_type` to split by business type. Available on metrics that list `business_type`.
    /// - Parameter industryType: Filter to one industry type, for example `options_trading`. Pair with `breakdown_by=industry_type` to split by industry type. Available on metrics that list `industry_type`.
    /// - Parameter productCategory: Filter to one product category, for example `algo_trading_course`. Pair with `breakdown_by=product_category` to split by product category. Available on metrics that list `product_category`.
    /// - Parameter accountCountry: Filter to accounts located in one country, as an ISO 3166-1 alpha-2 code such as `US`. Pair with `breakdown_by=account_country` to split by account country. Available on metrics that list `account_country`.
    /// - Parameter issuer: Filter to one card-issuing bank, named as the processor reports it, for example JPMORGAN CHASE BANK N A, or unknown for payments with no reported bank. Available on metrics that list issuer.
    /// - Parameter webhookId: The webhook to count deliveries for, for example hook_AbC123. Required by webhook_deliveries, and must belong to account_id or one of its apps.
    /// - Parameter conversionWindow: Funnel only. Time allowed from the first event to the final event: integer minutes, hours, or days, up to 30d.
    /// - Parameter matureOnly: Funnel only. Include only entrants whose full conversion window has elapsed. Required for confidence intervals and comparisons.
    /// - Parameter steps: Funnel only. Required when metric=funnel. 2 to 10 ordered events per person, as consecutive one-based bracket parameters such as `steps[1][event]=pixel.page&steps[1][page]=/pricing*&steps[2][event]=payment.completed`. Values are scalar strings, never JSON. A person's first step 1 match inside `from`/`to` anchors their cohort, breakdown, and conversion window; later matches do not restart it. Other events may occur between steps, and conversions may land after `to`. For an experiment funnel, make `experiment.exposure` step 1 and pass `breakdown_by=variant`.
    /// - Parameter compareTo: Funnel only. The breakdown value to use as baseline for whole-window final conversion. Requires breakdown_by and mature_only=true; defaults confidence_level to 0.95.
    /// - Parameter confidenceLevel: Funnel only. Confidence level for whole-window final conversion intervals, for example 0.95. Requires mature_only=true. Exposure steps must each filter one user- or visitor-randomized experiment.
    /// - Parameter contactable: People metric only: contactable equals this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter hasPurchased: People metric only: has_purchased equals this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter firstSeenAfter: People metric only: first_seen_at greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter firstSeenBefore: People metric only: first_seen_at less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter lastSeenAfter: People metric only: last_seen_at greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter lastSeenBefore: People metric only: last_seen_at less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter firstSeenWithinDays: People metric only: first_seen_at within this many days of now. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter lastSeenWithinDays: People metric only: last_seen_at within this many days of now. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter known: People metric only: known equals this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter hasEmail: People metric only: has_email equals this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter hasPhone: People metric only: has_phone equals this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter ltvGt: People metric only: ltv greater than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter ltvGte: People metric only: ltv greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter ltvLt: People metric only: ltv less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter ltvLte: People metric only: ltv less than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter aovGt: People metric only: aov greater than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter aovGte: People metric only: aov greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter aovLt: People metric only: aov less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter aovLte: People metric only: aov less than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter purchaseCountGt: People metric only: purchase_count greater than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter purchaseCountGte: People metric only: purchase_count greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter purchaseCountLt: People metric only: purchase_count less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter purchaseCountLte: People metric only: purchase_count less than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter eventCountGt: People metric only: event_count greater than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter eventCountGte: People metric only: event_count greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter eventCountLt: People metric only: event_count less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter eventCountLte: People metric only: event_count less than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    /// - Parameter referringAccountId: Read a referral metric for a business instead of the caller: the referrals its team members made, past members included, for example biz_AbC123. Requires company:basic:read on that business and cannot be combined with user_id. Available on metrics that list referring_account_id.
    /// - Parameter teamLeadId: Read a partner metric for one team lead and everyone under them in today's org chart, for example user_AbC123. Needs referring_account_id or a global query. As breakdown_by=team_lead_id, figures sit under the highest lead above the partner who earned them, so each group matches that lead's team_lead_id filter and the groups add up to the total. With team_lead_id set, or for a caller who reads only their own team, the groups are the leads under that person, who keeps the rest. Anyone with no lead is in a null group. Available on metrics that list team_lead_id.
    /// - Parameter activity: On partner_reps, all counts the period's roster, earning counts those who earned in the period, and not_earning counts the roster minus them. On the other partner metrics, earning keeps the figures of the people partner_reps counts as earning over the whole range and not_earning keeps the figures of everyone else; those need referring_account_id or a global query. Defaults to all. Available on metrics that list activity.
    /// - Parameter breakdownLimit: With a single breakdown_by, keep the groups with the highest whole-range values, up to this many, and fold every other group into one entry named other. A rate or an average ranks its groups by the deals it divides by. The other entry is measured from the underlying rows, so a distinct count or a rate stays exact rather than being added up from groups. Available on partner metrics only.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(metric: String, accountId: String? = nil, userId: String? = nil, from: String, to: String, interval: RetrieveTimeSeriesRequestInterval? = nil, breakdownBy: String? = nil, convertTo: String? = nil, currency: String? = nil, timeZone: String? = nil, paymentMethod: String? = nil, cardNetwork: String? = nil, disputeReason: String? = nil, source: String? = nil, hostname: String? = nil, page: String? = nil, deviceType: String? = nil, countryCode: String? = nil, eventName: String? = nil, eventType: RetrieveTimeSeriesRequestEventType? = nil, customName: String? = nil, segment: String? = nil, category: String? = nil, merchant: String? = nil, feeType: String? = nil, product: String? = nil, status: String? = nil, accessLevel: String? = nil, mostRecentAction: String? = nil, referredUserId: String? = nil, adCampaignIds: [String]? = nil, adGroupIds: [String]? = nil, adIds: [String]? = nil, snapshotWindow: RetrieveTimeSeriesRequestSnapshotWindow? = nil, event: String? = nil, businessType: String? = nil, industryType: String? = nil, productCategory: String? = nil, accountCountry: String? = nil, issuer: String? = nil, webhookId: String? = nil, conversionWindow: String? = nil, matureOnly: Bool? = nil, steps: RetrieveTimeSeriesRequestSteps? = nil, compareTo: String? = nil, confidenceLevel: Double? = nil, contactable: Bool? = nil, hasPurchased: Bool? = nil, firstSeenAfter: Date? = nil, firstSeenBefore: Date? = nil, lastSeenAfter: Date? = nil, lastSeenBefore: Date? = nil, firstSeenWithinDays: Int? = nil, lastSeenWithinDays: Int? = nil, known: Bool? = nil, hasEmail: Bool? = nil, hasPhone: Bool? = nil, ltvGt: Double? = nil, ltvGte: Double? = nil, ltvLt: Double? = nil, ltvLte: Double? = nil, aovGt: Double? = nil, aovGte: Double? = nil, aovLt: Double? = nil, aovLte: Double? = nil, purchaseCountGt: Double? = nil, purchaseCountGte: Double? = nil, purchaseCountLt: Double? = nil, purchaseCountLte: Double? = nil, eventCountGt: Double? = nil, eventCountGte: Double? = nil, eventCountLt: Double? = nil, eventCountLte: Double? = nil, referringAccountId: String? = nil, teamLeadId: String? = nil, activity: RetrieveTimeSeriesRequestActivity? = nil, breakdownLimit: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> RetrieveTimeSeriesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/stats/time_series/\(metric)",
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
                "event": event.map { .string($0) }, 
                "business_type": businessType.map { .string($0) }, 
                "industry_type": industryType.map { .string($0) }, 
                "product_category": productCategory.map { .string($0) }, 
                "account_country": accountCountry.map { .string($0) }, 
                "issuer": issuer.map { .string($0) }, 
                "webhook_id": webhookId.map { .string($0) }, 
                "conversion_window": conversionWindow.map { .string($0) }, 
                "mature_only": matureOnly.map { .bool($0) }, 
                "steps": steps.map { .unknown($0) }, 
                "compare_to": compareTo.map { .string($0) }, 
                "confidence_level": confidenceLevel.map { .double($0) }, 
                "contactable": contactable.map { .bool($0) }, 
                "has_purchased": hasPurchased.map { .bool($0) }, 
                "first_seen_after": firstSeenAfter.map { .date($0) }, 
                "first_seen_before": firstSeenBefore.map { .date($0) }, 
                "last_seen_after": lastSeenAfter.map { .date($0) }, 
                "last_seen_before": lastSeenBefore.map { .date($0) }, 
                "first_seen_within_days": firstSeenWithinDays.map { .int($0) }, 
                "last_seen_within_days": lastSeenWithinDays.map { .int($0) }, 
                "known": known.map { .bool($0) }, 
                "has_email": hasEmail.map { .bool($0) }, 
                "has_phone": hasPhone.map { .bool($0) }, 
                "ltv_gt": ltvGt.map { .double($0) }, 
                "ltv_gte": ltvGte.map { .double($0) }, 
                "ltv_lt": ltvLt.map { .double($0) }, 
                "ltv_lte": ltvLte.map { .double($0) }, 
                "aov_gt": aovGt.map { .double($0) }, 
                "aov_gte": aovGte.map { .double($0) }, 
                "aov_lt": aovLt.map { .double($0) }, 
                "aov_lte": aovLte.map { .double($0) }, 
                "purchase_count_gt": purchaseCountGt.map { .double($0) }, 
                "purchase_count_gte": purchaseCountGte.map { .double($0) }, 
                "purchase_count_lt": purchaseCountLt.map { .double($0) }, 
                "purchase_count_lte": purchaseCountLte.map { .double($0) }, 
                "event_count_gt": eventCountGt.map { .double($0) }, 
                "event_count_gte": eventCountGte.map { .double($0) }, 
                "event_count_lt": eventCountLt.map { .double($0) }, 
                "event_count_lte": eventCountLte.map { .double($0) }, 
                "referring_account_id": referringAccountId.map { .string($0) }, 
                "team_lead_id": teamLeadId.map { .string($0) }, 
                "activity": activity.map { .string($0.rawValue) }, 
                "breakdown_limit": breakdownLimit.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: RetrieveTimeSeriesResponse.self
        )
    }
}