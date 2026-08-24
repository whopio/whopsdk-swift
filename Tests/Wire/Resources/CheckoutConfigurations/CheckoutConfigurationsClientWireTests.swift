import Foundation
import Testing
import WhopSDK

@Suite("CheckoutConfigurationsClient Wire Tests") struct CheckoutConfigurationsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "affiliate_code": "tanyacole",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "currency": "usd",
                      "effective_payment_method_configuration": {
                        "disabled": [
                          "crypto"
                        ],
                        "enabled": [
                          "card"
                        ],
                        "include_platform_defaults": true
                      },
                      "id": "ch_xxxxxxxxxxxxxx",
                      "metadata": {
                        "booking_source": "front_desk"
                      },
                      "mode": "payment",
                      "payment_method_configuration": {
                        "disabled": [
                          "crypto"
                        ],
                        "enabled": [
                          "card"
                        ],
                        "include_platform_defaults": true
                      },
                      "plan": {
                        "adaptive_pricing_enabled": true,
                        "billing_period": 30,
                        "currency": "usd",
                        "expiration_days": 365,
                        "id": "plan_xxxxxxxxxxxxxx",
                        "initial_price": 0,
                        "plan_type": "renewal",
                        "release_method": "buy_now",
                        "renewal_price": 59,
                        "three_ds_level": null,
                        "trial_period_days": 7,
                        "visibility": "visible"
                      },
                      "purchase_url": "https://whop.com/checkout/ch_xxxxxxxxxxxxxx/",
                      "redirect_url": "https://shinetime.example/thanks",
                      "three_ds_level": "mandate_challenge",
                      "updated_at": "2026-01-01T12:00:00.000Z"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "WyJjdXJzb3IiLDFd",
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
        let expectedResponse = ListCheckoutConfigurationsResponse(
            data: [
                ListCheckoutConfigurationsResponseDataItem(
                    accountId: "biz_xxxxxxxxxxxxxx",
                    affiliateCode: Optional(Nullable<String>.value("tanyacole")),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currency: Optional(Nullable<String>.value("usd")),
                    effectivePaymentMethodConfiguration: Optional(Nullable<ListCheckoutConfigurationsResponseDataItemEffectivePaymentMethodConfiguration>.value(ListCheckoutConfigurationsResponseDataItemEffectivePaymentMethodConfiguration(
                        disabled: Optional([
                            "crypto"
                        ]),
                        enabled: Optional([
                            "card"
                        ]),
                        includePlatformDefaults: Optional(true)
                    ))),
                    id: "ch_xxxxxxxxxxxxxx",
                    metadata: Optional(Nullable<[String: JSONValue]>.value([
                        "booking_source": JSONValue.string("front_desk")
                    ])),
                    mode: ListCheckoutConfigurationsResponseDataItemMode.payment,
                    paymentMethodConfiguration: Optional(Nullable<ListCheckoutConfigurationsResponseDataItemPaymentMethodConfiguration>.value(ListCheckoutConfigurationsResponseDataItemPaymentMethodConfiguration(
                        disabled: Optional([
                            "crypto"
                        ]),
                        enabled: Optional([
                            "card"
                        ]),
                        includePlatformDefaults: Optional(true)
                    ))),
                    plan: Optional(Nullable<ListCheckoutConfigurationsResponseDataItemPlan>.value(ListCheckoutConfigurationsResponseDataItemPlan(
                        adaptivePricingEnabled: true,
                        billingPeriod: Nullable<Int>.value(30),
                        currency: "usd",
                        expirationDays: Nullable<Int>.value(365),
                        id: "plan_xxxxxxxxxxxxxx",
                        initialPrice: 0,
                        planType: ListCheckoutConfigurationsResponseDataItemPlanPlanType.renewal,
                        releaseMethod: ListCheckoutConfigurationsResponseDataItemPlanReleaseMethod.buyNow,
                        renewalPrice: 59,
                        threeDsLevel: .null,
                        trialPeriodDays: Nullable<Int>.value(7),
                        visibility: ListCheckoutConfigurationsResponseDataItemPlanVisibility.visible
                    ))),
                    purchaseUrl: Optional(Nullable<String>.value("https://whop.com/checkout/ch_xxxxxxxxxxxxxx/")),
                    redirectUrl: Optional(Nullable<String>.value("https://shinetime.example/thanks")),
                    threeDsLevel: Optional(Nullable<ListCheckoutConfigurationsResponseDataItemThreeDsLevel>.value(ListCheckoutConfigurationsResponseDataItemThreeDsLevel.mandateChallenge)),
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListCheckoutConfigurationsResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.checkoutConfigurations.list(
            accountId: "account_id",
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "affiliate_code": "tanyacole",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "effective_payment_method_configuration": {
                    "disabled": [
                      "paypal"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "id": "ch_xxxxxxxxxxxxxx",
                  "metadata": {
                    "booking_source": "front_desk"
                  },
                  "mode": "payment",
                  "payment_method_configuration": {
                    "disabled": [
                      "paypal"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "plan": {
                    "adaptive_pricing_enabled": true,
                    "billing_period": 30,
                    "currency": "usd",
                    "expiration_days": 365,
                    "id": "plan_xxxxxxxxxxxxxx",
                    "initial_price": 0,
                    "plan_type": "renewal",
                    "release_method": "buy_now",
                    "renewal_price": 59,
                    "three_ds_level": "mandate_challenge",
                    "trial_period_days": 7,
                    "visibility": "visible"
                  },
                  "purchase_url": "https://whop.com/checkout/ch_xxxxxxxxxxxxxx/",
                  "redirect_url": "https://shinetime.example/thanks",
                  "three_ds_level": "mandate_challenge",
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
        let expectedResponse = CreateCheckoutConfigurationsResponse(
            accountId: "biz_xxxxxxxxxxxxxx",
            affiliateCode: Optional(Nullable<String>.value("tanyacole")),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: Optional(Nullable<String>.value("usd")),
            effectivePaymentMethodConfiguration: Optional(Nullable<CreateCheckoutConfigurationsResponseEffectivePaymentMethodConfiguration>.value(CreateCheckoutConfigurationsResponseEffectivePaymentMethodConfiguration(
                disabled: Optional([
                    "paypal"
                ]),
                enabled: Optional([
                    "card"
                ]),
                includePlatformDefaults: Optional(true)
            ))),
            id: "ch_xxxxxxxxxxxxxx",
            metadata: Optional(Nullable<[String: JSONValue]>.value([
                "booking_source": JSONValue.string("front_desk")
            ])),
            mode: CreateCheckoutConfigurationsResponseMode.payment,
            paymentMethodConfiguration: Optional(Nullable<CreateCheckoutConfigurationsResponsePaymentMethodConfiguration>.value(CreateCheckoutConfigurationsResponsePaymentMethodConfiguration(
                disabled: Optional([
                    "paypal"
                ]),
                enabled: Optional([
                    "card"
                ]),
                includePlatformDefaults: Optional(true)
            ))),
            plan: Optional(Nullable<CreateCheckoutConfigurationsResponsePlan>.value(CreateCheckoutConfigurationsResponsePlan(
                adaptivePricingEnabled: true,
                billingPeriod: Nullable<Int>.value(30),
                currency: "usd",
                expirationDays: Nullable<Int>.value(365),
                id: "plan_xxxxxxxxxxxxxx",
                initialPrice: 0,
                planType: CreateCheckoutConfigurationsResponsePlanPlanType.renewal,
                releaseMethod: CreateCheckoutConfigurationsResponsePlanReleaseMethod.buyNow,
                renewalPrice: 59,
                threeDsLevel: Nullable<CreateCheckoutConfigurationsResponsePlanThreeDsLevel>.value(CreateCheckoutConfigurationsResponsePlanThreeDsLevel.mandateChallenge),
                trialPeriodDays: Nullable<Int>.value(7),
                visibility: CreateCheckoutConfigurationsResponsePlanVisibility.visible
            ))),
            purchaseUrl: Optional(Nullable<String>.value("https://whop.com/checkout/ch_xxxxxxxxxxxxxx/")),
            redirectUrl: Optional(Nullable<String>.value("https://shinetime.example/thanks")),
            threeDsLevel: Optional(Nullable<CreateCheckoutConfigurationsResponseThreeDsLevel>.value(CreateCheckoutConfigurationsResponseThreeDsLevel.mandateChallenge)),
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.checkoutConfigurations.create(
            request: .init(
                accountId: "biz_xxxxxxxxxxxxxx",
                planId: .value("plan_xxxxxxxxxxxxx")
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
                  "affiliate_code": "tanyacole",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "effective_payment_method_configuration": {
                    "disabled": [
                      "crypto"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "id": "ch_xxxxxxxxxxxxxx",
                  "metadata": {
                    "booking_source": "front_desk"
                  },
                  "mode": "payment",
                  "payment_method_configuration": {
                    "disabled": [
                      "crypto"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "plan": {
                    "adaptive_pricing_enabled": true,
                    "billing_period": 30,
                    "currency": "usd",
                    "expiration_days": 365,
                    "id": "plan_xxxxxxxxxxxxxx",
                    "initial_price": 0,
                    "plan_type": "renewal",
                    "release_method": "buy_now",
                    "renewal_price": 59,
                    "three_ds_level": "mandate_challenge",
                    "trial_period_days": 7,
                    "visibility": "visible"
                  },
                  "purchase_url": "https://whop.com/checkout/ch_xxxxxxxxxxxxxx/",
                  "redirect_url": "https://shinetime.example/thanks",
                  "three_ds_level": "mandate_challenge",
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
        let expectedResponse = RetrieveCheckoutConfigurationsResponse(
            accountId: "biz_xxxxxxxxxxxxxx",
            affiliateCode: Optional(Nullable<String>.value("tanyacole")),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: Optional(Nullable<String>.value("usd")),
            effectivePaymentMethodConfiguration: Optional(Nullable<RetrieveCheckoutConfigurationsResponseEffectivePaymentMethodConfiguration>.value(RetrieveCheckoutConfigurationsResponseEffectivePaymentMethodConfiguration(
                disabled: Optional([
                    "crypto"
                ]),
                enabled: Optional([
                    "card"
                ]),
                includePlatformDefaults: Optional(true)
            ))),
            id: "ch_xxxxxxxxxxxxxx",
            metadata: Optional(Nullable<[String: JSONValue]>.value([
                "booking_source": JSONValue.string("front_desk")
            ])),
            mode: RetrieveCheckoutConfigurationsResponseMode.payment,
            paymentMethodConfiguration: Optional(Nullable<RetrieveCheckoutConfigurationsResponsePaymentMethodConfiguration>.value(RetrieveCheckoutConfigurationsResponsePaymentMethodConfiguration(
                disabled: Optional([
                    "crypto"
                ]),
                enabled: Optional([
                    "card"
                ]),
                includePlatformDefaults: Optional(true)
            ))),
            plan: Optional(Nullable<RetrieveCheckoutConfigurationsResponsePlan>.value(RetrieveCheckoutConfigurationsResponsePlan(
                adaptivePricingEnabled: true,
                billingPeriod: Nullable<Int>.value(30),
                currency: "usd",
                expirationDays: Nullable<Int>.value(365),
                id: "plan_xxxxxxxxxxxxxx",
                initialPrice: 0,
                planType: RetrieveCheckoutConfigurationsResponsePlanPlanType.renewal,
                releaseMethod: RetrieveCheckoutConfigurationsResponsePlanReleaseMethod.buyNow,
                renewalPrice: 59,
                threeDsLevel: Nullable<RetrieveCheckoutConfigurationsResponsePlanThreeDsLevel>.value(RetrieveCheckoutConfigurationsResponsePlanThreeDsLevel.mandateChallenge),
                trialPeriodDays: Nullable<Int>.value(7),
                visibility: RetrieveCheckoutConfigurationsResponsePlanVisibility.visible
            ))),
            purchaseUrl: Optional(Nullable<String>.value("https://whop.com/checkout/ch_xxxxxxxxxxxxxx/")),
            redirectUrl: Optional(Nullable<String>.value("https://shinetime.example/thanks")),
            threeDsLevel: Optional(Nullable<RetrieveCheckoutConfigurationsResponseThreeDsLevel>.value(RetrieveCheckoutConfigurationsResponseThreeDsLevel.mandateChallenge)),
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.checkoutConfigurations.retrieve(
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
                  "id": "ch_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteCheckoutConfigurationsResponse(
            deleted: true,
            id: "ch_xxxxxxxxxxxxxx"
        )
        let response = try await client.checkoutConfigurations.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}