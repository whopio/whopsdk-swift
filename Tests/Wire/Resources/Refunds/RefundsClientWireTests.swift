import Foundation
import Testing
import WhopSDK

@Suite("RefundsClient Wire Tests") struct RefundsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "amount": 6.9,
                      "created_at": "2023-12-01T05:00:00Z",
                      "currency": "usd",
                      "id": "rf_xxxxxxxxxxxxxxx",
                      "payment": {
                        "id": "pay_xxxxxxxxxxxxxx"
                      },
                      "provider": "stripe",
                      "provider_created_at": "2023-12-01T05:00:00Z",
                      "reference_status": "available",
                      "reference_type": "acquirer_reference_number",
                      "reference_value": "74850120752",
                      "status": "pending"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": true,
                    "has_previous_page": true,
                    "start_cursor": "start_cursor"
                  }
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListRefundsResponse(
            data: [
                RefundListItem(
                    amount: 6.9,
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    currency: Currencies.usd,
                    id: "rf_xxxxxxxxxxxxxxx",
                    payment: Nullable<RefundListItemPayment>.value(RefundListItemPayment(
                        id: "pay_xxxxxxxxxxxxxx"
                    )),
                    provider: PaymentProviders.stripe,
                    providerCreatedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    referenceStatus: Nullable<RefundReferenceStatuses>.value(RefundReferenceStatuses.available),
                    referenceType: Nullable<RefundReferenceTypes>.value(RefundReferenceTypes.acquirerReferenceNumber),
                    referenceValue: Nullable<String>.value("74850120752"),
                    status: RefundStatuses.pending
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.refunds.list(
            first: 42,
            last: 42,
            paymentId: "pay_xxxxxxxxxxxxxx",
            companyId: "biz_xxxxxxxxxxxxxx",
            userId: "user_xxxxxxxxxxxxx",
            createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "amount": 6.9,
                  "created_at": "2023-12-01T05:00:00Z",
                  "currency": "usd",
                  "id": "rf_xxxxxxxxxxxxxxx",
                  "payment": {
                    "billing_reason": "subscription_create",
                    "card_brand": "mastercard",
                    "card_last4": "4242",
                    "created_at": "2023-12-01T05:00:00Z",
                    "currency": "usd",
                    "dispute_alerted_at": "2023-12-01T05:00:00Z",
                    "id": "pay_xxxxxxxxxxxxxx",
                    "member": {
                      "id": "id",
                      "phone": "phone"
                    },
                    "membership": {
                      "id": "mem_xxxxxxxxxxxxxx",
                      "status": "trialing"
                    },
                    "metadata": {
                      "key": "value"
                    },
                    "paid_at": "2023-12-01T05:00:00Z",
                    "payment_method_type": "acss_debit",
                    "plan": {
                      "id": "plan_xxxxxxxxxxxxx",
                      "metadata": {
                        "key": "value"
                      }
                    },
                    "product": {
                      "id": "prod_xxxxxxxxxxxxx",
                      "metadata": {
                        "key": "value"
                      }
                    },
                    "subtotal": 6.9,
                    "tax_amount": 6.9,
                    "tax_behavior": "exclusive",
                    "tax_refunded_amount": 6.9,
                    "total": 6.9,
                    "usd_total": 6.9,
                    "user": {
                      "email": "john.doe@example.com",
                      "id": "user_xxxxxxxxxxxxx",
                      "name": "John Doe",
                      "username": "johndoe42"
                    }
                  },
                  "provider": "stripe",
                  "provider_created_at": "2023-12-01T05:00:00Z",
                  "reference_status": "available",
                  "reference_type": "acquirer_reference_number",
                  "reference_value": "74850120752",
                  "status": "pending"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Refund(
            amount: 6.9,
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            currency: Currencies.usd,
            id: "rf_xxxxxxxxxxxxxxx",
            payment: Nullable<RefundPayment>.value(RefundPayment(
                billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
                cardBrand: Nullable<CardBrands>.value(CardBrands.mastercard),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                currency: Currencies.usd,
                disputeAlertedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                id: "pay_xxxxxxxxxxxxxx",
                member: Nullable<RefundPaymentMember>.value(RefundPaymentMember(
                    id: "id",
                    phone: Nullable<String>.value("phone")
                )),
                membership: Nullable<RefundPaymentMembership>.value(RefundPaymentMembership(
                    id: "mem_xxxxxxxxxxxxxx",
                    status: MembershipStatus.trialing
                )),
                metadata: Nullable<[String: JSONValue]>.value([
                    "key": JSONValue.string("value")
                ]),
                paidAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
                plan: Nullable<RefundPaymentPlan>.value(RefundPaymentPlan(
                    id: "plan_xxxxxxxxxxxxx",
                    metadata: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ])
                )),
                product: Nullable<RefundPaymentProduct>.value(RefundPaymentProduct(
                    id: "prod_xxxxxxxxxxxxx",
                    metadata: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ])
                )),
                subtotal: Nullable<Double>.value(6.9),
                taxAmount: Nullable<Double>.value(6.9),
                taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
                taxRefundedAmount: Nullable<Double>.value(6.9),
                total: Nullable<Double>.value(6.9),
                usdTotal: Nullable<Double>.value(6.9),
                user: Nullable<RefundPaymentUser>.value(RefundPaymentUser(
                    email: Nullable<String>.value("john.doe@example.com"),
                    id: "user_xxxxxxxxxxxxx",
                    name: Nullable<String>.value("John Doe"),
                    username: "johndoe42"
                ))
            )),
            provider: PaymentProviders.stripe,
            providerCreatedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            referenceStatus: Nullable<RefundReferenceStatuses>.value(RefundReferenceStatuses.available),
            referenceType: Nullable<RefundReferenceTypes>.value(RefundReferenceTypes.acquirerReferenceNumber),
            referenceValue: Nullable<String>.value("74850120752"),
            status: RefundStatuses.pending
        )
        let response = try await client.refunds.retrieve(
            id: "rf_xxxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}