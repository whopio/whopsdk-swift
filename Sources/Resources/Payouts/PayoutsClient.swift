import Foundation

public final class PayoutsClient: Sendable {
    public let methods: MethodsClient
    public let supportedMethods: SupportedMethodsClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.methods = MethodsClient(config: config)
        self.supportedMethods = SupportedMethodsClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists an account's or user's payouts, newest first.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.payouts.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The owning account ID (a biz_ identifier). Provide this or user_id.
    /// - Parameter userId: The owning user ID (a user_ identifier). Provide this or account_id.
    /// - Parameter currency: Optional currency code filter, for example `usd`.
    /// - Parameter status: Filter to payouts whose `status` reads this word, matching exactly what this version displays — `reversed` finds settled payouts the bank later returned. Requires Api-Version-Date 2026-08-21 or later.
    /// - Parameter source: Filter by how the payout was created. Payouts created before source tracking or through internal tooling carry no source and never match.
    /// - Parameter payoutMethodId: Filter to payouts sent to one saved payout method (a pytk_ identifier). An unknown id matches nothing.
    /// - Parameter createdBefore: Only payouts created before this ISO 8601 time (exclusive).
    /// - Parameter createdAfter: Only payouts created at or after this ISO 8601 time (inclusive).
    /// - Parameter first: Number of payouts to return from the start of the window.
    /// - Parameter after: Cursor to fetch the page after (from page_info.end_cursor).
    /// - Parameter last: Number of payouts to return from the end of the window.
    /// - Parameter before: Cursor to fetch the page before (from page_info.start_cursor).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, userId: String? = nil, currency: String? = nil, status: ListPayoutsRequestStatus? = nil, source: ListPayoutsRequestSource? = nil, payoutMethodId: String? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPayoutsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payouts",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "currency": currency.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "source": source.map { .string($0.rawValue) }, 
                "payout_method_id": payoutMethodId.map { .string($0) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListPayoutsResponse.self
        )
    }

    /// Sends money from an account or user balance to a saved payout method for that owner.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.payouts.create(request: CreatePayoutsRequestBody.jsonValue(
    ///         .object([
    ///             "key": .string("value")
    ///         ])
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreatePayoutsRequestBody, requestOptions: RequestOptions? = nil) async throws -> CreatePayoutsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payouts",
            body: request,
            requestOptions: requestOptions,
            responseType: CreatePayoutsResponse.self
        )
    }

    /// Fetches one payout by its `wdrl_` ID, or by the `cofr_` conversion request ID a stablecoin payout carries as `payout_request_id` — both ids answer with the same payout object.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.payouts.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Payout ID, prefixed `wdrl_` for a payout returned by `GET /payouts` or `cofr_` for the payout request returned by `POST /payouts`.
    /// - Parameter accountId: Owning account ID, prefixed `biz_`. Provide exactly one of `account_id` or `user_id`.
    /// - Parameter userId: Owning user ID, prefixed `user_`. Provide exactly one of `account_id` or `user_id`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, accountId: String? = nil, userId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> RetrievePayoutsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payouts/\(id)",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: RetrievePayoutsResponse.self
        )
    }
}