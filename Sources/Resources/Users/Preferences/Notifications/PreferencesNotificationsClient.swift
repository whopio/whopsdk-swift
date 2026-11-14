import Foundation

public final class PreferencesNotificationsClient: Sendable {
    public let experiences: NotificationsExperiencesClient
    public let topics: NotificationsTopicsClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.experiences = NotificationsExperiencesClient(config: config)
        self.topics = NotificationsTopicsClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Sets the authenticated user's notification preferences, each addressed by `scope` rather than by ID. The batch is applied in one transaction: if any entry is rejected, none are written. Experience levels are applied before topic overrides, because setting a level replaces every topic preference for that experience, so an override sent alongside a level wins. The response reports what each scope now resolves to, in the order the entries were sent.
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
    ///     _ = try await client.users.preferences.notifications.set(request: .init(preferences: [
    ///         SetNotificationsRequestPreferencesItem(
    ///             level: .null,
    ///             scope: SetNotificationsRequestPreferencesItemScope(
    ///
    ///             )
    ///         )
    ///     ]))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func set(request: Requests.SetNotificationsRequest, requestOptions: RequestOptions? = nil) async throws -> SetNotificationsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/users/me/preferences/notifications",
            body: request,
            requestOptions: requestOptions,
            responseType: SetNotificationsResponse.self
        )
    }
}