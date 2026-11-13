import Foundation

public final class MessagesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists messages in a channel. Existing public message and channel IDs are preserved. For reconnect synchronization, use inclusive updated_after with include_deleted=true; results use ascending change order. Follow the returned cursors and replace cached messages by ID, including when updated_at is unchanged. The returned updated_at is the stored message update time; reaction changes only affect synchronization ordering. Deleted entries contain identity and timestamps with their content redacted. To jump into history, specify channel_id and one around anchor; results use ascending creation-time order. For older messages in chronological order, use before_message_id with last and direction=asc; for newer messages, use after_message_id with first and direction=asc. Do not supply order or direction with updated_after or an around anchor. Keep message-ID filters when continuing with cursors. For around queries, omit the around anchor and continue with direction=asc.
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
    ///     _ = try await client.messages.list(channelId: "channel_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter channelId: Filter by public channel ID. An experience ID is also accepted for experience chat.
    /// - Parameter replyingToMessageId: Return replies to this message.
    /// - Parameter pinned: Filter by message pin state.
    /// - Parameter includeDeleted: Include redacted deletion entries for cache synchronization.
    /// - Parameter createdAfter: Return messages created strictly after this ISO 8601 timestamp.
    /// - Parameter createdBefore: Return messages created strictly before this ISO 8601 timestamp.
    /// - Parameter updatedAfter: Return messages changed at or after this ISO 8601 timestamp in ascending change order. Cannot be combined with history filters, around anchors, order, or direction.
    /// - Parameter beforeMessageId: Filter messages strictly before this message in channel_id by creation time and message ID. Deleted anchors are accepted; missing or other-channel IDs return 404. Cannot be combined with around anchors or updated_after.
    /// - Parameter afterMessageId: Filter messages strictly after this message in channel_id by creation time and message ID. Deleted anchors are accepted; missing or other-channel IDs return 404. Cannot be combined with around anchors or updated_after.
    /// - Parameter aroundMessageId: Center the first page around this live message in the selected channel.
    /// - Parameter aroundTimestamp: Center the first page around this ISO 8601 timestamp in the selected channel.
    /// - Parameter order: History sort field. Defaults to created_at. Cannot be supplied with updated_after or around anchors.
    /// - Parameter direction: History sort direction. Defaults to desc. Cannot be supplied with updated_after or around anchors.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(channelId: String, replyingToMessageId: String? = nil, pinned: Bool? = nil, includeDeleted: Bool? = nil, createdAfter: String? = nil, createdBefore: String? = nil, updatedAfter: String? = nil, beforeMessageId: String? = nil, afterMessageId: String? = nil, aroundMessageId: String? = nil, aroundTimestamp: String? = nil, order: ListMessagesRequestOrder? = nil, direction: ListMessagesRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListMessagesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/messages",
            queryParams: [
                "channel_id": .string(channelId), 
                "replying_to_message_id": replyingToMessageId.map { .string($0) }, 
                "pinned": pinned.map { .bool($0) }, 
                "include_deleted": includeDeleted.map { .bool($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "updated_after": updatedAfter.map { .string($0) }, 
                "before_message_id": beforeMessageId.map { .string($0) }, 
                "after_message_id": afterMessageId.map { .string($0) }, 
                "around_message_id": aroundMessageId.map { .string($0) }, 
                "around_timestamp": aroundTimestamp.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListMessagesResponse.self
        )
    }

    /// Sends a Markdown message as the authenticated user or app agent. Channel access, posting restrictions, moderation, and delivery follow the existing chat services. Use Idempotency-Key to safely retry a send. The response and realtime message use the same message ID. Custom author presentation and embeds are read-only.
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
    ///     _ = try await client.messages.create(request: .init(
    ///         channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
    ///         content: "New **message**"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateMessagesRequest, requestOptions: RequestOptions? = nil) async throws -> ChatMessage {
        return try await httpClient.performRequest(
            method: .post,
            path: "/messages",
            body: request,
            requestOptions: requestOptions,
            responseType: ChatMessage.self
        )
    }

    /// Retrieves a live message from an accessible channel. Use list synchronization to retrieve deletion entries.
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
    ///     _ = try await client.messages.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Existing public message ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> ChatMessage {
        return try await httpClient.performRequest(
            method: .get,
            path: "/messages/\(id)",
            requestOptions: requestOptions,
            responseType: ChatMessage.self
        )
    }

    /// Deletes a message as its author or a permitted moderator. Deleted messages remain available as redacted entries through list synchronization.
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
    ///     _ = try await client.messages.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Existing public message ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/messages/\(id)",
            requestOptions: requestOptions
        )
    }

    /// Updates the author's message. Use the pin and unpin actions to change its pin state. Omitted fields are preserved; attachment and preview collections replace their previous values.
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
    ///     _ = try await client.messages.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Existing public message ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateMessagesRequest, requestOptions: RequestOptions? = nil) async throws -> ChatMessage {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/messages/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: ChatMessage.self
        )
    }

    /// Pins a message in its channel. Requires the channel's pin permission.
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
    ///     _ = try await client.messages.pin(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The message to pin.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pin(id: String, requestOptions: RequestOptions? = nil) async throws -> ChatMessage {
        return try await httpClient.performRequest(
            method: .post,
            path: "/messages/\(id)/pin",
            requestOptions: requestOptions,
            responseType: ChatMessage.self
        )
    }

    /// Add your emoji reaction to a message. Reacting again with the same emoji changes nothing.
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
    ///     _ = try await client.messages.react(
    ///         id: "id",
    ///         request: .init(emoji: "❤️")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the message to react to.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func react(id: String, request: Requests.ReactMessagesRequest, requestOptions: RequestOptions? = nil) async throws -> ChatMessage {
        return try await httpClient.performRequest(
            method: .post,
            path: "/messages/\(id)/react",
            body: request,
            requestOptions: requestOptions,
            responseType: ChatMessage.self
        )
    }

    /// List who reacted to a message, newest first. Optionally filter by emoji.
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
    ///     _ = try await client.messages.listReactions(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the message.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter emoji: Only return reactions with this emoji, as a Unicode emoji or a supported shortcode.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listReactions(id: String, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, emoji: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListReactionsMessagesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/messages/\(id)/reactions",
            queryParams: [
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "emoji": emoji.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListReactionsMessagesResponse.self
        )
    }

    /// Unpins a message in its channel. Requires the channel's pin permission.
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
    ///     _ = try await client.messages.unpin(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The message to unpin.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func unpin(id: String, requestOptions: RequestOptions? = nil) async throws -> ChatMessage {
        return try await httpClient.performRequest(
            method: .post,
            path: "/messages/\(id)/unpin",
            requestOptions: requestOptions,
            responseType: ChatMessage.self
        )
    }

    /// Remove your emoji reaction from a message. Removing a reaction you have not added changes nothing.
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
    ///     _ = try await client.messages.unreact(
    ///         id: "id",
    ///         request: .init(emoji: "❤️")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the message to remove your reaction from.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func unreact(id: String, request: Requests.UnreactMessagesRequest, requestOptions: RequestOptions? = nil) async throws -> ChatMessage {
        return try await httpClient.performRequest(
            method: .post,
            path: "/messages/\(id)/unreact",
            body: request,
            requestOptions: requestOptions,
            responseType: ChatMessage.self
        )
    }

    /// Vote for one option on a message poll. Each user can vote once per poll.
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
    ///     _ = try await client.messages.vote(
    ///         id: "id",
    ///         request: .init(pollOptionId: "2")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the message containing the poll.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func vote(id: String, request: Requests.VoteMessagesRequest, requestOptions: RequestOptions? = nil) async throws -> ChatMessage {
        return try await httpClient.performRequest(
            method: .post,
            path: "/messages/\(id)/vote",
            body: request,
            requestOptions: requestOptions,
            responseType: ChatMessage.self
        )
    }
}