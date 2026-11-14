import Foundation

public final class MembersClient: Sendable {
    public let logs: LogsClient
    public let notes: NotesClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.logs = LogsClient(config: config)
        self.notes = NotesClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the members of an account. A member is one buyer's relationship with the account, regardless of how many memberships they hold.
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
    ///     _ = try await client.members.list(
    ///         userIds: [
    ///             "user_xxxxxxxxxxxxxx"
    ///         ],
    ///         productIds: [
    ///             "prod_xxxxxxxxxxxxx"
    ///         ],
    ///         variantIds: [
    ///             "plan_xxxxxxxxxxxxx"
    ///         ],
    ///         promoCodeIds: [
    ///             "promo_xxxxxxxxxxxx"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The account to list members for (`biz_` tag). Defaults to the account the credential acts as.
    /// - Parameter accessLevel: Filter by what the member can reach on the account.
    /// - Parameter status: Filter by whether the member is still part of the account.
    /// - Parameter userIds: Only return members whose users match these `user_` identifiers.
    /// - Parameter mostRecentActions: Only return members whose `most_recent_action` is one of these values.
    /// - Parameter membershipStatus: `active` returns members holding at least one membership that currently grants access; `inactive` returns members holding at least one membership that does not. Combined with `product_ids`, `variant_ids`, or `promo_code_ids`, one membership must match all of them.
    /// - Parameter productIds: Only return members holding a membership to one of these products, prefixed `prod_`. Unknown IDs match nothing.
    /// - Parameter variantIds: Only return members holding a membership on one of these variants, prefixed `plan_`. Unknown IDs match nothing.
    /// - Parameter promoCodeIds: Only return members holding a membership bought with one of these promo codes, prefixed `promo_`. Unknown IDs match nothing.
    /// - Parameter query: Search members by name or username. An exact email address also matches when the credential holds the member:email:read scope.
    /// - Parameter createdAfter: Only members who joined after this ISO 8601 timestamp.
    /// - Parameter createdBefore: Only members who joined before this ISO 8601 timestamp.
    /// - Parameter order: Sort field. `most_recent_action_at` and `last_activity_at` place members without one first when ascending and last when descending.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter includeTotalCount: Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, accessLevel: ListMembersRequestAccessLevel? = nil, status: ListMembersRequestStatus? = nil, userIds: [String]? = nil, mostRecentActions: [ListMembersRequestMostRecentActionsItem]? = nil, membershipStatus: ListMembersRequestMembershipStatus? = nil, productIds: [String]? = nil, variantIds: [String]? = nil, promoCodeIds: [String]? = nil, query: String? = nil, createdAfter: String? = nil, createdBefore: String? = nil, order: ListMembersRequestOrder? = nil, direction: ListMembersRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, includeTotalCount: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> ListMembersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/members",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "access_level": accessLevel.map { .string($0.rawValue) }, 
                "status": status.map { .string($0.rawValue) }, 
                "user_ids": userIds.map { .stringArray($0) }, 
                "most_recent_actions": mostRecentActions.map { .unknown($0) }, 
                "membership_status": membershipStatus.map { .string($0.rawValue) }, 
                "product_ids": productIds.map { .stringArray($0) }, 
                "variant_ids": variantIds.map { .stringArray($0) }, 
                "promo_code_ids": promoCodeIds.map { .stringArray($0) }, 
                "query": query.map { .string($0) }, 
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
            responseType: ListMembersResponse.self
        )
    }

    /// Adds a person to an account as a member. If the person is already a member of the account, that member is returned unchanged.
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
    ///     _ = try await client.members.create(request: .init(email: "jane@example.com"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateMembersRequest, requestOptions: RequestOptions? = nil) async throws -> Member {
        return try await httpClient.performRequest(
            method: .post,
            path: "/members",
            body: request,
            requestOptions: requestOptions,
            responseType: Member.self
        )
    }

    /// Retrieves a member by ID. Accessible to the account and to the member's own user.
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
    ///     _ = try await client.members.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Member ID (`mber_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Member {
        return try await httpClient.performRequest(
            method: .get,
            path: "/members/\(id)",
            requestOptions: requestOptions,
            responseType: Member.self
        )
    }

    /// Updates a member.
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
    ///     _ = try await client.members.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Member ID (`mber_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateMembersRequest, requestOptions: RequestOptions? = nil) async throws -> Member {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/members/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Member.self
        )
    }

    /// Unsubscribes a member from the account's marketing communications with the token from their unsubscribe link. Inboxes post here directly for one-click unsubscribe (RFC 8058).
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
    ///     _ = try await client.members.unsubscribe(
    ///         id: "id",
    ///         token: "token"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The member to unsubscribe, prefixed `mber_`.
    /// - Parameter token: The token from the member's unsubscribe link.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func unsubscribe(id: String, token: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .post,
            path: "/members/\(id)/unsubscribe",
            queryParams: [
                "token": .string(token)
            ],
            requestOptions: requestOptions
        )
    }
}