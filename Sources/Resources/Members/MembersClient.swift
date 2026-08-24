import Foundation

public final class MembersClient: Sendable {
    public let logs: LogsClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.logs = LogsClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the members of an account. A member is one buyer's relationship with the account, regardless of how many memberships they hold.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.members.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The account to list members for (`biz_` tag). Defaults to the account the credential acts as.
    /// - Parameter accessLevel: Filter by what the member can reach on the account.
    /// - Parameter status: Filter by whether the member is still part of the account.
    /// - Parameter query: Search members by name or username. An exact email address also matches when the credential holds the member:email:read scope.
    /// - Parameter createdAfter: Only members who joined after this ISO 8601 timestamp.
    /// - Parameter createdBefore: Only members who joined before this ISO 8601 timestamp.
    /// - Parameter order: Sort field.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of members to return from the start of the window.
    /// - Parameter after: Cursor to paginate forwards from.
    /// - Parameter last: Number of members to return from the end of the window.
    /// - Parameter before: Cursor to paginate backwards from.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, accessLevel: ListMembersRequestAccessLevel? = nil, status: ListMembersRequestStatus? = nil, query: String? = nil, createdAfter: String? = nil, createdBefore: String? = nil, order: ListMembersRequestOrder? = nil, direction: ListMembersRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListMembersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/members",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "access_level": accessLevel.map { .string($0.rawValue) }, 
                "status": status.map { .string($0.rawValue) }, 
                "query": query.map { .string($0) }, 
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
            responseType: ListMembersResponse.self
        )
    }

    /// Retrieves a member by ID. Accessible to the account and to the member's own user.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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
}