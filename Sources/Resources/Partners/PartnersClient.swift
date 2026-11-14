import Foundation

public final class PartnersClient: Sendable {
    public let businesses: BusinessesClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.businesses = BusinessesClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Enrolls the calling user in the Whop partner program, making their partner businesses eligible for earnings. Idempotent — enrolling again keeps the original enrollment time.
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
    ///     _ = try await client.partners.create()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(requestOptions: RequestOptions? = nil) async throws -> CreatePartnersResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/partners",
            requestOptions: requestOptions,
            responseType: CreatePartnersResponse.self
        )
    }

    /// Lists, per income stream, the fee a business the caller refers would be charged, how low the caller may price it, and the commission the caller earns on that stream. Answers for a referral that does not exist yet, so a referral flow can price the deal before the business is created. Requires `partner:fees:update`, since the floors a partner may price down to are only for a credential that can set them.
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
    ///     _ = try await client.partners.feeOptions()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func feeOptions(requestOptions: RequestOptions? = nil) async throws -> FeeOptionsPartnersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/partners/fee_options",
            requestOptions: requestOptions,
            responseType: FeeOptionsPartnersResponse.self
        )
    }

    /// Ranks referrers by partner business earnings over the chosen `period`, all-time by default. Authentication is optional: authenticated callers also get their own standing, anonymous callers get the rankings alone.
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
    ///     _ = try await client.partners.leaderboard()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter period: Time window for the rankings. `day`, `month`, and `year` count earnings since the start of the current calendar day, month, or year; `last_30_days` counts earnings over the trailing 30 days; `all_time` ranks lifetime earnings.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func leaderboard(period: LeaderboardPartnersRequestPeriod? = nil, requestOptions: RequestOptions? = nil) async throws -> LeaderboardPartnersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/partners/leaderboard",
            queryParams: [
                "period": period.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: LeaderboardPartnersResponse.self
        )
    }

    /// Lists the users the caller referred onto Whop, newest first by default, each with the caller's total affiliate earnings from that user across all tiers. Deprecated: this list is retired and no longer appears in the API reference. It keeps responding for existing integrations and has no replacement.
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
    ///     _ = try await client.partners.referredUsers()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter earningPartnerId: The selected referring partner's user_ ID. Requires user_id=global; cannot be combined with earning_partner_username.
    /// - Parameter earningPartnerUsername: The selected referring partner's exact username. Requires user_id=global; cannot be combined with earning_partner_id.
    /// - Parameter referringAccountId: List the users this business's team members referred, past members included, instead of the caller's own. Requires company:basic:read on that business, which every team member holds, and cannot be combined with user_id. The owner role reads every team member's referrals; anyone else reads only their own and those of the people under them in the org chart. earning_partner_id or earning_partner_username then narrows to one team member.
    /// - Parameter query: Search referred users by name or username. In global mode, matches the beginning of usernames only.
    /// - Parameter hasBusinesses: When true, only referred users who brought at least one business onto Whop.
    /// - Parameter hasEarningBusinesses: When true, only referred users with at least one business that has generated earnings.
    /// - Parameter order: The field to sort by. created_at uses the user's signup date; earnings_usd uses the current primary referrer's cached total affiliate earnings from that user.
    /// - Parameter direction: The direction to sort results.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func referredUsers(earningPartnerId: String? = nil, earningPartnerUsername: String? = nil, referringAccountId: String? = nil, query: String? = nil, hasBusinesses: Bool? = nil, hasEarningBusinesses: Bool? = nil, order: ReferredUsersPartnersRequestOrder? = nil, direction: ReferredUsersPartnersRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ReferredUsersPartnersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/partners/referred_users",
            queryParams: [
                "earning_partner_id": earningPartnerId.map { .string($0) }, 
                "earning_partner_username": earningPartnerUsername.map { .string($0) }, 
                "referring_account_id": referringAccountId.map { .string($0) }, 
                "query": query.map { .string($0) }, 
                "has_businesses": hasBusinesses.map { .bool($0) }, 
                "has_earning_businesses": hasEarningBusinesses.map { .bool($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ReferredUsersPartnersResponse.self
        )
    }

    /// Retrieves the authenticated user's partner profile: enrollment and verification status, certification completion, active direct business referral count, and default payout rates. Other users' profiles are not accessible. To create and manage referral links, use `/partner_referral_requests`.
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
    ///     _ = try await client.partners.retrieve(id: "me")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The authenticated partner's user ID, prefixed user_, or me. Other users' profiles are not accessible.
    /// - Parameter accountId: Return `payout_rates` for this business, prefixed `biz_`, instead of the caller's own: the business's rate rows, else the platform defaults. Requires company:basic:read on that business, which every team member holds. The rest of the profile stays the caller's.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, accountId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> Partner {
        return try await httpClient.performRequest(
            method: .get,
            path: "/partners/\(id)",
            queryParams: [
                "account_id": accountId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: Partner.self
        )
    }
}