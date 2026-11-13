import Foundation

public final class TradesClient: Sendable {
    public let candles: CandlesClient
    public let markets: MarketsClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.candles = CandlesClient(config: config)
        self.markets = MarketsClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists trades you can access, newest first. User credentials see their own trades and those of accounts they belong to, including subaccounts; account credentials see their account and its subaccounts.
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
    ///     _ = try await client.trades.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only return trades for this account or user, prefixed `biz_` or `user_`.
    /// - Parameter status: Only return trades with this status.
    /// - Parameter type: Only return trades of this type.
    /// - Parameter order: Field to sort by.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, status: ListTradesRequestStatus? = nil, type: ListTradesRequestType? = nil, order: ListTradesRequestOrder? = nil, direction: ListTradesRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListTradesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/trades",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "type": type.map { .string($0.rawValue) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListTradesResponse.self
        )
    }

    /// Places an order, closes a perpetual position, or deposits to or withdraws from the trading balance, from the Whop-managed wallet of an account or user. Answers `201` with the trade in `pending`; it runs in the background, so read it with `GET /trades/:id` until its `status` is `completed`, `failed` or `in_review`. Trades run alongside each other, except a second order on one market at a different leverage, which answers `409`. A retry with the same `Idempotency-Key` returns the same trade.
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
    ///     _ = try await client.trades.create(request: .init(
    ///         accountId: "biz_xxxxxxxxxxxxxx",
    ///         type: .close
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateTradesRequest, requestOptions: RequestOptions? = nil) async throws -> Trade {
        return try await httpClient.performRequest(
            method: .post,
            path: "/trades",
            body: request,
            requestOptions: requestOptions,
            responseType: Trade.self
        )
    }

    /// Retrieves a trade. Read it until its `status` is `completed`, `failed` or `in_review`.
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
    ///     _ = try await client.trades.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Trade ID, prefixed `tint_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Trade {
        return try await httpClient.performRequest(
            method: .get,
            path: "/trades/\(id)",
            requestOptions: requestOptions,
            responseType: Trade.self
        )
    }

    /// Cancels the order of a trade while it rests on the book, such as a `good_til_canceled` limit order. Answers with the trade still `processing`; read it with `GET /trades/:id` until its `status` is `completed` or `failed`. A part that filled before the cancel landed stays filled, and money bridged in for an order that did not fill goes back to the wallet. Calling it again sends no second cancel. Answers `409` when the trade has no order on the book.
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
    ///     _ = try await client.trades.cancel(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Trade ID, prefixed `tint_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func cancel(id: String, requestOptions: RequestOptions? = nil) async throws -> Trade {
        return try await httpClient.performRequest(
            method: .post,
            path: "/trades/\(id)/cancel",
            requestOptions: requestOptions,
            responseType: Trade.self
        )
    }
}