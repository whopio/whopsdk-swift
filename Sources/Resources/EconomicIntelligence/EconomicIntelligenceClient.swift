import Foundation

public final class EconomicIntelligenceClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists an account's recommendations, newest first by default. `status: ready` is what the account can act on now. Any other listing is its history of runs. Executed recommendations and runs stay listed after Economic Intelligence turns off, but new recommendations are offered only to businesses it is written for. For visitor countries, page views, ad impressions and clicks, or payment volume over a time range, use `GET /stats/time_series/:metric`.
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
    ///     _ = try await client.economicIntelligence.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account ID, prefixed `biz_`. Defaults to the API key's own account. Omit with `has_run` for the runs on every account you can read.
    /// - Parameter status: `ready` lists the recommendations the account can run now. A run status lists only the runs in that state. `queued`, `pending` and `superseded` are no longer listed and answer nothing.
    /// - Parameter input: No longer read: recommendations are written for the business as it changes. Up to 1000 characters.
    /// - Parameter hasRun: When true, only recommendations someone has started running, by any user. Without `account_id`, covers every account you can read.
    /// - Parameter order: Sort field.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, status: ListEconomicIntelligenceRequestStatus? = nil, input: String? = nil, hasRun: Bool? = nil, order: ListEconomicIntelligenceRequestOrder? = nil, direction: ListEconomicIntelligenceRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListEconomicIntelligenceResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/economic_intelligence",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "input": input.map { .string($0) }, 
                "has_run": hasRun.map { .bool($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListEconomicIntelligenceResponse.self
        )
    }

    /// Updates a recommendation status, records feedback, or both. Send `sentiment` to rate it. Include `status: superseded` to retire a ready recommendation. A rating alone leaves its status unchanged. To run a recommendation yourself, send `status: running` to start. Send `status: executed` when it is carried out, or `status: incomplete` if the run ended without carrying it out. With `executed`, name what changed in `result_id` or where the run worked in `result_page`, and the result links there. Whop AI reports its own runs the same way. Send `status: acknowledged` once an executed run's result has been seen.
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
    ///     _ = try await client.economicIntelligence.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Recommendation ID, prefixed `reca_`.
    /// - Parameter accountId: Account ID, prefixed `biz_`. Defaults to the API key's own account.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, accountId: String? = nil, request: Requests.UpdateEconomicIntelligenceRequest, requestOptions: RequestOptions? = nil) async throws -> EconomicIntelligence {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/economic_intelligence/\(id)",
            queryParams: [
                "account_id": accountId.map { .string($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: EconomicIntelligence.self
        )
    }
}