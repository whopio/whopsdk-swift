import Foundation

public final class PeopleClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the people (visitors and customers) of an account: identity-linked profiles assembled from every pixel, payment, and platform event. Filter and sort them to segment an account's audience.
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
    ///     _ = try await client.people.list(
    ///         source: [
    ///             "direct"
    ///         ],
    ///         eventName: [
    ///             "payment.completed"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account ID, prefixed `biz_`. Optional for account API keys; required for credentials that can access multiple accounts.
    /// - Parameter query: Search people by name, email, phone, or whop user ID (case-insensitive substring match).
    /// - Parameter source: Only include people acquired from any of these sources — canonical paths (whop:<campaign>:<group>:<ad>, ext:<platform>:..., referrer:<domain>, direct, other), exact or with a trailing :* prefix. The same vocabulary the events / people metrics use.
    /// - Parameter attributionModel: Attribution model the source filter matches against (defaults to last_touch).
    /// - Parameter eventName: Only include people who fired any of these events, e.g. payment.completed or page.checkout.view.
    /// - Parameter customEvent: Only include people who fired this custom pixel event.
    /// - Parameter eventWithinDays: Match activity within a rolling number of days. Cannot be combined with event_from/event_to.
    /// - Parameter from: Inclusive activity-window start. Alias for event_from.
    /// - Parameter to: Inclusive activity-window end. Alias for event_to.
    /// - Parameter eventFrom: The inclusive start of the matching activity window.
    /// - Parameter eventTo: The inclusive end of the matching activity window, for both stats drilldowns and saved audiences.
    /// - Parameter audienceId: Only include people in this audience. An audience that keeps itself up to date resolves to the People filters that define it, so this always reflects who matches now; uploaded lists and point-in-time snapshots match their recorded members.
    /// - Parameter userId: Only include the person linked to this whop user ID.
    /// - Parameter email: Only include the person linked to this email address.
    /// - Parameter phone: Only include the person linked to this phone number.
    /// - Parameter country: Only include people with activity from this ISO 3166-1 alpha-2 country code.
    /// - Parameter hasPurchased: true for customers only, false for people who have never purchased.
    /// - Parameter contactable: true for people who have an email address or phone number — the ones an ad platform can match.
    /// - Parameter firstSeenWithinDays: Only include people first seen within this many days, as a rolling window.
    /// - Parameter lastSeenWithinDays: Only include people last seen within this many days, as a rolling window.
    /// - Parameter firstSeenAfter: Only include people first seen at or after this ISO 8601 timestamp.
    /// - Parameter firstSeenBefore: Only include people first seen before this ISO 8601 timestamp.
    /// - Parameter lastSeenAfter: Only include people last seen at or after this ISO 8601 timestamp.
    /// - Parameter lastSeenBefore: Only include people last seen before this ISO 8601 timestamp.
    /// - Parameter ltvGt: Select people whose lifetime ltv is greater than this value. LTV and AOV are in USD.
    /// - Parameter ltvGte: Select people whose lifetime ltv is at least this value. LTV and AOV are in USD.
    /// - Parameter ltvLt: Select people whose lifetime ltv is less than this value. LTV and AOV are in USD.
    /// - Parameter ltvLte: Select people whose lifetime ltv is at most this value. LTV and AOV are in USD.
    /// - Parameter aovGt: Select people whose lifetime aov is greater than this value. LTV and AOV are in USD.
    /// - Parameter aovGte: Select people whose lifetime aov is at least this value. LTV and AOV are in USD.
    /// - Parameter aovLt: Select people whose lifetime aov is less than this value. LTV and AOV are in USD.
    /// - Parameter aovLte: Select people whose lifetime aov is at most this value. LTV and AOV are in USD.
    /// - Parameter purchaseCountGt: Select people whose lifetime purchase_count is greater than this value. LTV and AOV are in USD.
    /// - Parameter purchaseCountGte: Select people whose lifetime purchase_count is at least this value. LTV and AOV are in USD.
    /// - Parameter purchaseCountLt: Select people whose lifetime purchase_count is less than this value. LTV and AOV are in USD.
    /// - Parameter purchaseCountLte: Select people whose lifetime purchase_count is at most this value. LTV and AOV are in USD.
    /// - Parameter eventCountGt: Select people whose lifetime event_count is greater than this value. LTV and AOV are in USD.
    /// - Parameter eventCountGte: Select people whose lifetime event_count is at least this value. LTV and AOV are in USD.
    /// - Parameter eventCountLt: Select people whose lifetime event_count is less than this value. LTV and AOV are in USD.
    /// - Parameter eventCountLte: Select people whose lifetime event_count is at most this value. LTV and AOV are in USD.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter order: Column to sort by. Defaults to last_seen_at.
    /// - Parameter direction: Sort direction. Defaults to desc.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, query: String? = nil, source: [String]? = nil, attributionModel: ListPeopleRequestAttributionModel? = nil, eventName: [String]? = nil, customEvent: String? = nil, eventWithinDays: Int? = nil, from: Date? = nil, to: Date? = nil, eventFrom: Date? = nil, eventTo: Date? = nil, audienceId: String? = nil, userId: String? = nil, email: String? = nil, phone: String? = nil, country: String? = nil, hasPurchased: Bool? = nil, contactable: Bool? = nil, firstSeenWithinDays: Int? = nil, lastSeenWithinDays: Int? = nil, firstSeenAfter: Date? = nil, firstSeenBefore: Date? = nil, lastSeenAfter: Date? = nil, lastSeenBefore: Date? = nil, ltvGt: Double? = nil, ltvGte: Double? = nil, ltvLt: Double? = nil, ltvLte: Double? = nil, aovGt: Double? = nil, aovGte: Double? = nil, aovLt: Double? = nil, aovLte: Double? = nil, purchaseCountGt: Double? = nil, purchaseCountGte: Double? = nil, purchaseCountLt: Double? = nil, purchaseCountLte: Double? = nil, eventCountGt: Double? = nil, eventCountGte: Double? = nil, eventCountLt: Double? = nil, eventCountLte: Double? = nil, first: Int? = nil, after: String? = nil, before: String? = nil, order: ListPeopleRequestOrder? = nil, direction: ListPeopleRequestDirection? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPeopleResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/people",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "query": query.map { .string($0) }, 
                "source": source.map { .stringArray($0) }, 
                "attribution_model": attributionModel.map { .string($0.rawValue) }, 
                "event_name": eventName.map { .stringArray($0) }, 
                "custom_event": customEvent.map { .string($0) }, 
                "event_within_days": eventWithinDays.map { .int($0) }, 
                "from": from.map { .date($0) }, 
                "to": to.map { .date($0) }, 
                "event_from": eventFrom.map { .date($0) }, 
                "event_to": eventTo.map { .date($0) }, 
                "audience_id": audienceId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "email": email.map { .string($0) }, 
                "phone": phone.map { .string($0) }, 
                "country": country.map { .string($0) }, 
                "has_purchased": hasPurchased.map { .bool($0) }, 
                "contactable": contactable.map { .bool($0) }, 
                "first_seen_within_days": firstSeenWithinDays.map { .int($0) }, 
                "last_seen_within_days": lastSeenWithinDays.map { .int($0) }, 
                "first_seen_after": firstSeenAfter.map { .date($0) }, 
                "first_seen_before": firstSeenBefore.map { .date($0) }, 
                "last_seen_after": lastSeenAfter.map { .date($0) }, 
                "last_seen_before": lastSeenBefore.map { .date($0) }, 
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
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListPeopleResponse.self
        )
    }

    /// Retrieves one person for an account, looked up by person ID, user ID, email address, or phone number.
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
    ///     _ = try await client.people.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The person ID (prefixed `prsn_`), user ID (prefixed `user_`), email address, or phone number to look up. A merged person resolves to the surviving profile.
    /// - Parameter accountId: Account ID, prefixed `biz_`. Optional for account API keys; required for credentials that can access multiple accounts.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, accountId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> RetrievePeopleResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/people/\(id)",
            queryParams: [
                "account_id": accountId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: RetrievePeopleResponse.self
        )
    }
}