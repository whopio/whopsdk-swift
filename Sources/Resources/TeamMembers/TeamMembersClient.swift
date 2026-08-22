import Foundation

public final class TeamMembersClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists an account's team members, including pending invites (`status: "pending"`, `ausri_` ids; `user` is `null` for invites sent to an email with no Whop account yet). For accepted members, `email` requires the `company:authorized_user:email:read` scope and is `null` otherwise. Listing `role=workforce` is also allowed with the `bounty:create` scope.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.teamMembers.list(accountId: "account_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account ID, prefixed `biz_`.
    /// - Parameter status: Only return members with this status: `joined` (accepted members) or `pending` (pending invites). Both are returned by default.
    /// - Parameter userId: Only return the membership for this user ID, prefixed `user_`.
    /// - Parameter role: Only return members with this role. `custom` matches members on a dashboard-managed custom role.
    /// - Parameter createdBefore: Only return members added before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only return members added after this ISO 8601 timestamp.
    /// - Parameter order: Field used to sort members.
    /// - Parameter direction: Sort direction. Defaults to `desc`.
    /// - Parameter first: Number of members to return. Defaults to 20; maximum 100.
    /// - Parameter after: Cursor for the next page of members.
    /// - Parameter last: Number of members to return from the end of the window.
    /// - Parameter before: Cursor to paginate backwards from.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String, status: ListTeamMembersRequestStatus? = nil, userId: String? = nil, role: ListTeamMembersRequestRole? = nil, createdBefore: String? = nil, createdAfter: String? = nil, order: ListTeamMembersRequestOrder? = nil, direction: ListTeamMembersRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListTeamMembersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/team_members",
            queryParams: [
                "account_id": .string(accountId), 
                "status": status.map { .string($0.rawValue) }, 
                "user_id": userId.map { .string($0) }, 
                "role": role.map { .string($0.rawValue) }, 
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

    /// Adds a member to an account's team with a system role. Identify them by exactly one of `user_id` or `email`. If the person has not yet accepted — or the email does not belong to a Whop account yet — an invitation is sent instead and the response is `202` with `{ "object": "team_member_invite", "invitation_sent": true }`. If they already have a pending invite, the request fails with a `400`. Custom roles cannot be granted via the API. Granting the `workforce` role is also allowed with the `bounty:create` scope.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.teamMembers.create(request: .init(
    ///         accountId: "biz_xxxxxxxxxxxxxx",
    ///         role: .owner
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

    /// Retrieves a team member by ID. `email` requires the `company:authorized_user:email:read` scope and is `null` otherwise.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.teamMembers.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Team member ID — `ausr_` for accepted members, `ausri_` for pending invites.
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
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.teamMembers.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Team member ID — `ausr_` for accepted members, `ausri_` for pending invites.
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
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.teamMembers.update(
    ///         id: "id",
    ///         request: .init(role: .owner)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Team member ID — `ausr_` for accepted members, `ausri_` for pending invites.
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