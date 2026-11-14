import Foundation

public final class InvoicesClient: Sendable {
    public let sends: SendsClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.sends = SendsClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists receipt-backed invoices for accounts the caller can read. Legacy invoices are excluded.
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
    ///     _ = try await client.invoices.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter scheduled: Set to `true` for drafts with a scheduled send, which are the invoices with a `scheduled_send_at`. Set to `false` for every other invoice. Only a `draft` can be scheduled. An `open` invoice is not scheduled, even with a `scheduled_charge_at`. A draft that sends on its due date (`sends_on_due_date`) is not scheduled. Omit to include both.
    /// - Parameter order: Field to sort by. Sorting by `due_at` or `scheduled_send_at` puts invoices without that date last in both directions.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter includeTotalCount: Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, status: ListInvoicesRequestStatus? = nil, overdue: Bool? = nil, scheduled: Bool? = nil, memberId: String? = nil, productId: String? = nil, createdAfter: Date? = nil, createdBefore: Date? = nil, order: ListInvoicesRequestOrder? = nil, direction: ListInvoicesRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, includeTotalCount: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> ListInvoicesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/invoices",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "overdue": overdue.map { .bool($0) }, 
                "scheduled": scheduled.map { .bool($0) }, 
                "member_id": memberId.map { .string($0) }, 
                "product_id": productId.map { .string($0) }, 
                "created_after": createdAfter.map { .date($0) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "include_total_count": includeTotalCount.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListInvoicesResponse.self
        )
    }

    /// Creates a draft invoice backed by a receipt, with saved items, quantities, prices, and recipients. Issue the draft to resolve final tax and open the invoice. The pay_ ID stays the same when paid. Needs `invoice:create` or `payment:charge`; a `payment_method_id` needs `payment:charge`.
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
    ///     _ = try await client.invoices.create(request: .init(
    ///         accountId: "biz_xxxxxxxxxxxxxx",
    ///         items: [
    ///             CreateInvoicesRequestItemsItem(
    ///
    ///             )
    ///         ]
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateInvoicesRequest, requestOptions: RequestOptions? = nil) async throws -> Invoice {
        return try await httpClient.performRequest(
            method: .post,
            path: "/invoices",
            body: request,
            requestOptions: requestOptions,
            responseType: Invoice.self
        )
    }

    /// Retrieves a receipt-backed invoice by its pay_ ID.
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
    ///     _ = try await client.invoices.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The invoice's pay_ ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Invoice {
        return try await httpClient.performRequest(
            method: .get,
            path: "/invoices/\(id)",
            requestOptions: requestOptions,
            responseType: Invoice.self
        )
    }

    /// Deletes a draft or void invoice. A deleted invoice no longer appears in invoice or payment lists, and its ID returns a `404`. Deleting can't be undone. Void an open invoice before you delete it. A draft with a scheduled send or charge must be unscheduled first. A draft renewal invoice can't be deleted, and neither can a void invoice that collected money or still awaits a bank wire. The invoice's `deletable` field is `true` when this call can delete it.
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
    ///     _ = try await client.invoices.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The invoice's pay_ ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteInvoicesResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/invoices/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteInvoicesResponse.self
        )
    }

    /// Updates draft invoice items and billing fields. Updates of only `recipient_emails` and `memo` are also allowed on unpaid invoices. The customer is set when the draft is created and can't change. To bill someone else, first void the draft. Then create a new invoice. Edit customer contact details through the member API. A draft with no saved payment method and no scheduled send needs `invoice:update`, `invoice:create`, or `payment:charge`; every other update, and setting `payment_method_id`, needs `payment:charge`.
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
    ///     _ = try await client.invoices.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The invoice's pay_ ID.
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

    /// Charges an open invoice now to one of its customer's saved payment methods, canceling any charge scheduled for later. The charge completes asynchronously: the invoice becomes `paid`, or, if declined, stays `open` and its recipients are emailed the `checkout_link`. Refused for drafts and while another payment is in progress.
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
    ///     _ = try await client.invoices.charge(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The invoice's pay_ ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func charge(id: String, request: Requests.ChargeInvoicesRequest, requestOptions: RequestOptions? = nil) async throws -> Invoice {
        return try await httpClient.performRequest(
            method: .post,
            path: "/invoices/\(id)/charge",
            body: request,
            requestOptions: requestOptions,
            responseType: Invoice.self
        )
    }

    /// Generates the invoice as a PDF and returns a short-lived link to download it. A draft shows its estimated totals. The buyer's name and email need `member:basic:read` and `member:email:read`, and the Pay now link on an open invoice needs `payment:charge`, or `invoice:create` or `invoice:update` when it has no `payment_method_id`. Each call generates a new file and link, so this endpoint does not replay `Idempotency-Key` responses.
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
    ///     _ = try await client.invoices.generatePdf(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The invoice's pay_ ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func generatePdf(id: String, request: Requests.GeneratePdfInvoicesRequest, requestOptions: RequestOptions? = nil) async throws -> InvoicePdf {
        return try await httpClient.performRequest(
            method: .post,
            path: "/invoices/\(id)/generate_pdf",
            body: request,
            requestOptions: requestOptions,
            responseType: InvoicePdf.self
        )
    }

    /// Resolves final tax and opens a draft invoice without emailing it. An invoice with a `payment_method_id` is charged to it off-session, as `POST /payments` charges a saved payment method: at `charge_at` if given, otherwise on `due_at` while it is still ahead, otherwise right away (see `scheduled_charge_at`). With a future `due_at` and no `charge_at`, the customer is charged on the due date without being emailed first. Issuing an open invoice again retains its totals and charges nothing.
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
    ///     _ = try await client.invoices.issue(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The invoice's pay_ ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func issue(id: String, request: Requests.IssueInvoicesRequest, requestOptions: RequestOptions? = nil) async throws -> Invoice {
        return try await httpClient.performRequest(
            method: .post,
            path: "/invoices/\(id)/issue",
            body: request,
            requestOptions: requestOptions,
            responseType: Invoice.self
        )
    }

    /// Marks an open invoice as uncollectible. Its checkout link stops working.
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
    ///     _ = try await client.invoices.markUncollectible(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The invoice's pay_ ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func markUncollectible(id: String, requestOptions: RequestOptions? = nil) async throws -> Invoice {
        return try await httpClient.performRequest(
            method: .post,
            path: "/invoices/\(id)/mark_uncollectible",
            requestOptions: requestOptions,
            responseType: Invoice.self
        )
    }

    /// Issues a draft and emails it to its recipients, with reminders after the due date. A draft with no `payment_method_id` needs `invoice:update`, `invoice:create`, or `payment:charge`, and is never charged. A draft with a `payment_method_id` needs `payment:charge`: with a `charge_at`, or when its `due_at` is still ahead, it is emailed now and charged to that method at that time (see `scheduled_charge_at`); otherwise it is charged right away instead of emailed. Voiding the invoice, marking it uncollectible, or paying it first cancels the scheduled charge, and its recipients get the payment link if a charge fails. Sending an open invoice needs `payment:charge` and emails it again, up to three emails a day including the first send. With `send_at`, the draft is sent at that time instead, and cannot be edited, except its recipients, until it is sent or unscheduled. Each email, reminders included, is sent separately to the customer email shown on the invoice and to each address in `recipient_emails`, so recipients never see each other's addresses.
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
    ///     _ = try await client.invoices.send(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The invoice's pay_ ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func send(id: String, request: Requests.SendInvoicesRequest, requestOptions: RequestOptions? = nil) async throws -> Invoice {
        return try await httpClient.performRequest(
            method: .post,
            path: "/invoices/\(id)/send",
            body: request,
            requestOptions: requestOptions,
            responseType: Invoice.self
        )
    }

    /// Cancels a draft's scheduled send, so it can be edited again. An invoice with no scheduled send is returned unchanged. A draft with no `payment_method_id` needs `invoice:update`, `invoice:create`, or `payment:charge`; any other invoice needs `payment:charge`.
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
    ///     _ = try await client.invoices.unschedule(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The invoice's pay_ ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func unschedule(id: String, requestOptions: RequestOptions? = nil) async throws -> Invoice {
        return try await httpClient.performRequest(
            method: .post,
            path: "/invoices/\(id)/unschedule",
            requestOptions: requestOptions,
            responseType: Invoice.self
        )
    }

    /// Voids a draft or unpaid invoice.
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
    ///     _ = try await client.invoices.void(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The invoice's pay_ ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func void(id: String, requestOptions: RequestOptions? = nil) async throws -> Invoice {
        return try await httpClient.performRequest(
            method: .post,
            path: "/invoices/\(id)/void",
            requestOptions: requestOptions,
            responseType: Invoice.self
        )
    }
}