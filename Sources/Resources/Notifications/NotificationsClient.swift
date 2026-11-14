import Foundation

public final class NotificationsClient: Sendable {
    public let topics: TopicsClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.topics = TopicsClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the authenticated user's notifications, newest first. Without filters the feed spans every experience the user belongs to plus the teams they are a member of. Requires a user credential — an account API key has no notification feed.
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
    ///     _ = try await client.notifications.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter unread: Only return notifications created since the user last viewed their source.
    /// - Parameter experienceId: Only return notifications from this experience (`exp_` tag).
    /// - Parameter accountId: Only return team notifications for this account (`biz_` tag).
    /// - Parameter mentions: Only return notifications that mention the user directly.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(unread: Bool? = nil, experienceId: String? = nil, accountId: String? = nil, mentions: Bool? = nil, first: Int? = nil, after: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListNotificationsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/notifications",
            queryParams: [
                "unread": unread.map { .bool($0) }, 
                "experience_id": experienceId.map { .string($0) }, 
                "account_id": accountId.map { .string($0) }, 
                "mentions": mentions.map { .bool($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListNotificationsResponse.self
        )
    }

    /// Queues a notification to every user of an experience or to an account's team, processed asynchronously. Every send is attributed to an app: use an app API key, or a credential acting on behalf of an app. Narrow the audience with `user_ids` to send a mention.
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
    ///     _ = try await client.notifications.create(request: .init(
    ///         content: "Drop off at 4180 Burnet Rd. Plan on two days for the full coating.",
    ///         title: "Your ceramic coating is booked"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateNotificationsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateNotificationsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/notifications",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateNotificationsResponse.self
        )
    }

    /// Lists the authenticated user's per-experience unread badge state. Requires a user credential. Returns one row per experience the user belongs to (or per requested experience).
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
    ///     _ = try await client.notifications.badges(experienceIds: [
    ///         "exp_xxxxxxxxxxxxxx"
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter experienceIds: Only return badges for these experiences (`exp_` tags).
    /// - Parameter lastFetchedAt: The client's last fetched-at ISO 8601 timestamp, used to partially refresh badges after a websocket message.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func badges(experienceIds: [String]? = nil, lastFetchedAt: String? = nil, requestOptions: RequestOptions? = nil) async throws -> BadgesNotificationsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/notifications/badges",
            queryParams: [
                "experience_ids": experienceIds.map { .stringArray($0) }, 
                "last_fetched_at": lastFetchedAt.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: BadgesNotificationsResponse.self
        )
    }

    /// Marks the authenticated user's notifications as read, for one experience or all of them, and returns the refreshed badge rows for that scope. Requires a user credential.
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
    ///     _ = try await client.notifications.markRead(request: .init())
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func markRead(request: Requests.MarkReadNotificationsRequest, requestOptions: RequestOptions? = nil) async throws -> MarkReadNotificationsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/notifications/mark_read",
            body: request,
            requestOptions: requestOptions,
            responseType: MarkReadNotificationsResponse.self
        )
    }

    /// Retrieves a single notification, from the feed or from a push or websocket event. Requires a user credential.
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
    ///     _ = try await client.notifications.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: A notification `id` from List Notifications, or the ephemeral id delivered with a push or websocket event.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Notification {
        return try await httpClient.performRequest(
            method: .get,
            path: "/notifications/\(id)",
            requestOptions: requestOptions,
            responseType: Notification.self
        )
    }
}