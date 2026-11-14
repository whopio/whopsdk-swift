import Foundation

public final class ChannelsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// List channels you can access.
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
    ///     _ = try await client.channels.list(kind: [
    ///         .private
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter includeTotalCount: Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    /// - Parameter kind: Channel kinds to return. Combine `private` and `support`, or pass `community` alone. `private` includes one-to-one and group direct messages.
    /// - Parameter supportRole: Which support channels to return. `customer` returns support chats you opened, including when `account_id` is set. `staff` returns the support inbox of the account in `account_id`, and requires permission to read that account's support chats. Applies only to `support` channels.
    /// - Parameter accountId: Filter channels by their owning account, prefixed `biz_`. Applies to private, community and support channels.
    /// - Parameter query: Return only channels whose name contains this text. Private and support channels also match a member's username or name. `%` and `_` match literally.
    /// - Parameter status: Return only support channels with this resolution. Requires `kind` to be `support` alone.
    /// - Parameter awaitingReply: `true` returns unresolved support channels whose last message came from the customer; `false` returns the other support channels. Other channel kinds are returned either way.
    /// - Parameter unread: `true` returns channels with messages you have not read; `false` returns the rest. Requires authenticating as a user.
    /// - Parameter pinned: `true` returns private and support channels you have pinned; `false` returns those you have not. Requires authenticating as a user.
    /// - Parameter viewed: `true` returns community channels you have opened; `false` returns those you never have. Requires authenticating as a user.
    /// - Parameter requested: `true` returns your pending direct-message requests; `false` returns your accepted private channels. Requires `private` in `kind` and authenticating as a user. With `support` also in `kind`, `false` keeps support channels and `true` returns only pending requests.
    /// - Parameter order: The field to sort by. Defaults to `last_viewed_at` for community channels and `last_message_at` for private and support channels. Ties sort in a stable order. Cannot be supplied with updated_after.
    /// - Parameter includeMembers: Include the current members of private and support channels, including you, with their public profiles.
    /// - Parameter includeLastMessage: Include the most recent message you can see, with its author.
    /// - Parameter direction: The sort direction. Defaults to `desc`. Cannot be supplied with updated_after.
    /// - Parameter includeDeleted: Include redacted entries for deleted channels and your removed memberships. Use deleted_at to remove these channels from your cache.
    /// - Parameter updatedAfter: Return channels where the channel or your membership changed at or after this ISO 8601 timestamp. Cannot be more than one hour old, including on subsequent pages. For older changes, reload channels without updated_after. Results use ascending synchronized_at order. Cannot be combined with order, direction, query, status, awaiting_reply, unread, pinned, viewed, requested, created_before, or created_after.
    /// - Parameter createdBefore: Return only channels created before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Return only channels created after this ISO 8601 timestamp.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, includeTotalCount: Bool? = nil, kind: [ListChannelsRequestKindItem]? = nil, supportRole: ListChannelsRequestSupportRole? = nil, accountId: String? = nil, query: String? = nil, status: ListChannelsRequestStatus? = nil, awaitingReply: Bool? = nil, unread: Bool? = nil, pinned: Bool? = nil, viewed: Bool? = nil, requested: Bool? = nil, order: ListChannelsRequestOrder? = nil, includeMembers: Bool? = nil, includeLastMessage: Bool? = nil, direction: ListChannelsRequestDirection? = nil, includeDeleted: Bool? = nil, updatedAfter: String? = nil, createdBefore: String? = nil, createdAfter: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListChannelsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/channels",
            queryParams: [
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "include_total_count": includeTotalCount.map { .bool($0) }, 
                "kind": kind.map { .unknown($0) }, 
                "support_role": supportRole.map { .string($0.rawValue) }, 
                "account_id": accountId.map { .string($0) }, 
                "query": query.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "awaiting_reply": awaitingReply.map { .bool($0) }, 
                "unread": unread.map { .bool($0) }, 
                "pinned": pinned.map { .bool($0) }, 
                "viewed": viewed.map { .bool($0) }, 
                "requested": requested.map { .bool($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "include_members": includeMembers.map { .bool($0) }, 
                "include_last_message": includeLastMessage.map { .bool($0) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "include_deleted": includeDeleted.map { .bool($0) }, 
                "updated_after": updatedAfter.map { .string($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListChannelsResponse.self
        )
    }

    /// Create a private, community or support channel. Returns an existing private or support channel unchanged with `200`, or a new channel with `201`.
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
    ///     _ = try await client.channels.create(request: .init(kind: .private))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateChannelsRequest, requestOptions: RequestOptions? = nil) async throws -> Channel {
        return try await httpClient.performRequest(
            method: .post,
            path: "/channels",
            body: request,
            requestOptions: requestOptions,
            responseType: Channel.self
        )
    }

    /// Retrieve a channel.
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
    ///     _ = try await client.channels.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Public resource ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Channel {
        return try await httpClient.performRequest(
            method: .get,
            path: "/channels/\(id)",
            requestOptions: requestOptions,
            responseType: Channel.self
        )
    }

    /// Delete a channel. Deleting a support channel requires `support_chat:create` on the account. Community channels delete their backing experience and accept account API keys with the `experience:delete` permission. Private and support channels require a user identity with channel management permission; account API keys cannot act as a channel participant.
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
    ///     _ = try await client.channels.delete(id: "id")
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
            path: "/channels/\(id)",
            requestOptions: requestOptions
        )
    }

    /// Update a channel. Community icon changes update the experience logo and require `experience:update`. Group private channel icon changes set the channel's own icon and require a group member. One-to-one private and support channels reject icon changes. Support rename and notification changes require `support_chat:create`. Private and support writes require a user identity with channel management permission. Account API keys can update community channels only.
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
    ///     _ = try await client.channels.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Public resource ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateChannelsRequest, requestOptions: RequestOptions? = nil) async throws -> Channel {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/channels/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Channel.self
        )
    }

    /// Accept a direct-message request.
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
    ///     _ = try await client.channels.accept(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Public resource ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func accept(id: String, request: Requests.AcceptChannelsRequest, requestOptions: RequestOptions? = nil) async throws -> ChannelMember {
        return try await httpClient.performRequest(
            method: .post,
            path: "/channels/\(id)/accept",
            body: request,
            requestOptions: requestOptions,
            responseType: ChannelMember.self
        )
    }

    /// Decline a DM request by hiding the channel from your inbox.
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
    ///     _ = try await client.channels.hide(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Public resource ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func hide(id: String, request: Requests.HideChannelsRequest, requestOptions: RequestOptions? = nil) async throws -> ChannelMember {
        return try await httpClient.performRequest(
            method: .post,
            path: "/channels/\(id)/hide",
            body: request,
            requestOptions: requestOptions,
            responseType: ChannelMember.self
        )
    }

    /// Mark a channel as read and optionally record viewed messages.
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
    ///     _ = try await client.channels.markRead(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Public resource ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func markRead(id: String, request: Requests.MarkReadChannelsRequest, requestOptions: RequestOptions? = nil) async throws -> ChannelMember {
        return try await httpClient.performRequest(
            method: .post,
            path: "/channels/\(id)/mark_read",
            body: request,
            requestOptions: requestOptions,
            responseType: ChannelMember.self
        )
    }

    /// Mark a channel as unread for the authenticated user. Experience channels are unchanged.
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
    ///     _ = try await client.channels.markUnread(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Public resource ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func markUnread(id: String, request: Requests.MarkUnreadChannelsRequest, requestOptions: RequestOptions? = nil) async throws -> ChannelMember {
        return try await httpClient.performRequest(
            method: .post,
            path: "/channels/\(id)/mark_unread",
            body: request,
            requestOptions: requestOptions,
            responseType: ChannelMember.self
        )
    }

    /// Pin a private or support channel for yourself. Omit position to append a new pin or keep an existing pin in place. An explicit zero-based position inserts or moves the pin and shifts the rest. At most 12 channels can be pinned.
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
    ///     _ = try await client.channels.pin(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The channel ID, prefixed `feed_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pin(id: String, request: Requests.PinChannelsRequest, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .post,
            path: "/channels/\(id)/pin",
            body: request,
            requestOptions: requestOptions
        )
    }

    /// Reopen a resolved support channel.
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
    ///     _ = try await client.channels.reopen(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Public resource ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func reopen(id: String, request: Requests.ReopenChannelsRequest, requestOptions: RequestOptions? = nil) async throws -> Channel {
        return try await httpClient.performRequest(
            method: .post,
            path: "/channels/\(id)/reopen",
            body: request,
            requestOptions: requestOptions,
            responseType: Channel.self
        )
    }

    /// Resolve a support channel.
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
    ///     _ = try await client.channels.resolve(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Public resource ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func resolve(id: String, request: Requests.ResolveChannelsRequest, requestOptions: RequestOptions? = nil) async throws -> Channel {
        return try await httpClient.performRequest(
            method: .post,
            path: "/channels/\(id)/resolve",
            body: request,
            requestOptions: requestOptions,
            responseType: Channel.self
        )
    }

    /// Remove a channel from your pins and compact the remaining order. Your discarded memberships and inaccessible channels can be unpinned. Does not return channel data or grant read access.
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
    ///     _ = try await client.channels.unpin(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The channel ID, prefixed `feed_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func unpin(id: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .post,
            path: "/channels/\(id)/unpin",
            requestOptions: requestOptions
        )
    }
}