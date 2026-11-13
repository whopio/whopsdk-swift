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
                      "purchase_url": "https://whop.com/checkout/ch_xxxxxxxxxxxxxx/",
                      "redirect_url": "https://shinetime.example/thanks",
                      "three_ds_level": "mandate_challenge",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "variant": {
                        "adaptive_pricing_enabled": true,
                        "billing_period": 30,
                        "billing_type": "renewal",
                        "currency": "usd",
                        "expiration_days": 365,
                        "id": "plan_xxxxxxxxxxxxxx",
                        "initial_price": 0,
                        "release_method": "buy_now",
                        "renewal_price": 59,
                        "three_ds_level": null,
                        "trial_period_days": 7,
                        "visibility": "visible"
                      }
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
                    purchaseUrl: Optional(Nullable<String>.value("https://whop.com/checkout/ch_xxxxxxxxxxxxxx/")),
                    redirectUrl: Optional(Nullable<String>.value("https://shinetime.example/thanks")),
                    threeDsLevel: Optional(Nullable<ListCheckoutConfigurationsResponseDataItemThreeDsLevel>.value(ListCheckoutConfigurationsResponseDataItemThreeDsLevel.mandateChallenge)),
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    variant: Optional(Nullable<ListCheckoutConfigurationsResponseDataItemVariant>.value(ListCheckoutConfigurationsResponseDataItemVariant(
                        adaptivePricingEnabled: true,
                        billingPeriod: Nullable<Int>.value(30),
                        billingType: ListCheckoutConfigurationsResponseDataItemVariantBillingType.renewal,
                        currency: "usd",
                        expirationDays: Nullable<Int>.value(365),
                        id: "plan_xxxxxxxxxxxxxx",
                        initialPrice: 0,
                        releaseMethod: ListCheckoutConfigurationsResponseDataItemVariantReleaseMethod.buyNow,
                        renewalPrice: 59,
                        threeDsLevel: .null,
                        trialPeriodDays: Nullable<Int>.value(7),
                        visibility: ListCheckoutConfigurationsResponseDataItemVariantVisibility.visible
                    )))
                )
            ],
            pageInfo: ListCheckoutConfigurationsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
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
                    "key": "value"
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
                  "purchase_url": "https://whop.com/checkout/ch_xxxxxxxxxxxxxx/",
                  "redirect_url": "https://shinetime.example/thanks",
                  "three_ds_level": "mandate_challenge",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variant": {
                    "adaptive_pricing_enabled": true,
                    "billing_period": 30,
                    "billing_type": "renewal",
                    "currency": "usd",
                    "expiration_days": 365,
                    "id": "plan_xxxxxxxxxxxxxx",
                    "initial_price": 249,
                    "release_method": "buy_now",
                    "renewal_price": 0,
                    "three_ds_level": "mandate_challenge",
                    "trial_period_days": 7,
                    "visibility": "visible"
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
                "key": JSONValue.string("value")
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
            purchaseUrl: Optional(Nullable<String>.value("https://whop.com/checkout/ch_xxxxxxxxxxxxxx/")),
            redirectUrl: Optional(Nullable<String>.value("https://shinetime.example/thanks")),
            threeDsLevel: Optional(Nullable<CreateCheckoutConfigurationsResponseThreeDsLevel>.value(CreateCheckoutConfigurationsResponseThreeDsLevel.mandateChallenge)),
            updatedAt: "2026-01-01T12:00:00.000Z",
            variant: Optional(Nullable<CreateCheckoutConfigurationsResponseVariant>.value(CreateCheckoutConfigurationsResponseVariant(
                adaptivePricingEnabled: true,
                billingPeriod: Nullable<Int>.value(30),
                billingType: CreateCheckoutConfigurationsResponseVariantBillingType.renewal,
                currency: "usd",
                expirationDays: Nullable<Int>.value(365),
                id: "plan_xxxxxxxxxxxxxx",
                initialPrice: 249,
                releaseMethod: CreateCheckoutConfigurationsResponseVariantReleaseMethod.buyNow,
                renewalPrice: 0,
                threeDsLevel: Nullable<CreateCheckoutConfigurationsResponseVariantThreeDsLevel>.value(CreateCheckoutConfigurationsResponseVariantThreeDsLevel.mandateChallenge),
                trialPeriodDays: Nullable<Int>.value(7),
                visibility: CreateCheckoutConfigurationsResponseVariantVisibility.visible
            )))
        )
        let response = try await client.checkoutConfigurations.create(
            request: .init(
                accountId: "biz_xxxxxxxxxxxxxx",
                variantId: .value("plan_xxxxxxxxxxxxx")
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
                  "purchase_url": "https://whop.com/checkout/ch_xxxxxxxxxxxxxx/",
                  "redirect_url": "https://shinetime.example/thanks",
                  "three_ds_level": "mandate_challenge",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variant": {
                    "adaptive_pricing_enabled": true,
                    "billing_period": 30,
                    "billing_type": "renewal",
                    "currency": "usd",
                    "expiration_days": 365,
                    "id": "plan_xxxxxxxxxxxxxx",
                    "initial_price": 0,
                    "release_method": "buy_now",
                    "renewal_price": 59,
                    "three_ds_level": "mandate_challenge",
                    "trial_period_days": 7,
                    "visibility": "visible"
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
            purchaseUrl: Optional(Nullable<String>.value("https://whop.com/checkout/ch_xxxxxxxxxxxxxx/")),
            redirectUrl: Optional(Nullable<String>.value("https://shinetime.example/thanks")),
            threeDsLevel: Optional(Nullable<RetrieveCheckoutConfigurationsResponseThreeDsLevel>.value(RetrieveCheckoutConfigurationsResponseThreeDsLevel.mandateChallenge)),
            updatedAt: "2026-01-01T12:00:00.000Z",
            variant: Optional(Nullable<RetrieveCheckoutConfigurationsResponseVariant>.value(RetrieveCheckoutConfigurationsResponseVariant(
                adaptivePricingEnabled: true,
                billingPeriod: Nullable<Int>.value(30),
                billingType: RetrieveCheckoutConfigurationsResponseVariantBillingType.renewal,
                currency: "usd",
                expirationDays: Nullable<Int>.value(365),
                id: "plan_xxxxxxxxxxxxxx",
                initialPrice: 0,
                releaseMethod: RetrieveCheckoutConfigurationsResponseVariantReleaseMethod.buyNow,
                renewalPrice: 59,
                threeDsLevel: Nullable<RetrieveCheckoutConfigurationsResponseVariantThreeDsLevel>.value(RetrieveCheckoutConfigurationsResponseVariantThreeDsLevel.mandateChallenge),
                trialPeriodDays: Nullable<Int>.value(7),
                visibility: RetrieveCheckoutConfigurationsResponseVariantVisibility.visible
            )))
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