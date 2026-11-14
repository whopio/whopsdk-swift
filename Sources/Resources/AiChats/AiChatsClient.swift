import Foundation

public final class AiChatsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of AI chat threads for the current authenticated user.
    ///
    /// Required permissions:
    ///  - `ai_chat:read`
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
    ///     _ = try await client.aiChats.list(
    ///         first: 42,
    ///         last: 42
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
    /// - Parameter accountId: Only return chats associated with this business account.
    /// - Parameter onlyActiveCrons: When true, returns only chats with an active cron schedule
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, agentIdentifier: AiChatAgentIdentifiers? = nil, accountId: String? = nil, onlyActiveCrons: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAiChatsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/ai_chats",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "agent_identifier": agentIdentifier.map { .string($0.rawValue) }, 
                "account_id": accountId.map { .string($0) }, 
                "only_active_crons": onlyActiveCrons.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListAiChatsResponse.self
        )
    }

    /// Create a new AI chat thread and send the first message to the AI agent.
    ///
    /// Required permissions:
    ///  - `ai_chat:create`
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
    ///     _ = try await client.aiChats.create(request: .init(messageText: "message_text"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateAiChatsRequest, requestOptions: RequestOptions? = nil) async throws -> AiChat {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ai_chats",
            body: request,
            requestOptions: requestOptions,
            responseType: AiChat.self
        )
    }

    /// Retrieves the details of an existing AI chat.
    ///
    /// Required permissions:
    ///  - `ai_chat:read`
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
    ///     _ = try await client.aiChats.retrieve(id: "aich_xxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the AI chat to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> AiChat {
        return try await httpClient.performRequest(
            method: .get,
            path: "/ai_chats/\(id)",
            requestOptions: requestOptions,
            responseType: AiChat.self
        )
    }

    /// Delete an AI chat thread so it no longer appears in the user's chat list.
    ///
    /// Required permissions:
    ///  - `ai_chat:delete`
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
    ///     _ = try await client.aiChats.delete(id: "aich_xxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the AI chat to delete (e.g., "ai_chat_XXXXX").
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/ai_chats/\(id)",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }

    /// Update an AI chat's title, notification preferences, or associated account context.
    ///
    /// Required permissions:
    ///  - `ai_chat:update`
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
    ///     _ = try await client.aiChats.update(
    ///         id: "aich_xxxxxxxxxxxxx",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the AI chat to update (e.g., "ai_chat_XXXXX").
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateAiChatsRequest, requestOptions: RequestOptions? = nil) async throws -> AiChat {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/ai_chats/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: AiChat.self
        )
    }
}