import Foundation

public final class UsersClient: Sendable {
    public let oauthGrants: OauthGrantsClient
    public let passkeys: PasskeysClient
    public let preferences: UsersPreferencesClient
    public let fees: UsersFeesClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.oauthGrants = OauthGrantsClient(config: config)
        self.passkeys = PasskeysClient(config: config)
        self.preferences = UsersPreferencesClient(config: config)
        self.fees = UsersFeesClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Searches for users by name or username, ranked by social proximity to the authenticated user. Without a `query`, returns the user's most recently followed users.
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
    ///     _ = try await client.users.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter contextChannelId: Prioritize people relevant to this channel for mentions. Results remain global; channel access is required.
    /// - Parameter query: A search term to filter users by name or username.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(contextChannelId: String? = nil, query: String? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListUsersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users",
            queryParams: [
                "context_channel_id": contextChannelId.map { .string($0) }, 
                "query": query.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListUsersResponse.self
        )
    }

    /// Retrieves the authenticated user. Same as `GET /users/:id` with the reserved id `me`: the self view, where self-only fields such as `email`, `balance`, and `cards` can be populated.
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
    ///     _ = try await client.users.me()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter includeTrading: Also return the trading account under `trading`: its address, a snapshot of its margin and open positions, and its Hyperliquid WebSocket subscriptions. Only honored on the self view (me) with crypto_wallet:trade:read, crypto_wallet:trade, or crypto_wallet:manage permission and an Ethereum wallet.
    /// - Parameter accountId: When set, returns your account-specific profile overrides for this account.
    /// - Parameter includeBalance: Compute live wallet and owned-account balances (default true). Set false for identity-only reads. Ignored for callers without balance-read scope.
    /// - Parameter includeBalanceHistory: Also compute your balance history (opt-in; runs a heavier query). Ignored for callers without balance-read scope.
    /// - Parameter from: Balance-history window start, ISO 8601 date or datetime. Defaults to 30 days ago. Only used with `include_balance_history`.
    /// - Parameter to: Balance-history window end, ISO 8601 date or datetime. Defaults to now. Only used with `include_balance_history`.
    /// - Parameter interval: Balance-history point granularity. Defaults to `day`. Only used with `include_balance_history`.
    /// - Parameter timeZone: IANA time zone the balance-history points are bucketed in. Defaults to `UTC`. Only used with `include_balance_history`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func me(includeTrading: Bool? = nil, accountId: String? = nil, includeBalance: Bool? = nil, includeBalanceHistory: Bool? = nil, from: String? = nil, to: String? = nil, interval: MeUsersRequestInterval? = nil, timeZone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> User {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/me",
            queryParams: [
                "include_trading": includeTrading.map { .bool($0) }, 
                "account_id": accountId.map { .string($0) }, 
                "include_balance": includeBalance.map { .bool($0) }, 
                "include_balance_history": includeBalanceHistory.map { .bool($0) }, 
                "from": from.map { .string($0) }, 
                "to": to.map { .string($0) }, 
                "interval": interval.map { .string($0.rawValue) }, 
                "time_zone": timeZone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: User.self
        )
    }

    /// Updates the authenticated user's global profile, or their profile override for an account when `account_id` is given. Not available to API keys.
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
    ///     _ = try await client.users.updateMe(request: .init())
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: When set, updates the authenticated user's profile override for this account instead of their global profile.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func updateMe(accountId: String? = nil, request: Requests.UpdateMeUsersRequest, requestOptions: RequestOptions? = nil) async throws -> User {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/users/me",
            queryParams: [
                "account_id": accountId.map { .string($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: User.self
        )
    }

    /// Retrieves a user by `user_` tag or username, or the authenticated user with the reserved id `me`. Self-only fields such as `email`, `balance`, and `earnings_usd` are populated only when the id is `me`, and are always `null` when addressing a user by tag or username.
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
    ///     _ = try await client.users.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: User ID (prefixed `user_`), username, or `me` for the authenticated user.
    /// - Parameter includeTrading: Also return the trading account under `trading`: its address, a snapshot of its margin and open positions, and its Hyperliquid WebSocket subscriptions. Only honored on the self view (me) with crypto_wallet:trade:read, crypto_wallet:trade, or crypto_wallet:manage permission and an Ethereum wallet.
    /// - Parameter accountId: When set, returns the user's account-specific profile overrides for this account.
    /// - Parameter includeBalance: Compute live wallet and owned-account balances on the self view (default true). Set false for identity-only reads. Ignored when the id is not `me` or the caller lacks balance-read scope.
    /// - Parameter includeBalanceHistory: Also compute your balance history (opt-in; runs a heavier query). Only applies when the id is `me`; ignored for callers without balance-read scope.
    /// - Parameter from: Balance-history window start, ISO 8601 date or datetime. Defaults to 30 days ago. Only used with `include_balance_history`.
    /// - Parameter to: Balance-history window end, ISO 8601 date or datetime. Defaults to now. Only used with `include_balance_history`.
    /// - Parameter interval: Balance-history point granularity. Defaults to `day`. Only used with `include_balance_history`.
    /// - Parameter timeZone: IANA time zone the balance-history points are bucketed in. Defaults to `UTC`. Only used with `include_balance_history`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, includeTrading: Bool? = nil, accountId: String? = nil, includeBalance: Bool? = nil, includeBalanceHistory: Bool? = nil, from: String? = nil, to: String? = nil, interval: RetrieveUsersRequestInterval? = nil, timeZone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> User {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(id)",
            queryParams: [
                "include_trading": includeTrading.map { .bool($0) }, 
                "account_id": accountId.map { .string($0) }, 
                "include_balance": includeBalance.map { .bool($0) }, 
                "include_balance_history": includeBalanceHistory.map { .bool($0) }, 
                "from": from.map { .string($0) }, 
                "to": to.map { .string($0) }, 
                "interval": interval.map { .string($0.rawValue) }, 
                "time_zone": timeZone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: User.self
        )
    }

    /// Updates a user, addressed by `user_` tag, username, or the reserved id `me` for the authenticated user. A user token updates their own global profile; an API key updates the user's profile override for the account in `account_id`.
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
    ///     _ = try await client.users.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: User ID (prefixed `user_`), username, or `me` for the authenticated user.
    /// - Parameter accountId: The account whose profile override to update. Required for API key callers.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, accountId: String? = nil, request: Requests.UpdateUsersRequest, requestOptions: RequestOptions? = nil) async throws -> User {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/users/\(id)",
            queryParams: [
                "account_id": accountId.map { .string($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: User.self
        )
    }

    /// Checks whether a user has access to an account, product, or experience the caller can reach.
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
    ///     _ = try await client.users.checkAccess(
    ///         id: "id",
    ///         resourceId: "resource_id"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The user_ tag or username to check access for.
    /// - Parameter resourceId: An account (biz_), product (prod_), or experience (exp_) ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func checkAccess(id: String, resourceId: String, requestOptions: RequestOptions? = nil) async throws -> CheckAccessUsersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(id)/access/\(resourceId)",
            requestOptions: requestOptions,
            responseType: CheckAccessUsersResponse.self
        )
    }

    /// Lists the recommended actions computed for the authenticated user, such as starting a business. You can only list your own recommended actions.
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
    ///     _ = try await client.users.recommendActions(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: `me`, or the authenticated user's own `user_` tag or username.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func recommendActions(id: String, requestOptions: RequestOptions? = nil) async throws -> RecommendActionsUsersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(id)/recommend_actions",
            requestOptions: requestOptions,
            responseType: RecommendActionsUsersResponse.self
        )
    }
}