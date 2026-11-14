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

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "account_id",
                      "affiliate_code": "affiliate_code",
                      "created_at": "created_at",
                      "currency": "currency",
                      "effective_payment_method_configuration": {
                        "disabled": [
                          "disabled",
                          "disabled"
                        ],
                        "enabled": [
                          "enabled",
                          "enabled"
                        ],
                        "include_platform_defaults": true
                      },
                      "id": "id",
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "mode": "payment",
                      "payment_method_configuration": {
                        "disabled": [
                          "disabled",
                          "disabled"
                        ],
                        "enabled": [
                          "enabled",
                          "enabled"
                        ],
                        "include_platform_defaults": true
                      },
                      "purchase_url": "purchase_url",
                      "redirect_url": "redirect_url",
                      "three_ds_level": "mandate_challenge",
                      "updated_at": "updated_at",
                      "variant": {
                        "adaptive_pricing_enabled": true,
                        "billing_period": 1,
                        "billing_type": "renewal",
                        "currency": "currency",
                        "expiration_days": 1,
                        "id": "id",
                        "initial_price": 1.1,
                        "release_method": "buy_now",
                        "renewal_price": 1.1,
                        "three_ds_level": "mandate_challenge",
                        "trial_period_days": 1,
                        "visibility": "visible"
                      }
                    },
                    {
                      "account_id": "account_id",
                      "affiliate_code": "affiliate_code",
                      "created_at": "created_at",
                      "currency": "currency",
                      "effective_payment_method_configuration": {
                        "disabled": [
                          "disabled",
                          "disabled"
                        ],
                        "enabled": [
                          "enabled",
                          "enabled"
                        ],
                        "include_platform_defaults": true
                      },
                      "id": "id",
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "mode": "payment",
                      "payment_method_configuration": {
                        "disabled": [
                          "disabled",
                          "disabled"
                        ],
                        "enabled": [
                          "enabled",
                          "enabled"
                        ],
                        "include_platform_defaults": true
                      },
                      "purchase_url": "purchase_url",
                      "redirect_url": "redirect_url",
                      "three_ds_level": "mandate_challenge",
                      "updated_at": "updated_at",
                      "variant": {
                        "adaptive_pricing_enabled": true,
                        "billing_period": 1,
                        "billing_type": "renewal",
                        "currency": "currency",
                        "expiration_days": 1,
                        "id": "id",
                        "initial_price": 1.1,
                        "release_method": "buy_now",
                        "renewal_price": 1.1,
                        "three_ds_level": "mandate_challenge",
                        "trial_period_days": 1,
                        "visibility": "visible"
                      }
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
        let expectedResponse = ListCheckoutConfigurationsResponse(
            data: [
                ListCheckoutConfigurationsResponseDataItem(
                    accountId: "account_id",
                    affiliateCode: Optional(Nullable<String>.value("affiliate_code")),
                    createdAt: "created_at",
                    currency: Optional(Nullable<String>.value("currency")),
                    effectivePaymentMethodConfiguration: Optional(Nullable<ListCheckoutConfigurationsResponseDataItemEffectivePaymentMethodConfiguration>.value(ListCheckoutConfigurationsResponseDataItemEffectivePaymentMethodConfiguration(
                        disabled: Optional([
                            "disabled",
                            "disabled"
                        ]),
                        enabled: Optional([
                            "enabled",
                            "enabled"
                        ]),
                        includePlatformDefaults: Optional(true)
                    ))),
                    id: "id",
                    metadata: Optional(Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ])),
                    mode: ListCheckoutConfigurationsResponseDataItemMode.payment,
                    paymentMethodConfiguration: Optional(Nullable<ListCheckoutConfigurationsResponseDataItemPaymentMethodConfiguration>.value(ListCheckoutConfigurationsResponseDataItemPaymentMethodConfiguration(
                        disabled: Optional([
                            "disabled",
                            "disabled"
                        ]),
                        enabled: Optional([
                            "enabled",
                            "enabled"
                        ]),
                        includePlatformDefaults: Optional(true)
                    ))),
                    purchaseUrl: Optional(Nullable<String>.value("purchase_url")),
                    redirectUrl: Optional(Nullable<String>.value("redirect_url")),
                    threeDsLevel: Optional(Nullable<ListCheckoutConfigurationsResponseDataItemThreeDsLevel>.value(ListCheckoutConfigurationsResponseDataItemThreeDsLevel.mandateChallenge)),
                    updatedAt: "updated_at",
                    variant: Optional(Nullable<ListCheckoutConfigurationsResponseDataItemVariant>.value(ListCheckoutConfigurationsResponseDataItemVariant(
                        adaptivePricingEnabled: true,
                        billingPeriod: Nullable<Int>.value(1),
                        billingType: ListCheckoutConfigurationsResponseDataItemVariantBillingType.renewal,
                        currency: "currency",
                        expirationDays: Nullable<Int>.value(1),
                        id: "id",
                        initialPrice: 1.1,
                        releaseMethod: ListCheckoutConfigurationsResponseDataItemVariantReleaseMethod.buyNow,
                        renewalPrice: 1.1,
                        threeDsLevel: Nullable<ListCheckoutConfigurationsResponseDataItemVariantThreeDsLevel>.value(ListCheckoutConfigurationsResponseDataItemVariantThreeDsLevel.mandateChallenge),
                        trialPeriodDays: Nullable<Int>.value(1),
                        visibility: ListCheckoutConfigurationsResponseDataItemVariantVisibility.visible
                    )))
                ),
                ListCheckoutConfigurationsResponseDataItem(
                    accountId: "account_id",
                    affiliateCode: Optional(Nullable<String>.value("affiliate_code")),
                    createdAt: "created_at",
                    currency: Optional(Nullable<String>.value("currency")),
                    effectivePaymentMethodConfiguration: Optional(Nullable<ListCheckoutConfigurationsResponseDataItemEffectivePaymentMethodConfiguration>.value(ListCheckoutConfigurationsResponseDataItemEffectivePaymentMethodConfiguration(
                        disabled: Optional([
                            "disabled",
                            "disabled"
                        ]),
                        enabled: Optional([
                            "enabled",
                            "enabled"
                        ]),
                        includePlatformDefaults: Optional(true)
                    ))),
                    id: "id",
                    metadata: Optional(Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ])),
                    mode: ListCheckoutConfigurationsResponseDataItemMode.payment,
                    paymentMethodConfiguration: Optional(Nullable<ListCheckoutConfigurationsResponseDataItemPaymentMethodConfiguration>.value(ListCheckoutConfigurationsResponseDataItemPaymentMethodConfiguration(
                        disabled: Optional([
                            "disabled",
                            "disabled"
                        ]),
                        enabled: Optional([
                            "enabled",
                            "enabled"
                        ]),
                        includePlatformDefaults: Optional(true)
                    ))),
                    purchaseUrl: Optional(Nullable<String>.value("purchase_url")),
                    redirectUrl: Optional(Nullable<String>.value("redirect_url")),
                    threeDsLevel: Optional(Nullable<ListCheckoutConfigurationsResponseDataItemThreeDsLevel>.value(ListCheckoutConfigurationsResponseDataItemThreeDsLevel.mandateChallenge)),
                    updatedAt: "updated_at",
                    variant: Optional(Nullable<ListCheckoutConfigurationsResponseDataItemVariant>.value(ListCheckoutConfigurationsResponseDataItemVariant(
                        adaptivePricingEnabled: true,
                        billingPeriod: Nullable<Int>.value(1),
                        billingType: ListCheckoutConfigurationsResponseDataItemVariantBillingType.renewal,
                        currency: "currency",
                        expirationDays: Nullable<Int>.value(1),
                        id: "id",
                        initialPrice: 1.1,
                        releaseMethod: ListCheckoutConfigurationsResponseDataItemVariantReleaseMethod.buyNow,
                        renewalPrice: 1.1,
                        threeDsLevel: Nullable<ListCheckoutConfigurationsResponseDataItemVariantThreeDsLevel>.value(ListCheckoutConfigurationsResponseDataItemVariantThreeDsLevel.mandateChallenge),
                        trialPeriodDays: Nullable<Int>.value(1),
                        visibility: ListCheckoutConfigurationsResponseDataItemVariantVisibility.visible
                    )))
                )
            ],
            pageInfo: ListCheckoutConfigurationsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
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

    @Test func create2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "affiliate_code": "affiliate_code",
                  "created_at": "created_at",
                  "currency": "currency",
                  "effective_payment_method_configuration": {
                    "disabled": [
                      "disabled",
                      "disabled"
                    ],
                    "enabled": [
                      "enabled",
                      "enabled"
                    ],
                    "include_platform_defaults": true
                  },
                  "id": "id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "mode": "payment",
                  "payment_method_configuration": {
                    "disabled": [
                      "disabled",
                      "disabled"
                    ],
                    "enabled": [
                      "enabled",
                      "enabled"
                    ],
                    "include_platform_defaults": true
                  },
                  "purchase_url": "purchase_url",
                  "redirect_url": "redirect_url",
                  "three_ds_level": "mandate_challenge",
                  "updated_at": "updated_at",
                  "variant": {
                    "adaptive_pricing_enabled": true,
                    "billing_period": 1,
                    "billing_type": "renewal",
                    "currency": "currency",
                    "expiration_days": 1,
                    "id": "id",
                    "initial_price": 1.1,
                    "release_method": "buy_now",
                    "renewal_price": 1.1,
                    "three_ds_level": "mandate_challenge",
                    "trial_period_days": 1,
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
            accountId: "account_id",
            affiliateCode: Optional(Nullable<String>.value("affiliate_code")),
            createdAt: "created_at",
            currency: Optional(Nullable<String>.value("currency")),
            effectivePaymentMethodConfiguration: Optional(Nullable<CreateCheckoutConfigurationsResponseEffectivePaymentMethodConfiguration>.value(CreateCheckoutConfigurationsResponseEffectivePaymentMethodConfiguration(
                disabled: Optional([
                    "disabled",
                    "disabled"
                ]),
                enabled: Optional([
                    "enabled",
                    "enabled"
                ]),
                includePlatformDefaults: Optional(true)
            ))),
            id: "id",
            metadata: Optional(Nullable<[String: JSONValue]>.value([
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ])),
            mode: CreateCheckoutConfigurationsResponseMode.payment,
            paymentMethodConfiguration: Optional(Nullable<CreateCheckoutConfigurationsResponsePaymentMethodConfiguration>.value(CreateCheckoutConfigurationsResponsePaymentMethodConfiguration(
                disabled: Optional([
                    "disabled",
                    "disabled"
                ]),
                enabled: Optional([
                    "enabled",
                    "enabled"
                ]),
                includePlatformDefaults: Optional(true)
            ))),
            purchaseUrl: Optional(Nullable<String>.value("purchase_url")),
            redirectUrl: Optional(Nullable<String>.value("redirect_url")),
            threeDsLevel: Optional(Nullable<CreateCheckoutConfigurationsResponseThreeDsLevel>.value(CreateCheckoutConfigurationsResponseThreeDsLevel.mandateChallenge)),
            updatedAt: "updated_at",
            variant: Optional(Nullable<CreateCheckoutConfigurationsResponseVariant>.value(CreateCheckoutConfigurationsResponseVariant(
                adaptivePricingEnabled: true,
                billingPeriod: Nullable<Int>.value(1),
                billingType: CreateCheckoutConfigurationsResponseVariantBillingType.renewal,
                currency: "currency",
                expirationDays: Nullable<Int>.value(1),
                id: "id",
                initialPrice: 1.1,
                releaseMethod: CreateCheckoutConfigurationsResponseVariantReleaseMethod.buyNow,
                renewalPrice: 1.1,
                threeDsLevel: Nullable<CreateCheckoutConfigurationsResponseVariantThreeDsLevel>.value(CreateCheckoutConfigurationsResponseVariantThreeDsLevel.mandateChallenge),
                trialPeriodDays: Nullable<Int>.value(1),
                visibility: CreateCheckoutConfigurationsResponseVariantVisibility.visible
            )))
        )
        let response = try await client.checkoutConfigurations.create(
            request: .init(),
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

    @Test func retrieve2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "affiliate_code": "affiliate_code",
                  "created_at": "created_at",
                  "currency": "currency",
                  "effective_payment_method_configuration": {
                    "disabled": [
                      "disabled",
                      "disabled"
                    ],
                    "enabled": [
                      "enabled",
                      "enabled"
                    ],
                    "include_platform_defaults": true
                  },
                  "id": "id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "mode": "payment",
                  "payment_method_configuration": {
                    "disabled": [
                      "disabled",
                      "disabled"
                    ],
                    "enabled": [
                      "enabled",
                      "enabled"
                    ],
                    "include_platform_defaults": true
                  },
                  "purchase_url": "purchase_url",
                  "redirect_url": "redirect_url",
                  "three_ds_level": "mandate_challenge",
                  "updated_at": "updated_at",
                  "variant": {
                    "adaptive_pricing_enabled": true,
                    "billing_period": 1,
                    "billing_type": "renewal",
                    "currency": "currency",
                    "expiration_days": 1,
                    "id": "id",
                    "initial_price": 1.1,
                    "release_method": "buy_now",
                    "renewal_price": 1.1,
                    "three_ds_level": "mandate_challenge",
                    "trial_period_days": 1,
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
            accountId: "account_id",
            affiliateCode: Optional(Nullable<String>.value("affiliate_code")),
            createdAt: "created_at",
            currency: Optional(Nullable<String>.value("currency")),
            effectivePaymentMethodConfiguration: Optional(Nullable<RetrieveCheckoutConfigurationsResponseEffectivePaymentMethodConfiguration>.value(RetrieveCheckoutConfigurationsResponseEffectivePaymentMethodConfiguration(
                disabled: Optional([
                    "disabled",
                    "disabled"
                ]),
                enabled: Optional([
                    "enabled",
                    "enabled"
                ]),
                includePlatformDefaults: Optional(true)
            ))),
            id: "id",
            metadata: Optional(Nullable<[String: JSONValue]>.value([
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ])),
            mode: RetrieveCheckoutConfigurationsResponseMode.payment,
            paymentMethodConfiguration: Optional(Nullable<RetrieveCheckoutConfigurationsResponsePaymentMethodConfiguration>.value(RetrieveCheckoutConfigurationsResponsePaymentMethodConfiguration(
                disabled: Optional([
                    "disabled",
                    "disabled"
                ]),
                enabled: Optional([
                    "enabled",
                    "enabled"
                ]),
                includePlatformDefaults: Optional(true)
            ))),
            purchaseUrl: Optional(Nullable<String>.value("purchase_url")),
            redirectUrl: Optional(Nullable<String>.value("redirect_url")),
            threeDsLevel: Optional(Nullable<RetrieveCheckoutConfigurationsResponseThreeDsLevel>.value(RetrieveCheckoutConfigurationsResponseThreeDsLevel.mandateChallenge)),
            updatedAt: "updated_at",
            variant: Optional(Nullable<RetrieveCheckoutConfigurationsResponseVariant>.value(RetrieveCheckoutConfigurationsResponseVariant(
                adaptivePricingEnabled: true,
                billingPeriod: Nullable<Int>.value(1),
                billingType: RetrieveCheckoutConfigurationsResponseVariantBillingType.renewal,
                currency: "currency",
                expirationDays: Nullable<Int>.value(1),
                id: "id",
                initialPrice: 1.1,
                releaseMethod: RetrieveCheckoutConfigurationsResponseVariantReleaseMethod.buyNow,
                renewalPrice: 1.1,
                threeDsLevel: Nullable<RetrieveCheckoutConfigurationsResponseVariantThreeDsLevel>.value(RetrieveCheckoutConfigurationsResponseVariantThreeDsLevel.mandateChallenge),
                trialPeriodDays: Nullable<Int>.value(1),
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

    @Test func delete2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "deleted": true,
                  "id": "id"
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
            id: "id"
        )
        let response = try await client.checkoutConfigurations.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}