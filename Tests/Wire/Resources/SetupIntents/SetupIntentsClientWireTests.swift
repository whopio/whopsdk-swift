import Foundation
import Testing
import WhopSDK

@Suite("SetupIntentsClient Wire Tests") struct SetupIntentsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "checkout_configuration": {
                        "id": "ch_xxxxxxxxxxxxxxx"
                      },
                      "company": {
                        "id": "biz_xxxxxxxxxxxxxx"
                      },
                      "created_at": "2023-12-01T05:00:00Z",
                      "error_message": "Your card was declined.",
                      "id": "sint_xxxxxxxxxxxxx",
                      "member": {
                        "id": "id",
                        "user": null
                      },
                      "metadata": {
                        "key": "value"
                      },
                      "payment_method": {
                        "card": {
                          "brand": null,
                          "exp_month": 42,
                          "exp_year": 42,
                          "last4": "4242"
                        },
                        "created_at": "2023-12-01T05:00:00Z",
                        "id": "payt_xxxxxxxxxxxxx",
                        "mailing_address": null,
                        "payment_method_type": "acss_debit"
                      },
                      "status": "processing"
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
        let expectedResponse = ListSetupIntentsResponse(
            data: [
                SetupIntentListItem(
                    checkoutConfiguration: Nullable<SetupIntentListItemCheckoutConfiguration>.value(SetupIntentListItemCheckoutConfiguration(
                        id: "ch_xxxxxxxxxxxxxxx"
                    )),
                    company: Nullable<SetupIntentListItemCompany>.value(SetupIntentListItemCompany(
                        id: "biz_xxxxxxxxxxxxxx"
                    )),
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    errorMessage: Nullable<String>.value("Your card was declined."),
                    id: "sint_xxxxxxxxxxxxx",
                    member: Nullable<SetupIntentListItemMember>.value(SetupIntentListItemMember(
                        id: "id",
                        user: .null
                    )),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    paymentMethod: Nullable<SetupIntentListItemPaymentMethod>.value(SetupIntentListItemPaymentMethod(
                        card: Nullable<SetupIntentListItemPaymentMethodCard>.value(SetupIntentListItemPaymentMethodCard(
                            brand: .null,
                            expMonth: Nullable<Int>.value(42),
                            expYear: Nullable<Int>.value(42),
                            last4: Nullable<String>.value("4242")
                        )),
                        createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                        id: "payt_xxxxxxxxxxxxx",
                        mailingAddress: .null,
                        paymentMethodType: PaymentMethodTypes.acssDebit
                    )),
                    status: SetupIntentStatuses.processing
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.setupIntents.list(
            first: 42,
            last: 42,
            companyId: "biz_xxxxxxxxxxxxxx",
            createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "checkout_configuration": {
                    "id": "ch_xxxxxxxxxxxxxxx"
                  },
                  "client_secret": "sint_xxxxxxxxxxxxxx_secret_v1_xxxx",
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "error_message": "Your card was declined.",
                  "id": "sint_xxxxxxxxxxxxx",
                  "member": {
                    "id": "id",
                    "user": {
                      "email": "email",
                      "id": "id",
                      "name": "name",
                      "username": "username"
                    }
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "payment_method": {
                    "card": {
                      "brand": "mastercard",
                      "exp_month": 42,
                      "exp_year": 42,
                      "last4": "4242"
                    },
                    "created_at": "2023-12-01T05:00:00Z",
                    "id": "payt_xxxxxxxxxxxxx",
                    "mailing_address": {
                      "city": "city",
                      "country": "country",
                      "line1": "line1",
                      "line2": "line2",
                      "name": "name",
                      "postal_code": "postal_code",
                      "state": "state"
                    },
                    "payment_method_type": "acss_debit"
                  },
                  "status": "processing",
                  "three_ds_verified": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateSetupIntentsResponse(
            checkoutConfiguration: Nullable<CreateSetupIntentsResponseCheckoutConfiguration>.value(CreateSetupIntentsResponseCheckoutConfiguration(
                id: "ch_xxxxxxxxxxxxxxx"
            )),
            clientSecret: Nullable<String>.value("sint_xxxxxxxxxxxxxx_secret_v1_xxxx"),
            company: Nullable<CreateSetupIntentsResponseCompany>.value(CreateSetupIntentsResponseCompany(
                id: "biz_xxxxxxxxxxxxxx"
            )),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            errorMessage: Nullable<String>.value("Your card was declined."),
            id: "sint_xxxxxxxxxxxxx",
            member: Nullable<CreateSetupIntentsResponseMember>.value(CreateSetupIntentsResponseMember(
                id: "id",
                user: Nullable<CreateSetupIntentsResponseMemberUser>.value(CreateSetupIntentsResponseMemberUser(
                    email: Nullable<String>.value("email"),
                    id: "id",
                    name: Nullable<String>.value("name"),
                    username: "username"
                ))
            )),
            metadata: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            paymentMethod: Nullable<CreateSetupIntentsResponsePaymentMethod>.value(CreateSetupIntentsResponsePaymentMethod(
                card: Nullable<CreateSetupIntentsResponsePaymentMethodCard>.value(CreateSetupIntentsResponsePaymentMethodCard(
                    brand: Nullable<CardBrands>.value(CardBrands.mastercard),
                    expMonth: Nullable<Int>.value(42),
                    expYear: Nullable<Int>.value(42),
                    last4: Nullable<String>.value("4242")
                )),
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                id: "payt_xxxxxxxxxxxxx",
                mailingAddress: Nullable<CreateSetupIntentsResponsePaymentMethodMailingAddress>.value(CreateSetupIntentsResponsePaymentMethodMailingAddress(
                    city: Nullable<String>.value("city"),
                    country: Nullable<String>.value("country"),
                    line1: Nullable<String>.value("line1"),
                    line2: Nullable<String>.value("line2"),
                    name: Nullable<String>.value("name"),
                    postalCode: Nullable<String>.value("postal_code"),
                    state: Nullable<String>.value("state")
                )),
                paymentMethodType: PaymentMethodTypes.acssDebit
            )),
            status: SetupIntentStatuses.processing,
            threeDsVerified: true
        )
        let response = try await client.setupIntents.create(
            request: CreateSetupIntentsRequest.createSetupIntentsRequestConfirmationToken(
                CreateSetupIntentsRequestConfirmationToken(
                    companyId: "biz_xxxxxxxxxxxxxx",
                    confirmationToken: "ctok_xxxxxxxxxxxxxx"
                )
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
                  "checkout_configuration": {
                    "id": "ch_xxxxxxxxxxxxxxx"
                  },
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "error_message": "Your card was declined.",
                  "id": "sint_xxxxxxxxxxxxx",
                  "member": {
                    "id": "id",
                    "user": {
                      "email": "email",
                      "id": "id",
                      "name": "name",
                      "username": "username"
                    }
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "payment_method": {
                    "card": {
                      "brand": "mastercard",
                      "exp_month": 42,
                      "exp_year": 42,
                      "last4": "4242"
                    },
                    "created_at": "2023-12-01T05:00:00Z",
                    "id": "payt_xxxxxxxxxxxxx",
                    "mailing_address": {
                      "city": "city",
                      "country": "country",
                      "line1": "line1",
                      "line2": "line2",
                      "name": "name",
                      "postal_code": "postal_code",
                      "state": "state"
                    },
                    "payment_method_type": "acss_debit"
                  },
                  "status": "processing",
                  "three_ds_verified": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SetupIntent(
            checkoutConfiguration: Nullable<SetupIntentCheckoutConfiguration>.value(SetupIntentCheckoutConfiguration(
                id: "ch_xxxxxxxxxxxxxxx"
            )),
            company: Nullable<SetupIntentCompany>.value(SetupIntentCompany(
                id: "biz_xxxxxxxxxxxxxx"
            )),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            errorMessage: Nullable<String>.value("Your card was declined."),
            id: "sint_xxxxxxxxxxxxx",
            member: Nullable<SetupIntentMember>.value(SetupIntentMember(
                id: "id",
                user: Nullable<SetupIntentMemberUser>.value(SetupIntentMemberUser(
                    email: Nullable<String>.value("email"),
                    id: "id",
                    name: Nullable<String>.value("name"),
                    username: "username"
                ))
            )),
            metadata: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            paymentMethod: Nullable<SetupIntentPaymentMethod>.value(SetupIntentPaymentMethod(
                card: Nullable<SetupIntentPaymentMethodCard>.value(SetupIntentPaymentMethodCard(
                    brand: Nullable<CardBrands>.value(CardBrands.mastercard),
                    expMonth: Nullable<Int>.value(42),
                    expYear: Nullable<Int>.value(42),
                    last4: Nullable<String>.value("4242")
                )),
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                id: "payt_xxxxxxxxxxxxx",
                mailingAddress: Nullable<SetupIntentPaymentMethodMailingAddress>.value(SetupIntentPaymentMethodMailingAddress(
                    city: Nullable<String>.value("city"),
                    country: Nullable<String>.value("country"),
                    line1: Nullable<String>.value("line1"),
                    line2: Nullable<String>.value("line2"),
                    name: Nullable<String>.value("name"),
                    postalCode: Nullable<String>.value("postal_code"),
                    state: Nullable<String>.value("state")
                )),
                paymentMethodType: PaymentMethodTypes.acssDebit
            )),
            status: SetupIntentStatuses.processing,
            threeDsVerified: true
        )
        let response = try await client.setupIntents.retrieve(
            id: "sint_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func updateReturnUrl1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "id": "sint_xxxxxxxxxxxxxx",
                  "last_setup_error": {
                    "code": "enrollment_declined",
                    "message": "The enrollment was declined by the payment provider."
                  },
                  "next_action": {
                    "data": {
                      "expires_at": "2026-01-01T12:00:00.000Z"
                    },
                    "render": [
                      "inline"
                    ],
                    "type": "await_confirmation"
                  },
                  "object": "setup_status",
                  "return_url": "https://shinetime.example/billing/saved",
                  "status": "processing"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SetupStatus(
            id: "sint_xxxxxxxxxxxxxx",
            lastSetupError: Nullable<SetupLastSetupError>.value(SetupLastSetupError(
                code: Nullable<String>.value("enrollment_declined"),
                message: Nullable<String>.value("The enrollment was declined by the payment provider.")
            )),
            nextAction: Nullable<PaymentNextAction>.value(PaymentNextAction.awaitConfirmation(
                .init(
                    data: PaymentNextActionAwaitConfirmationData(
                        expiresAt: "2026-01-01T12:00:00.000Z"
                    ),
                    render: [
                        PaymentNextActionAwaitConfirmationRenderItem.inline
                    ],
                    additionalProperties: [
                        "type": JSONValue.string("await_confirmation")
                    ]
                )
            )),
            object: "setup_status",
            returnUrl: Nullable<String>.value("https://shinetime.example/billing/saved"),
            status: SetupStatusStatus.processing
        )
        let response = try await client.setupIntents.updateReturnUrl(
            setupIntentId: "setup_intent_id",
            request: .init(returnUrl: "https://shinetime.example/checkout/thanks"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retrieveStatus1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "id": "sint_xxxxxxxxxxxxxx",
                  "last_setup_error": {
                    "code": "enrollment_declined",
                    "message": "The enrollment was declined by the payment provider."
                  },
                  "next_action": {
                    "data": {
                      "expires_at": "2026-01-01T12:00:00.000Z"
                    },
                    "render": [
                      "inline"
                    ],
                    "type": "await_confirmation"
                  },
                  "object": "setup_status",
                  "return_url": "https://shinetime.example/billing/saved",
                  "status": "processing"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SetupStatus(
            id: "sint_xxxxxxxxxxxxxx",
            lastSetupError: Nullable<SetupLastSetupError>.value(SetupLastSetupError(
                code: Nullable<String>.value("enrollment_declined"),
                message: Nullable<String>.value("The enrollment was declined by the payment provider.")
            )),
            nextAction: Nullable<PaymentNextAction>.value(PaymentNextAction.awaitConfirmation(
                .init(
                    data: PaymentNextActionAwaitConfirmationData(
                        expiresAt: "2026-01-01T12:00:00.000Z"
                    ),
                    render: [
                        PaymentNextActionAwaitConfirmationRenderItem.inline
                    ],
                    additionalProperties: [
                        "type": JSONValue.string("await_confirmation")
                    ]
                )
            )),
            object: "setup_status",
            returnUrl: Nullable<String>.value("https://shinetime.example/billing/saved"),
            status: SetupStatusStatus.processing
        )
        let response = try await client.setupIntents.retrieveStatus(
            setupIntentId: "setup_intent_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}