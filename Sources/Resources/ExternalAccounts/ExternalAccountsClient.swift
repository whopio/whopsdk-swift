import Foundation

public final class ExternalAccountsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the external accounts linked to an account or user.
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
    ///     _ = try await client.externalAccounts.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The Account that the external accounts are connected to. Provide either this or user_id.
    /// - Parameter userId: The User that the external accounts are connected to. Provide either this or account_id.
    /// - Parameter platform: Only return external accounts for the platform that is specified. An `aimerce` account is returned only with this filter, which requires the `company:manage_checkout` scope instead of `social_account:read`.
    /// - Parameter trustLevel: Only return external accounts linked with this trust level, such as `oauth` for accounts connected through OAuth.
    /// - Parameter verified: Only return external accounts that are verified on the platform.
    /// - Parameter scopes: Only return external accounts that have these scopes.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter order: The field to sort external accounts by.
    /// - Parameter direction: Sort direction.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, userId: String? = nil, platform: ListExternalAccountsRequestPlatform? = nil, trustLevel: ListExternalAccountsRequestTrustLevel? = nil, verified: Bool? = nil, scopes: [ListExternalAccountsRequestScopesItem]? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListExternalAccountsRequestOrder? = nil, direction: ListExternalAccountsRequestDirection? = nil, requestOptions: RequestOptions? = nil) async throws -> ListExternalAccountsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/external_accounts",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "platform": platform.map { .string($0.rawValue) }, 
                "trust_level": trustLevel.map { .string($0.rawValue) }, 
                "verified": verified.map { .bool($0) }, 
                "scopes": scopes.map { .unknown($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListExternalAccountsResponse.self
        )
    }

    /// Creates or returns a Whop-managed TikTok account for an account, or connects the account's existing Klaviyo account with a private API key. Whop no longer creates Facebook pages.
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
    ///     _ = try await client.externalAccounts.create(request: CreateExternalAccountsRequestBody.facebook(
    ///         CreateExternalAccountsRequestBodyFacebook(
    ///
    ///         )
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreateExternalAccountsRequestBody, requestOptions: RequestOptions? = nil) async throws -> ExternalAccount {
        return try await httpClient.performRequest(
            method: .post,
            path: "/external_accounts",
            body: request,
            requestOptions: requestOptions,
            responseType: ExternalAccount.self
        )
    }

    /// Starts an OAuth connection flow and returns an `authorize_url` to send the user to, where they connect an external account. Personal profile connections must be completed in a browser signed in as the Whop user who started the flow.
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
    ///     _ = try await client.externalAccounts.connect(request: .init(
    ///         platform: .tiktok,
    ///         redirectUrl: "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/settings"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func connect(request: Requests.ConnectExternalAccountsRequest, requestOptions: RequestOptions? = nil) async throws -> ConnectExternalAccountsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/external_accounts/connect",
            body: request,
            requestOptions: requestOptions,
            responseType: ConnectExternalAccountsResponse.self
        )
    }

    /// Disconnects an external account from an account or user without deleting the underlying platform account.
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
    ///     _ = try await client.externalAccounts.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the external account to disconnect.
    /// - Parameter accountId: The Account that the external account is connected to. Provide either this or user_id.
    /// - Parameter userId: The User that the external account is connected to. Provide either this or account_id.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, accountId: String? = nil, userId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> DeleteExternalAccountsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/external_accounts/\(id)",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: DeleteExternalAccountsResponse.self
        )
    }

    /// Refreshes the state of an external account. Use it to clear an `error` that has been resolved.
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
    ///     _ = try await client.externalAccounts.refresh(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The external account (a sacc_ identifier) to refresh.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func refresh(id: String, request: Requests.RefreshExternalAccountsRequest, requestOptions: RequestOptions? = nil) async throws -> ExternalAccount {
        return try await httpClient.performRequest(
            method: .post,
            path: "/external_accounts/\(id)/refresh",
            body: request,
            requestOptions: requestOptions,
            responseType: ExternalAccount.self
        )
    }
}