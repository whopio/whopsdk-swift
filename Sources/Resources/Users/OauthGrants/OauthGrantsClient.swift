import Foundation

public final class OauthGrantsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the authenticated user's own OAuth grants: one per app they have authorized, per account they authorized it for. You cannot read another user's grants. Requires a user session: an API key or an OAuth token is refused, so an app can never enumerate the other apps a user has authorized.
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
    ///     _ = try await client.users.oauthGrants.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter appId: Only return grants for this app, prefixed `app_`. An app the user has never authorized returns an empty list.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
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

    /// Completes the OAuth authorization step for the authenticated user: records their consent to the scopes an app asked for and mints an authorization code. Returns the grant plus a `redirect_url` carrying the code, which is returned only this once; the app exchanges it at `POST /oauth/token`. Requires a user session, because consent has to come from the account holder: an API key or an OAuth token is refused, so an app can never authorize itself. Send an `Idempotency-Key` so a retry returns the original `redirect_url` and code instead of issuing a second one.
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
    ///     _ = try await client.users.oauthGrants.create(request: .init(
    ///         clientId: "app_xxxxxxxxxxxxxx",
    ///         redirectUri: "https://Booking.Shinetime.example:8443/oauth/Callback/",
    ///         requestedScopes: [
    ///             "openid"
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