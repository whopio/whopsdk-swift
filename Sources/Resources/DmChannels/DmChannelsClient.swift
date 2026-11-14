import Foundation

public final class DmChannelsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the authenticated user's DM channels, most recently active first.
    ///
    /// Required permissions:
    ///  - `dms:read`
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
    ///     _ = try await client.dmChannels.list(
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
    /// - Parameter accountId: The unique identifier of a company to filter DM channels by. Only returns channels scoped to this company.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, accountId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListDmChannelsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/dm_channels",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "account_id": accountId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListDmChannelsResponse.self
        )
    }

    /// Creates a DM channel between two or more users, optionally scoped to an account. Returns the existing channel if one already exists.
    ///
    /// Required permissions:
    ///  - `dms:channel:manage`
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
    ///     _ = try await client.dmChannels.create(request: .init(withUserIds: [
    ///         "with_user_ids"
    ///     ]))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateDmChannelsRequest, requestOptions: RequestOptions? = nil) async throws -> DmChannel {
        return try await httpClient.performRequest(
            method: .post,
            path: "/dm_channels",
            body: request,
            requestOptions: requestOptions,
            responseType: DmChannel.self
        )
    }

    /// Retrieves the details of an existing DM channel.
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
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.dmChannels.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the DM channel to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> DmChannel {
        return try await httpClient.performRequest(
            method: .get,
            path: "/dm_channels/\(id)",
            requestOptions: requestOptions,
            responseType: DmChannel.self
        )
    }

    /// Permanently deletes a DM channel and all of its messages. Only a channel admin can delete it.
    ///
    /// Required permissions (one of):
    ///  - `dms:channel:manage`
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
    ///     _ = try await client.dmChannels.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the DM channel to delete.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/dm_channels/\(id)",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }

    /// Updates a DM channel's settings, such as its display name. Only a channel admin can update it.
    ///
    /// Required permissions (one of):
    ///  - `dms:channel:manage`
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
    ///     _ = try await client.dmChannels.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the DM channel to update.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateDmChannelsRequest, requestOptions: RequestOptions? = nil) async throws -> DmChannel {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/dm_channels/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: DmChannel.self
        )
    }
}