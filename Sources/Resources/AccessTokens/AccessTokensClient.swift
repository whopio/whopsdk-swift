import Foundation

public final class AccessTokensClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Creates a short-lived access token for Whop's web and mobile embedded components. With API key authentication, pass `account_id` or `user_id`; with OAuth, the token is issued for the OAuth user.
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
    ///     _ = try await client.accessTokens.create(request: .init())
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateAccessTokensRequest, requestOptions: RequestOptions? = nil) async throws -> AccessToken {
        return try await httpClient.performRequest(
            method: .post,
            path: "/access_tokens",
            body: request,
            requestOptions: requestOptions,
            responseType: AccessToken.self
        )
    }
}