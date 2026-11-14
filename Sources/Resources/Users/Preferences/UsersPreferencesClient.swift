import Foundation

public final class UsersPreferencesClient: Sendable {
    public let notifications: PreferencesNotificationsClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.notifications = PreferencesNotificationsClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Retrieves the authenticated user's settings document.
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
    ///     _ = try await client.users.preferences.retrieve()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(requestOptions: RequestOptions? = nil) async throws -> UserPreferences {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/me/preferences",
            requestOptions: requestOptions,
            responseType: UserPreferences.self
        )
    }

    /// Updates the authenticated user's settings document. Replaces the top-level keys it is given and leaves the rest untouched.
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
    ///     _ = try await client.users.preferences.update(request: .init())
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(request: Requests.UpdatePreferencesRequestType, requestOptions: RequestOptions? = nil) async throws -> UserPreferences {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/users/me/preferences",
            body: request,
            requestOptions: requestOptions,
            responseType: UserPreferences.self
        )
    }
}