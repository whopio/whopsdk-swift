import Foundation

public final class ShipmentsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of shipments for an account.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.shipments.list(paymentId: [
    ///         "pay_xxxxxxxxxxxxxx"
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The account to list shipments for. Defaults to the acting account.
    /// - Parameter status: Filter to shipments with this delivery status.
    /// - Parameter paymentId: Only shipments fulfilling these payments, each prefixed `pay_`. Repeat the parameter to pass several, up to 100 per request — one paginated list covers all of them.
    /// - Parameter createdBefore: Return shipments created before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Return shipments created after this ISO 8601 timestamp.
    /// - Parameter order: The field to sort by.
    /// - Parameter direction: The sort direction.
    /// - Parameter first: The number of shipments to return.
    /// - Parameter after: A cursor; returns shipments after this position.
    /// - Parameter last: The number of shipments to return from the end of the range.
    /// - Parameter before: A cursor; returns shipments before this position.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, status: ListShipmentsRequestStatus? = nil, paymentId: [String]? = nil, createdBefore: String? = nil, createdAfter: String? = nil, order: ListShipmentsRequestOrder? = nil, direction: ListShipmentsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListShipmentsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/shipments",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "payment_id": paymentId.map { .stringArray($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListShipmentsResponse.self
        )
    }

    /// Attaches a carrier tracking number to a payment and begins tracking it.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.shipments.create(request: .init(
    ///         paymentId: "pay_xxxxxxxxxxxxxx",
    ///         trackingNumber: "1Z999AA10123456784"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateShipmentsRequest, requestOptions: RequestOptions? = nil) async throws -> Shipment {
        return try await httpClient.performRequest(
            method: .post,
            path: "/shipments",
            body: request,
            requestOptions: requestOptions,
            responseType: Shipment.self
        )
    }

    /// Retrieves a shipment by its id, or by the payment id it fulfills.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.shipments.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The shipment id (`ship_`), or the payment id (`pay_`) it fulfills.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Shipment {
        return try await httpClient.performRequest(
            method: .get,
            path: "/shipments/\(id)",
            requestOptions: requestOptions,
            responseType: Shipment.self
        )
    }

    /// Updates a shipment's tracking number and re-tracks it with the carrier.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.shipments.update(
    ///         id: "id",
    ///         request: .init(trackingNumber: "9400111899223456789012")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The shipment id (`ship_`), or the payment id (`pay_`) it fulfills.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateShipmentsRequest, requestOptions: RequestOptions? = nil) async throws -> Shipment {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/shipments/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Shipment.self
        )
    }
}