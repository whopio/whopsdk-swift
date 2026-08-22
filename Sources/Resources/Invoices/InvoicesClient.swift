import Foundation

public final class InvoicesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of invoices for a company, with optional filtering by product, status, collection method, and creation date.
    ///
    /// Required permissions:
    ///  - `invoice:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.invoices.list(
    ///         first: 42,
    ///         last: 42,
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
    ///         createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
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
    /// - Parameter companyId: The unique identifier of the company to list invoices for.
    /// - Parameter productIds: Filter invoices to only those associated with these specific product identifiers.
    /// - Parameter collectionMethods: Filter invoices by their collection method.
    /// - Parameter statuses: Filter invoices by their current status.
    /// - Parameter createdBefore: Only return invoices created before this timestamp.
    /// - Parameter createdAfter: Only return invoices created after this timestamp.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, companyId: String? = nil, direction: Direction? = nil, productIds: [String]? = nil, collectionMethods: [InvoiceCollectionMethods]? = nil, statuses: [InvoiceStatuses]? = nil, order: InvoicesSortableColumns? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> ListInvoicesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/invoices",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "company_id": companyId.map { .string($0) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "product_ids": productIds.map { .stringArray($0) }, 
                "collection_methods": collectionMethods.map { .unknown($0) }, 
                "statuses": statuses.map { .unknown($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListInvoicesResponse.self
        )
    }

    /// Create an invoice for a customer. The invoice can be charged automatically using a stored payment method, or sent to the customer for manual payment.
    ///
    /// Required permissions:
    ///  - `invoice:create`
    ///  - `member:email:read`
    ///  - `member:basic:read`
    ///  - `payment:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.invoices.create(request: CreateInvoicesRequest.createInvoicesRequestProduct(
    ///         CreateInvoicesRequestProduct(
    ///             collectionMethod: .sendInvoice,
    ///             companyId: "biz_xxxxxxxxxxxxxx",
    ///             plan: CreateInvoicesRequestProductPlan(
    ///
    ///             ),
    ///             product: CreateInvoicesRequestProductProduct(
    ///                 title: "title"
    ///             )
    ///         )
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter request: Parameters for CreateInvoice
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreateInvoicesRequest, requestOptions: RequestOptions? = nil) async throws -> Invoice {
        return try await httpClient.performRequest(
            method: .post,
            path: "/invoices",
            body: request,
            requestOptions: requestOptions,
            responseType: Invoice.self
        )
    }

    /// Retrieves the details of an existing invoice.
    ///
    /// Required permissions:
    ///  - `invoice:basic:read`
    ///  - `member:email:read`
    ///  - `member:basic:read`
    ///  - `payment:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.invoices.retrieve(id: "inv_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the invoice, or a secure token.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Invoice {
        return try await httpClient.performRequest(
            method: .get,
            path: "/invoices/\(id)",
            requestOptions: requestOptions,
            responseType: Invoice.self
        )
    }

    /// Delete a draft invoice.
    ///
    /// Required permissions:
    ///  - `invoice:update`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.invoices.delete(id: "inv_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the draft invoice to delete.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/invoices/\(id)",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }

    /// Update a draft invoice's details.
    ///
    /// Required permissions:
    ///  - `invoice:update`
    ///  - `member:email:read`
    ///  - `member:basic:read`
    ///  - `payment:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.invoices.update(
    ///         id: "inv_xxxxxxxxxxxxxx",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the invoice to update.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateInvoicesRequest, requestOptions: RequestOptions? = nil) async throws -> Invoice {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/invoices/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Invoice.self
        )
    }

    /// Mark an open invoice as paid when payment was collected outside of Whop.
    ///
    /// Required permissions:
    ///  - `invoice:update`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.invoices.markPaid(id: "inv_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the invoice to mark as paid.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func markPaid(id: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .post,
            path: "/invoices/\(id)/mark_paid",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }

    /// Mark an open invoice as uncollectible when payment is not expected.
    ///
    /// Required permissions:
    ///  - `invoice:update`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.invoices.markUncollectible(id: "inv_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the invoice to mark as uncollectible.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func markUncollectible(id: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .post,
            path: "/invoices/\(id)/mark_uncollectible",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }

    /// Resend the notification email for an existing invoice to the customer.
    ///
    /// Required permissions:
    ///  - `invoice:update`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.invoices.resend(id: "inv_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the invoice to resend.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func resend(id: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .post,
            path: "/invoices/\(id)/resend",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }

    /// Void an open invoice so it can no longer be paid. Voiding is permanent and cannot be undone.
    ///
    /// Required permissions:
    ///  - `invoice:update`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.invoices.void(id: "inv_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the invoice to void.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func void(id: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .post,
            path: "/invoices/\(id)/void",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }
}