import Foundation

public final class MembershipsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists every membership the caller can read: an account API key its account's; a user credential their own plus those of every account they manage. `account_id` and `user_id` only narrow that list — values outside the caller's reach return fewer results, not an error.
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
    ///     _ = try await client.memberships.list(
    ///         externalAccount: "discord_123456789012345678",
    ///         productIds: [
    ///             "prod_xxxxxxxxxxxxx"
    ///         ],
    ///         variantIds: [
    ///             "plan_xxxxxxxxxxxxx"
    ///         ],
    ///         promoCodeIds: [
    ///             "promo_xxxxxxxxxxxxxx"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Narrow to one account (`biz_` tag). With read access to the account this lists all of its memberships; without, only the caller's own memberships in it.
    /// - Parameter userId: Narrow to one user's memberships (`user_` tag, or `me` for the caller). A user outside the caller's visible set returns an empty list.
    /// - Parameter memberId: Narrow to one member's memberships (`mber_` tag), including memberships bought by another business. A member outside the caller's visible set returns an empty list.
    /// - Parameter externalAccount: Narrow to memberships linked to one Discord or Telegram account, given as the platform's user ID prefixed with `discord_` or `telegram_`. Discord matches include memberships imported with that Discord ID. Any other format is a 400.
    /// - Parameter status: Filter by billing state. `trialing`, `active`, `past_due`, `completed`, `canceled`, and `expired` match the membership's `status`; `active`, `trialing`, and `past_due` exclude memberships set to cancel at period end. The other values are derived buckets that never appear as a `status`: `canceling` matches memberships set to cancel at period end; `paused` matches memberships with payment collection paused; `expiring` matches one-time purchases that have not yet expired; `one_time` matches one-time purchases that never expire; `unclaimed` matches memberships with no buyer user, including memberships bought by another business; `banned` matches memberships whose buyer is banned from the account.
    /// - Parameter statuses: Filter to memberships matching any of these billing states, with the same meanings as `status`. Repeat the parameter to pass several. Combined with `status` when both are sent.
    /// - Parameter productId: Filter to memberships of this product (`prod_` tag).
    /// - Parameter productIds: Filter to memberships of any of these products, each prefixed `prod_`. Repeat the parameter to pass several.
    /// - Parameter variantId: Filter to memberships of this variant (`plan_` tag).
    /// - Parameter variantIds: Filter to memberships of any of these variants, each prefixed `plan_`. Repeat the parameter to pass several.
    /// - Parameter promoCodeIds: Filter to memberships discounted by any of these promo codes, each prefixed `promo_`. Repeat the parameter to pass several.
    /// - Parameter createdAfter: Only memberships created after this ISO 8601 timestamp.
    /// - Parameter createdBefore: Only memberships created before this ISO 8601 timestamp.
    /// - Parameter order: Sort field.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter includeTotalCount: Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, userId: String? = nil, memberId: String? = nil, externalAccount: String? = nil, status: ListMembershipsRequestStatus? = nil, statuses: [ListMembershipsRequestStatusesItem]? = nil, productId: String? = nil, productIds: [String]? = nil, variantId: String? = nil, variantIds: [String]? = nil, promoCodeIds: [String]? = nil, createdAfter: String? = nil, createdBefore: String? = nil, order: ListMembershipsRequestOrder? = nil, direction: ListMembershipsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, includeTotalCount: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> ListMembershipsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/memberships",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "member_id": memberId.map { .string($0) }, 
                "external_account": externalAccount.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "statuses": statuses.map { .unknown($0) }, 
                "product_id": productId.map { .string($0) }, 
                "product_ids": productIds.map { .stringArray($0) }, 
                "variant_id": variantId.map { .string($0) }, 
                "variant_ids": variantIds.map { .stringArray($0) }, 
                "promo_code_ids": promoCodeIds.map { .stringArray($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "include_total_count": includeTotalCount.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListMembershipsResponse.self
        )
    }

    /// Emails one recipient an invitation to a free variant's membership. The invitation is bound to that recipient; after signing in, accepting it immediately grants the membership without checkout. This Experimental endpoint is available only to accounts enabled for membership invitations.
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
    ///     _ = try await client.memberships.invite(request: .init(variantId: "plan_xxxxxxxxxxxxxx"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func invite(request: Requests.InviteMembershipsRequest, requestOptions: RequestOptions? = nil) async throws -> InviteMembershipsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/memberships/invite",
            body: request,
            requestOptions: requestOptions,
            responseType: InviteMembershipsResponse.self
        )
    }

    /// Retrieves a membership by ID or license key. Accessible to the account and to the membership's own user.
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
    ///     _ = try await client.memberships.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Membership ID (`mem_` tag), or a software license key.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Membership {
        return try await httpClient.performRequest(
            method: .get,
            path: "/memberships/\(id)",
            requestOptions: requestOptions,
            responseType: Membership.self
        )
    }

    /// Updates a membership's metadata, scheduled cancellation, renewal payment method, renewal cadence, next renewal date, or renewal price.
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
    ///     _ = try await client.memberships.update(
    ///         id: "id",
    ///         request: .init(billingPeriodDays: 45)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Membership ID (`mem_` tag), or a software license key.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateMembershipsRequest, requestOptions: RequestOptions? = nil) async throws -> Membership {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/memberships/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Membership.self
        )
    }

    /// Applies a promo code to an `active` or `trialing` membership that does not already have one and has exactly one recurring item, for Stripe-billed memberships and memberships billed by Whop's billing engine. The discount lands on the next invoice and follows the code's duration (`once`, `repeating`, or `forever`).
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
    ///     _ = try await client.memberships.applyPromoCode(
    ///         id: "id",
    ///         request: .init(promoCode: "SAVE20")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Membership ID (`mem_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func applyPromoCode(id: String, request: Requests.ApplyPromoCodeMembershipsRequest, requestOptions: RequestOptions? = nil) async throws -> Membership {
        return try await httpClient.performRequest(
            method: .post,
            path: "/memberships/\(id)/apply_promo_code",
            body: request,
            requestOptions: requestOptions,
            responseType: Membership.self
        )
    }

    /// Assigns an affiliate to a membership and pays them the commission you set on its future payments; past payments are not recalculated. A user who is not yet an affiliate of your account becomes one, which also requires `affiliate:create`. Send a new `commission_type` or `commission_value` for the membership's current affiliate to change their commission; a membership that already has a different affiliate returns a conflict. Works for active or trialing memberships with one recurring variant that bill through Stripe or Whop's billing engine, and not for marketplace memberships, paused payments, or a scheduled cancellation. You cannot assign yourself.
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
    ///     _ = try await client.memberships.assignAffiliate(
    ///         id: "id",
    ///         request: .init(
    ///             commissionType: .flatFee,
    ///             commissionValue: 5,
    ///             email: "affiliate@example.com"
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Membership ID (`mem_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func assignAffiliate(id: String, request: Requests.AssignAffiliateMembershipsRequest, requestOptions: RequestOptions? = nil) async throws -> Membership {
        return try await httpClient.performRequest(
            method: .post,
            path: "/memberships/\(id)/assign_affiliate",
            body: request,
            requestOptions: requestOptions,
            responseType: Membership.self
        )
    }

    /// Cancels a membership, either immediately or at the end of the current billing period. Buyers cannot cancel buy-now-pay-later (`splitit`, `sezzle`) or non-trial split-pay memberships.
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
    ///     _ = try await client.memberships.cancel(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Membership ID (`mem_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func cancel(id: String, request: Requests.CancelMembershipsRequest, requestOptions: RequestOptions? = nil) async throws -> Membership {
        return try await httpClient.performRequest(
            method: .post,
            path: "/memberships/\(id)/cancel",
            body: request,
            requestOptions: requestOptions,
            responseType: Membership.self
        )
    }

    /// Adds free days to a membership, extending its current billing period, expiration date, or trial depending on the plan type.
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
    ///     _ = try await client.memberships.extend(
    ///         id: "id",
    ///         request: .init(days: 7)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Membership ID (`mem_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func extend(id: String, request: Requests.ExtendMembershipsRequest, requestOptions: RequestOptions? = nil) async throws -> Membership {
        return try await httpClient.performRequest(
            method: .post,
            path: "/memberships/\(id)/extend",
            body: request,
            requestOptions: requestOptions,
            responseType: Membership.self
        )
    }

    /// Pauses a membership's recurring payment collection. The customer keeps access but is not charged until the membership is resumed.
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
    ///     _ = try await client.memberships.pause(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Membership ID (`mem_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pause(id: String, request: Requests.PauseMembershipsRequest, requestOptions: RequestOptions? = nil) async throws -> Membership {
        return try await httpClient.performRequest(
            method: .post,
            path: "/memberships/\(id)/pause",
            body: request,
            requestOptions: requestOptions,
            responseType: Membership.self
        )
    }

    /// Restores access to a `canceled` or `expired` membership that contains only one-time purchases and sets its `status` to `completed`. Lifetime memberships regain lifetime access; for memberships with an expiration, `days` sets the new `current_period_end`. Active and recurring memberships cannot be reactivated.
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
    ///     _ = try await client.memberships.reactivate(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Membership ID (`mem_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func reactivate(id: String, request: Requests.ReactivateMembershipsRequest, requestOptions: RequestOptions? = nil) async throws -> Membership {
        return try await httpClient.performRequest(
            method: .post,
            path: "/memberships/\(id)/reactivate",
            body: request,
            requestOptions: requestOptions,
            responseType: Membership.self
        )
    }

    /// Resumes a previously paused membership's recurring payment collection. Billing resumes on the next cycle.
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
    ///     _ = try await client.memberships.resume(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Membership ID (`mem_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func resume(id: String, requestOptions: RequestOptions? = nil) async throws -> Membership {
        return try await httpClient.performRequest(
            method: .post,
            path: "/memberships/\(id)/resume",
            requestOptions: requestOptions,
            responseType: Membership.self
        )
    }

    /// Re-runs access fulfillment for a membership: recomputes the member's content access on Whop, re-validates their Discord link (re-adding them to the server and re-assigning roles if needed), and re-fulfills TradingView indicator access. Telegram access is invite-based and is not resynced. The work runs in the background and the outcome is written to the membership's logs.
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
    ///     _ = try await client.memberships.resyncAccess(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Membership ID (`mem_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func resyncAccess(id: String, requestOptions: RequestOptions? = nil) async throws -> Membership {
        return try await httpClient.performRequest(
            method: .post,
            path: "/memberships/\(id)/resync_access",
            requestOptions: requestOptions,
            responseType: Membership.self
        )
    }

    /// Creates a one-use transfer URL for a membership. Opening the URL while logged into a different Whop account claims the membership onto that account. The membership's buyer can generate a link for their own membership with `membership:transfer` when the product allows transfers and the membership is `trialing`, `active`, or `completed`. An account credential with `membership:update` bypasses both restrictions.
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
    ///     _ = try await client.memberships.transfer(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Membership ID (`mem_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func transfer(id: String, requestOptions: RequestOptions? = nil) async throws -> TransferMembershipsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/memberships/\(id)/transfer",
            requestOptions: requestOptions,
            responseType: TransferMembershipsResponse.self
        )
    }
}