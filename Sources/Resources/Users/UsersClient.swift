import Foundation

public final class UsersClient: Sendable {
    public let oauthGrants: OauthGrantsClient
    public let passkeys: PasskeysClient
    public let preferences: UsersPreferencesClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.oauthGrants = OauthGrantsClient(config: config)
        self.passkeys = PasskeysClient(config: config)
        self.preferences = UsersPreferencesClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Search for users by name or username, ranked by social proximity to the authenticated user. Returns the user's most recently followed users when no query is given.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.users.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter query: A search term to filter users by name or username.
    /// - Parameter first: The number of users to return (max 50).
    /// - Parameter after: A cursor; returns users after this position.
    /// - Parameter last: The number of users to return from the end of the range.
    /// - Parameter before: A cursor; returns users before this position.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(query: String? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListUsersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users",
            queryParams: [
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

    /// Retrieves the authenticated user — the self view of the user object. Same shape as `GET /users/{id}`, with the self-only fields populated: `email` (email-read scope), `staff` (Whop staff only, staff-read scope), `balance` and `earnings_usd` (balance-read scope), the opt-in `balance_history`, and every linked social account.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.users.me()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: When set, returns your account-specific profile overrides for this account.
    /// - Parameter includeBalanceHistory: Also compute your balance history (opt-in; runs a heavier query). Ignored for callers without balance-read scope.
    /// - Parameter from: Balance-history window start, ISO 8601 date or datetime. Defaults to 30 days ago. Only used with `include_balance_history`.
    /// - Parameter to: Balance-history window end, ISO 8601 date or datetime. Defaults to now. Only used with `include_balance_history`.
    /// - Parameter interval: Balance-history point granularity. Defaults to `day`. Only used with `include_balance_history`.
    /// - Parameter timeZone: IANA time zone the balance-history points are bucketed in. Defaults to `UTC`. Only used with `include_balance_history`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func me(accountId: String? = nil, includeBalanceHistory: Bool? = nil, from: String? = nil, to: String? = nil, interval: MeUsersRequestInterval? = nil, timeZone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> User {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/me",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
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

    /// Updates the authenticated user's global profile, or their profile override for an account when account_id is given. Not available to API keys.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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

    /// Retrieves a user by `user_` tag or username, or the authenticated user with the reserved id `me`. Profiles include linked social accounts — reading your own profile returns every linked account, other profiles only what is public on Whop (the primary Discord and the X account). The self-only fields are populated only when the id is `me`: `email` (email-read scope), `staff` (Whop staff only, staff-read scope), `balance` and `earnings_usd` (balance-read scope), and the opt-in `balance_history`. They are always `null` when addressing a user by tag or username.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.users.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: User ID (prefixed `user_`), username, or `me` for the authenticated user.
    /// - Parameter accountId: When set, returns the user's account-specific profile overrides for this account.
    /// - Parameter includeBalanceHistory: Also compute your balance history (opt-in; runs a heavier query). Only applies when the id is `me`; ignored for callers without balance-read scope.
    /// - Parameter from: Balance-history window start, ISO 8601 date or datetime. Defaults to 30 days ago. Only used with `include_balance_history`.
    /// - Parameter to: Balance-history window end, ISO 8601 date or datetime. Defaults to now. Only used with `include_balance_history`.
    /// - Parameter interval: Balance-history point granularity. Defaults to `day`. Only used with `include_balance_history`.
    /// - Parameter timeZone: IANA time zone the balance-history points are bucketed in. Defaults to `UTC`. Only used with `include_balance_history`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, accountId: String? = nil, includeBalanceHistory: Bool? = nil, from: String? = nil, to: String? = nil, interval: RetrieveUsersRequestInterval? = nil, timeZone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> User {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(id)",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
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

    /// Updates a user, addressed by `user_` tag, username, or the reserved id `me` for the authenticated user. A user token updates their own global profile; an API key updates the user's account-specific profile override (account_id required).
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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
    ///     let client = Whop(token: "<token>")
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

    /// Lists the recommended actions computed for the user: personal suggestions (e.g. start a business or become an affiliate) pooled with the highest-impact actions across the accounts the user owns. Business actions are tagged with their `account_id`/`account_name`; personal actions leave those `null`. Self-only: `id` must be `me` or the authenticated user's own tag/username.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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