import Foundation

public final class CandlesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns price candles for a tokenized stock, oldest first.
    ///
    /// - **Intervals:** `1h`, `2h`, `4h`, `6h` and `12h` candles cover the last 30 days. `1d` and `1w` candles cover the full history.
    /// - **Weeks** start on Monday at 00:00 UTC.
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
    ///     _ = try await client.trades.candles.list(
    ///         market: "market",
    ///         interval: .oneH,
    ///         from: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter market: The tokenized stock's ticker, such as `NVDA`. This is the `id` of a spot market from List Markets.
    /// - Parameter interval: How much time each candle covers.
    /// - Parameter from: Return candles that start at or after this time, as an ISO 8601 timestamp.
    /// - Parameter to: Return candles that start before this time, as an ISO 8601 timestamp. Defaults to now.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(market: String, interval: ListCandlesRequestInterval, from: Date, to: Date? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListCandlesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/trades/candles",
            queryParams: [
                "market": .string(market), 
                "interval": .string(interval.rawValue), 
                "from": .date(from), 
                "to": to.map { .date($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListCandlesResponse.self
        )
    }
}