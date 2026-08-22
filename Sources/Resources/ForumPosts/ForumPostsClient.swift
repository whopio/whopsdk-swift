import Foundation

public final class ForumPostsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of forum posts within a specific experience, with optional filtering by parent post or pinned status.
    ///
    /// Required permissions:
    ///  - `forum:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.forumPosts.list(
    ///         first: 42,
    ///         last: 42,
    ///         experienceId: "exp_xxxxxxxxxxxxxx"
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
    /// - Parameter experienceId: The unique identifier of the experience to list forum posts for.
    /// - Parameter includeBountyAnchors: Whether to include top-level bounty discussion anchors as rich forum items.
    /// - Parameter parentId: The unique identifier of a parent post to list comments for. When set, returns replies to that post.
    /// - Parameter pinned: Whether to filter for only pinned posts. Set to true to return only pinned posts.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, experienceId: String, includeBountyAnchors: Bool? = nil, parentId: String? = nil, pinned: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> ListForumPostsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/forum_posts",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "experience_id": .string(experienceId), 
                "include_bounty_anchors": includeBountyAnchors.map { .bool($0) }, 
                "parent_id": parentId.map { .string($0) }, 
                "pinned": pinned.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListForumPostsResponse.self
        )
    }

    /// Create a new forum post or comment within an experience. Supports text content, attachments, polls, paywalling, and pinning. Pass experience_id 'public' with a company_id to post to a company's public forum.
    ///
    /// Required permissions:
    ///  - `forum:post:create`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.forumPosts.create(request: .init(experienceId: "exp_xxxxxxxxxxxxxx"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateForumPostsRequest, requestOptions: RequestOptions? = nil) async throws -> ForumPost {
        return try await httpClient.performRequest(
            method: .post,
            path: "/forum_posts",
            body: request,
            requestOptions: requestOptions,
            responseType: ForumPost.self
        )
    }

    /// Retrieves the details of an existing forum post.
    ///
    /// Required permissions:
    ///  - `forum:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.forumPosts.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the forum post to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> ForumPost {
        return try await httpClient.performRequest(
            method: .get,
            path: "/forum_posts/\(id)",
            requestOptions: requestOptions,
            responseType: ForumPost.self
        )
    }

    /// Edit the content, attachments, pinned status, or visibility of an existing forum post or comment.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.forumPosts.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the forum post to update.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateForumPostsRequest, requestOptions: RequestOptions? = nil) async throws -> ForumPost {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/forum_posts/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: ForumPost.self
        )
    }
}