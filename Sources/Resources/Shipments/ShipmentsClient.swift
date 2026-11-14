import Foundation

public final class ShipmentsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists an account's shipments.
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
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
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
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
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

    /// Finds the delivery for a purchase from an account with customer tracking turned on, using exactly one order or tracking number plus the buyer's current receipt email. No authentication is required and no sign-in or session is created. Email matching ignores case and surrounding whitespace, but dots and +tags must match. Every miss returns the same 404: an unknown account, tracking turned off, a wrong number or email, an unpaid order or a purchase with nothing to ship. `shipment` is `null` while a paid physical purchase has no tracking yet, unless it has been fully refunded. Limited to 10 attempts per hour per order or tracking number within the account, and 30 attempts per five minutes per client IP and per email within the account. Responses are never cached or replayed with Idempotency-Key.
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
    ///     _ = try await client.shipments.lookup(request: .init(
    ///         accountId: "biz_xxxxxxxxxxxxxx",
    ///         email: "marcus@shinetime.example"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func lookup(request: Requests.LookupShipmentsRequest, requestOptions: RequestOptions? = nil) async throws -> ShipmentLookup {
        return try await httpClient.performRequest(
            method: .post,
            path: "/shipments/lookup",
            body: request,
            requestOptions: requestOptions,
            responseType: ShipmentLookup.self
        )
    }

    /// Retrieves a shipment by its ID, or by the ID of the payment it fulfills.
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
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
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