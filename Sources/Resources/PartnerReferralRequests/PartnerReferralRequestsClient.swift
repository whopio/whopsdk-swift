import Foundation

public final class PartnerReferralRequestsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists your referral links and attribution requests, including incoming requests for you or businesses you own, with filters for recipient, partner, type, and status.
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
    ///     _ = try await client.partnerReferralRequests.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only requests for this business ID, prefixed `biz_`.
    /// - Parameter targetUserId: Only requests received by this user ID, prefixed `user_`.
    /// - Parameter partnerId: Only requests sent by this partner's user ID, prefixed `user_`.
    /// - Parameter referringAccountId: Only the referral links created for memberships on this business's team, prefixed `biz_`. Needs read access to the business: its owner sees every member's links, a manager the links of the people reporting to them, and other members only their own.
    /// - Parameter status: Only requests with this approval status.
    /// - Parameter requestType: Only requests initiated in this way.
    /// - Parameter authorizedUserId: Only requests created for this team membership, prefixed `ausr_`.
    /// - Parameter memberId: Only requests that credit this member record, prefixed `mber_`. A request created for a team membership also credits its holder's member record.
    /// - Parameter personal: When true, only personal requests, created for neither a team membership nor a member record. When false, only requests created for one.
    /// - Parameter order: Field used to sort requests.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, targetUserId: String? = nil, partnerId: String? = nil, referringAccountId: String? = nil, status: ListPartnerReferralRequestsRequestStatus? = nil, requestType: ListPartnerReferralRequestsRequestRequestType? = nil, authorizedUserId: String? = nil, memberId: String? = nil, personal: Bool? = nil, order: ListPartnerReferralRequestsRequestOrder? = nil, direction: ListPartnerReferralRequestsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPartnerReferralRequestsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/partner_referral_requests",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "target_user_id": targetUserId.map { .string($0) }, 
                "partner_id": partnerId.map { .string($0) }, 
                "referring_account_id": referringAccountId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "request_type": requestType.map { .string($0.rawValue) }, 
                "authorized_user_id": authorizedUserId.map { .string($0) }, 
                "member_id": memberId.map { .string($0) }, 
                "personal": personal.map { .bool($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListPartnerReferralRequestsResponse.self
        )
    }

    /// Creates a referral link, or sends an attribution request to an existing business or user for approval. Links require an enrolled partner who is not suspended; attribution requests require an enrolled, verified partner. Recipients do not need to join the partner program.
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
    ///     _ = try await client.partnerReferralRequests.create(request: CreatePartnerReferralRequestsRequestBody.createPartnerReferralRequestsRequestBodyAccountId(
    ///         CreatePartnerReferralRequestsRequestBodyAccountId(
    ///             accountId: "biz_xxxxxxxxxxxxxx"
    ///         )
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreatePartnerReferralRequestsRequestBody, requestOptions: RequestOptions? = nil) async throws -> PartnerReferralRequest {
        return try await httpClient.performRequest(
            method: .post,
            path: "/partner_referral_requests",
            body: request,
            requestOptions: requestOptions,
            responseType: PartnerReferralRequest.self
        )
    }

    /// Retrieves a referral link or attribution request by ID, including its partner, recipient, approval status, and referral code when present.
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
    ///     _ = try await client.partnerReferralRequests.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Partner referral request ID, prefixed `prfr_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> PartnerReferralRequest {
        return try await httpClient.performRequest(
            method: .get,
            path: "/partner_referral_requests/\(id)",
            requestOptions: requestOptions,
            responseType: PartnerReferralRequest.self
        )
    }

    /// Accepts a pending attribution request as the receiving user or business owner, assigning the requesting partner as that user's or business's referrer.
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
    ///     _ = try await client.partnerReferralRequests.accept(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Partner referral request ID, prefixed `prfr_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func accept(id: String, requestOptions: RequestOptions? = nil) async throws -> PartnerReferralRequest {
        return try await httpClient.performRequest(
            method: .post,
            path: "/partner_referral_requests/\(id)/accept",
            requestOptions: requestOptions,
            responseType: PartnerReferralRequest.self
        )
    }

    /// Cancels a pending attribution request you sent so the recipient can no longer accept it, and returns the cancelled request.
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
    ///     _ = try await client.partnerReferralRequests.cancel(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Partner referral request ID, prefixed `prfr_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func cancel(id: String, requestOptions: RequestOptions? = nil) async throws -> PartnerReferralRequest {
        return try await httpClient.performRequest(
            method: .post,
            path: "/partner_referral_requests/\(id)/cancel",
            requestOptions: requestOptions,
            responseType: PartnerReferralRequest.self
        )
    }

    /// Declines a pending attribution request for you or a business you own, marking it as denied without assigning the requesting partner as a referrer.
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
    ///     _ = try await client.partnerReferralRequests.decline(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Partner referral request ID, prefixed `prfr_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func decline(id: String, requestOptions: RequestOptions? = nil) async throws -> PartnerReferralRequest {
        return try await httpClient.performRequest(
            method: .post,
            path: "/partner_referral_requests/\(id)/decline",
            requestOptions: requestOptions,
            responseType: PartnerReferralRequest.self
        )
    }
}