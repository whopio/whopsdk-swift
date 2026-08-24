import Foundation

public final class RecommendedActionsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the recommended action chains for an account — short sequences of actions (create a product, price it, publish it) the account should run next, gated on what it already has.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.recommendedActions.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account ID, prefixed `biz_`. Defaults to the API key's own account.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListRecommendedActionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/recommended_actions",
            queryParams: [
                "account_id": accountId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListRecommendedActionsResponse.self
        )
    }

    /// Retrieves a recommended action chain by id, including chains that have already been run. Seeded chains are reconstructed from their hard-coded chain; generated chains are read from the account's stored chain, with each step's filled-in input.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.recommendedActions.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Chain ID from the list endpoint, e.g. `rac_seed_start_selling_9f2c1a7b04`.
    /// - Parameter accountId: Account ID, prefixed `biz_`. Defaults to the API key's own account.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, accountId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> AccountRecommendedActionChain {
        return try await httpClient.performRequest(
            method: .get,
            path: "/recommended_actions/\(id)",
            queryParams: [
                "account_id": accountId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: AccountRecommendedActionChain.self
        )
    }

    /// Records that the caller ran a recommended action chain. Nothing is executed server-side yet — the client follows the chain's step CTAs itself; this writes the `recommended_action_chain.executed` analytics event.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.recommendedActions.run(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Chain ID from the list endpoint, e.g. `rac_seed_start_selling_9f2c1a7b04`.
    /// - Parameter accountId: Account ID, prefixed `biz_`. Defaults to the API key's own account.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func run(id: String, accountId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> RunRecommendedActionsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/recommended_actions/\(id)",
            queryParams: [
                "account_id": accountId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: RunRecommendedActionsResponse.self
        )
    }

    /// Lists the per-step record of a recommended action chain the server ran — one entry per step in position order, each carrying its current status and, once the step completed, the API response it produced. A chain that was never run server-side returns an empty list.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.recommendedActions.listExecutions(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Chain ID from the list endpoint.
    /// - Parameter accountId: Account ID, prefixed `biz_`. Defaults to the API key's own account.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listExecutions(id: String, accountId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListExecutionsRecommendedActionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/recommended_actions/\(id)/executions",
            queryParams: [
                "account_id": accountId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListExecutionsRecommendedActionsResponse.self
        )
    }
}