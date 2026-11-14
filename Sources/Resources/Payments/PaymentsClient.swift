import Foundation

public final class PaymentsClient: Sendable {
    public let levelsRebate: LevelsRebateClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.levelsRebate = LevelsRebateClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists payments, newest first. By default, returns sales for the accounts your credential can read: an account credential's own account, or every account a user can read payments for. Set `mode` to `user_sales` to list the sales the signed-in user received personally, outside any account.
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
    ///     _ = try await client.payments.list(
    ///         currencies: [
    ///             "eur"
    ///         ],
    ///         minAmount: 995,
    ///         maxAmount: 995,
    ///         variantIds: [
    ///             "plan_xxxxxxxxxxxxx"
    ///         ],
    ///         productIds: [
    ///             "prod_xxxxxxxxxxxxx"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter mode: Which sales to list. `account_sales` returns sales for the accounts the caller can read. `user_sales` returns only sales the signed-in user received personally, outside any account; it requires the user's own Whop login session and cannot be combined with `account_id`.
    /// - Parameter accountId: Only payments charged by this account, prefixed `biz_`.
    /// - Parameter status: Only payments in this lifecycle state.
    /// - Parameter trackingStatus: Only payments whose most recently attached kept shipment is in this tracking state. `missing_tracking` selects paid payments with a captured shipping address and no kept shipment, excluding fully refunded payments. `needs_tracking` selects payments with an open pre-shipment funds hold and no kept shipment. Shipment states do not imply a payment or refund state. Requires `shipment:basic:read` as well as `payment:basic:read`; user-wide lists include only accounts readable under both scopes. Only supported with `mode=account_sales`.
    /// - Parameter billingReason: Only payments charged for this reason. `subscription_cycle` also matches renewals recorded as `subscription_update`.
    /// - Parameter currency: Only payments presented in this three-letter currency, such as `usd`.
    /// - Parameter userId: Only payments made by this buyer, prefixed `user_`. This filters sales the caller can read, so `me` is not accepted; list the caller's own purchases with `GET /memberships?user_id=me`.
    /// - Parameter query: Search payments by payment ID, dispute ID, user ID, membership ID, user email, name, or username. Email filtering requires the member:email:read permission.
    /// - Parameter includeSubaccounts: Also cover the account's subaccounts. Requires `account_id`, and is a 400 without it. Without `query`, lists the payments of the account and every subaccount, newest first by `created_at` only; another `order` is a 400. The listing is cut off after 10 seconds, which a rare filter on an account with little recent activity can reach; add a `query` to narrow it. With `query`, matches on payment, dispute, user or membership ID, buyer email, or a card's first 6 or 8 digits and last 4 separated by a space or dash (`424242 4242`); free-text queries such as a name search only the named account. Subaccounts' payments are returned only for subaccounts you can read payments on.
    /// - Parameter memberId: Only payments made by this member, prefixed `mber_`.
    /// - Parameter membershipId: Only payments billed under this membership, prefixed `mem_`.
    /// - Parameter productId: Only payments for this product, prefixed `prod_`.
    /// - Parameter variantId: Only payments priced by this variant, prefixed `plan_`.
    /// - Parameter createdBefore: Only payments created before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only payments created after this ISO 8601 timestamp.
    /// - Parameter statuses: Only payments in any of these lifecycle states, with the same meanings as `status`. Repeat the parameter to pass several. Combined with `status` when both are sent.
    /// - Parameter substatuses: Only payments whose `substatus` is any of these. Repeat the parameter to pass several. `incomplete` also matches payments that report `incomplete` because no finer status was recorded.
    /// - Parameter billingReasons: Only payments charged for any of these reasons, with the same meanings as `billing_reason`. Repeat the parameter to pass several. Combined with `billing_reason` when both are sent.
    /// - Parameter currencies: Only payments presented in any of these three-letter currencies. Repeat the parameter to pass several. Combined with `currency` when both are sent.
    /// - Parameter minAmount: Only payments charged at least this amount: what the buyer was charged after discounts and including tax, in the currency each payment was presented in, the same amount `order=amount` sorts by. Where tax is added on top of the price (`tax_behavior` is `exclusive`), that is the price plus the tax, so a 995 price with tax added does not match `995`: match a range instead. A failed payment that charged nothing matches 0, not its price. Inclusive and compared to the cent. Pair it with `currencies` when the account sells in several. Send the same value as `max_amount` to match one exact amount.
    /// - Parameter maxAmount: Only payments charged at most this amount, measured like `min_amount`: after discounts and including tax, in the currency each payment was presented in. Inclusive and compared to the cent. Must not be less than `min_amount`.
    /// - Parameter variantIds: Only payments priced by any of these variants, each prefixed `plan_`. Repeat the parameter to pass several. Combined with `variant_id` when both are sent.
    /// - Parameter productIds: Only payments for any of these products, each prefixed `prod_`. Repeat the parameter to pass several. Combined with `product_id` when both are sent.
    /// - Parameter paymentMethods: Only payments paid with any of these methods: a card brand such as `amex`, a wallet such as `apple_pay`, or a payment method type such as `paypal`. Repeat the parameter to pass several.
    /// - Parameter trackingStates: Only payments whose shipment is in any of these tracking states, or that still need a tracking number (`needs_tracking`). Repeat the parameter to pass several. Requires `account_id` and the shipment:basic:read permission.
    /// - Parameter refundedAfter: Only payments refunded after this ISO 8601 timestamp.
    /// - Parameter refundedBefore: Only payments refunded before this ISO 8601 timestamp.
    /// - Parameter disputeAlertedAfter: Only payments with a dispute alert after this ISO 8601 timestamp.
    /// - Parameter disputeAlertedBefore: Only payments with a dispute alert before this ISO 8601 timestamp.
    /// - Parameter disputeCreatedAfter: Only payments with a dispute opened after this ISO 8601 timestamp.
    /// - Parameter disputeCreatedBefore: Only payments with a dispute opened before this ISO 8601 timestamp.
    /// - Parameter order: The field to sort by. `amount` sorts by the amount charged, in the currency it was charged in.
    /// - Parameter direction: The sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter includeTotalCount: Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(mode: ListPaymentsRequestMode? = nil, accountId: String? = nil, status: ListPaymentsRequestStatus? = nil, trackingStatus: ListPaymentsRequestTrackingStatus? = nil, billingReason: ListPaymentsRequestBillingReason? = nil, currency: String? = nil, userId: String? = nil, query: String? = nil, includeSubaccounts: Bool? = nil, memberId: String? = nil, membershipId: String? = nil, productId: String? = nil, variantId: String? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, statuses: [ListPaymentsRequestStatusesItem]? = nil, substatuses: [ListPaymentsRequestSubstatusesItem]? = nil, billingReasons: [ListPaymentsRequestBillingReasonsItem]? = nil, currencies: [String]? = nil, minAmount: Double? = nil, maxAmount: Double? = nil, variantIds: [String]? = nil, productIds: [String]? = nil, paymentMethods: [ListPaymentsRequestPaymentMethodsItem]? = nil, trackingStates: [ListPaymentsRequestTrackingStatesItem]? = nil, refundedAfter: Date? = nil, refundedBefore: Date? = nil, disputeAlertedAfter: Date? = nil, disputeAlertedBefore: Date? = nil, disputeCreatedAfter: Date? = nil, disputeCreatedBefore: Date? = nil, order: ListPaymentsRequestOrder? = nil, direction: ListPaymentsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, includeTotalCount: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPaymentsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payments",
            queryParams: [
                "mode": mode.map { .string($0.rawValue) }, 
                "account_id": accountId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "tracking_status": trackingStatus.map { .string($0.rawValue) }, 
                "billing_reason": billingReason.map { .string($0.rawValue) }, 
                "currency": currency.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "query": query.map { .string($0) }, 
                "include_subaccounts": includeSubaccounts.map { .bool($0) }, 
                "member_id": memberId.map { .string($0) }, 
                "membership_id": membershipId.map { .string($0) }, 
                "product_id": productId.map { .string($0) }, 
                "variant_id": variantId.map { .string($0) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }, 
                "statuses": statuses.map { .unknown($0) }, 
                "substatuses": substatuses.map { .unknown($0) }, 
                "billing_reasons": billingReasons.map { .unknown($0) }, 
                "currencies": currencies.map { .stringArray($0) }, 
                "min_amount": minAmount.map { .double($0) }, 
                "max_amount": maxAmount.map { .double($0) }, 
                "variant_ids": variantIds.map { .stringArray($0) }, 
                "product_ids": productIds.map { .stringArray($0) }, 
                "payment_methods": paymentMethods.map { .unknown($0) }, 
                "tracking_states": trackingStates.map { .unknown($0) }, 
                "refunded_after": refundedAfter.map { .date($0) }, 
                "refunded_before": refundedBefore.map { .date($0) }, 
                "dispute_alerted_after": disputeAlertedAfter.map { .date($0) }, 
                "dispute_alerted_before": disputeAlertedBefore.map { .date($0) }, 
                "dispute_created_after": disputeCreatedAfter.map { .date($0) }, 
                "dispute_created_before": disputeCreatedBefore.map { .date($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "include_total_count": includeTotalCount.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListPaymentsResponse.self
        )
    }

    /// Charges a buyer for one or more variants with a payment method already on file (`member_id` and `payment_method_id`), or with a `confirmation_token` for a method the buyer just supplied. Collection runs in the background, so the response is the payment as created, not its outcome: poll Retrieve payment status for how far it has got and what the buyer must still do.
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
    ///     _ = try await client.payments.create(request: .init(accountId: "biz_xxxxxxxxxxxxxx"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreatePaymentsRequest, requestOptions: RequestOptions? = nil) async throws -> Payment {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payments",
            body: request,
            requestOptions: requestOptions,
            responseType: Payment.self
        )
    }

    /// Totals up the same payments the list returns, so you can build status tabs and filter options without paging through them. Takes the same filters as List Payments.
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
    ///     _ = try await client.payments.summary(
    ///         currencies: [
    ///             "usd"
    ///         ],
    ///         minAmount: 995,
    ///         maxAmount: 995,
    ///         variantIds: [
    ///             "plan_xxxxxxxxxxxxx"
    ///         ],
    ///         productIds: [
    ///             "prod_xxxxxxxxxxxxx"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter groups: Which breakdowns to return, keyed by these names under `groups`. Repeat the parameter to ask for several; omit it for all of them.
    /// - Parameter accountId: Only payments charged by this account, prefixed `biz_`.
    /// - Parameter statuses: Only payments in any of these lifecycle states. Repeat the parameter to pass several.
    /// - Parameter substatuses: Only payments whose `substatus` is any of these. Repeat the parameter to pass several.
    /// - Parameter billingReasons: Only payments charged for any of these reasons. Repeat the parameter to pass several.
    /// - Parameter currencies: Only payments presented in any of these three-letter currencies. Repeat the parameter to pass several.
    /// - Parameter minAmount: Only payments charged at least this amount: what the buyer was charged after discounts and including tax, in the currency each payment was presented in. Where tax is added on top of the price (`tax_behavior` is `exclusive`), that is the price plus the tax. A failed payment that charged nothing counts as 0. Inclusive and compared to the cent.
    /// - Parameter maxAmount: Only payments charged at most this amount, measured like `min_amount`: after discounts and including tax. Inclusive and compared to the cent. Must not be less than `min_amount`.
    /// - Parameter variantIds: Only payments priced by any of these variants, each prefixed `plan_`. Repeat the parameter to pass several.
    /// - Parameter productIds: Only payments for any of these products, each prefixed `prod_`. Repeat the parameter to pass several.
    /// - Parameter paymentMethods: Only payments paid with any of these methods. Repeat the parameter to pass several.
    /// - Parameter trackingStates: Only payments in any of these tracking states. Requires `account_id` and the shipment:basic:read permission.
    /// - Parameter createdAfter: Only payments created after this ISO 8601 timestamp.
    /// - Parameter createdBefore: Only payments created before this ISO 8601 timestamp.
    /// - Parameter refundedAfter: Only payments refunded after this ISO 8601 timestamp.
    /// - Parameter refundedBefore: Only payments refunded before this ISO 8601 timestamp.
    /// - Parameter disputeAlertedAfter: Only payments with a dispute alert after this ISO 8601 timestamp.
    /// - Parameter disputeAlertedBefore: Only payments with a dispute alert before this ISO 8601 timestamp.
    /// - Parameter disputeCreatedAfter: Only payments with a dispute opened after this ISO 8601 timestamp.
    /// - Parameter disputeCreatedBefore: Only payments with a dispute opened before this ISO 8601 timestamp.
    /// - Parameter query: Search payments by payment ID, dispute ID, user ID, membership ID, user email, name, or username.
    /// - Parameter includeSubaccounts: Only for searches: with `query`, also search the account's subaccounts. Requires `account_id` and `query`, and is a 400 without either; it never lists subaccounts' payments on its own. Matches on payment, dispute, user or membership ID, buyer email, or a card's first 6 or 8 digits and last 4 separated by a space or dash (`424242 4242`). Free-text queries such as a name search only the named account. Subaccounts' payments are returned only for subaccounts you can read payments on.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func summary(groups: [SummaryPaymentsRequestGroupsItem]? = nil, accountId: String? = nil, statuses: [SummaryPaymentsRequestStatusesItem]? = nil, substatuses: [SummaryPaymentsRequestSubstatusesItem]? = nil, billingReasons: [SummaryPaymentsRequestBillingReasonsItem]? = nil, currencies: [String]? = nil, minAmount: Double? = nil, maxAmount: Double? = nil, variantIds: [String]? = nil, productIds: [String]? = nil, paymentMethods: [SummaryPaymentsRequestPaymentMethodsItem]? = nil, trackingStates: [SummaryPaymentsRequestTrackingStatesItem]? = nil, createdAfter: Date? = nil, createdBefore: Date? = nil, refundedAfter: Date? = nil, refundedBefore: Date? = nil, disputeAlertedAfter: Date? = nil, disputeAlertedBefore: Date? = nil, disputeCreatedAfter: Date? = nil, disputeCreatedBefore: Date? = nil, query: String? = nil, includeSubaccounts: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> SummaryPaymentsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payments/summary",
            queryParams: [
                "groups": groups.map { .unknown($0) }, 
                "account_id": accountId.map { .string($0) }, 
                "statuses": statuses.map { .unknown($0) }, 
                "substatuses": substatuses.map { .unknown($0) }, 
                "billing_reasons": billingReasons.map { .unknown($0) }, 
                "currencies": currencies.map { .stringArray($0) }, 
                "min_amount": minAmount.map { .double($0) }, 
                "max_amount": maxAmount.map { .double($0) }, 
                "variant_ids": variantIds.map { .stringArray($0) }, 
                "product_ids": productIds.map { .stringArray($0) }, 
                "payment_methods": paymentMethods.map { .unknown($0) }, 
                "tracking_states": trackingStates.map { .unknown($0) }, 
                "created_after": createdAfter.map { .date($0) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "refunded_after": refundedAfter.map { .date($0) }, 
                "refunded_before": refundedBefore.map { .date($0) }, 
                "dispute_alerted_after": disputeAlertedAfter.map { .date($0) }, 
                "dispute_alerted_before": disputeAlertedBefore.map { .date($0) }, 
                "dispute_created_after": disputeCreatedAfter.map { .date($0) }, 
                "dispute_created_before": disputeCreatedBefore.map { .date($0) }, 
                "query": query.map { .string($0) }, 
                "include_subaccounts": includeSubaccounts.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: SummaryPaymentsResponse.self
        )
    }

    /// Returns one payment, including every purchased line item with its quantity and subtotal. Related records are ids — resolve a variant, membership, member or shipment on its own endpoint, and list this payment's refunds, disputes or Resolution Center cases with `?payment_id=`.
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
    ///     _ = try await client.payments.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The payment, prefixed `pay_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Payment {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payments/\(id)",
            requestOptions: requestOptions,
            responseType: Payment.self
        )
    }

    /// Updates a payment's `shipping_address` or `return_url`.
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
    ///     _ = try await client.payments.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The payment, prefixed `pay_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdatePaymentsRequest, requestOptions: RequestOptions? = nil) async throws -> Payment {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/payments/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Payment.self
        )
    }

    /// Captures the full amount of a card payment created with `capture: false`. The payment must still be in `requires_capture` before `capture_expires_at`. Partial capture, multiple captures, capturing more than the authorized amount, and tips are not supported.
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
    ///     _ = try await client.payments.capture(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the payment.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func capture(id: String, requestOptions: RequestOptions? = nil) async throws -> PaymentStatus {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payments/\(id)/capture",
            requestOptions: requestOptions,
            responseType: PaymentStatus.self
        )
    }

    /// Returns the fee breakdown of one payment — Whop's fee, processing, affiliate and other lines — each in the currency it was collected in and converted to the payment's settlement currency. The list is complete in one page.
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
    ///     _ = try await client.payments.listFees(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The payment whose fees to list, prefixed `pay_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listFees(id: String, requestOptions: RequestOptions? = nil) async throws -> ListFeesPaymentsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payments/\(id)/fees",
            requestOptions: requestOptions,
            responseType: ListFeesPaymentsResponse.self
        )
    }

    /// Generates the payment's receipt (invoice) as a PDF and returns a short-lived link to download it. Each call generates a new file and link, so this endpoint does not replay `Idempotency-Key` responses.
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
    ///     _ = try await client.payments.generatePdf(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The payment whose receipt to generate, prefixed `pay_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func generatePdf(id: String, requestOptions: RequestOptions? = nil) async throws -> PaymentPdf {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payments/\(id)/generate_pdf",
            requestOptions: requestOptions,
            responseType: PaymentPdf.self
        )
    }

    /// Refunds all or part of a payment through the processor that charged it, and updates its membership to match. The buyer is emailed, the affiliate commission on the payment is clawed back, and any open Resolution Center case on the payment is closed.
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
    ///     _ = try await client.payments.refund(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The payment to refund, prefixed `pay_`.
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

    /// Charges an unpaid payment again with its original payment method and variant. A payment can typically be retried once, and only while its membership is active, trialing or past due, or when it is a membership's failed first payment.
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
    ///     _ = try await client.payments.retry(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The payment to retry, prefixed `pay_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retry(id: String, requestOptions: RequestOptions? = nil) async throws -> Payment {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payments/\(id)/retry",
            requestOptions: requestOptions,
            responseType: Payment.self
        )
    }

    /// Voids or cancels an eligible payment. The request is rejected if the payment is no longer eligible. Some processors confirm the release of a card authorization asynchronously: the payment is then returned still `authorized`, and a `payment.canceled` webhook follows once the hold is released.
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
    ///     _ = try await client.payments.void(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The payment to void, prefixed `pay_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func void(id: String, requestOptions: RequestOptions? = nil) async throws -> Payment {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payments/\(id)/void",
            requestOptions: requestOptions,
            responseType: Payment.self
        )
    }

    /// Charges the saved card again, with the buyer present, for a payment their bank declined until they authenticate (such as with 3DS). Retrieve the payment afterward to get the bank's challenge from `next_action`; once the buyer completes it, they land on `return_url`, or on Whop's hosted verification page if none was given. Only the buyer can call this, with the payment's `client_secret` in the body, an OAuth token for their own account with the `member:payment_methods:use` scope, or the token from a verified `payment` session intent. An API key gets a `403`. Has no effect on a payment that is not waiting on authentication.
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
    ///     _ = try await client.payments.resume(
    ///         paymentId: "payment_id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter paymentId: The unique identifier of the payment.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func resume(paymentId: String, request: Requests.ResumePaymentsRequest, requestOptions: RequestOptions? = nil) async throws -> PaymentStatus {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payments/\(paymentId)/resume",
            body: request,
            requestOptions: requestOptions,
            responseType: PaymentStatus.self
        )
    }

    /// Changes where the buyer lands after completing an off-site step, up until they return. Accepts either a secret key or the payment's own `client_secret` in the body, so the surface that knows the final destination can set it.
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

    /// Retrieves how far a payment has got and what the buyer must do next, if anything. A payment is collected in the background, so poll this rather than reading the create response. Accepts either a secret key or the payment's own `client_secret` as a query parameter, so the surface collecting the payment can poll it directly.
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
    ///     _ = try await client.payments.retrieveStatus(paymentId: "payment_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter paymentId: The unique identifier of the payment.
    /// - Parameter clientSecret: The payment's own `client_secret`, for a caller without a secret key.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieveStatus(paymentId: String, clientSecret: String? = nil, requestOptions: RequestOptions? = nil) async throws -> PaymentStatus {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payments/\(paymentId)/status",
            queryParams: [
                "client_secret": clientSecret.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: PaymentStatus.self
        )
    }
}