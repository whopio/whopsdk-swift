import Foundation
import Testing
import WhopSDK

@Suite("InvoicesClient Wire Tests") struct InvoicesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "amount_due": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "billing_address": {
                        "city": "Austin",
                        "country": "US",
                        "line1": "1114 Bouldin Ave",
                        "line2": "Unit B",
                        "name": "Dana Whitfield",
                        "postal_code": "78704",
                        "state": "TX"
                      },
                      "buyer_fee_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "buyer_fee_percentage": 0,
                      "checkout_link": "pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "customer_name": "Dana",
                      "deletable": false,
                      "due_at": "due_at",
                      "email_address": "marcus@shinetime.example",
                      "id": "pay_xxxxxxxxxxxxxx",
                      "invoice_prefix": "invoice_prefix",
                      "line_items": [
                        {
                          "description": null,
                          "discount_amount": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "id": "li_xxxxxxxxxxxxxx",
                          "label": "Ceramic Coating Package",
                          "product_id": "prod_xxxxxxxxxxxxxx",
                          "quantity": 1,
                          "subtotal": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "tax_amount": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unit_amount": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "variant_id": "plan_xxxxxxxxxxxxxx"
                        }
                      ],
                      "mailing_address_id": "mailing_address_id",
                      "member_id": "mber_xxxxxxxxxxxxxx",
                      "membership_id": "mem_xxxxxxxxxxxxxx",
                      "memo": "memo",
                      "metadata": {
                        "key": "value"
                      },
                      "number": "#xxxxxxxx",
                      "object": "invoice",
                      "overdue": false,
                      "paid_at": "paid_at",
                      "payment_method_configuration": {
                        "disabled": [
                          "card"
                        ],
                        "enabled": [
                          "card"
                        ],
                        "include_platform_defaults": true
                      },
                      "payment_method_id": "payt_xxxxxxxxxxxxxx",
                      "recipient_emails": [
                        "marcus@shinetime.example"
                      ],
                      "scheduled_charge_at": "scheduled_charge_at",
                      "scheduled_collection_method": "charge_automatically",
                      "scheduled_send_at": "scheduled_send_at",
                      "sends_on_due_date": false,
                      "status": "draft",
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "tax_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "total": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "totals_status": "estimated",
                      "updated_at": "2026-01-01T12:00:00.000Z"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "WyJjdXJzb3IiLDFd",
                    "total_count": 1,
                    "total_count_capped": true
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
        let expectedResponse = ListInvoicesResponse(
            data: [
                Invoice(
                    accountId: "biz_xxxxxxxxxxxxxx",
                    amountDue: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                        city: Nullable<String>.value("Austin"),
                        country: Nullable<String>.value("US"),
                        line1: Nullable<String>.value("1114 Bouldin Ave"),
                        line2: Nullable<String>.value("Unit B"),
                        name: Nullable<String>.value("Dana Whitfield"),
                        postalCode: Nullable<String>.value("78704"),
                        state: Nullable<String>.value("TX")
                    )),
                    buyerFeeAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    buyerFeePercentage: 0,
                    checkoutLink: Nullable<String>.value("pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    customerName: Nullable<String>.value("Dana"),
                    deletable: false,
                    dueAt: Nullable<String>.value("due_at"),
                    emailAddress: Nullable<String>.value("marcus@shinetime.example"),
                    id: "pay_xxxxxxxxxxxxxx",
                    invoicePrefix: Nullable<String>.value("invoice_prefix"),
                    lineItems: [
                        InvoiceLineItem(
                            description: .null,
                            discountAmount: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                            label: Nullable<String>.value("Ceramic Coating Package"),
                            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                            quantity: 1,
                            subtotal: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            taxAmount: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            unitAmount: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
                        )
                    ],
                    mailingAddressId: Nullable<String>.value("mailing_address_id"),
                    memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                    membershipId: Nullable<String>.value("mem_xxxxxxxxxxxxxx"),
                    memo: Nullable<String>.value("memo"),
                    metadata: [
                        "key": "value"
                    ],
                    number: "#xxxxxxxx",
                    object: InvoiceObject.invoice,
                    overdue: false,
                    paidAt: Nullable<String>.value("paid_at"),
                    paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                        disabled: [
                            "card"
                        ],
                        enabled: [
                            "card"
                        ],
                        includePlatformDefaults: true
                    )),
                    paymentMethodId: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
                    recipientEmails: [
                        "marcus@shinetime.example"
                    ],
                    scheduledChargeAt: Nullable<String>.value("scheduled_charge_at"),
                    scheduledCollectionMethod: Nullable<InvoiceScheduledCollectionMethod>.value(InvoiceScheduledCollectionMethod.chargeAutomatically),
                    scheduledSendAt: Nullable<String>.value("scheduled_send_at"),
                    sendsOnDueDate: false,
                    status: InvoiceStatus.draft,
                    subtotal: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    taxAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    total: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    totalsStatus: InvoiceTotalsStatus.estimated,
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListInvoicesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                totalCount: Nullable<Int>.value(1),
                totalCountCapped: true
            )
        )
        let response = try await client.invoices.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount_due": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "billing_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "buyer_fee_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "buyer_fee_percentage": 0,
                  "checkout_link": "pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "customer_name": "Dana",
                  "deletable": false,
                  "due_at": "due_at",
                  "email_address": "marcus@shinetime.example",
                  "id": "pay_xxxxxxxxxxxxxx",
                  "invoice_prefix": "invoice_prefix",
                  "line_items": [
                    {
                      "description": "description",
                      "discount_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "quantity": 1,
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "tax_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "unit_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx"
                    }
                  ],
                  "mailing_address_id": "mailing_address_id",
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "membership_id": "mem_xxxxxxxxxxxxxx",
                  "memo": "memo",
                  "metadata": {
                    "key": "value"
                  },
                  "number": "#xxxxxxxx",
                  "object": "invoice",
                  "overdue": false,
                  "paid_at": "paid_at",
                  "payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "payment_method_id": "payt_xxxxxxxxxxxxxx",
                  "recipient_emails": [
                    "marcus@shinetime.example"
                  ],
                  "scheduled_charge_at": "scheduled_charge_at",
                  "scheduled_collection_method": "charge_automatically",
                  "scheduled_send_at": "scheduled_send_at",
                  "sends_on_due_date": false,
                  "status": "draft",
                  "subtotal": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "tax_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "totals_status": "estimated",
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Invoice(
            accountId: "biz_xxxxxxxxxxxxxx",
            amountDue: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            buyerFeeAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            buyerFeePercentage: 0,
            checkoutLink: Nullable<String>.value("pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customerName: Nullable<String>.value("Dana"),
            deletable: false,
            dueAt: Nullable<String>.value("due_at"),
            emailAddress: Nullable<String>.value("marcus@shinetime.example"),
            id: "pay_xxxxxxxxxxxxxx",
            invoicePrefix: Nullable<String>.value("invoice_prefix"),
            lineItems: [
                InvoiceLineItem(
                    description: Nullable<String>.value("description"),
                    discountAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    quantity: 1,
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    taxAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    unitAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
                )
            ],
            mailingAddressId: Nullable<String>.value("mailing_address_id"),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            membershipId: Nullable<String>.value("mem_xxxxxxxxxxxxxx"),
            memo: Nullable<String>.value("memo"),
            metadata: [
                "key": "value"
            ],
            number: "#xxxxxxxx",
            object: InvoiceObject.invoice,
            overdue: false,
            paidAt: Nullable<String>.value("paid_at"),
            paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            paymentMethodId: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
            recipientEmails: [
                "marcus@shinetime.example"
            ],
            scheduledChargeAt: Nullable<String>.value("scheduled_charge_at"),
            scheduledCollectionMethod: Nullable<InvoiceScheduledCollectionMethod>.value(InvoiceScheduledCollectionMethod.chargeAutomatically),
            scheduledSendAt: Nullable<String>.value("scheduled_send_at"),
            sendsOnDueDate: false,
            status: InvoiceStatus.draft,
            subtotal: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            taxAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            total: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            totalsStatus: InvoiceTotalsStatus.estimated,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.invoices.create(
            request: .init(
                accountId: "biz_xxxxxxxxxxxxxx",
                items: [
                    CreateInvoicesRequestItemsItem(

                    )
                ]
            ),
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount_due": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "billing_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "buyer_fee_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "buyer_fee_percentage": 0,
                  "checkout_link": "pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "customer_name": "Dana",
                  "deletable": false,
                  "due_at": "due_at",
                  "email_address": "marcus@shinetime.example",
                  "id": "pay_xxxxxxxxxxxxxx",
                  "invoice_prefix": "invoice_prefix",
                  "line_items": [
                    {
                      "description": "description",
                      "discount_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "quantity": 1,
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "tax_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "unit_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx"
                    }
                  ],
                  "mailing_address_id": "mailing_address_id",
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "membership_id": "mem_xxxxxxxxxxxxxx",
                  "memo": "memo",
                  "metadata": {
                    "key": "value"
                  },
                  "number": "#xxxxxxxx",
                  "object": "invoice",
                  "overdue": false,
                  "paid_at": "paid_at",
                  "payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "payment_method_id": "payt_xxxxxxxxxxxxxx",
                  "recipient_emails": [
                    "marcus@shinetime.example"
                  ],
                  "scheduled_charge_at": "scheduled_charge_at",
                  "scheduled_collection_method": "charge_automatically",
                  "scheduled_send_at": "scheduled_send_at",
                  "sends_on_due_date": false,
                  "status": "draft",
                  "subtotal": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "tax_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "totals_status": "estimated",
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Invoice(
            accountId: "biz_xxxxxxxxxxxxxx",
            amountDue: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            buyerFeeAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            buyerFeePercentage: 0,
            checkoutLink: Nullable<String>.value("pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customerName: Nullable<String>.value("Dana"),
            deletable: false,
            dueAt: Nullable<String>.value("due_at"),
            emailAddress: Nullable<String>.value("marcus@shinetime.example"),
            id: "pay_xxxxxxxxxxxxxx",
            invoicePrefix: Nullable<String>.value("invoice_prefix"),
            lineItems: [
                InvoiceLineItem(
                    description: Nullable<String>.value("description"),
                    discountAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    quantity: 1,
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    taxAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    unitAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
                )
            ],
            mailingAddressId: Nullable<String>.value("mailing_address_id"),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            membershipId: Nullable<String>.value("mem_xxxxxxxxxxxxxx"),
            memo: Nullable<String>.value("memo"),
            metadata: [
                "key": "value"
            ],
            number: "#xxxxxxxx",
            object: InvoiceObject.invoice,
            overdue: false,
            paidAt: Nullable<String>.value("paid_at"),
            paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            paymentMethodId: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
            recipientEmails: [
                "marcus@shinetime.example"
            ],
            scheduledChargeAt: Nullable<String>.value("scheduled_charge_at"),
            scheduledCollectionMethod: Nullable<InvoiceScheduledCollectionMethod>.value(InvoiceScheduledCollectionMethod.chargeAutomatically),
            scheduledSendAt: Nullable<String>.value("scheduled_send_at"),
            sendsOnDueDate: false,
            status: InvoiceStatus.draft,
            subtotal: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            taxAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            total: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            totalsStatus: InvoiceTotalsStatus.estimated,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.invoices.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "deleted": true,
                  "id": "pay_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteInvoicesResponse(
            deleted: true,
            id: "pay_xxxxxxxxxxxxxx"
        )
        let response = try await client.invoices.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount_due": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "billing_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "buyer_fee_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "buyer_fee_percentage": 0,
                  "checkout_link": "pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "customer_name": "Dana",
                  "deletable": false,
                  "due_at": "due_at",
                  "email_address": "marcus@shinetime.example",
                  "id": "pay_xxxxxxxxxxxxxx",
                  "invoice_prefix": "invoice_prefix",
                  "line_items": [
                    {
                      "description": "description",
                      "discount_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "quantity": 1,
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "tax_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "unit_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx"
                    }
                  ],
                  "mailing_address_id": "mailing_address_id",
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "membership_id": "mem_xxxxxxxxxxxxxx",
                  "memo": "memo",
                  "metadata": {
                    "key": "value"
                  },
                  "number": "#xxxxxxxx",
                  "object": "invoice",
                  "overdue": false,
                  "paid_at": "paid_at",
                  "payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "payment_method_id": "payt_xxxxxxxxxxxxxx",
                  "recipient_emails": [
                    "marcus@shinetime.example"
                  ],
                  "scheduled_charge_at": "scheduled_charge_at",
                  "scheduled_collection_method": "charge_automatically",
                  "scheduled_send_at": "scheduled_send_at",
                  "sends_on_due_date": false,
                  "status": "draft",
                  "subtotal": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "tax_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "totals_status": "estimated",
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Invoice(
            accountId: "biz_xxxxxxxxxxxxxx",
            amountDue: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            buyerFeeAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            buyerFeePercentage: 0,
            checkoutLink: Nullable<String>.value("pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customerName: Nullable<String>.value("Dana"),
            deletable: false,
            dueAt: Nullable<String>.value("due_at"),
            emailAddress: Nullable<String>.value("marcus@shinetime.example"),
            id: "pay_xxxxxxxxxxxxxx",
            invoicePrefix: Nullable<String>.value("invoice_prefix"),
            lineItems: [
                InvoiceLineItem(
                    description: Nullable<String>.value("description"),
                    discountAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    quantity: 1,
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    taxAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    unitAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
                )
            ],
            mailingAddressId: Nullable<String>.value("mailing_address_id"),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            membershipId: Nullable<String>.value("mem_xxxxxxxxxxxxxx"),
            memo: Nullable<String>.value("memo"),
            metadata: [
                "key": "value"
            ],
            number: "#xxxxxxxx",
            object: InvoiceObject.invoice,
            overdue: false,
            paidAt: Nullable<String>.value("paid_at"),
            paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            paymentMethodId: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
            recipientEmails: [
                "marcus@shinetime.example"
            ],
            scheduledChargeAt: Nullable<String>.value("scheduled_charge_at"),
            scheduledCollectionMethod: Nullable<InvoiceScheduledCollectionMethod>.value(InvoiceScheduledCollectionMethod.chargeAutomatically),
            scheduledSendAt: Nullable<String>.value("scheduled_send_at"),
            sendsOnDueDate: false,
            status: InvoiceStatus.draft,
            subtotal: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            taxAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            total: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            totalsStatus: InvoiceTotalsStatus.estimated,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.invoices.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func charge1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount_due": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "billing_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "buyer_fee_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "buyer_fee_percentage": 0,
                  "checkout_link": "pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "customer_name": "Dana",
                  "deletable": false,
                  "due_at": "due_at",
                  "email_address": "marcus@shinetime.example",
                  "id": "pay_xxxxxxxxxxxxxx",
                  "invoice_prefix": "invoice_prefix",
                  "line_items": [
                    {
                      "description": "description",
                      "discount_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "quantity": 1,
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "tax_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "unit_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx"
                    }
                  ],
                  "mailing_address_id": "mailing_address_id",
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "membership_id": "mem_xxxxxxxxxxxxxx",
                  "memo": "memo",
                  "metadata": {
                    "key": "value"
                  },
                  "number": "#xxxxxxxx",
                  "object": "invoice",
                  "overdue": false,
                  "paid_at": "paid_at",
                  "payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "payment_method_id": "payt_xxxxxxxxxxxxxx",
                  "recipient_emails": [
                    "marcus@shinetime.example"
                  ],
                  "scheduled_charge_at": "scheduled_charge_at",
                  "scheduled_collection_method": "charge_automatically",
                  "scheduled_send_at": "scheduled_send_at",
                  "sends_on_due_date": false,
                  "status": "draft",
                  "subtotal": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "tax_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "totals_status": "estimated",
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Invoice(
            accountId: "biz_xxxxxxxxxxxxxx",
            amountDue: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            buyerFeeAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            buyerFeePercentage: 0,
            checkoutLink: Nullable<String>.value("pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customerName: Nullable<String>.value("Dana"),
            deletable: false,
            dueAt: Nullable<String>.value("due_at"),
            emailAddress: Nullable<String>.value("marcus@shinetime.example"),
            id: "pay_xxxxxxxxxxxxxx",
            invoicePrefix: Nullable<String>.value("invoice_prefix"),
            lineItems: [
                InvoiceLineItem(
                    description: Nullable<String>.value("description"),
                    discountAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    quantity: 1,
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    taxAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    unitAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
                )
            ],
            mailingAddressId: Nullable<String>.value("mailing_address_id"),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            membershipId: Nullable<String>.value("mem_xxxxxxxxxxxxxx"),
            memo: Nullable<String>.value("memo"),
            metadata: [
                "key": "value"
            ],
            number: "#xxxxxxxx",
            object: InvoiceObject.invoice,
            overdue: false,
            paidAt: Nullable<String>.value("paid_at"),
            paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            paymentMethodId: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
            recipientEmails: [
                "marcus@shinetime.example"
            ],
            scheduledChargeAt: Nullable<String>.value("scheduled_charge_at"),
            scheduledCollectionMethod: Nullable<InvoiceScheduledCollectionMethod>.value(InvoiceScheduledCollectionMethod.chargeAutomatically),
            scheduledSendAt: Nullable<String>.value("scheduled_send_at"),
            sendsOnDueDate: false,
            status: InvoiceStatus.draft,
            subtotal: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            taxAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            total: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            totalsStatus: InvoiceTotalsStatus.estimated,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.invoices.charge(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func generatePdf1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "url": "https://content.whop.com/exports/2026-01-01/pdfs/receipt_pay_xxxxxxxxxxxxxx.pdf"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = InvoicePdf(
            expiresAt: "2026-01-01T12:00:00.000Z",
            url: "https://content.whop.com/exports/2026-01-01/pdfs/receipt_pay_xxxxxxxxxxxxxx.pdf"
        )
        let response = try await client.invoices.generatePdf(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func issue1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount_due": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "billing_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "buyer_fee_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "buyer_fee_percentage": 0,
                  "checkout_link": "pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "customer_name": "Dana",
                  "deletable": false,
                  "due_at": "due_at",
                  "email_address": "marcus@shinetime.example",
                  "id": "pay_xxxxxxxxxxxxxx",
                  "invoice_prefix": "invoice_prefix",
                  "line_items": [
                    {
                      "description": "description",
                      "discount_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "quantity": 1,
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "tax_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "unit_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx"
                    }
                  ],
                  "mailing_address_id": "mailing_address_id",
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "membership_id": "mem_xxxxxxxxxxxxxx",
                  "memo": "memo",
                  "metadata": {
                    "key": "value"
                  },
                  "number": "#xxxxxxxx",
                  "object": "invoice",
                  "overdue": false,
                  "paid_at": "paid_at",
                  "payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "payment_method_id": "payt_xxxxxxxxxxxxxx",
                  "recipient_emails": [
                    "marcus@shinetime.example"
                  ],
                  "scheduled_charge_at": "scheduled_charge_at",
                  "scheduled_collection_method": "charge_automatically",
                  "scheduled_send_at": "scheduled_send_at",
                  "sends_on_due_date": false,
                  "status": "draft",
                  "subtotal": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "tax_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "totals_status": "estimated",
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Invoice(
            accountId: "biz_xxxxxxxxxxxxxx",
            amountDue: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            buyerFeeAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            buyerFeePercentage: 0,
            checkoutLink: Nullable<String>.value("pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customerName: Nullable<String>.value("Dana"),
            deletable: false,
            dueAt: Nullable<String>.value("due_at"),
            emailAddress: Nullable<String>.value("marcus@shinetime.example"),
            id: "pay_xxxxxxxxxxxxxx",
            invoicePrefix: Nullable<String>.value("invoice_prefix"),
            lineItems: [
                InvoiceLineItem(
                    description: Nullable<String>.value("description"),
                    discountAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    quantity: 1,
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    taxAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    unitAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
                )
            ],
            mailingAddressId: Nullable<String>.value("mailing_address_id"),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            membershipId: Nullable<String>.value("mem_xxxxxxxxxxxxxx"),
            memo: Nullable<String>.value("memo"),
            metadata: [
                "key": "value"
            ],
            number: "#xxxxxxxx",
            object: InvoiceObject.invoice,
            overdue: false,
            paidAt: Nullable<String>.value("paid_at"),
            paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            paymentMethodId: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
            recipientEmails: [
                "marcus@shinetime.example"
            ],
            scheduledChargeAt: Nullable<String>.value("scheduled_charge_at"),
            scheduledCollectionMethod: Nullable<InvoiceScheduledCollectionMethod>.value(InvoiceScheduledCollectionMethod.chargeAutomatically),
            scheduledSendAt: Nullable<String>.value("scheduled_send_at"),
            sendsOnDueDate: false,
            status: InvoiceStatus.draft,
            subtotal: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            taxAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            total: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            totalsStatus: InvoiceTotalsStatus.estimated,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.invoices.issue(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func markUncollectible1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount_due": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "billing_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "buyer_fee_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "buyer_fee_percentage": 0,
                  "checkout_link": "pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "customer_name": "Dana",
                  "deletable": false,
                  "due_at": "due_at",
                  "email_address": "marcus@shinetime.example",
                  "id": "pay_xxxxxxxxxxxxxx",
                  "invoice_prefix": "invoice_prefix",
                  "line_items": [
                    {
                      "description": "description",
                      "discount_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "quantity": 1,
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "tax_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "unit_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx"
                    }
                  ],
                  "mailing_address_id": "mailing_address_id",
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "membership_id": "mem_xxxxxxxxxxxxxx",
                  "memo": "memo",
                  "metadata": {
                    "key": "value"
                  },
                  "number": "#xxxxxxxx",
                  "object": "invoice",
                  "overdue": false,
                  "paid_at": "paid_at",
                  "payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "payment_method_id": "payt_xxxxxxxxxxxxxx",
                  "recipient_emails": [
                    "marcus@shinetime.example"
                  ],
                  "scheduled_charge_at": "scheduled_charge_at",
                  "scheduled_collection_method": "charge_automatically",
                  "scheduled_send_at": "scheduled_send_at",
                  "sends_on_due_date": false,
                  "status": "draft",
                  "subtotal": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "tax_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "totals_status": "estimated",
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Invoice(
            accountId: "biz_xxxxxxxxxxxxxx",
            amountDue: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            buyerFeeAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            buyerFeePercentage: 0,
            checkoutLink: Nullable<String>.value("pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customerName: Nullable<String>.value("Dana"),
            deletable: false,
            dueAt: Nullable<String>.value("due_at"),
            emailAddress: Nullable<String>.value("marcus@shinetime.example"),
            id: "pay_xxxxxxxxxxxxxx",
            invoicePrefix: Nullable<String>.value("invoice_prefix"),
            lineItems: [
                InvoiceLineItem(
                    description: Nullable<String>.value("description"),
                    discountAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    quantity: 1,
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    taxAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    unitAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
                )
            ],
            mailingAddressId: Nullable<String>.value("mailing_address_id"),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            membershipId: Nullable<String>.value("mem_xxxxxxxxxxxxxx"),
            memo: Nullable<String>.value("memo"),
            metadata: [
                "key": "value"
            ],
            number: "#xxxxxxxx",
            object: InvoiceObject.invoice,
            overdue: false,
            paidAt: Nullable<String>.value("paid_at"),
            paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            paymentMethodId: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
            recipientEmails: [
                "marcus@shinetime.example"
            ],
            scheduledChargeAt: Nullable<String>.value("scheduled_charge_at"),
            scheduledCollectionMethod: Nullable<InvoiceScheduledCollectionMethod>.value(InvoiceScheduledCollectionMethod.chargeAutomatically),
            scheduledSendAt: Nullable<String>.value("scheduled_send_at"),
            sendsOnDueDate: false,
            status: InvoiceStatus.draft,
            subtotal: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            taxAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            total: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            totalsStatus: InvoiceTotalsStatus.estimated,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.invoices.markUncollectible(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func send1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount_due": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "billing_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "buyer_fee_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "buyer_fee_percentage": 0,
                  "checkout_link": "pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "customer_name": "Dana",
                  "deletable": false,
                  "due_at": "due_at",
                  "email_address": "marcus@shinetime.example",
                  "id": "pay_xxxxxxxxxxxxxx",
                  "invoice_prefix": "invoice_prefix",
                  "line_items": [
                    {
                      "description": "description",
                      "discount_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "quantity": 1,
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "tax_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "unit_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx"
                    }
                  ],
                  "mailing_address_id": "mailing_address_id",
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "membership_id": "mem_xxxxxxxxxxxxxx",
                  "memo": "memo",
                  "metadata": {
                    "key": "value"
                  },
                  "number": "#xxxxxxxx",
                  "object": "invoice",
                  "overdue": false,
                  "paid_at": "paid_at",
                  "payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "payment_method_id": "payt_xxxxxxxxxxxxxx",
                  "recipient_emails": [
                    "marcus@shinetime.example"
                  ],
                  "scheduled_charge_at": "scheduled_charge_at",
                  "scheduled_collection_method": "charge_automatically",
                  "scheduled_send_at": "scheduled_send_at",
                  "sends_on_due_date": false,
                  "status": "draft",
                  "subtotal": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "tax_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "totals_status": "estimated",
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Invoice(
            accountId: "biz_xxxxxxxxxxxxxx",
            amountDue: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            buyerFeeAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            buyerFeePercentage: 0,
            checkoutLink: Nullable<String>.value("pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customerName: Nullable<String>.value("Dana"),
            deletable: false,
            dueAt: Nullable<String>.value("due_at"),
            emailAddress: Nullable<String>.value("marcus@shinetime.example"),
            id: "pay_xxxxxxxxxxxxxx",
            invoicePrefix: Nullable<String>.value("invoice_prefix"),
            lineItems: [
                InvoiceLineItem(
                    description: Nullable<String>.value("description"),
                    discountAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    quantity: 1,
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    taxAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    unitAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
                )
            ],
            mailingAddressId: Nullable<String>.value("mailing_address_id"),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            membershipId: Nullable<String>.value("mem_xxxxxxxxxxxxxx"),
            memo: Nullable<String>.value("memo"),
            metadata: [
                "key": "value"
            ],
            number: "#xxxxxxxx",
            object: InvoiceObject.invoice,
            overdue: false,
            paidAt: Nullable<String>.value("paid_at"),
            paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            paymentMethodId: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
            recipientEmails: [
                "marcus@shinetime.example"
            ],
            scheduledChargeAt: Nullable<String>.value("scheduled_charge_at"),
            scheduledCollectionMethod: Nullable<InvoiceScheduledCollectionMethod>.value(InvoiceScheduledCollectionMethod.chargeAutomatically),
            scheduledSendAt: Nullable<String>.value("scheduled_send_at"),
            sendsOnDueDate: false,
            status: InvoiceStatus.draft,
            subtotal: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            taxAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            total: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            totalsStatus: InvoiceTotalsStatus.estimated,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.invoices.send(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func unschedule1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount_due": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "billing_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "buyer_fee_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "buyer_fee_percentage": 0,
                  "checkout_link": "pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "customer_name": "Dana",
                  "deletable": false,
                  "due_at": "due_at",
                  "email_address": "marcus@shinetime.example",
                  "id": "pay_xxxxxxxxxxxxxx",
                  "invoice_prefix": "invoice_prefix",
                  "line_items": [
                    {
                      "description": "description",
                      "discount_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "quantity": 1,
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "tax_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "unit_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx"
                    }
                  ],
                  "mailing_address_id": "mailing_address_id",
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "membership_id": "mem_xxxxxxxxxxxxxx",
                  "memo": "memo",
                  "metadata": {
                    "key": "value"
                  },
                  "number": "#xxxxxxxx",
                  "object": "invoice",
                  "overdue": false,
                  "paid_at": "paid_at",
                  "payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "payment_method_id": "payt_xxxxxxxxxxxxxx",
                  "recipient_emails": [
                    "marcus@shinetime.example"
                  ],
                  "scheduled_charge_at": "scheduled_charge_at",
                  "scheduled_collection_method": "charge_automatically",
                  "scheduled_send_at": "scheduled_send_at",
                  "sends_on_due_date": false,
                  "status": "draft",
                  "subtotal": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "tax_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "totals_status": "estimated",
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Invoice(
            accountId: "biz_xxxxxxxxxxxxxx",
            amountDue: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            buyerFeeAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            buyerFeePercentage: 0,
            checkoutLink: Nullable<String>.value("pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customerName: Nullable<String>.value("Dana"),
            deletable: false,
            dueAt: Nullable<String>.value("due_at"),
            emailAddress: Nullable<String>.value("marcus@shinetime.example"),
            id: "pay_xxxxxxxxxxxxxx",
            invoicePrefix: Nullable<String>.value("invoice_prefix"),
            lineItems: [
                InvoiceLineItem(
                    description: Nullable<String>.value("description"),
                    discountAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    quantity: 1,
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    taxAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    unitAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
                )
            ],
            mailingAddressId: Nullable<String>.value("mailing_address_id"),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            membershipId: Nullable<String>.value("mem_xxxxxxxxxxxxxx"),
            memo: Nullable<String>.value("memo"),
            metadata: [
                "key": "value"
            ],
            number: "#xxxxxxxx",
            object: InvoiceObject.invoice,
            overdue: false,
            paidAt: Nullable<String>.value("paid_at"),
            paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            paymentMethodId: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
            recipientEmails: [
                "marcus@shinetime.example"
            ],
            scheduledChargeAt: Nullable<String>.value("scheduled_charge_at"),
            scheduledCollectionMethod: Nullable<InvoiceScheduledCollectionMethod>.value(InvoiceScheduledCollectionMethod.chargeAutomatically),
            scheduledSendAt: Nullable<String>.value("scheduled_send_at"),
            sendsOnDueDate: false,
            status: InvoiceStatus.draft,
            subtotal: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            taxAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            total: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            totalsStatus: InvoiceTotalsStatus.estimated,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.invoices.unschedule(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func void1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount_due": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "billing_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "buyer_fee_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "buyer_fee_percentage": 0,
                  "checkout_link": "pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "customer_name": "Dana",
                  "deletable": false,
                  "due_at": "due_at",
                  "email_address": "marcus@shinetime.example",
                  "id": "pay_xxxxxxxxxxxxxx",
                  "invoice_prefix": "invoice_prefix",
                  "line_items": [
                    {
                      "description": "description",
                      "discount_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "quantity": 1,
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "tax_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "unit_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx"
                    }
                  ],
                  "mailing_address_id": "mailing_address_id",
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "membership_id": "mem_xxxxxxxxxxxxxx",
                  "memo": "memo",
                  "metadata": {
                    "key": "value"
                  },
                  "number": "#xxxxxxxx",
                  "object": "invoice",
                  "overdue": false,
                  "paid_at": "paid_at",
                  "payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "payment_method_id": "payt_xxxxxxxxxxxxxx",
                  "recipient_emails": [
                    "marcus@shinetime.example"
                  ],
                  "scheduled_charge_at": "scheduled_charge_at",
                  "scheduled_collection_method": "charge_automatically",
                  "scheduled_send_at": "scheduled_send_at",
                  "sends_on_due_date": false,
                  "status": "draft",
                  "subtotal": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "tax_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "totals_status": "estimated",
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Invoice(
            accountId: "biz_xxxxxxxxxxxxxx",
            amountDue: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            buyerFeeAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            buyerFeePercentage: 0,
            checkoutLink: Nullable<String>.value("pay_xxxxxxxxxxxxxx.eyJfcmFpbHMiOnsiZGF0YSI6WzEsZmFsc2VdLCJwdXIiOiJSZWNlaXB0XG5jaGVja291dF9tb3VudFxuIn19--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customerName: Nullable<String>.value("Dana"),
            deletable: false,
            dueAt: Nullable<String>.value("due_at"),
            emailAddress: Nullable<String>.value("marcus@shinetime.example"),
            id: "pay_xxxxxxxxxxxxxx",
            invoicePrefix: Nullable<String>.value("invoice_prefix"),
            lineItems: [
                InvoiceLineItem(
                    description: Nullable<String>.value("description"),
                    discountAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    quantity: 1,
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    taxAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    unitAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
                )
            ],
            mailingAddressId: Nullable<String>.value("mailing_address_id"),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            membershipId: Nullable<String>.value("mem_xxxxxxxxxxxxxx"),
            memo: Nullable<String>.value("memo"),
            metadata: [
                "key": "value"
            ],
            number: "#xxxxxxxx",
            object: InvoiceObject.invoice,
            overdue: false,
            paidAt: Nullable<String>.value("paid_at"),
            paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            paymentMethodId: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
            recipientEmails: [
                "marcus@shinetime.example"
            ],
            scheduledChargeAt: Nullable<String>.value("scheduled_charge_at"),
            scheduledCollectionMethod: Nullable<InvoiceScheduledCollectionMethod>.value(InvoiceScheduledCollectionMethod.chargeAutomatically),
            scheduledSendAt: Nullable<String>.value("scheduled_send_at"),
            sendsOnDueDate: false,
            status: InvoiceStatus.draft,
            subtotal: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            taxAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            total: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            totalsStatus: InvoiceTotalsStatus.estimated,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.invoices.void(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}