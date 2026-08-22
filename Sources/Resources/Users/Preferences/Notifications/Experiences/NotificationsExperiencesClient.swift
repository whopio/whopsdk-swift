import Foundation

public final class NotificationsExperiencesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the authenticated user's per-experience notification levels. Experiences the user never set a level for are omitted — their effective level is `all`.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.users.preferences.notifications.experiences.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter first: The number of preferences to return.
    /// - Parameter after: A cursor; returns preferences after this position.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(first: Int? = nil, after: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListExperiencesResponseType {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/me/preferences/notifications/experiences",
            queryParams: [
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListExperiencesResponseType.self
        )
    }
}