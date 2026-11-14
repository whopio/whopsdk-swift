import Foundation

public final class ReactionsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of emoji reactions on a specific message or forum post, sorted by most recent.
    ///
    /// Required permissions (one of):
    ///  - `chat:read`
    ///  - `dms:read`
    ///  - `forum:read`
    ///  - `livestream:chat:read`
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
    ///     _ = try await client.reactions.list(
    ///         first: 42,
    ///         last: 42,
    ///         resourceId: "resource_id"
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
    /// - Parameter resourceId: The unique identifier of the message or forum post to list reactions for.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, resourceId: String, requestOptions: RequestOptions? = nil) async throws -> ListReactionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/reactions",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "resource_id": .string(resourceId)
            ],
            requestOptions: requestOptions,
            responseType: ListReactionsResponse.self
        )
    }

    /// Add an emoji reaction or poll vote to a message or forum post. In forums, the reaction is always a like.
    ///
    /// Required permissions (one of):
    ///  - `chat:read`
    ///  - `dms:read`
    ///  - `forum:read`
    ///  - `livestream:chat:read`
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
    ///     _ = try await client.reactions.create(request: .init(resourceId: "resource_id"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateReactionsRequest, requestOptions: RequestOptions? = nil) async throws -> Reaction {
        return try await httpClient.performRequest(
            method: .post,
            path: "/reactions",
            body: request,
            requestOptions: requestOptions,
            responseType: Reaction.self
        )
    }

    /// Retrieves the details of an existing reaction.
    ///
    /// Required permissions (one of):
    ///  - `chat:read`
    ///  - `dms:read`
    ///  - `forum:read`
    ///  - `livestream:chat:read`
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
    ///     _ = try await client.reactions.retrieve(id: "reac_xxxxxxxxxxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the reaction to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Reaction {
        return try await httpClient.performRequest(
            method: .get,
            path: "/reactions/\(id)",
            requestOptions: requestOptions,
            responseType: Reaction.self
        )
    }

    /// Remove an emoji reaction from a message or forum post. Only the reaction author or a channel admin can remove a reaction.
    ///
    /// Required permissions (one of):
    ///  - `chat:read`
    ///  - `dms:read`
    ///  - `forum:read`
    ///  - `livestream:chat:read`
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
    ///     _ = try await client.reactions.delete(id: "reac_xxxxxxxxxxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the reaction to remove, or the identifier of the message or forum post to remove a reaction from. When passing a message or post ID, you must also provide the emoji argument.
    /// - Parameter emoji: The emoji to remove, in shortcode or unicode format. For example, ':heart:' or a unicode emoji. Required when the id refers to a message or post instead of a reaction.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, emoji: String? = nil, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/reactions/\(id)",
            queryParams: [
                "emoji": emoji.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }
}