import Foundation

public final class SocialAccountsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the social accounts linked to an account or user.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.socialAccounts.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The Account that the social accounts are connected to. Provide either this or user_id.
    /// - Parameter userId: The User that the social accounts are connected to. Provide either this or account_id.
    /// - Parameter platform: Only return social accounts for the platform that is specified.
    /// - Parameter verified: Only return social accounts that are verified on the platform.
    /// - Parameter scopes: Only return social accounts that have these scopes.
    /// - Parameter first: The number of social accounts to return.
    /// - Parameter after: Cursor to fetch the page after (from page_info.end_cursor).
    /// - Parameter last: The number of social accounts to return from the end of the range.
    /// - Parameter before: Cursor to fetch the page before (from page_info.start_cursor).
    /// - Parameter order: The field to sort social accounts by.
    /// - Parameter direction: Sort direction.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, userId: String? = nil, platform: ListSocialAccountsRequestPlatform? = nil, verified: Bool? = nil, scopes: [ListSocialAccountsRequestScopesItem]? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListSocialAccountsRequestOrder? = nil, direction: ListSocialAccountsRequestDirection? = nil, requestOptions: RequestOptions? = nil) async throws -> ListSocialAccountsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/social_accounts",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "platform": platform.map { .string($0.rawValue) }, 
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

    /// Creates or returns a Whop-managed Facebook page for an account.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.socialAccounts.create(request: .init(platform: .facebook))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateSocialAccountsRequest, requestOptions: RequestOptions? = nil) async throws -> SocialAccount {
        return try await httpClient.performRequest(
            method: .post,
            path: "/social_accounts",
            body: request,
            requestOptions: requestOptions,
            responseType: SocialAccount.self
        )
    }

    /// Starts an OAuth connection flow and returns an authorize_url where the user can connect a social account.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.socialAccounts.connect(request: .init(platform: .metaBusiness))
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

    /// Disconnects a social account from an account or user without deleting the underlying platform account.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.socialAccounts.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the social account to disconnect.
    /// - Parameter accountId: The Account that the social account is connected to. Provide either this or user_id.
    /// - Parameter userId: The User that the social account is connected to. Provide either this or account_id.
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

    /// Lists the active lead (instant) forms that already exist on a connected Facebook page, so an ad can reuse one as its `lead_gen_form_id` instead of authoring a new form. Every active form comes back in a single response — the list is not paginated.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.socialAccounts.leadForms(
    ///         id: "id",
    ///         accountId: "account_id"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The social account (a sacc_ identifier) whose lead forms to list.
    /// - Parameter accountId: The Account (a biz_ identifier) the social account is connected to.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func leadForms(id: String, accountId: String, requestOptions: RequestOptions? = nil) async throws -> LeadFormsSocialAccountsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/social_accounts/\(id)/lead_forms",
            queryParams: [
                "account_id": .string(accountId)
            ],
            requestOptions: requestOptions,
            responseType: LeadFormsSocialAccountsResponse.self
        )
    }

    /// Lists the existing posts of a connected Facebook page, Instagram account, or TikTok account.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.socialAccounts.posts(
    ///         id: "id",
    ///         accountId: "account_id"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The social account (a sacc_ identifier) whose posts to list.
    /// - Parameter accountId: The Account (a biz_ identifier) the social account is connected to.
    /// - Parameter postId: Return only the single post with this platform id, instead of the full list.
    /// - Parameter first: The number of posts to return.
    /// - Parameter after: Cursor to fetch the page after (from page_info.end_cursor).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func posts(id: String, accountId: String, postId: String? = nil, first: Int? = nil, after: String? = nil, requestOptions: RequestOptions? = nil) async throws -> PostsSocialAccountsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/social_accounts/\(id)/posts",
            queryParams: [
                "account_id": .string(accountId), 
                "post_id": postId.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: PostsSocialAccountsResponse.self
        )
    }
}