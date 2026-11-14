import Foundation

public final class DisputeAlertsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the dispute alerts and early fraud warnings across the accounts you can read.
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
    ///     _ = try await client.disputeAlerts.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only alerts on this account's payments (`biz_` tag). Omit it to cover every account you can read.
    /// - Parameter paymentId: Only alerts on this payment (`pay_` tag). A payment can carry several.
    /// - Parameter type: Only alerts of this kind. `early_fraud_warning` for issuer fraud reports, `dispute_alert` for pre-dispute notices, `rapid_dispute_resolution` for Visa RDR cases the network already closed.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter order: The field to sort alerts by.
    /// - Parameter direction: Sort direction.
    /// - Parameter createdBefore: Only alerts Whop received before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only alerts Whop received after this ISO 8601 timestamp.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, paymentId: String? = nil, type: ListDisputeAlertsRequestType? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListDisputeAlertsRequestOrder? = nil, direction: ListDisputeAlertsRequestDirection? = nil, createdBefore: String? = nil, createdAfter: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListDisputeAlertsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/dispute_alerts",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "payment_id": paymentId.map { .string($0) }, 
                "type": type.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListDisputeAlertsResponse.self
        )
    }

    /// Retrieves a single dispute alert or early fraud warning by ID.
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
    ///     _ = try await client.disputeAlerts.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The dispute alert ID, prefixed `dspa_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> DisputeAlert {
        return try await httpClient.performRequest(
            method: .get,
            path: "/dispute_alerts/\(id)",
            requestOptions: requestOptions,
            responseType: DisputeAlert.self
        )
    }
}