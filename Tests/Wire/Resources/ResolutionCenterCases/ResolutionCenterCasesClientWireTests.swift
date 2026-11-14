import Foundation
import Testing
import WhopSDK

@Suite("ResolutionCenterCasesClient Wire Tests") struct ResolutionCenterCasesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "title": "Acme Bookkeeping"
                      },
                      "amount": 249,
                      "available_actions": [
                        "accept"
                      ],
                      "buyer": {
                        "email": "marcus@shinetime.example",
                        "member_id": "mber_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "user_id": "user_xxxxxxxxxxxxxx",
                        "username": "danawhitfield"
                      },
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "currency": "usd",
                      "customer_appealed": false,
                      "escalated": false,
                      "id": "reso_xxxxxxxxxxxxxx",
                      "line_items": [
                        {
                          "id": "li_xxxxxxxxxxxxxx",
                          "label": "Ceramic Coating Package",
                          "product_id": "prod_xxxxxxxxxxxxxx",
                          "product_title": "Ceramic Coating Package",
                          "quantity": 1,
                          "sku": null,
                          "subtotal": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "variant_id": "plan_xxxxxxxxxxxxxx",
                          "variant_title": "Ceramic Coating — Full Vehicle"
                        }
                      ],
                      "outcome": "customer_won",
                      "payment": {
                        "card_brand": "visa",
                        "card_last4": "4242",
                        "created_at": "2026-01-01T12:00:00.000Z",
                        "id": "pay_xxxxxxxxxxxxxx",
                        "payment_method_type": "card"
                      },
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "reason": "fraudulent",
                      "refund": "none",
                      "response_due_at": "2026-01-01T12:00:00.000Z",
                      "status": "awaiting_merchant",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "variant_id": "plan_xxxxxxxxxxxxxx"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "WyJjdXJzb3IiLDFd"
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
        let expectedResponse = ListResolutionCenterCasesResponse(
            data: [
                ResolutionCenterCase(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "biz_xxxxxxxxxxxxxx",
                        title: "Acme Bookkeeping"
                    )),
                    amount: 249,
                    availableActions: [
                        ResolutionCenterCaseAvailableActionsItem.accept
                    ],
                    buyer: ResolutionBuyer(
                        email: Nullable<String>.value("marcus@shinetime.example"),
                        memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                        name: Nullable<String>.value("Dana Whitfield"),
                        userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                        username: Nullable<String>.value("danawhitfield")
                    ),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currency: Nullable<String>.value("usd"),
                    customerAppealed: false,
                    escalated: false,
                    id: "reso_xxxxxxxxxxxxxx",
                    lineItems: [
                        ReceiptLineItem(
                            id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                            label: Nullable<String>.value("Ceramic Coating Package"),
                            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                            productTitle: Nullable<String>.value("Ceramic Coating Package"),
                            quantity: 1,
                            sku: .null,
                            subtotal: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
                            variantTitle: Nullable<String>.value("Ceramic Coating — Full Vehicle")
                        )
                    ],
                    outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
                    payment: ResolutionPayment(
                        cardBrand: Nullable<String>.value("visa"),
                        cardLast4: Nullable<String>.value("4242"),
                        createdAt: "2026-01-01T12:00:00.000Z",
                        id: "pay_xxxxxxxxxxxxxx",
                        paymentMethodType: Nullable<String>.value("card")
                    ),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    reason: ResolutionCenterCaseReason.fraudulent,
                    refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
                    responseDueAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    status: ResolutionCenterCaseStatus.awaitingMerchant,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
                )
            ],
            pageInfo: ListResolutionCenterCasesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.resolutionCenterCases.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account": {
                        "id": "id",
                        "title": "title"
                      },
                      "amount": 1.1,
                      "available_actions": [
                        "accept",
                        "accept"
                      ],
                      "buyer": {
                        "email": "email",
                        "member_id": "member_id",
                        "name": "name",
                        "user_id": "user_id",
                        "username": "username"
                      },
                      "created_at": "created_at",
                      "currency": "currency",
                      "customer_appealed": true,
                      "escalated": true,
                      "id": "id",
                      "line_items": [
                        {
                          "id": "id",
                          "label": "label",
                          "product_id": "product_id",
                          "product_title": "product_title",
                          "quantity": 1.1,
                          "sku": "sku",
                          "subtotal": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "variant_id": "variant_id",
                          "variant_title": "variant_title"
                        },
                        {
                          "id": "id",
                          "label": "label",
                          "product_id": "product_id",
                          "product_title": "product_title",
                          "quantity": 1.1,
                          "sku": "sku",
                          "subtotal": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "variant_id": "variant_id",
                          "variant_title": "variant_title"
                        }
                      ],
                      "outcome": "customer_won",
                      "payment": {
                        "card_brand": "card_brand",
                        "card_last4": "card_last4",
                        "created_at": "created_at",
                        "id": "id",
                        "payment_method_type": "payment_method_type"
                      },
                      "product_id": "product_id",
                      "reason": "fraudulent",
                      "refund": "none",
                      "response_due_at": "response_due_at",
                      "status": "awaiting_merchant",
                      "updated_at": "updated_at",
                      "variant_id": "variant_id"
                    },
                    {
                      "account": {
                        "id": "id",
                        "title": "title"
                      },
                      "amount": 1.1,
                      "available_actions": [
                        "accept",
                        "accept"
                      ],
                      "buyer": {
                        "email": "email",
                        "member_id": "member_id",
                        "name": "name",
                        "user_id": "user_id",
                        "username": "username"
                      },
                      "created_at": "created_at",
                      "currency": "currency",
                      "customer_appealed": true,
                      "escalated": true,
                      "id": "id",
                      "line_items": [
                        {
                          "id": "id",
                          "label": "label",
                          "product_id": "product_id",
                          "product_title": "product_title",
                          "quantity": 1.1,
                          "sku": "sku",
                          "subtotal": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "variant_id": "variant_id",
                          "variant_title": "variant_title"
                        },
                        {
                          "id": "id",
                          "label": "label",
                          "product_id": "product_id",
                          "product_title": "product_title",
                          "quantity": 1.1,
                          "sku": "sku",
                          "subtotal": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "variant_id": "variant_id",
                          "variant_title": "variant_title"
                        }
                      ],
                      "outcome": "customer_won",
                      "payment": {
                        "card_brand": "card_brand",
                        "card_last4": "card_last4",
                        "created_at": "created_at",
                        "id": "id",
                        "payment_method_type": "payment_method_type"
                      },
                      "product_id": "product_id",
                      "reason": "fraudulent",
                      "refund": "none",
                      "response_due_at": "response_due_at",
                      "status": "awaiting_merchant",
                      "updated_at": "updated_at",
                      "variant_id": "variant_id"
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
        let expectedResponse = ListResolutionCenterCasesResponse(
            data: [
                ResolutionCenterCase(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    amount: 1.1,
                    availableActions: [
                        ResolutionCenterCaseAvailableActionsItem.accept,
                        ResolutionCenterCaseAvailableActionsItem.accept
                    ],
                    buyer: ResolutionBuyer(
                        email: Nullable<String>.value("email"),
                        memberId: Nullable<String>.value("member_id"),
                        name: Nullable<String>.value("name"),
                        userId: Nullable<String>.value("user_id"),
                        username: Nullable<String>.value("username")
                    ),
                    createdAt: "created_at",
                    currency: Nullable<String>.value("currency"),
                    customerAppealed: true,
                    escalated: true,
                    id: "id",
                    lineItems: [
                        ReceiptLineItem(
                            id: Nullable<String>.value("id"),
                            label: Nullable<String>.value("label"),
                            productId: Nullable<String>.value("product_id"),
                            productTitle: Nullable<String>.value("product_title"),
                            quantity: 1.1,
                            sku: Nullable<String>.value("sku"),
                            subtotal: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            variantId: Nullable<String>.value("variant_id"),
                            variantTitle: Nullable<String>.value("variant_title")
                        ),
                        ReceiptLineItem(
                            id: Nullable<String>.value("id"),
                            label: Nullable<String>.value("label"),
                            productId: Nullable<String>.value("product_id"),
                            productTitle: Nullable<String>.value("product_title"),
                            quantity: 1.1,
                            sku: Nullable<String>.value("sku"),
                            subtotal: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            variantId: Nullable<String>.value("variant_id"),
                            variantTitle: Nullable<String>.value("variant_title")
                        )
                    ],
                    outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
                    payment: ResolutionPayment(
                        cardBrand: Nullable<String>.value("card_brand"),
                        cardLast4: Nullable<String>.value("card_last4"),
                        createdAt: "created_at",
                        id: "id",
                        paymentMethodType: Nullable<String>.value("payment_method_type")
                    ),
                    productId: Nullable<String>.value("product_id"),
                    reason: ResolutionCenterCaseReason.fraudulent,
                    refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
                    responseDueAt: Nullable<String>.value("response_due_at"),
                    status: ResolutionCenterCaseStatus.awaitingMerchant,
                    updatedAt: "updated_at",
                    variantId: Nullable<String>.value("variant_id")
                ),
                ResolutionCenterCase(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    amount: 1.1,
                    availableActions: [
                        ResolutionCenterCaseAvailableActionsItem.accept,
                        ResolutionCenterCaseAvailableActionsItem.accept
                    ],
                    buyer: ResolutionBuyer(
                        email: Nullable<String>.value("email"),
                        memberId: Nullable<String>.value("member_id"),
                        name: Nullable<String>.value("name"),
                        userId: Nullable<String>.value("user_id"),
                        username: Nullable<String>.value("username")
                    ),
                    createdAt: "created_at",
                    currency: Nullable<String>.value("currency"),
                    customerAppealed: true,
                    escalated: true,
                    id: "id",
                    lineItems: [
                        ReceiptLineItem(
                            id: Nullable<String>.value("id"),
                            label: Nullable<String>.value("label"),
                            productId: Nullable<String>.value("product_id"),
                            productTitle: Nullable<String>.value("product_title"),
                            quantity: 1.1,
                            sku: Nullable<String>.value("sku"),
                            subtotal: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            variantId: Nullable<String>.value("variant_id"),
                            variantTitle: Nullable<String>.value("variant_title")
                        ),
                        ReceiptLineItem(
                            id: Nullable<String>.value("id"),
                            label: Nullable<String>.value("label"),
                            productId: Nullable<String>.value("product_id"),
                            productTitle: Nullable<String>.value("product_title"),
                            quantity: 1.1,
                            sku: Nullable<String>.value("sku"),
                            subtotal: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            variantId: Nullable<String>.value("variant_id"),
                            variantTitle: Nullable<String>.value("variant_title")
                        )
                    ],
                    outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
                    payment: ResolutionPayment(
                        cardBrand: Nullable<String>.value("card_brand"),
                        cardLast4: Nullable<String>.value("card_last4"),
                        createdAt: "created_at",
                        id: "id",
                        paymentMethodType: Nullable<String>.value("payment_method_type")
                    ),
                    productId: Nullable<String>.value("product_id"),
                    reason: ResolutionCenterCaseReason.fraudulent,
                    refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
                    responseDueAt: Nullable<String>.value("response_due_at"),
                    status: ResolutionCenterCaseStatus.awaitingMerchant,
                    updatedAt: "updated_at",
                    variantId: Nullable<String>.value("variant_id")
                )
            ],
            pageInfo: ListResolutionCenterCasesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.resolutionCenterCases.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "amount": 249,
                  "available_actions": [
                    "accept"
                  ],
                  "buyer": {
                    "email": "marcus@shinetime.example",
                    "member_id": "mber_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "user_id": "user_xxxxxxxxxxxxxx",
                    "username": "danawhitfield"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "customer_appealed": false,
                  "escalated": false,
                  "id": "reso_xxxxxxxxxxxxxx",
                  "line_items": [
                    {
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "product_title": "Ceramic Coating Package",
                      "quantity": 1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx",
                      "variant_title": "Ceramic Coating — Full Vehicle"
                    }
                  ],
                  "outcome": "customer_won",
                  "payment": {
                    "card_brand": "visa",
                    "card_last4": "4242",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "id": "pay_xxxxxxxxxxxxxx",
                    "payment_method_type": "card"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "reason": "fraudulent",
                  "refund": "none",
                  "response_due_at": "2026-01-01T12:00:00.000Z",
                  "status": "awaiting_merchant",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ResolutionCenterCase(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            amount: 249,
            availableActions: [
                ResolutionCenterCaseAvailableActionsItem.accept
            ],
            buyer: ResolutionBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: Nullable<String>.value("usd"),
            customerAppealed: false,
            escalated: false,
            id: "reso_xxxxxxxxxxxxxx",
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    productTitle: Nullable<String>.value("Ceramic Coating Package"),
                    quantity: 1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
                    variantTitle: Nullable<String>.value("Ceramic Coating — Full Vehicle")
                )
            ],
            outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
            payment: ResolutionPayment(
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                id: "pay_xxxxxxxxxxxxxx",
                paymentMethodType: Nullable<String>.value("card")
            ),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            reason: ResolutionCenterCaseReason.fraudulent,
            refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
            responseDueAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: ResolutionCenterCaseStatus.awaitingMerchant,
            updatedAt: "2026-01-01T12:00:00.000Z",
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
        )
        let response = try await client.resolutionCenterCases.create(
            request: .init(
                message: "The mobile detailer never showed up for the Ceramic Coating appointment.",
                reason: .fraudulent,
                receiptId: "pay_xxxxxxxxxxxxxx"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "amount": 1.1,
                  "available_actions": [
                    "accept",
                    "accept"
                  ],
                  "buyer": {
                    "email": "email",
                    "member_id": "member_id",
                    "name": "name",
                    "user_id": "user_id",
                    "username": "username"
                  },
                  "created_at": "created_at",
                  "currency": "currency",
                  "customer_appealed": true,
                  "escalated": true,
                  "id": "id",
                  "line_items": [
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    },
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    }
                  ],
                  "outcome": "customer_won",
                  "payment": {
                    "card_brand": "card_brand",
                    "card_last4": "card_last4",
                    "created_at": "created_at",
                    "id": "id",
                    "payment_method_type": "payment_method_type"
                  },
                  "product_id": "product_id",
                  "reason": "fraudulent",
                  "refund": "none",
                  "response_due_at": "response_due_at",
                  "status": "awaiting_merchant",
                  "updated_at": "updated_at",
                  "variant_id": "variant_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ResolutionCenterCase(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            amount: 1.1,
            availableActions: [
                ResolutionCenterCaseAvailableActionsItem.accept,
                ResolutionCenterCaseAvailableActionsItem.accept
            ],
            buyer: ResolutionBuyer(
                email: Nullable<String>.value("email"),
                memberId: Nullable<String>.value("member_id"),
                name: Nullable<String>.value("name"),
                userId: Nullable<String>.value("user_id"),
                username: Nullable<String>.value("username")
            ),
            createdAt: "created_at",
            currency: Nullable<String>.value("currency"),
            customerAppealed: true,
            escalated: true,
            id: "id",
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                ),
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                )
            ],
            outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
            payment: ResolutionPayment(
                cardBrand: Nullable<String>.value("card_brand"),
                cardLast4: Nullable<String>.value("card_last4"),
                createdAt: "created_at",
                id: "id",
                paymentMethodType: Nullable<String>.value("payment_method_type")
            ),
            productId: Nullable<String>.value("product_id"),
            reason: ResolutionCenterCaseReason.fraudulent,
            refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
            responseDueAt: Nullable<String>.value("response_due_at"),
            status: ResolutionCenterCaseStatus.awaitingMerchant,
            updatedAt: "updated_at",
            variantId: Nullable<String>.value("variant_id")
        )
        let response = try await client.resolutionCenterCases.create(
            request: .init(
                message: "message",
                reason: .fraudulent,
                receiptId: "receipt_id"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func summary1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "groups": {
                    "outcome": {
                      "customer_won": 0,
                      "merchant_won": 0,
                      "withdrawn": 0
                    },
                    "reason": {
                      "fraudulent": 0,
                      "not_as_described": 0,
                      "product_not_received": 1,
                      "product_unacceptable": 0,
                      "subscription_canceled": 0
                    },
                    "status": {
                      "awaiting_customer": 0,
                      "awaiting_merchant": 1,
                      "closed": 0,
                      "under_review": 0
                    }
                  },
                  "total": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SummaryResolutionCenterCasesResponse(
            groups: SummaryResolutionCenterCasesResponseGroups(
                outcome: Optional(SummaryResolutionCenterCasesResponseGroupsOutcome(
                    customerWon: 0,
                    merchantWon: 0,
                    withdrawn: 0
                )),
                reason: Optional(SummaryResolutionCenterCasesResponseGroupsReason(
                    fraudulent: 0,
                    notAsDescribed: 0,
                    productNotReceived: 1,
                    productUnacceptable: 0,
                    subscriptionCanceled: 0
                )),
                status: Optional(SummaryResolutionCenterCasesResponseGroupsStatus(
                    awaitingCustomer: 0,
                    awaitingMerchant: 1,
                    closed: 0,
                    underReview: 0
                ))
            ),
            total: 1
        )
        let response = try await client.resolutionCenterCases.summary(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func summary2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "groups": {
                    "outcome": {
                      "customer_won": 1,
                      "merchant_won": 1,
                      "withdrawn": 1
                    },
                    "reason": {
                      "fraudulent": 1,
                      "not_as_described": 1,
                      "product_not_received": 1,
                      "product_unacceptable": 1,
                      "subscription_canceled": 1
                    },
                    "status": {
                      "awaiting_customer": 1,
                      "awaiting_merchant": 1,
                      "closed": 1,
                      "under_review": 1
                    }
                  },
                  "total": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SummaryResolutionCenterCasesResponse(
            groups: SummaryResolutionCenterCasesResponseGroups(
                outcome: Optional(SummaryResolutionCenterCasesResponseGroupsOutcome(
                    customerWon: 1,
                    merchantWon: 1,
                    withdrawn: 1
                )),
                reason: Optional(SummaryResolutionCenterCasesResponseGroupsReason(
                    fraudulent: 1,
                    notAsDescribed: 1,
                    productNotReceived: 1,
                    productUnacceptable: 1,
                    subscriptionCanceled: 1
                )),
                status: Optional(SummaryResolutionCenterCasesResponseGroupsStatus(
                    awaitingCustomer: 1,
                    awaitingMerchant: 1,
                    closed: 1,
                    underReview: 1
                ))
            ),
            total: 1
        )
        let response = try await client.resolutionCenterCases.summary(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "amount": 249,
                  "available_actions": [
                    "accept"
                  ],
                  "buyer": {
                    "email": "marcus@shinetime.example",
                    "member_id": "mber_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "user_id": "user_xxxxxxxxxxxxxx",
                    "username": "danawhitfield"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "customer_appealed": false,
                  "escalated": false,
                  "id": "reso_xxxxxxxxxxxxxx",
                  "line_items": [
                    {
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "product_title": "Ceramic Coating Package",
                      "quantity": 1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx",
                      "variant_title": "Ceramic Coating — Full Vehicle"
                    }
                  ],
                  "outcome": "customer_won",
                  "payment": {
                    "card_brand": "visa",
                    "card_last4": "4242",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "id": "pay_xxxxxxxxxxxxxx",
                    "payment_method_type": "card"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "reason": "fraudulent",
                  "refund": "none",
                  "response_due_at": "2026-01-01T12:00:00.000Z",
                  "status": "awaiting_merchant",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ResolutionCenterCase(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            amount: 249,
            availableActions: [
                ResolutionCenterCaseAvailableActionsItem.accept
            ],
            buyer: ResolutionBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: Nullable<String>.value("usd"),
            customerAppealed: false,
            escalated: false,
            id: "reso_xxxxxxxxxxxxxx",
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    productTitle: Nullable<String>.value("Ceramic Coating Package"),
                    quantity: 1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
                    variantTitle: Nullable<String>.value("Ceramic Coating — Full Vehicle")
                )
            ],
            outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
            payment: ResolutionPayment(
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                id: "pay_xxxxxxxxxxxxxx",
                paymentMethodType: Nullable<String>.value("card")
            ),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            reason: ResolutionCenterCaseReason.fraudulent,
            refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
            responseDueAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: ResolutionCenterCaseStatus.awaitingMerchant,
            updatedAt: "2026-01-01T12:00:00.000Z",
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
        )
        let response = try await client.resolutionCenterCases.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retrieve2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "amount": 1.1,
                  "available_actions": [
                    "accept",
                    "accept"
                  ],
                  "buyer": {
                    "email": "email",
                    "member_id": "member_id",
                    "name": "name",
                    "user_id": "user_id",
                    "username": "username"
                  },
                  "created_at": "created_at",
                  "currency": "currency",
                  "customer_appealed": true,
                  "escalated": true,
                  "id": "id",
                  "line_items": [
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    },
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    }
                  ],
                  "outcome": "customer_won",
                  "payment": {
                    "card_brand": "card_brand",
                    "card_last4": "card_last4",
                    "created_at": "created_at",
                    "id": "id",
                    "payment_method_type": "payment_method_type"
                  },
                  "product_id": "product_id",
                  "reason": "fraudulent",
                  "refund": "none",
                  "response_due_at": "response_due_at",
                  "status": "awaiting_merchant",
                  "updated_at": "updated_at",
                  "variant_id": "variant_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ResolutionCenterCase(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            amount: 1.1,
            availableActions: [
                ResolutionCenterCaseAvailableActionsItem.accept,
                ResolutionCenterCaseAvailableActionsItem.accept
            ],
            buyer: ResolutionBuyer(
                email: Nullable<String>.value("email"),
                memberId: Nullable<String>.value("member_id"),
                name: Nullable<String>.value("name"),
                userId: Nullable<String>.value("user_id"),
                username: Nullable<String>.value("username")
            ),
            createdAt: "created_at",
            currency: Nullable<String>.value("currency"),
            customerAppealed: true,
            escalated: true,
            id: "id",
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                ),
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                )
            ],
            outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
            payment: ResolutionPayment(
                cardBrand: Nullable<String>.value("card_brand"),
                cardLast4: Nullable<String>.value("card_last4"),
                createdAt: "created_at",
                id: "id",
                paymentMethodType: Nullable<String>.value("payment_method_type")
            ),
            productId: Nullable<String>.value("product_id"),
            reason: ResolutionCenterCaseReason.fraudulent,
            refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
            responseDueAt: Nullable<String>.value("response_due_at"),
            status: ResolutionCenterCaseStatus.awaitingMerchant,
            updatedAt: "updated_at",
            variantId: Nullable<String>.value("variant_id")
        )
        let response = try await client.resolutionCenterCases.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func accept1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "amount": 249,
                  "available_actions": [
                    "accept"
                  ],
                  "buyer": {
                    "email": "marcus@shinetime.example",
                    "member_id": "mber_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "user_id": "user_xxxxxxxxxxxxxx",
                    "username": "danawhitfield"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "customer_appealed": false,
                  "escalated": false,
                  "id": "reso_xxxxxxxxxxxxxx",
                  "line_items": [
                    {
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "product_title": "Ceramic Coating Package",
                      "quantity": 1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx",
                      "variant_title": "Ceramic Coating — Full Vehicle"
                    }
                  ],
                  "outcome": "customer_won",
                  "payment": {
                    "card_brand": "visa",
                    "card_last4": "4242",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "id": "pay_xxxxxxxxxxxxxx",
                    "payment_method_type": "card"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "reason": "fraudulent",
                  "refund": "none",
                  "response_due_at": "2026-01-01T12:00:00.000Z",
                  "status": "awaiting_merchant",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ResolutionCenterCase(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            amount: 249,
            availableActions: [
                ResolutionCenterCaseAvailableActionsItem.accept
            ],
            buyer: ResolutionBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: Nullable<String>.value("usd"),
            customerAppealed: false,
            escalated: false,
            id: "reso_xxxxxxxxxxxxxx",
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    productTitle: Nullable<String>.value("Ceramic Coating Package"),
                    quantity: 1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
                    variantTitle: Nullable<String>.value("Ceramic Coating — Full Vehicle")
                )
            ],
            outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
            payment: ResolutionPayment(
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                id: "pay_xxxxxxxxxxxxxx",
                paymentMethodType: Nullable<String>.value("card")
            ),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            reason: ResolutionCenterCaseReason.fraudulent,
            refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
            responseDueAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: ResolutionCenterCaseStatus.awaitingMerchant,
            updatedAt: "2026-01-01T12:00:00.000Z",
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
        )
        let response = try await client.resolutionCenterCases.accept(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func accept2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "amount": 1.1,
                  "available_actions": [
                    "accept",
                    "accept"
                  ],
                  "buyer": {
                    "email": "email",
                    "member_id": "member_id",
                    "name": "name",
                    "user_id": "user_id",
                    "username": "username"
                  },
                  "created_at": "created_at",
                  "currency": "currency",
                  "customer_appealed": true,
                  "escalated": true,
                  "id": "id",
                  "line_items": [
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    },
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    }
                  ],
                  "outcome": "customer_won",
                  "payment": {
                    "card_brand": "card_brand",
                    "card_last4": "card_last4",
                    "created_at": "created_at",
                    "id": "id",
                    "payment_method_type": "payment_method_type"
                  },
                  "product_id": "product_id",
                  "reason": "fraudulent",
                  "refund": "none",
                  "response_due_at": "response_due_at",
                  "status": "awaiting_merchant",
                  "updated_at": "updated_at",
                  "variant_id": "variant_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ResolutionCenterCase(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            amount: 1.1,
            availableActions: [
                ResolutionCenterCaseAvailableActionsItem.accept,
                ResolutionCenterCaseAvailableActionsItem.accept
            ],
            buyer: ResolutionBuyer(
                email: Nullable<String>.value("email"),
                memberId: Nullable<String>.value("member_id"),
                name: Nullable<String>.value("name"),
                userId: Nullable<String>.value("user_id"),
                username: Nullable<String>.value("username")
            ),
            createdAt: "created_at",
            currency: Nullable<String>.value("currency"),
            customerAppealed: true,
            escalated: true,
            id: "id",
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                ),
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                )
            ],
            outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
            payment: ResolutionPayment(
                cardBrand: Nullable<String>.value("card_brand"),
                cardLast4: Nullable<String>.value("card_last4"),
                createdAt: "created_at",
                id: "id",
                paymentMethodType: Nullable<String>.value("payment_method_type")
            ),
            productId: Nullable<String>.value("product_id"),
            reason: ResolutionCenterCaseReason.fraudulent,
            refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
            responseDueAt: Nullable<String>.value("response_due_at"),
            status: ResolutionCenterCaseStatus.awaitingMerchant,
            updatedAt: "updated_at",
            variantId: Nullable<String>.value("variant_id")
        )
        let response = try await client.resolutionCenterCases.accept(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func appeal1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "amount": 249,
                  "available_actions": [
                    "accept"
                  ],
                  "buyer": {
                    "email": "marcus@shinetime.example",
                    "member_id": "mber_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "user_id": "user_xxxxxxxxxxxxxx",
                    "username": "danawhitfield"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "customer_appealed": false,
                  "escalated": false,
                  "id": "reso_xxxxxxxxxxxxxx",
                  "line_items": [
                    {
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "product_title": "Ceramic Coating Package",
                      "quantity": 1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx",
                      "variant_title": "Ceramic Coating — Full Vehicle"
                    }
                  ],
                  "outcome": "customer_won",
                  "payment": {
                    "card_brand": "visa",
                    "card_last4": "4242",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "id": "pay_xxxxxxxxxxxxxx",
                    "payment_method_type": "card"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "reason": "fraudulent",
                  "refund": "none",
                  "response_due_at": "2026-01-01T12:00:00.000Z",
                  "status": "awaiting_merchant",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ResolutionCenterCase(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            amount: 249,
            availableActions: [
                ResolutionCenterCaseAvailableActionsItem.accept
            ],
            buyer: ResolutionBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: Nullable<String>.value("usd"),
            customerAppealed: false,
            escalated: false,
            id: "reso_xxxxxxxxxxxxxx",
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    productTitle: Nullable<String>.value("Ceramic Coating Package"),
                    quantity: 1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
                    variantTitle: Nullable<String>.value("Ceramic Coating — Full Vehicle")
                )
            ],
            outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
            payment: ResolutionPayment(
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                id: "pay_xxxxxxxxxxxxxx",
                paymentMethodType: Nullable<String>.value("card")
            ),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            reason: ResolutionCenterCaseReason.fraudulent,
            refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
            responseDueAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: ResolutionCenterCaseStatus.awaitingMerchant,
            updatedAt: "2026-01-01T12:00:00.000Z",
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
        )
        let response = try await client.resolutionCenterCases.appeal(
            id: "id",
            request: .init(message: "The coating is already flaking on the hood two weeks later."),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func appeal2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "amount": 1.1,
                  "available_actions": [
                    "accept",
                    "accept"
                  ],
                  "buyer": {
                    "email": "email",
                    "member_id": "member_id",
                    "name": "name",
                    "user_id": "user_id",
                    "username": "username"
                  },
                  "created_at": "created_at",
                  "currency": "currency",
                  "customer_appealed": true,
                  "escalated": true,
                  "id": "id",
                  "line_items": [
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    },
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    }
                  ],
                  "outcome": "customer_won",
                  "payment": {
                    "card_brand": "card_brand",
                    "card_last4": "card_last4",
                    "created_at": "created_at",
                    "id": "id",
                    "payment_method_type": "payment_method_type"
                  },
                  "product_id": "product_id",
                  "reason": "fraudulent",
                  "refund": "none",
                  "response_due_at": "response_due_at",
                  "status": "awaiting_merchant",
                  "updated_at": "updated_at",
                  "variant_id": "variant_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ResolutionCenterCase(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            amount: 1.1,
            availableActions: [
                ResolutionCenterCaseAvailableActionsItem.accept,
                ResolutionCenterCaseAvailableActionsItem.accept
            ],
            buyer: ResolutionBuyer(
                email: Nullable<String>.value("email"),
                memberId: Nullable<String>.value("member_id"),
                name: Nullable<String>.value("name"),
                userId: Nullable<String>.value("user_id"),
                username: Nullable<String>.value("username")
            ),
            createdAt: "created_at",
            currency: Nullable<String>.value("currency"),
            customerAppealed: true,
            escalated: true,
            id: "id",
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                ),
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                )
            ],
            outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
            payment: ResolutionPayment(
                cardBrand: Nullable<String>.value("card_brand"),
                cardLast4: Nullable<String>.value("card_last4"),
                createdAt: "created_at",
                id: "id",
                paymentMethodType: Nullable<String>.value("payment_method_type")
            ),
            productId: Nullable<String>.value("product_id"),
            reason: ResolutionCenterCaseReason.fraudulent,
            refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
            responseDueAt: Nullable<String>.value("response_due_at"),
            status: ResolutionCenterCaseStatus.awaitingMerchant,
            updatedAt: "updated_at",
            variantId: Nullable<String>.value("variant_id")
        )
        let response = try await client.resolutionCenterCases.appeal(
            id: "id",
            request: .init(message: "message"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func deny1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "amount": 249,
                  "available_actions": [
                    "accept"
                  ],
                  "buyer": {
                    "email": "marcus@shinetime.example",
                    "member_id": "mber_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "user_id": "user_xxxxxxxxxxxxxx",
                    "username": "danawhitfield"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "customer_appealed": false,
                  "escalated": false,
                  "id": "reso_xxxxxxxxxxxxxx",
                  "line_items": [
                    {
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "product_title": "Ceramic Coating Package",
                      "quantity": 1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx",
                      "variant_title": "Ceramic Coating — Full Vehicle"
                    }
                  ],
                  "outcome": "customer_won",
                  "payment": {
                    "card_brand": "visa",
                    "card_last4": "4242",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "id": "pay_xxxxxxxxxxxxxx",
                    "payment_method_type": "card"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "reason": "fraudulent",
                  "refund": "none",
                  "response_due_at": "2026-01-01T12:00:00.000Z",
                  "status": "awaiting_merchant",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ResolutionCenterCase(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            amount: 249,
            availableActions: [
                ResolutionCenterCaseAvailableActionsItem.accept
            ],
            buyer: ResolutionBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: Nullable<String>.value("usd"),
            customerAppealed: false,
            escalated: false,
            id: "reso_xxxxxxxxxxxxxx",
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    productTitle: Nullable<String>.value("Ceramic Coating Package"),
                    quantity: 1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
                    variantTitle: Nullable<String>.value("Ceramic Coating — Full Vehicle")
                )
            ],
            outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
            payment: ResolutionPayment(
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                id: "pay_xxxxxxxxxxxxxx",
                paymentMethodType: Nullable<String>.value("card")
            ),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            reason: ResolutionCenterCaseReason.fraudulent,
            refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
            responseDueAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: ResolutionCenterCaseStatus.awaitingMerchant,
            updatedAt: "2026-01-01T12:00:00.000Z",
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
        )
        let response = try await client.resolutionCenterCases.deny(
            id: "id",
            request: .init(message: "The ceramic coating was applied and the vehicle was collected on 2026-01-05."),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func deny2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "amount": 1.1,
                  "available_actions": [
                    "accept",
                    "accept"
                  ],
                  "buyer": {
                    "email": "email",
                    "member_id": "member_id",
                    "name": "name",
                    "user_id": "user_id",
                    "username": "username"
                  },
                  "created_at": "created_at",
                  "currency": "currency",
                  "customer_appealed": true,
                  "escalated": true,
                  "id": "id",
                  "line_items": [
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    },
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    }
                  ],
                  "outcome": "customer_won",
                  "payment": {
                    "card_brand": "card_brand",
                    "card_last4": "card_last4",
                    "created_at": "created_at",
                    "id": "id",
                    "payment_method_type": "payment_method_type"
                  },
                  "product_id": "product_id",
                  "reason": "fraudulent",
                  "refund": "none",
                  "response_due_at": "response_due_at",
                  "status": "awaiting_merchant",
                  "updated_at": "updated_at",
                  "variant_id": "variant_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ResolutionCenterCase(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            amount: 1.1,
            availableActions: [
                ResolutionCenterCaseAvailableActionsItem.accept,
                ResolutionCenterCaseAvailableActionsItem.accept
            ],
            buyer: ResolutionBuyer(
                email: Nullable<String>.value("email"),
                memberId: Nullable<String>.value("member_id"),
                name: Nullable<String>.value("name"),
                userId: Nullable<String>.value("user_id"),
                username: Nullable<String>.value("username")
            ),
            createdAt: "created_at",
            currency: Nullable<String>.value("currency"),
            customerAppealed: true,
            escalated: true,
            id: "id",
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                ),
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                )
            ],
            outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
            payment: ResolutionPayment(
                cardBrand: Nullable<String>.value("card_brand"),
                cardLast4: Nullable<String>.value("card_last4"),
                createdAt: "created_at",
                id: "id",
                paymentMethodType: Nullable<String>.value("payment_method_type")
            ),
            productId: Nullable<String>.value("product_id"),
            reason: ResolutionCenterCaseReason.fraudulent,
            refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
            responseDueAt: Nullable<String>.value("response_due_at"),
            status: ResolutionCenterCaseStatus.awaitingMerchant,
            updatedAt: "updated_at",
            variantId: Nullable<String>.value("variant_id")
        )
        let response = try await client.resolutionCenterCases.deny(
            id: "id",
            request: .init(message: "message"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func events1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "action": "created",
                      "attachments": [
                        {
                          "content_type": "image/png",
                          "filename": "booking-confirmation.png",
                          "id": "file_xxxxxxxxxxxxxx",
                          "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                        }
                      ],
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "details": "Booked the Ceramic Coating Package for 2026-01-05; nobody arrived.",
                      "id": "revt_xxxxxxxxxxxxxx",
                      "reporter_type": "merchant",
                      "viewable_by_customer": true,
                      "viewable_by_merchant": true
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "WyJjdXJzb3IiLDFd"
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
        let expectedResponse = EventsResolutionCenterCasesResponse(
            data: [
                ResolutionEvent(
                    action: ResolutionEventAction.created,
                    attachments: [
                        ResolutionAttachment(
                            contentType: Nullable<String>.value("image/png"),
                            filename: Nullable<String>.value("booking-confirmation.png"),
                            id: "file_xxxxxxxxxxxxxx",
                            url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                        )
                    ],
                    createdAt: "2026-01-01T12:00:00.000Z",
                    details: Nullable<String>.value("Booked the Ceramic Coating Package for 2026-01-05; nobody arrived."),
                    id: "revt_xxxxxxxxxxxxxx",
                    reporterType: ResolutionEventReporterType.merchant,
                    viewableByCustomer: true,
                    viewableByMerchant: true
                )
            ],
            pageInfo: EventsResolutionCenterCasesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.resolutionCenterCases.events(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func events2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "action": "created",
                      "attachments": [
                        {
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "url": "url"
                        },
                        {
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "url": "url"
                        }
                      ],
                      "created_at": "created_at",
                      "details": "details",
                      "id": "id",
                      "reporter_type": "merchant",
                      "viewable_by_customer": true,
                      "viewable_by_merchant": true
                    },
                    {
                      "action": "created",
                      "attachments": [
                        {
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "url": "url"
                        },
                        {
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "url": "url"
                        }
                      ],
                      "created_at": "created_at",
                      "details": "details",
                      "id": "id",
                      "reporter_type": "merchant",
                      "viewable_by_customer": true,
                      "viewable_by_merchant": true
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
        let expectedResponse = EventsResolutionCenterCasesResponse(
            data: [
                ResolutionEvent(
                    action: ResolutionEventAction.created,
                    attachments: [
                        ResolutionAttachment(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        ),
                        ResolutionAttachment(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        )
                    ],
                    createdAt: "created_at",
                    details: Nullable<String>.value("details"),
                    id: "id",
                    reporterType: ResolutionEventReporterType.merchant,
                    viewableByCustomer: true,
                    viewableByMerchant: true
                ),
                ResolutionEvent(
                    action: ResolutionEventAction.created,
                    attachments: [
                        ResolutionAttachment(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        ),
                        ResolutionAttachment(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        )
                    ],
                    createdAt: "created_at",
                    details: Nullable<String>.value("details"),
                    id: "id",
                    reporterType: ResolutionEventReporterType.merchant,
                    viewableByCustomer: true,
                    viewableByMerchant: true
                )
            ],
            pageInfo: EventsResolutionCenterCasesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.resolutionCenterCases.events(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func reply1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "amount": 249,
                  "available_actions": [
                    "accept"
                  ],
                  "buyer": {
                    "email": "marcus@shinetime.example",
                    "member_id": "mber_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "user_id": "user_xxxxxxxxxxxxxx",
                    "username": "danawhitfield"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "customer_appealed": false,
                  "escalated": false,
                  "id": "reso_xxxxxxxxxxxxxx",
                  "line_items": [
                    {
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "product_title": "Ceramic Coating Package",
                      "quantity": 1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx",
                      "variant_title": "Ceramic Coating — Full Vehicle"
                    }
                  ],
                  "outcome": "customer_won",
                  "payment": {
                    "card_brand": "visa",
                    "card_last4": "4242",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "id": "pay_xxxxxxxxxxxxxx",
                    "payment_method_type": "card"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "reason": "fraudulent",
                  "refund": "none",
                  "response_due_at": "2026-01-01T12:00:00.000Z",
                  "status": "awaiting_merchant",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ResolutionCenterCase(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            amount: 249,
            availableActions: [
                ResolutionCenterCaseAvailableActionsItem.accept
            ],
            buyer: ResolutionBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: Nullable<String>.value("usd"),
            customerAppealed: false,
            escalated: false,
            id: "reso_xxxxxxxxxxxxxx",
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    productTitle: Nullable<String>.value("Ceramic Coating Package"),
                    quantity: 1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
                    variantTitle: Nullable<String>.value("Ceramic Coating — Full Vehicle")
                )
            ],
            outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
            payment: ResolutionPayment(
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                id: "pay_xxxxxxxxxxxxxx",
                paymentMethodType: Nullable<String>.value("card")
            ),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            reason: ResolutionCenterCaseReason.fraudulent,
            refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
            responseDueAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: ResolutionCenterCaseStatus.awaitingMerchant,
            updatedAt: "2026-01-01T12:00:00.000Z",
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
        )
        let response = try await client.resolutionCenterCases.reply(
            id: "id",
            request: .init(message: "Here are the before and after photos from the Burnet Rd bay."),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func reply2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "amount": 1.1,
                  "available_actions": [
                    "accept",
                    "accept"
                  ],
                  "buyer": {
                    "email": "email",
                    "member_id": "member_id",
                    "name": "name",
                    "user_id": "user_id",
                    "username": "username"
                  },
                  "created_at": "created_at",
                  "currency": "currency",
                  "customer_appealed": true,
                  "escalated": true,
                  "id": "id",
                  "line_items": [
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    },
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    }
                  ],
                  "outcome": "customer_won",
                  "payment": {
                    "card_brand": "card_brand",
                    "card_last4": "card_last4",
                    "created_at": "created_at",
                    "id": "id",
                    "payment_method_type": "payment_method_type"
                  },
                  "product_id": "product_id",
                  "reason": "fraudulent",
                  "refund": "none",
                  "response_due_at": "response_due_at",
                  "status": "awaiting_merchant",
                  "updated_at": "updated_at",
                  "variant_id": "variant_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ResolutionCenterCase(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            amount: 1.1,
            availableActions: [
                ResolutionCenterCaseAvailableActionsItem.accept,
                ResolutionCenterCaseAvailableActionsItem.accept
            ],
            buyer: ResolutionBuyer(
                email: Nullable<String>.value("email"),
                memberId: Nullable<String>.value("member_id"),
                name: Nullable<String>.value("name"),
                userId: Nullable<String>.value("user_id"),
                username: Nullable<String>.value("username")
            ),
            createdAt: "created_at",
            currency: Nullable<String>.value("currency"),
            customerAppealed: true,
            escalated: true,
            id: "id",
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                ),
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                )
            ],
            outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
            payment: ResolutionPayment(
                cardBrand: Nullable<String>.value("card_brand"),
                cardLast4: Nullable<String>.value("card_last4"),
                createdAt: "created_at",
                id: "id",
                paymentMethodType: Nullable<String>.value("payment_method_type")
            ),
            productId: Nullable<String>.value("product_id"),
            reason: ResolutionCenterCaseReason.fraudulent,
            refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
            responseDueAt: Nullable<String>.value("response_due_at"),
            status: ResolutionCenterCaseStatus.awaitingMerchant,
            updatedAt: "updated_at",
            variantId: Nullable<String>.value("variant_id")
        )
        let response = try await client.resolutionCenterCases.reply(
            id: "id",
            request: .init(message: "message"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func requestInfo1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "amount": 249,
                  "available_actions": [
                    "accept"
                  ],
                  "buyer": {
                    "email": "marcus@shinetime.example",
                    "member_id": "mber_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "user_id": "user_xxxxxxxxxxxxxx",
                    "username": "danawhitfield"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "customer_appealed": false,
                  "escalated": false,
                  "id": "reso_xxxxxxxxxxxxxx",
                  "line_items": [
                    {
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "product_title": "Ceramic Coating Package",
                      "quantity": 1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx",
                      "variant_title": "Ceramic Coating — Full Vehicle"
                    }
                  ],
                  "outcome": "customer_won",
                  "payment": {
                    "card_brand": "visa",
                    "card_last4": "4242",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "id": "pay_xxxxxxxxxxxxxx",
                    "payment_method_type": "card"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "reason": "fraudulent",
                  "refund": "none",
                  "response_due_at": "2026-01-01T12:00:00.000Z",
                  "status": "awaiting_merchant",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ResolutionCenterCase(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            amount: 249,
            availableActions: [
                ResolutionCenterCaseAvailableActionsItem.accept
            ],
            buyer: ResolutionBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: Nullable<String>.value("usd"),
            customerAppealed: false,
            escalated: false,
            id: "reso_xxxxxxxxxxxxxx",
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    productTitle: Nullable<String>.value("Ceramic Coating Package"),
                    quantity: 1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
                    variantTitle: Nullable<String>.value("Ceramic Coating — Full Vehicle")
                )
            ],
            outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
            payment: ResolutionPayment(
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                id: "pay_xxxxxxxxxxxxxx",
                paymentMethodType: Nullable<String>.value("card")
            ),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            reason: ResolutionCenterCaseReason.fraudulent,
            refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
            responseDueAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: ResolutionCenterCaseStatus.awaitingMerchant,
            updatedAt: "2026-01-01T12:00:00.000Z",
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
        )
        let response = try await client.resolutionCenterCases.requestInfo(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func requestInfo2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "amount": 1.1,
                  "available_actions": [
                    "accept",
                    "accept"
                  ],
                  "buyer": {
                    "email": "email",
                    "member_id": "member_id",
                    "name": "name",
                    "user_id": "user_id",
                    "username": "username"
                  },
                  "created_at": "created_at",
                  "currency": "currency",
                  "customer_appealed": true,
                  "escalated": true,
                  "id": "id",
                  "line_items": [
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    },
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    }
                  ],
                  "outcome": "customer_won",
                  "payment": {
                    "card_brand": "card_brand",
                    "card_last4": "card_last4",
                    "created_at": "created_at",
                    "id": "id",
                    "payment_method_type": "payment_method_type"
                  },
                  "product_id": "product_id",
                  "reason": "fraudulent",
                  "refund": "none",
                  "response_due_at": "response_due_at",
                  "status": "awaiting_merchant",
                  "updated_at": "updated_at",
                  "variant_id": "variant_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ResolutionCenterCase(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            amount: 1.1,
            availableActions: [
                ResolutionCenterCaseAvailableActionsItem.accept,
                ResolutionCenterCaseAvailableActionsItem.accept
            ],
            buyer: ResolutionBuyer(
                email: Nullable<String>.value("email"),
                memberId: Nullable<String>.value("member_id"),
                name: Nullable<String>.value("name"),
                userId: Nullable<String>.value("user_id"),
                username: Nullable<String>.value("username")
            ),
            createdAt: "created_at",
            currency: Nullable<String>.value("currency"),
            customerAppealed: true,
            escalated: true,
            id: "id",
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                ),
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                )
            ],
            outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
            payment: ResolutionPayment(
                cardBrand: Nullable<String>.value("card_brand"),
                cardLast4: Nullable<String>.value("card_last4"),
                createdAt: "created_at",
                id: "id",
                paymentMethodType: Nullable<String>.value("payment_method_type")
            ),
            productId: Nullable<String>.value("product_id"),
            reason: ResolutionCenterCaseReason.fraudulent,
            refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
            responseDueAt: Nullable<String>.value("response_due_at"),
            status: ResolutionCenterCaseStatus.awaitingMerchant,
            updatedAt: "updated_at",
            variantId: Nullable<String>.value("variant_id")
        )
        let response = try await client.resolutionCenterCases.requestInfo(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func withdraw1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "amount": 249,
                  "available_actions": [
                    "accept"
                  ],
                  "buyer": {
                    "email": "marcus@shinetime.example",
                    "member_id": "mber_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "user_id": "user_xxxxxxxxxxxxxx",
                    "username": "danawhitfield"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "customer_appealed": false,
                  "escalated": false,
                  "id": "reso_xxxxxxxxxxxxxx",
                  "line_items": [
                    {
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "product_title": "Ceramic Coating Package",
                      "quantity": 1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx",
                      "variant_title": "Ceramic Coating — Full Vehicle"
                    }
                  ],
                  "outcome": "customer_won",
                  "payment": {
                    "card_brand": "visa",
                    "card_last4": "4242",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "id": "pay_xxxxxxxxxxxxxx",
                    "payment_method_type": "card"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "reason": "fraudulent",
                  "refund": "none",
                  "response_due_at": "2026-01-01T12:00:00.000Z",
                  "status": "awaiting_merchant",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ResolutionCenterCase(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            amount: 249,
            availableActions: [
                ResolutionCenterCaseAvailableActionsItem.accept
            ],
            buyer: ResolutionBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: Nullable<String>.value("usd"),
            customerAppealed: false,
            escalated: false,
            id: "reso_xxxxxxxxxxxxxx",
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    productTitle: Nullable<String>.value("Ceramic Coating Package"),
                    quantity: 1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
                    variantTitle: Nullable<String>.value("Ceramic Coating — Full Vehicle")
                )
            ],
            outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
            payment: ResolutionPayment(
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                id: "pay_xxxxxxxxxxxxxx",
                paymentMethodType: Nullable<String>.value("card")
            ),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            reason: ResolutionCenterCaseReason.fraudulent,
            refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
            responseDueAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: ResolutionCenterCaseStatus.awaitingMerchant,
            updatedAt: "2026-01-01T12:00:00.000Z",
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
        )
        let response = try await client.resolutionCenterCases.withdraw(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func withdraw2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "amount": 1.1,
                  "available_actions": [
                    "accept",
                    "accept"
                  ],
                  "buyer": {
                    "email": "email",
                    "member_id": "member_id",
                    "name": "name",
                    "user_id": "user_id",
                    "username": "username"
                  },
                  "created_at": "created_at",
                  "currency": "currency",
                  "customer_appealed": true,
                  "escalated": true,
                  "id": "id",
                  "line_items": [
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    },
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    }
                  ],
                  "outcome": "customer_won",
                  "payment": {
                    "card_brand": "card_brand",
                    "card_last4": "card_last4",
                    "created_at": "created_at",
                    "id": "id",
                    "payment_method_type": "payment_method_type"
                  },
                  "product_id": "product_id",
                  "reason": "fraudulent",
                  "refund": "none",
                  "response_due_at": "response_due_at",
                  "status": "awaiting_merchant",
                  "updated_at": "updated_at",
                  "variant_id": "variant_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ResolutionCenterCase(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            amount: 1.1,
            availableActions: [
                ResolutionCenterCaseAvailableActionsItem.accept,
                ResolutionCenterCaseAvailableActionsItem.accept
            ],
            buyer: ResolutionBuyer(
                email: Nullable<String>.value("email"),
                memberId: Nullable<String>.value("member_id"),
                name: Nullable<String>.value("name"),
                userId: Nullable<String>.value("user_id"),
                username: Nullable<String>.value("username")
            ),
            createdAt: "created_at",
            currency: Nullable<String>.value("currency"),
            customerAppealed: true,
            escalated: true,
            id: "id",
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                ),
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                )
            ],
            outcome: Nullable<ResolutionCenterCaseOutcome>.value(ResolutionCenterCaseOutcome.customerWon),
            payment: ResolutionPayment(
                cardBrand: Nullable<String>.value("card_brand"),
                cardLast4: Nullable<String>.value("card_last4"),
                createdAt: "created_at",
                id: "id",
                paymentMethodType: Nullable<String>.value("payment_method_type")
            ),
            productId: Nullable<String>.value("product_id"),
            reason: ResolutionCenterCaseReason.fraudulent,
            refund: Nullable<ResolutionCenterCaseRefund>.value(ResolutionCenterCaseRefund.none),
            responseDueAt: Nullable<String>.value("response_due_at"),
            status: ResolutionCenterCaseStatus.awaitingMerchant,
            updatedAt: "updated_at",
            variantId: Nullable<String>.value("variant_id")
        )
        let response = try await client.resolutionCenterCases.withdraw(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}