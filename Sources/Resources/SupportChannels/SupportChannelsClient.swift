import Foundation

public final class SupportChannelsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists support channels between an account's team and its customers, most recently active first by default. Pass `open=true` to find channels awaiting a support response.
    ///
    /// Required permissions:
    ///  - `support_chat:read`
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
    ///     _ = try await client.supportChannels.list(
    ///         first: 42,
    ///         last: 42,
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
    /// - Parameter open: Whether to filter by open or resolved support channels. Set to true to only return channels awaiting a response, or false for resolved channels.
    /// - Parameter customerUserId: Only return support channels opened by this customer.
    /// - Parameter customerUserIds: Only return support channels opened by any of these customers. Maximum 100 IDs per request.
    /// - Parameter participated: Set to true to only return channels the authenticated user has joined as a participant. Requires a user.
    /// - Parameter includeLastMessage: Set to true to return `last_message` and `unread` on each channel. Both are `null` otherwise, which keeps large lists fast.
    /// - Parameter includeParticipated: Set to true to return `participated` on each channel. It is `null` otherwise, which keeps large lists fast.
    /// - Parameter accountId: The unique identifier of the company to list support channels for. Includes channels of child companies. When omitted, returns support channels across all companies the user has access to.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, view: SupportChannelView? = nil, open: Bool? = nil, customerUserId: String? = nil, customerUserIds: [String]? = nil, participated: Bool? = nil, includeLastMessage: Bool? = nil, includeParticipated: Bool? = nil, direction: Direction? = nil, order: MessageChannelOrder? = nil, accountId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListSupportChannelsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/support_channels",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "view": view.map { .string($0.rawValue) }, 
                "open": open.map { .bool($0) }, 
                "customer_user_id": customerUserId.map { .string($0) }, 
                "customer_user_ids": customerUserIds.map { .stringArray($0) }, 
                "participated": participated.map { .bool($0) }, 
                "include_last_message": includeLastMessage.map { .bool($0) }, 
                "include_participated": includeParticipated.map { .bool($0) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "order": order.map { .string($0.rawValue) }, 
                "account_id": accountId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListSupportChannelsResponse.self
        )
    }

    /// Opens a support channel between an account's team and a customer. Returns the existing channel if that customer already has one.
    ///
    /// Required permissions:
    ///  - `support_chat:create`
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
    ///     _ = try await client.supportChannels.create(request: .init(
    ///         accountId: "biz_xxxxxxxxxxxxxx",
    ///         userId: "user_xxxxxxxxxxxxx"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateSupportChannelsRequest, requestOptions: RequestOptions? = nil) async throws -> SupportChannel {
        return try await httpClient.performRequest(
            method: .post,
            path: "/support_channels",
            body: request,
            requestOptions: requestOptions,
            responseType: SupportChannel.self
        )
    }

    /// Retrieves the details of an existing support channel.
    ///
    /// Required permissions:
    ///  - `support_chat:read`
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
    ///     _ = try await client.supportChannels.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the support channel to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> SupportChannel {
        return try await httpClient.performRequest(
            method: .get,
            path: "/support_channels/\(id)",
            requestOptions: requestOptions,
            responseType: SupportChannel.self
        )
    }
}