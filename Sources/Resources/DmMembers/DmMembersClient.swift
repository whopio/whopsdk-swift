import Foundation

public final class DmMembersClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of members in a specific DM channel, sorted by the date they were added.
    ///
    /// Required permissions (one of):
    ///  - `dms:read`
    ///  - `support_chat:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.dmMembers.list(
    ///         first: 42,
    ///         last: 42,
    ///         channelId: "channel_id"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter after: Returns the elements in the list that come after the specified cursor.
    /// - Parameter before: Returns the elements in the list that come before the specified cursor.
    /// - Parameter first: Returns the first _n_ elements from the list.
    /// - Parameter last: Returns the last _n_ elements from the list.
    /// - Parameter channelId: The unique identifier of the DM channel to list members for.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, channelId: String, requestOptions: RequestOptions? = nil) async throws -> ListDmMembersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/dm_members",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "channel_id": .string(channelId)
            ],
            requestOptions: requestOptions,
            responseType: ListDmMembersResponse.self
        )
    }

    /// Add a new user to an existing DM channel. Only an admin of the channel can add members.
    ///
    /// Required permissions (one of):
    ///  - `dms:message:manage`
    ///  - `support_chat:message:create`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.dmMembers.create(request: .init(
    ///         channelId: "channel_id",
    ///         userId: "user_xxxxxxxxxxxxx"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateDmMembersRequest, requestOptions: RequestOptions? = nil) async throws -> DmMember {
        return try await httpClient.performRequest(
            method: .post,
            path: "/dm_members",
            body: request,
            requestOptions: requestOptions,
            responseType: DmMember.self
        )
    }

    /// Retrieves the details of an existing DM member.
    ///
    /// Required permissions (one of):
    ///  - `dms:read`
    ///  - `support_chat:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.dmMembers.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the DM channel member to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> DmMember {
        return try await httpClient.performRequest(
            method: .get,
            path: "/dm_members/\(id)",
            requestOptions: requestOptions,
            responseType: DmMember.self
        )
    }

    /// Remove a user from a DM channel. An admin can remove any member, and a member can remove themselves.
    ///
    /// Required permissions (one of):
    ///  - `dms:read`
    ///  - `support_chat:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.dmMembers.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the DM channel member to remove.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/dm_members/\(id)",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }

    /// Update a DM channel member's settings, such as their notification preferences or membership status.
    ///
    /// Required permissions (one of):
    ///  - `dms:read`
    ///  - `support_chat:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.dmMembers.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the DM channel member to update.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateDmMembersRequest, requestOptions: RequestOptions? = nil) async throws -> DmMember {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/dm_members/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: DmMember.self
        )
    }
}