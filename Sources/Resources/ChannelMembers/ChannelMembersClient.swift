import Foundation

public final class ChannelMembersClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List or search the people in a channel.
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
    ///     _ = try await client.channelMembers.list(channelId: "channel_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter channelId: The channel whose members to list.
    /// - Parameter query: Search by name or username.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, channelId: String, query: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListChannelMembersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/channel_members",
            queryParams: [
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "channel_id": .string(channelId), 
                "query": query.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListChannelMembersResponse.self
        )
    }

    /// Add a member to a direct or support channel.
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
    ///     _ = try await client.channelMembers.create(request: .init(
    ///         channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
    ///         userId: "user_xxxxxxxxxxxxxx"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateChannelMembersRequest, requestOptions: RequestOptions? = nil) async throws -> ChannelMember {
        return try await httpClient.performRequest(
            method: .post,
            path: "/channel_members",
            body: request,
            requestOptions: requestOptions,
            responseType: ChannelMember.self
        )
    }

    /// Retrieve a channel member and their read position.
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
    ///     _ = try await client.channelMembers.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Public resource ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> ChannelMember {
        return try await httpClient.performRequest(
            method: .get,
            path: "/channel_members/\(id)",
            requestOptions: requestOptions,
            responseType: ChannelMember.self
        )
    }

    /// Remove a channel member, or leave the channel yourself. Requires dms:channel:manage and access to the channel. Removing someone else also requires permission to manage its members.
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
    ///     _ = try await client.channelMembers.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Public resource ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/channel_members/\(id)",
            requestOptions: requestOptions
        )
    }

    /// Update your notification preference using your stored membership ID in a private or support channel.
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
    ///     _ = try await client.channelMembers.update(
    ///         id: "id",
    ///         request: .init(notificationPreference: .all)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Public resource ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateChannelMembersRequest, requestOptions: RequestOptions? = nil) async throws -> ChannelMember {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/channel_members/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: ChannelMember.self
        )
    }
}