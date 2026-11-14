import Foundation

public final class ChatChannelsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the chat channels in an account.
    ///
    /// Required permissions:
    ///  - `chat:read`
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
    ///     _ = try await client.chatChannels.list(
    ///         first: 42,
    ///         last: 42,
    ///         productId: "prod_xxxxxxxxxxxxx",
    ///         accountId: "biz_xxxxxxxxxxxxxx"
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
    /// - Parameter productId: The unique identifier of a product to filter by. When set, only chat channels connected to this product are returned.
    /// - Parameter accountId: The unique identifier of the company to list chat channels for.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, productId: String? = nil, accountId: String, requestOptions: RequestOptions? = nil) async throws -> ListChatChannelsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/chat_channels",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "product_id": productId.map { .string($0) }, 
                "account_id": .string(accountId)
            ],
            requestOptions: requestOptions,
            responseType: ListChatChannelsResponse.self
        )
    }

    /// Retrieves the details of an existing chat channel.
    ///
    /// Required permissions:
    ///  - `chat:read`
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
    ///     _ = try await client.chatChannels.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the chat channel or experience to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> ChatChannel {
        return try await httpClient.performRequest(
            method: .get,
            path: "/chat_channels/\(id)",
            requestOptions: requestOptions,
            responseType: ChatChannel.self
        )
    }

    /// Updates a chat channel's moderation settings, such as who can post, banned words, and media restrictions.
    ///
    /// Required permissions:
    ///  - `chat:moderate`
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
    ///     _ = try await client.chatChannels.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the chat channel to update. Accepts either an experience ID (e.g. 'exp_xxxxx') or a chat channel ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateChatChannelsRequest, requestOptions: RequestOptions? = nil) async throws -> ChatChannel {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/chat_channels/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: ChatChannel.self
        )
    }
}