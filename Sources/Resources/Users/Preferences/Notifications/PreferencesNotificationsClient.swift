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

    /// Sets the authenticated user's notification preferences. Each preference is addressed by `scope`, not by id, so a scope read back from either list endpoint can be sent straight here.
    ///
    /// A scope naming an experience with no topic sets that experience's level, and accepts all three levels. Any other scope sets a topic override, which is binary — `all` or `nothing` — and requires a `channel`.
    ///
    /// `level: null` clears the preference. Preferences are stored as overrides, so clearing one means the scope inherits its default again rather than being switched off.
    ///
    /// The batch is applied in one transaction: if any entry is rejected, none are written. Experience levels are applied before topic overrides, because setting a level replaces every topic preference for that experience — so an override sent alongside a level wins. The response reports what each scope now resolves to, in the order the entries were sent.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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