import Foundation

public final class PeopleClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the people (visitors and customers) of an account: the identity-linked person profiles aggregated from every pixel, payment, and platform event — identities, purchases and LTV, geo/device profile, traffic sources, and first/last marketing touches.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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
    /// - Parameter eventFrom: With event_to plus an event or source filter, switches to exact-population mode: person ids are resolved and paginated on the events side within this window (the same query the people metric counts), then hydrated per page.
    /// - Parameter eventTo: The inclusive end of the event window for exact-population mode.
    /// - Parameter audienceId: Only include people in this audience. An audience that keeps itself up to date resolves to the People filters that define it, so this always reflects who matches now; uploaded lists and point-in-time snapshots match their recorded members.
    /// - Parameter userId: Only include the person linked to this whop user ID.
    /// - Parameter email: Only include the person linked to this email address.
    /// - Parameter phone: Only include the person linked to this phone number.
    /// - Parameter country: Only include people whose most recent visit came from this ISO 3166-1 alpha-2 country code.
    /// - Parameter hasPurchased: true for customers only, false for people who have never purchased.
    /// - Parameter contactable: true for people who have an email address or phone number — the ones an ad platform can match.
    /// - Parameter firstSeenWithinDays: Only include people first seen within this many days, as a rolling window.
    /// - Parameter lastSeenWithinDays: Only include people last seen within this many days, as a rolling window.
    /// - Parameter firstSeenAfter: Only include people first seen at or after this ISO 8601 timestamp.
    /// - Parameter firstSeenBefore: Only include people first seen before this ISO 8601 timestamp.
    /// - Parameter lastSeenAfter: Only include people last seen at or after this ISO 8601 timestamp.
    /// - Parameter lastSeenBefore: Only include people last seen before this ISO 8601 timestamp.
    /// - Parameter first: The number of people to return (default 100, max 100).
    /// - Parameter after: A cursor for fetching people after a previous page.
    /// - Parameter before: A cursor for fetching people before a later page.
    /// - Parameter order: Column to sort by. Defaults to last_seen_at.
    /// - Parameter direction: Sort direction. Defaults to desc.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, query: String? = nil, source: [String]? = nil, attributionModel: ListPeopleRequestAttributionModel? = nil, eventName: [String]? = nil, customEvent: String? = nil, eventFrom: Date? = nil, eventTo: Date? = nil, audienceId: String? = nil, userId: String? = nil, email: String? = nil, phone: String? = nil, country: String? = nil, hasPurchased: Bool? = nil, contactable: Bool? = nil, firstSeenWithinDays: Int? = nil, lastSeenWithinDays: Int? = nil, firstSeenAfter: Date? = nil, firstSeenBefore: Date? = nil, lastSeenAfter: Date? = nil, lastSeenBefore: Date? = nil, first: Int? = nil, after: String? = nil, before: String? = nil, order: ListPeopleRequestOrder? = nil, direction: ListPeopleRequestDirection? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPeopleResponse {
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

    /// Retrieves one person for an account. The identifier can be a person ID (prefixed `prsn_`), a user ID (prefixed `user_`), an email address, or a phone number — merged people resolve to the surviving profile.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.people.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The person ID, user ID, email address, or phone number to look up.
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