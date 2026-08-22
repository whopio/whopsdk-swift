import Foundation

public final class MessagesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of messages within a specific experience chat, DM, or group chat channel, sorted by creation time.
    ///
    /// Required permissions (one of):
    ///  - `chat:read`
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
    ///     _ = try await client.messages.list(
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
    /// - Parameter channelId: The unique identifier of the channel or experience to list messages for.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, channelId: String, direction: Direction? = nil, requestOptions: RequestOptions? = nil) async throws -> ListMessagesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/messages",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "channel_id": .string(channelId), 
                "direction": direction.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListMessagesResponse.self
        )
    }

    /// Send a new message in an experience chat, DM, or group chat channel. Supports text content, attachments, polls, and replies.
    ///
    /// Required permissions (one of):
    ///  - `chat:message:create`
    ///  - `dms:message:manage`
    ///  - `livestream:chat:write`
    ///  - `support_chat:message:create`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.messages.create(request: .init(
    ///         channelId: "channel_id",
    ///         content: "content"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateMessagesRequest, requestOptions: RequestOptions? = nil) async throws -> Message {
        return try await httpClient.performRequest(
            method: .post,
            path: "/messages",
            body: request,
            requestOptions: requestOptions,
            responseType: Message.self
        )
    }

    /// Retrieves the details of an existing message.
    ///
    /// Required permissions (one of):
    ///  - `chat:read`
    ///  - `dms:read`
    ///  - `livestream:chat:read`
    ///  - `support_chat:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.messages.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the message to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Message {
        return try await httpClient.performRequest(
            method: .get,
            path: "/messages/\(id)",
            requestOptions: requestOptions,
            responseType: Message.self
        )
    }

    /// Permanently delete a message from an experience chat, DM, or group chat channel. Only the message author or a channel admin can delete a message.
    ///
    /// Required permissions (one of):
    ///  - `chat:message:create` and `chat:read`
    ///  - `dms:message:manage` and `dms:read`
    ///  - `livestream:chat:write` and `livestream:chat:read`
    ///  - `support_chat:message:create` and `support_chat:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.messages.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the message to delete.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/messages/\(id)",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }

    /// Edit the content, attachments, or pinned status of an existing message in an experience chat, DM, or group chat channel.
    ///
    /// Required permissions (one of):
    ///  - `chat:message:create`
    ///  - `dms:message:manage`
    ///  - `livestream:chat:write`
    ///  - `support_chat:message:create`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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
    /// - Parameter id: The unique identifier of the message to update.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateMessagesRequest, requestOptions: RequestOptions? = nil) async throws -> Message {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/messages/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Message.self
        )
    }
}