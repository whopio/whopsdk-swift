import Foundation

public final class PaymentsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of payments for the actor in context, with optional filtering by product, plan, status, billing reason, currency, and creation date.
    ///
    /// Required permissions:
    ///  - `payment:basic:read`
    ///  - `plan:basic:read`
    ///  - `access_pass:basic:read`
    ///  - `member:email:read`
    ///  - `member:basic:read`
    ///  - `member:phone:read`
    ///  - `promo_code:basic:read`
    ///  - `shipment:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.payments.list(
    ///         first: 42,
    ///         last: 42,
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
    ///         createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
    ///         updatedBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
    ///         updatedAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter after: Returns the elements in the list that come after the specified cursor.
    /// - Parameter before: Returns the elements in the list that come before the specified cursor.
    /// - Parameter first: Returns the first _n_ elements from the list.
    /// - Parameter last: Returns the last _n_ elements from the list.
    /// - Parameter companyId: The unique identifier of the company to list payments for.
    /// - Parameter productIds: Filter payments to only those associated with these specific product identifiers.
    /// - Parameter billingReasons: Filter payments by their billing reason.
    /// - Parameter currencies: Filter payments by their currency code.
    /// - Parameter planIds: Filter payments to only those associated with these specific plan identifiers.
    /// - Parameter statuses: Filter payments by their current status.
    /// - Parameter substatuses: Filter payments by their current substatus for more granular filtering.
    /// - Parameter includeFree: Whether to include payments with a zero amount.
    /// - Parameter createdBefore: Only return payments created before this timestamp.
    /// - Parameter createdAfter: Only return payments created after this timestamp.
    /// - Parameter updatedBefore: Only return payments last updated before this timestamp.
    /// - Parameter updatedAfter: Only return payments last updated after this timestamp.
    /// - Parameter query: Search payments by user ID, membership ID, user email, name, or username. Email filtering requires the member:email:read permission.
    /// - Parameter checkoutConfigurationIds: Only return payments from these checkout configurations.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, companyId: String? = nil, direction: Direction? = nil, order: ReceiptV2Order? = nil, productIds: [String]? = nil, billingReasons: [BillingReasons]? = nil, currencies: [Currencies]? = nil, planIds: [String]? = nil, statuses: [ReceiptStatus]? = nil, substatuses: [FriendlyReceiptStatus]? = nil, includeFree: Bool? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, updatedBefore: Date? = nil, updatedAfter: Date? = nil, query: String? = nil, checkoutConfigurationIds: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPaymentsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payments",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "company_id": companyId.map { .string($0) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "order": order.map { .string($0.rawValue) }, 
                "product_ids": productIds.map { .stringArray($0) }, 
                "billing_reasons": billingReasons.map { .unknown($0) }, 
                "currencies": currencies.map { .unknown($0) }, 
                "plan_ids": planIds.map { .stringArray($0) }, 
                "statuses": statuses.map { .unknown($0) }, 
                "substatuses": substatuses.map { .unknown($0) }, 
                "include_free": includeFree.map { .bool($0) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }, 
                "updated_before": updatedBefore.map { .date($0) }, 
                "updated_after": updatedAfter.map { .date($0) }, 
                "query": query.map { .string($0) }, 
                "checkout_configuration_ids": checkoutConfigurationIds.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListPaymentsResponse.self
        )
    }

    /// Charge an existing member off-session using one of their stored payment methods. You can provide an existing plan, or create a new one in-line. This endpoint will respond with a payment object immediately, but the payment is processed asynchronously in the background. Use webhooks to be notified when the payment succeeds or fails.
    ///
    /// Required permissions:
    ///  - `payment:charge`
    ///  - `plan:create`
    ///  - `access_pass:create`
    ///  - `access_pass:update`
    ///  - `plan:basic:read`
    ///  - `access_pass:basic:read`
    ///  - `member:email:read`
    ///  - `member:basic:read`
    ///  - `member:phone:read`
    ///  - `promo_code:basic:read`
    ///  - `shipment:basic:read`
    ///  - `payment:dispute:read`
    ///  - `payment:resolution_center_case:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.payments.create(request: CreatePaymentsRequest.createPaymentsRequestZero(
    ///         CreatePaymentsRequestZero(
    ///             companyId: "biz_xxxxxxxxxxxxxx",
    ///             confirmationToken: "confirmation_token",
    ///             plan: CreatePaymentsRequestZeroPlan(
    ///                 currency: .usd
    ///             )
    ///         )
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter request: Parameters for CreatePayment
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreatePaymentsRequest, requestOptions: RequestOptions? = nil) async throws -> CreatePaymentsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payments",
            body: request,
            requestOptions: requestOptions,
            responseType: CreatePaymentsResponse.self
        )
    }

    /// Retrieves the details of an existing payment.
    ///
    /// Required permissions:
    ///  - `payment:basic:read`
    ///  - `plan:basic:read`
    ///  - `access_pass:basic:read`
    ///  - `member:email:read`
    ///  - `member:basic:read`
    ///  - `member:phone:read`
    ///  - `promo_code:basic:read`
    ///  - `shipment:basic:read`
    ///  - `payment:dispute:read`
    ///  - `payment:resolution_center_case:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.payments.retrieve(id: "pay_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the payment.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> RetrievePaymentsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payments/\(id)",
            requestOptions: requestOptions,
            responseType: RetrievePaymentsResponse.self
        )
    }

    /// Returns the list of fees associated with a specific payment, including platform fees and processing fees.
    ///
    /// Required permissions:
    ///  - `payment:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.payments.listFees(
    ///         id: "pay_xxxxxxxxxxxxxx",
    ///         first: 42,
    ///         last: 42
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the payment to list fees for.
    /// - Parameter after: Returns the elements in the list that come after the specified cursor.
    /// - Parameter before: Returns the elements in the list that come before the specified cursor.
    /// - Parameter first: Returns the first _n_ elements from the list.
    /// - Parameter last: Returns the last _n_ elements from the list.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listFees(id: String, after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ListFeesPaymentsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payments/\(id)/fees",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListFeesPaymentsResponse.self
        )
    }

    /// Issue a full or partial refund for a payment. The refund is processed through the original payment processor and the membership status is updated accordingly.
    ///
    /// Required permissions:
    ///  - `payment:manage`
    ///  - `plan:basic:read`
    ///  - `access_pass:basic:read`
    ///  - `member:email:read`
    ///  - `member:basic:read`
    ///  - `member:phone:read`
    ///  - `promo_code:basic:read`
    ///  - `shipment:basic:read`
    ///  - `payment:dispute:read`
    ///  - `payment:resolution_center_case:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.payments.refund(
    ///         id: "pay_xxxxxxxxxxxxxx",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the payment to refund.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func refund(id: String, request: Requests.RefundPaymentsRequest, requestOptions: RequestOptions? = nil) async throws -> Payment {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payments/\(id)/refund",
            body: request,
            requestOptions: requestOptions,
            responseType: Payment.self
        )
    }

    /// Retry a failed or pending payment. This re-attempts the charge using the original payment method and plan details.
    ///
    /// Required permissions:
    ///  - `payment:manage`
    ///  - `plan:basic:read`
    ///  - `access_pass:basic:read`
    ///  - `member:email:read`
    ///  - `member:basic:read`
    ///  - `member:phone:read`
    ///  - `promo_code:basic:read`
    ///  - `shipment:basic:read`
    ///  - `payment:dispute:read`
    ///  - `payment:resolution_center_case:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.payments.retry(id: "pay_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the payment to retry.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retry(id: String, requestOptions: RequestOptions? = nil) async throws -> Payment {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payments/\(id)/retry",
            requestOptions: requestOptions,
            responseType: Payment.self
        )
    }

    /// Void a payment that has not yet been settled. Voiding cancels the payment before it is captured by the payment processor.
    ///
    /// Required permissions:
    ///  - `payment:manage`
    ///  - `plan:basic:read`
    ///  - `access_pass:basic:read`
    ///  - `member:email:read`
    ///  - `member:basic:read`
    ///  - `member:phone:read`
    ///  - `promo_code:basic:read`
    ///  - `shipment:basic:read`
    ///  - `payment:dispute:read`
    ///  - `payment:resolution_center_case:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.payments.void(id: "pay_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the payment to void.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func void(id: String, requestOptions: RequestOptions? = nil) async throws -> Payment {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payments/\(id)/void",
            requestOptions: requestOptions,
            responseType: Payment.self
        )
    }

    /// Changes where the buyer lands after completing an off-site step, up until they return. Accepts either a secret key or the payment's own `client_secret`, so the surface that knows the final destination can set it.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.payments.updateReturnUrl(
    ///         paymentId: "payment_id",
    ///         request: .init(returnUrl: "https://shinetime.example/checkout/thanks")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter paymentId: The unique identifier of the payment.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func updateReturnUrl(paymentId: String, request: Requests.UpdateReturnUrlPaymentsRequest, requestOptions: RequestOptions? = nil) async throws -> PaymentStatus {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/payments/\(paymentId)/return_url",
            body: request,
            requestOptions: requestOptions,
            responseType: PaymentStatus.self
        )
    }

    /// Retrieves how far a payment has got and what the buyer must do next, if anything. A payment is collected in the background, so poll this rather than reading the create response. Accepts either a secret key or the payment's own `client_secret`, so the surface collecting the payment can poll it directly.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.payments.retrieveStatus(paymentId: "payment_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter paymentId: The unique identifier of the payment.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieveStatus(paymentId: String, requestOptions: RequestOptions? = nil) async throws -> PaymentStatus {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payments/\(paymentId)/status",
            requestOptions: requestOptions,
            responseType: PaymentStatus.self
        )
    }
}