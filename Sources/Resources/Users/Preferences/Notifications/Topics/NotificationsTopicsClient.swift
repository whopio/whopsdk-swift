import Foundation

public final class NotificationsTopicsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the authenticated user's topic-scoped notification preferences, plus user-agnostic platform defaults. Per-experience levels are listed separately, by `GET /users/me/preferences/notifications/experiences`.
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
    ///     _ = try await client.users.preferences.notifications.topics.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter channel: Only return preferences for this delivery channel (or not narrowed to a channel).
    /// - Parameter accountId: Only return preferences scoped to this account's member notifications (`biz_` tag), or not narrowed to an account.
    /// - Parameter teamAccountId: Only return preferences scoped to this account's team notifications (`biz_` tag), or not narrowed to a team account.
    /// - Parameter experienceId: Only return preferences scoped to this experience (`exp_` tag), or not narrowed to an experience.
    /// - Parameter topicId: Only return preferences scoped to this notification topic (`topic_` tag), or not narrowed to a topic.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(channel: ListTopicsRequestChannel? = nil, accountId: String? = nil, teamAccountId: String? = nil, experienceId: String? = nil, topicId: String? = nil, first: Int? = nil, after: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListTopicsResponseType {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/me/preferences/notifications/topics",
            queryParams: [
                "channel": channel.map { .string($0.rawValue) }, 
                "account_id": accountId.map { .string($0) }, 
                "team_account_id": teamAccountId.map { .string($0) }, 
                "experience_id": experienceId.map { .string($0) }, 
                "topic_id": topicId.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListTopicsResponseType.self
        )
    }
}