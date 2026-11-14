import Foundation

public final class CashbackRulesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Creates a future-dated card cashback rule for your direct subaccounts, funded by the authenticated platform account. Creating a rule does not transfer funds; pay cashback out with `POST /cashback_rules/payout`. Requires `payout:transfer_funds`. Supports `Idempotency-Key` for safe retries.
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
    ///     _ = try await client.cashbackRules.create(request: .init(
    ///         rateBps: 500,
    ///         startsAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateCashbackRulesRequest, requestOptions: RequestOptions? = nil) async throws -> CashbackRule {
        return try await httpClient.performRequest(
            method: .post,
            path: "/cashback_rule",
            body: request,
            requestOptions: requestOptions,
            responseType: CashbackRule.self
        )
    }

    /// Lists the cashback rules funded by the authenticated platform account, including scheduled, expired, and discarded rules. Requires an account-scoped credential with `payout:transfer:read`.
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
    ///     _ = try await client.cashbackRules.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter order: Field to sort by. Defaults to created_at.
    /// - Parameter direction: Sort direction. Defaults to desc.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListCashbackRulesRequestOrder? = nil, direction: ListCashbackRulesRequestDirection? = nil, requestOptions: RequestOptions? = nil) async throws -> ListCashbackRulesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/cashback_rules",
            queryParams: [
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListCashbackRulesResponse.self
        )
    }

    /// Pays out cashback on demand from the authenticated platform's available USD balance to its direct subaccounts. Covers completed, unpaid card transactions created before the request, each under its latest matching rule, which must be funded by the authenticated platform. Filters combine, and an empty body includes every eligible transaction. Payouts process in the background and amounts are calculated then, so the response confirms queuing, not payment. If a payout fails for insufficient funds, add USD to the platform's balance. Requires `payout:transfer_funds`. Supports `Idempotency-Key`, and overlapping requests cannot pay the same card transaction twice.
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
    ///     _ = try await client.cashbackRules.payout(request: .init())
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func payout(request: Requests.PayoutCashbackRulesRequest, requestOptions: RequestOptions? = nil) async throws -> CashbackPayout {
        return try await httpClient.performRequest(
            method: .post,
            path: "/cashback_rules/payout",
            body: request,
            requestOptions: requestOptions,
            responseType: CashbackPayout.self
        )
    }

    /// Updates the merchant filters, description, or expiration of a cashback rule funded by the authenticated platform account; its start, rate, and accounts can't change. Omitted fields stay unchanged. Scheduled, active, and expired rules can be updated, but discarded rules can't. Updating a rule does not transfer funds. Requires `payout:transfer_funds`.
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
    ///     _ = try await client.cashbackRules.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: ID of the cashback rule, prefixed cicbr_.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateCashbackRulesRequest, requestOptions: RequestOptions? = nil) async throws -> CashbackRule {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/cashback_rules/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: CashbackRule.self
        )
    }
}