import Foundation

public final class OauthGrantsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the authenticated user's own OAuth grants — one per app they have authorized, per account they authorized it for. The list is always the caller's own; there is no parameter for reading another user's grants. Requires a user session: an API key or an OAuth token is refused, so an app can never enumerate the other apps a user has authorized.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.users.oauthGrants.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter appId: Only return grants for this app, prefixed `app_`. An app the user has never authorized returns an empty list.
    /// - Parameter first: The number of grants to return (default 20, max 100).
    /// - Parameter after: A cursor; returns grants after this position.
    /// - Parameter last: The number of grants to return from the end of the range.
    /// - Parameter before: A cursor; returns grants before this position.
    /// - Parameter order: The field to sort grants by.
    /// - Parameter direction: Sort direction.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(appId: String? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListOauthGrantsRequestOrder? = nil, direction: ListOauthGrantsRequestDirection? = nil, requestOptions: RequestOptions? = nil) async throws -> ListOauthGrantsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/me/oauth_grants",
            queryParams: [
                "app_id": appId.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListOauthGrantsResponse.self
        )
    }

    /// Completes the OAuth authorization step for the authenticated user: records their consent for the scopes an app asked for and mints the authorization code to hand back to it. Returns the grant, plus a `redirect_url` carrying that code — the one and only time it is returned. Exchange the code at `POST /oauth/token` with the verifier for `code_challenge`. Requires a user session, because consent has to come from the account holder: an API key or an OAuth token is refused, so an app can never authorize itself. Send an `Idempotency-Key` to make a retry safe — a replay returns the original `redirect_url` and its code rather than issuing a second one.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.users.oauthGrants.create(request: .init(
    ///         clientId: "app_xxxxxxxxxxxxxx",
    ///         codeChallenge: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    ///         codeChallengeMethod: .s256,
    ///         redirectUri: "https://Booking.Shinetime.example:8443/oauth/Callback/",
    ///         requestedScopes: [
    ///             "profile"
    ///         ]
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateOauthGrantsRequest, requestOptions: RequestOptions? = nil) async throws -> OauthGrant {
        return try await httpClient.performRequest(
            method: .post,
            path: "/users/me/oauth_grants",
            body: request,
            requestOptions: requestOptions,
            responseType: OauthGrant.self
        )
    }
}