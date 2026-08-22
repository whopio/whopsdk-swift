import Foundation

public final class SupportChannelsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of support channels for a specific company, with optional filtering by resolution status and custom sorting.
    ///
    /// Required permissions:
    ///  - `support_chat:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.supportChannels.list(
    ///         first: 42,
    ///         last: 42,
    ///         companyId: "biz_xxxxxxxxxxxxxx"
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
    /// - Parameter companyId: The unique identifier of the company to list support channels for. Includes channels of child companies. When omitted, returns support channels across all companies the user has access to.
    /// - Parameter open: Whether to filter by open or resolved support channels. Set to true to only return channels awaiting a response, or false for resolved channels.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, companyId: String? = nil, view: SupportChannelView? = nil, open: Bool? = nil, direction: Direction? = nil, order: MessageChannelOrder? = nil, requestOptions: RequestOptions? = nil) async throws -> ListSupportChannelsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/support_channels",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "company_id": companyId.map { .string($0) }, 
                "view": view.map { .string($0.rawValue) }, 
                "open": open.map { .bool($0) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "order": order.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListSupportChannelsResponse.self
        )
    }

    /// Open a new support channel between a company team member and a customer. Returns the existing channel if one already exists for that user.
    ///
    /// Required permissions:
    ///  - `support_chat:create`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.supportChannels.create(request: .init(
    ///         companyId: "biz_xxxxxxxxxxxxxx",
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
    ///     let client = Whop(token: "<token>")
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