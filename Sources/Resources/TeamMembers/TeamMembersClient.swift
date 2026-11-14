import Foundation

public final class TeamMembersClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists team members, including pending invites. Pass `account_id` to list one account's team. Without it, a signed-in user can pass `user_id=me` to list their own joined memberships across accounts. The list has one for each account they can read. An API key without `account_id` lists the team of its own account. With `company:basic:read`, a user can list their own joined membership on one account. To do this, pass `status=joined` and their own `user_id` with the account ID. The `bounty:create` scope also allows listing `role=workforce` members. A signed-in Partner without `company:authorized_user:read` lists only their own joined membership and the members who report up to them. A member others report to gets the same list. Neither of them sees pending invites. Members with the view-only Partner role are listed after all other members.
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
    ///     _ = try await client.teamMembers.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only return the team of this account, prefixed `biz_`. A signed-in user can omit it only with `user_id=me` or their own user ID. An API key that omits it gets its own account. `reports_to_id`, `direct_reports_min` and `direct_reports_max` need it.
    /// - Parameter status: Only return members with this status: `joined` (accepted members) or `pending` (pending invites). Both are returned by default.
    /// - Parameter userId: Only return the memberships of this user ID, prefixed `user_`. Pass `me` for the signed-in user.
    /// - Parameter userIds: Only return the memberships of these users, prefixed `user_`, at most 100. IDs that match no user are ignored. With `account_id=global`, a user can have one in each partner account. Can't be combined with `user_id`.
    /// - Parameter role: Only return members with this role. `custom` matches members on a dashboard-managed custom role.
    /// - Parameter query: Only return members whose name or username contains this text, and invites whose email contains it.
    /// - Parameter reportsToId: Only return the direct reports of this team member, whose ID may start with `ausr_` or `mber_`. Pass the account ID, prefixed `biz_`, for the members who report to the business directly. Pending invites are excluded, and the list pages in `created_at` order without moving Partner-role members last.
    /// - Parameter directReportsMin: Only return members with at least this many direct reports. Pending invites are excluded, and the list pages in `created_at` order without moving Partner-role members last.
    /// - Parameter directReportsMax: Only return members with at most this many direct reports; `0` returns the people who manage no one. Pending invites are excluded, and the list pages in `created_at` order without moving Partner-role members last.
    /// - Parameter teamLeadId: Only return this user, prefixed `user_`, and everyone under them in today's org chart: the same team the stats API's `team_lead_id` reads. With `account_id=global`, their line in every partner account where they hold a role. Pending invites are excluded, and the list pages in `created_at` order without moving Partner-role members last.
    /// - Parameter hasReferredBusinesses: When true, only members who referred at least one business for their account; when false, only members who referred none. Pending invites are excluded, and the list pages in `created_at` order without moving Partner-role members last.
    /// - Parameter isPartner: When true, only members and invites with the view-only Partner role. When false, only the ones without it.
    /// - Parameter createdBefore: Only return members added before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only return members added after this ISO 8601 timestamp.
    /// - Parameter order: Field used to sort members. Members with the view-only Partner role are listed after all other members whichever way the list is sorted.
    /// - Parameter direction: Sort direction. Defaults to `desc`.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, status: ListTeamMembersRequestStatus? = nil, userId: String? = nil, userIds: [String]? = nil, role: ListTeamMembersRequestRole? = nil, query: String? = nil, reportsToId: String? = nil, directReportsMin: Int? = nil, directReportsMax: Int? = nil, teamLeadId: String? = nil, hasReferredBusinesses: Bool? = nil, isPartner: Bool? = nil, createdBefore: String? = nil, createdAfter: String? = nil, order: ListTeamMembersRequestOrder? = nil, direction: ListTeamMembersRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListTeamMembersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/team_members",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "user_id": userId.map { .string($0) }, 
                "user_ids": userIds.map { .stringArray($0) }, 
                "role": role.map { .string($0.rawValue) }, 
                "query": query.map { .string($0) }, 
                "reports_to_id": reportsToId.map { .string($0) }, 
                "direct_reports_min": directReportsMin.map { .int($0) }, 
                "direct_reports_max": directReportsMax.map { .int($0) }, 
                "team_lead_id": teamLeadId.map { .string($0) }, 
                "has_referred_businesses": hasReferredBusinesses.map { .bool($0) }, 
                "is_partner": isPartner.map { .bool($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListTeamMembersResponse.self
        )
    }

    /// Adds a member to an account's team with a system role. Identify them by exactly one of `user_id` or `email`. If the person has not yet accepted, or the email does not belong to a Whop account yet, an invitation is sent instead and the response is `202` with the pending team member, whose `status` is `pending` and whose id is prefixed `ausri_`. If they already have a pending invite, the request fails with a `400`. Granting the `workforce` role is also allowed with the `bounty:create` scope.
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
    ///     _ = try await client.teamMembers.create(request: .init(
    ///         accountId: "biz_xxxxxxxxxxxxxx",
    ///         role: .salesManager,
    ///         userId: "user_xxxxxxxxxxxxxx"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateTeamMembersRequest, requestOptions: RequestOptions? = nil) async throws -> TeamMember {
        return try await httpClient.performRequest(
            method: .post,
            path: "/team_members",
            body: request,
            requestOptions: requestOptions,
            responseType: TeamMember.self
        )
    }

    /// Retrieves a team member or pending invite by ID.
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
    ///     _ = try await client.teamMembers.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Team member ID. Accepted members have an ID starting with `ausr_` or `mber_`, and pending invites one starting with `ausri_`. Treat it as opaque.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> TeamMember {
        return try await httpClient.performRequest(
            method: .get,
            path: "/team_members/\(id)",
            requestOptions: requestOptions,
            responseType: TeamMember.self
        )
    }

    /// Removes a team member from the account, or revokes a pending invite when given an `ausri_` ID. A user session may delete its own membership to leave the team without the delete scope. Removing a member on the `workforce` role is also allowed with the `bounty:create` scope. The account owner cannot be removed.
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
    ///     _ = try await client.teamMembers.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Team member ID. Accepted members have an ID starting with `ausr_` or `mber_`, and pending invites one starting with `ausri_`. Treat it as opaque.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteTeamMembersResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/team_members/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteTeamMembersResponse.self
        )
    }

    /// Changes a team member's system role. Requires a user session — account API keys cannot change member roles. The account owner's role cannot be changed, and you cannot change your own role.
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
    ///     _ = try await client.teamMembers.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Team member ID. Accepted members have an ID starting with `ausr_` or `mber_`, and pending invites one starting with `ausri_`. Treat it as opaque.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateTeamMembersRequest, requestOptions: RequestOptions? = nil) async throws -> TeamMember {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/team_members/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: TeamMember.self
        )
    }
}