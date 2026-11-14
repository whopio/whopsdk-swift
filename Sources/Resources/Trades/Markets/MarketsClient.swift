import Foundation

public final class MarketsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns every market you can trade on Whop.
    ///
    /// - **Spot:** listed by symbol: `BTC`, `SOL` and `XAUT` (gold), and tokenized stocks by ticker, such as `AAPL`, with their 24-hour change and logo. Spot markets also carry `volume_24h`, the value traded across exchanges over the last 24 hours.
    /// - **Perpetuals:** such as `BTC`, and stock and commodity perpetuals from Hyperliquid's `xyz` exchange, such as `xyz:TSLA`. Send the `id` as `market` when you create a trade.
    ///
    /// The same symbol can appear twice, once as a perpetual and once as spot, so use `id` together with `instrument_type` to tell them apart. Results are sorted by `id`, then `instrument_type`.
    ///
    /// This endpoint is public: no API key is needed, and each IP address can make up to 60 requests a minute.
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
    ///     _ = try await client.trades.markets.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter instrumentType: Only return perpetuals or only spot markets.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(instrumentType: ListMarketsRequestInstrumentType? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListMarketsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/trades/markets",
            queryParams: [
                "instrument_type": instrumentType.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListMarketsResponse.self
        )
    }
}