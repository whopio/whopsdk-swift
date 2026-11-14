import Foundation

public final class RefundsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists refunds the caller can read, newest first. Filter by payment, account, or buyer to narrow the results.
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
    ///     _ = try await client.refunds.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only refunds issued by this account, prefixed `biz_`.
    /// - Parameter paymentId: Only refunds of this payment, prefixed `pay_`.
    /// - Parameter userId: Only refunds to this buyer, prefixed `user_`.
    /// - Parameter createdBefore: Only refunds requested before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only refunds requested after this ISO 8601 timestamp.
    /// - Parameter order: The field to sort by.
    /// - Parameter direction: The sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, paymentId: String? = nil, userId: String? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, order: ListRefundsRequestOrder? = nil, direction: ListRefundsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListRefundsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/refunds",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "payment_id": paymentId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListRefundsResponse.self
        )
    }

    /// Returns one refund.
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
    ///     _ = try await client.refunds.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The refund to retrieve, prefixed `rf_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Refund {
        return try await httpClient.performRequest(
            method: .get,
            path: "/refunds/\(id)",
            requestOptions: requestOptions,
            responseType: Refund.self
        )
    }
}