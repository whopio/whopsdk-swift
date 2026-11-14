import Foundation

public final class SocialAccountsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Deprecated compatibility endpoint. List external accounts with `GET /external_accounts` instead.
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
    ///     _ = try await client.socialAccounts.list()
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
    public func list(accountId: String? = nil, userId: String? = nil, platform: ListSocialAccountsRequestPlatform? = nil, trustLevel: ListSocialAccountsRequestTrustLevel? = nil, verified: Bool? = nil, scopes: [ListSocialAccountsRequestScopesItem]? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListSocialAccountsRequestOrder? = nil, direction: ListSocialAccountsRequestDirection? = nil, requestOptions: RequestOptions? = nil) async throws -> ListSocialAccountsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/social_accounts",
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
            responseType: ListSocialAccountsResponse.self
        )
    }

    /// Deprecated compatibility endpoint. Create external accounts with `POST /external_accounts` instead.
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
    ///     _ = try await client.socialAccounts.create(request: CreateSocialAccountsRequestBody.facebook(
    ///         CreateSocialAccountsRequestBodyFacebook(
    ///
    ///         )
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreateSocialAccountsRequestBody, requestOptions: RequestOptions? = nil) async throws -> SocialAccount {
        return try await httpClient.performRequest(
            method: .post,
            path: "/social_accounts",
            body: request,
            requestOptions: requestOptions,
            responseType: SocialAccount.self
        )
    }

    /// Deprecated compatibility endpoint. Connect external accounts with `POST /external_accounts/connect` instead.
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
    ///     _ = try await client.socialAccounts.connect(request: .init(
    ///         platform: .tiktok,
    ///         redirectUrl: "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/settings"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func connect(request: Requests.ConnectSocialAccountsRequest, requestOptions: RequestOptions? = nil) async throws -> ConnectSocialAccountsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/social_accounts/connect",
            body: request,
            requestOptions: requestOptions,
            responseType: ConnectSocialAccountsResponse.self
        )
    }

    /// Deprecated compatibility endpoint. Disconnect external accounts with `DELETE /external_accounts/{id}` instead.
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
    ///     _ = try await client.socialAccounts.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the social account to disconnect.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, accountId: String? = nil, userId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> DeleteSocialAccountsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/social_accounts/\(id)",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: DeleteSocialAccountsResponse.self
        )
    }

    /// Deprecated compatibility endpoint. Refresh external accounts with `POST /external_accounts/{id}/refresh` instead.
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
    ///     _ = try await client.socialAccounts.refresh(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The social account (a sacc_ identifier) to refresh.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func refresh(id: String, request: Requests.RefreshSocialAccountsRequest, requestOptions: RequestOptions? = nil) async throws -> SocialAccount {
        return try await httpClient.performRequest(
            method: .post,
            path: "/social_accounts/\(id)/refresh",
            body: request,
            requestOptions: requestOptions,
            responseType: SocialAccount.self
        )
    }
}