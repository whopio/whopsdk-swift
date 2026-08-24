import Foundation

public final class TopicsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the platform's visible notification topics — the categories users can set notification preferences on. App-created topics are internal and not returned.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.notifications.topics.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter topicType: Only return topics of this scope: `user` (member notifications) or `account_team` (team notifications).
    /// - Parameter first: The number of topics to return (default 20, max 100).
    /// - Parameter after: A cursor; returns topics after this position.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(topicType: ListTopicsRequestTopicType? = nil, first: Int? = nil, after: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListTopicsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/notifications/topics",
            queryParams: [
                "topic_type": topicType.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListTopicsResponse.self
        )
    }
}