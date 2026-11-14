import Foundation

public final class EventsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists identity-linked events, most recent first by default. Pass `identifier` for one person's journey, or omit it to list an account's events within a time range. Events have the same shape as the `POST /events` intake: attribution in `context`, identity in `user`.
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
    ///     _ = try await client.events.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter identifier: Any hard identifier of the person: a person ID (prsn_*), user ID, email, phone number, or a tracking cookie value (wuid, anonymous ID, fbp/fbc/ttp/ga). Omit to list recent events for the account.
    /// - Parameter accountId: Account ID, prefixed `biz_`. Optional for account API keys; required for credentials that can access multiple accounts.
    /// - Parameter from: Start of the time range as an ISO 8601 timestamp. Required when identifier is omitted.
    /// - Parameter to: End of the time range as an ISO 8601 timestamp. Required when identifier is omitted; otherwise defaults to now.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter direction: The order events are returned in by time. Defaults to desc (most recent first); asc reads a journey forwards from where it starts. after and before always page forwards and backwards through that order.
    /// - Parameter event: Full event names to filter by, comma-separated (payment.completed, pixel.lead, pixel.page, pixel.custom:<name>) — the same vocabulary the events / people metrics use.
    /// - Parameter source: Canonical source path, exact or with a trailing :* prefix (whop:<campaign>:*, ext:meta:*, referrer:<domain>, direct, unknown). Selects conversions credited to this source.
    /// - Parameter attributionModel: Attribution model for the source filter (defaults to last_touch).
    /// - Parameter country: Country codes to filter by, comma-separated.
    /// - Parameter city: Cities to filter by, comma-separated.
    /// - Parameter device: Device families to filter by, comma-separated (e.g. iPhone, Mac).
    /// - Parameter browser: Browser families to filter by, comma-separated (e.g. Chrome, Mobile Safari).
    /// - Parameter os: Operating system families to filter by, comma-separated (e.g. iOS, Windows).
    /// - Parameter utmSource: utm_source values to filter by, comma-separated.
    /// - Parameter hostname: Page hostnames to filter by, comma-separated.
    /// - Parameter page: Page paths to filter by, comma-separated.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(identifier: String? = nil, accountId: String? = nil, from: Date? = nil, to: Date? = nil, first: Int? = nil, after: String? = nil, before: String? = nil, direction: ListEventsRequestDirection? = nil, event: String? = nil, source: String? = nil, attributionModel: ListEventsRequestAttributionModel? = nil, country: String? = nil, city: String? = nil, device: String? = nil, browser: String? = nil, os: String? = nil, utmSource: String? = nil, hostname: String? = nil, page: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListEventsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/events",
            queryParams: [
                "identifier": identifier.map { .string($0) }, 
                "account_id": accountId.map { .string($0) }, 
                "from": from.map { .date($0) }, 
                "to": to.map { .date($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "event": event.map { .string($0) }, 
                "source": source.map { .string($0) }, 
                "attribution_model": attributionModel.map { .string($0.rawValue) }, 
                "country": country.map { .string($0) }, 
                "city": city.map { .string($0) }, 
                "device": device.map { .string($0) }, 
                "browser": browser.map { .string($0) }, 
                "os": os.map { .string($0) }, 
                "utm_source": utmSource.map { .string($0) }, 
                "hostname": hostname.map { .string($0) }, 
                "page": page.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListEventsResponse.self
        )
    }

    /// Tracks a conversion or engagement event for an account, such as a lead or a sign-up, so it can be attributed to the ads and links that drove it. Send server-side events with an API key that has `event:create`; the browser pixel calls this without authentication.
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
    ///     _ = try await client.events.create(request: .init(
    ///         accountId: "biz_xxxxxxxxxxxxxx",
    ///         eventName: "coating_deposit_paid"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateEventsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateEventsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/events",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateEventsResponse.self
        )
    }

    /// Returns a fully anonymized feed of recent money movement across Whop, most recent first, such as purchases, card spend, and transfers between accounts. Each item carries only its `type`, a USD amount, a coarse location, and a timestamp coarsened to the minute. The payload is identical for every caller and requires no authentication.
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
    ///     _ = try await client.events.pulse()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter event: Filter to one or more types, comma separated — for example `purchase,card_spend`. These are the item's `type`, not its `event_name`: several types share the `ledger_line.created` event name. Omit for every type in the feed. Values outside the feed's own set are rejected.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pulse(event: String? = nil, first: Int? = nil, after: String? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> PulseEventsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/events/pulse",
            queryParams: [
                "event": event.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: PulseEventsResponse.self
        )
    }

    /// Checks whether the Whop pixel is installed for an account, or on one page when you pass a `url`. Use it before launching an ad to confirm its destination is tracked, or in a setup flow to tell a merchant whether their install is live.
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
    ///     _ = try await client.events.validatePixel(request: .init())
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func validatePixel(request: Requests.ValidatePixelEventsRequest, requestOptions: RequestOptions? = nil) async throws -> PixelValidation {
        return try await httpClient.performRequest(
            method: .post,
            path: "/events/validate_pixel",
            body: request,
            requestOptions: requestOptions,
            responseType: PixelValidation.self
        )
    }
}