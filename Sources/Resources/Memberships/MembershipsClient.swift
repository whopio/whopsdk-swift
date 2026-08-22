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
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.memberships.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Narrow to one account (`biz_` tag). With read access to the account this lists all of its memberships; without, only the caller's own memberships in it.
    /// - Parameter userId: Narrow to one user's memberships (`user_` tag, or `me` for the caller). A user outside the caller's visible set returns an empty list.
    /// - Parameter status: Filter by billing state. `canceling` matches active memberships set to cancel at period end; `paused` matches memberships with payment collection paused.
    /// - Parameter productId: Filter to memberships of this product (`prod_` tag). Repeat as product_ids[] for several.
    /// - Parameter planId: Filter to memberships of this plan (`plan_` tag). Repeat as plan_ids[] for several.
    /// - Parameter createdAfter: Only memberships created after this ISO 8601 timestamp.
    /// - Parameter createdBefore: Only memberships created before this ISO 8601 timestamp.
    /// - Parameter order: Sort field.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of memberships to return from the start of the window.
    /// - Parameter after: Cursor to paginate forwards from.
    /// - Parameter last: Number of memberships to return from the end of the window.
    /// - Parameter before: Cursor to paginate backwards from.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, userId: String? = nil, status: ListMembershipsRequestStatus? = nil, productId: String? = nil, planId: String? = nil, createdAfter: String? = nil, createdBefore: String? = nil, order: ListMembershipsRequestOrder? = nil, direction: ListMembershipsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListMembershipsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/memberships",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "product_id": productId.map { .string($0) }, 
                "plan_id": planId.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListMembershipsResponse.self
        )
    }

    /// Sends an email inviting one recipient to join the account through a free plan. Identify the recipient by exactly one of `user_id` or `email`. The invitation is bound to that recipient; after signing in, accepting it immediately grants the membership without checkout. This Experimental endpoint is available only to accounts enabled for membership invitations.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.memberships.invite(request: InviteMembershipsRequestBody.inviteMembershipsRequestBodyUserId(
    ///         InviteMembershipsRequestBodyUserId(
    ///             planId: "plan_xxxxxxxxxxxxxx",
    ///             userId: "user_xxxxxxxxxxxxxx"
    ///         )
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func invite(request: InviteMembershipsRequestBody, requestOptions: RequestOptions? = nil) async throws -> InviteMembershipsResponse {
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
    ///     let client = Whop(token: "<token>")
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

    /// Updates a membership: merge metadata key-value pairs, or toggle `cancel_at_period_end` — `true` schedules the cancellation for the end of the current billing period, `false` reverses a pending one.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.memberships.update(
    ///         id: "id",
    ///         request: .init()
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

    /// Add free days to extend a membership's current billing period, expiration date, or Stripe trial.
    ///
    /// Required permissions:
    ///  - `member:manage`
    ///  - `member:email:read`
    ///  - `member:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.memberships.addFreeDaysMembership(
    ///         id: "mem_xxxxxxxxxxxxxx",
    ///         request: .init(freeDays: 42)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the membership.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func addFreeDaysMembership(id: String, request: Requests.AddFreeDaysMembershipRequest, requestOptions: RequestOptions? = nil) async throws -> Membership {
        return try await httpClient.performRequest(
            method: .post,
            path: "/memberships/\(id)/add_free_days",
            body: request,
            requestOptions: requestOptions,
            responseType: Membership.self
        )
    }

    /// Cancels a membership. Pass `cancel_at_period_end: true` to stop auto-renewal and keep access until the current billing period ends. Omit it (or pass `false`) to revoke access immediately. Buyers cannot cancel buy-now-pay-later (`splitit`, `sezzle`) or non-trial split-pay memberships.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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
    ///     let client = Whop(token: "<token>")
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
    ///     let client = Whop(token: "<token>")
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

    /// Resumes a previously paused membership's recurring payment collection. Billing resumes on the next cycle.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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

    /// Re-run access fulfillment for a membership. Recomputes the member's content access on Whop, re-validates their Discord link (re-adding them to the server and re-assigning roles if needed), and re-fulfills TradingView indicator access. Telegram access is invite-based and cannot be resynced here. The outcome is written to the membership's logs.
    ///
    /// Required permissions:
    ///  - `membership:resync_access`
    ///  - `member:email:read`
    ///  - `member:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.memberships.resyncAccessMembership(id: "mem_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the membership to resync access for.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func resyncAccessMembership(id: String, requestOptions: RequestOptions? = nil) async throws -> Membership {
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
    ///     let client = Whop(token: "<token>")
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

    /// Reverse a pending cancellation for a membership that was scheduled to cancel at period end.
    ///
    /// Required permissions:
    ///  - `member:manage`
    ///  - `member:email:read`
    ///  - `member:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.memberships.uncancelMembership(id: "mem_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the membership to uncancel.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func uncancelMembership(id: String, requestOptions: RequestOptions? = nil) async throws -> Membership {
        return try await httpClient.performRequest(
            method: .post,
            path: "/memberships/\(id)/uncancel",
            requestOptions: requestOptions,
            responseType: Membership.self
        )
    }
}