import Foundation

public final class BusinessesClient: Sendable {
    public let earnings: EarningsClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.earnings = EarningsClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the businesses the authenticated user referred onto Whop, most recent first.
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
    ///     _ = try await client.partners.businesses.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter referringAccountId: List the referrals this business's team members made, past members included, instead of the authenticated user's own. Requires company:basic:read on that business, which every team member holds, and cannot be combined with user_id. The owner role reads every referral; anyone else reads only the referrals made by themselves and by the people under them in the org chart.
    /// - Parameter advanceStatus: Filter the authenticated partner's CPA offers by status, or with referring_account_id, the CPA terms of the reps the caller manages. Use offered for every state after qualification.
    /// - Parameter status: Filter by referral status.
    /// - Parameter hasEarnings: When true, only businesses with pending or completed earnings paid to the caller.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter includeTotalCount: Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    /// - Parameter order: The field to sort partner businesses by.
    /// - Parameter direction: Sort direction.
    /// - Parameter createdBefore: Only return partner businesses created before this timestamp.
    /// - Parameter createdAfter: Only return partner businesses created after this timestamp.
    /// - Parameter firstSaleBefore: Only return partner businesses whose first paid sale above zero happened before this timestamp.
    /// - Parameter firstSaleAfter: Only return partner businesses whose first paid sale above zero happened after this timestamp. Combined with first_sale_before, this is the net new set: businesses that processed their first $1 inside the window.
    /// - Parameter referredUserId: Filter to referrals attributed to this user. For first-tier referrals, this is the referred account owner; for second-tier referrals, this is the partner you recruited.
    /// - Parameter referredUsername: Filter by the referred user's exact username. Ignored when `referred_user_id` is present.
    /// - Parameter tier: Filter to referrals from a single tier: first, second, or blueprint.
    /// - Parameter businessPrefixQuery: Case-insensitive business-name prefix, or an exact `biz_` account ID. Surrounding whitespace is ignored; blank values apply no filter.
    /// - Parameter earningPartnerId: Only the referrals this team member made, plus the ones they were added to as a deal participant. User ID, prefixed `user_`. Requires `referring_account_id`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(referringAccountId: String? = nil, advanceStatus: ListBusinessesRequestAdvanceStatus? = nil, status: ListBusinessesRequestStatus? = nil, hasEarnings: Bool? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, includeTotalCount: Bool? = nil, order: ListBusinessesRequestOrder? = nil, direction: ListBusinessesRequestDirection? = nil, createdBefore: String? = nil, createdAfter: String? = nil, firstSaleBefore: String? = nil, firstSaleAfter: String? = nil, referredUserId: String? = nil, referredUsername: String? = nil, tier: ListBusinessesRequestTier? = nil, businessPrefixQuery: String? = nil, earningPartnerId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListBusinessesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/partners/businesses",
            queryParams: [
                "referring_account_id": referringAccountId.map { .string($0) }, 
                "advance_status": advanceStatus.map { .string($0.rawValue) }, 
                "status": status.map { .string($0.rawValue) }, 
                "has_earnings": hasEarnings.map { .bool($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "include_total_count": includeTotalCount.map { .bool($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "first_sale_before": firstSaleBefore.map { .string($0) }, 
                "first_sale_after": firstSaleAfter.map { .string($0) }, 
                "referred_user_id": referredUserId.map { .string($0) }, 
                "referred_username": referredUsername.map { .string($0) }, 
                "tier": tier.map { .string($0.rawValue) }, 
                "business_prefix_query": businessPrefixQuery.map { .string($0) }, 
                "earning_partner_id": earningPartnerId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListBusinessesResponse.self
        )
    }

    /// Retrieves a single referred business and its referral terms. The original referrer or a caller with company:basic:read on the business credited for the referral can read it.
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
    ///     _ = try await client.partners.businesses.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The partner business ID (a coma_ identifier).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> RetrieveBusinessesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/partners/businesses/\(id)",
            requestOptions: requestOptions,
            responseType: RetrieveBusinessesResponse.self
        )
    }

    /// Save annual payment projections for a business referred by the authenticated partner. Unaccepted projections can be replaced with updated annual card and BNPL payment volume. To qualify, payment volume over the last 30 days must reach 5% of the annual payment projection. Ads are excluded from CPA; ordinary ad commissions continue. Pass withdraw_projections: true without projection amounts to remove unaccepted projections. Accepted projections are immutable. Public API access requires a partner OAuth token; business API keys are not supported.
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
    ///     _ = try await client.partners.businesses.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The partner business ID (a coma_ identifier).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateBusinessesRequest, requestOptions: RequestOptions? = nil) async throws -> UpdateBusinessesResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/partners/businesses/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateBusinessesResponse.self
        )
    }

    /// Accept the authenticated partner's CPA offer with the reviewed terms and signed offer token. Public API access requires a partner OAuth token; business API keys are not supported.
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
    ///     _ = try await client.partners.businesses.acceptCommissionAdvance(
    ///         id: "id",
    ///         request: .init(
    ///             acknowledgments: [
    ///                 .commissionReplacement,
    ///                 .clawback,
    ///                 .term
    ///             ],
    ///             expectedAmountUsd: "1079.99",
    ///             offerToken: "eyJfcmFpbHMiOnsiZGF0YSI6MSwicHVyIjoiYmxvYl9pZCJ9fQ==--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    ///             termsVersion: "2026-01-01"
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The referred business relationship ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func acceptCommissionAdvance(id: String, request: Requests.AcceptCommissionAdvanceBusinessesRequest, requestOptions: RequestOptions? = nil) async throws -> AcceptCommissionAdvanceBusinessesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/partners/businesses/\(id)/accept_commission_advance",
            body: request,
            requestOptions: requestOptions,
            responseType: AcceptCommissionAdvanceBusinessesResponse.self
        )
    }

    /// Re-emails an outstanding invite to claim ownership of a referred business. Find the invite in the business's `pending_owner_invites`. Only the first-tier partner can resend, from a whop.com session or the Whop CLI or MCP with `partner:handoff`. Rate limited to one resend per invite every five minutes.
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
    ///     _ = try await client.partners.businesses.resendInvite(
    ///         id: "id",
    ///         request: .init(inviteId: "ausri_xxxxxxxxxxxxxx")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The partner business ID (a coma_ identifier).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func resendInvite(id: String, request: Requests.ResendInviteBusinessesRequest, requestOptions: RequestOptions? = nil) async throws -> ResendInviteBusinessesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/partners/businesses/\(id)/resend_invite",
            body: request,
            requestOptions: requestOptions,
            responseType: ResendInviteBusinessesResponse.self
        )
    }
}