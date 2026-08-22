import Foundation
import Testing
import WhopSDK

@Suite("PlansClient Wire Tests") struct PlansClientWireTests {
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
                        "title": "Shine Time Auto Detailing"
                      },
                      "adaptive_pricing_enabled": true,
                      "billing_period": 30,
                      "cancel_discount_intervals": 3,
                      "cancel_discount_percentage": 20,
                      "checkout_styling": {
                        "background_color": "#0f172a",
                        "border_style": "rounded",
                        "button_color": "#f59e0b",
                        "font_family": "roboto"
                      },
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "currency": "usd",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "field_xxxxxxxxxxxxxx",
                          "name": "Vehicle make and model",
                          "order": 0,
                          "placeholder": "2021 Audi S5",
                          "required": true
                        }
                      ],
                      "description": "Two hand washes a month, interior vacuum, and a quarterly sealant top-up.",
                      "expiration_days": 365,
                      "formatted_price": "$59.00 / month",
                      "id": "plan_xxxxxxxxxxxxxx",
                      "image": {
                        "blurhash": "LA6bDXT$E3b:R6i+RibEIWbp%ej1",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      },
                      "initial_price": 0,
                      "internal_notes": "Maintenance tier. Upsell the interior shampoo add-on at renewal.",
                      "invoice": {
                        "id": "inv_xxxxxxxxxxxxxx"
                      },
                      "member_count": 0,
                      "metadata": {
                        "custom_cta": "subscribe",
                        "custom_cta_url": "https://shinetime.example/wash-club"
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "disabled": [
                          "crypto"
                        ],
                        "enabled": [
                          "card"
                        ],
                        "include_platform_defaults": true
                      },
                      "plan_type": "renewal",
                      "product": {
                        "id": "prod_xxxxxxxxxxxxxx",
                        "title": "Ceramic Coating Package"
                      },
                      "purchase_url": "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                      "release_method": "buy_now",
                      "renewal_price": 59,
                      "split_pay_required_payments": 4,
                      "stock": 0,
                      "strike_through_initial_price": 99,
                      "strike_through_renewal_price": 79,
                      "three_ds_level": "mandate_challenge",
                      "title": "Unlimited Wash Club",
                      "trial_period_days": 7,
                      "unlimited_stock": false,
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "visibility": "visible"
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
        let expectedResponse = ListPlansResponse(
            data: [
                PlanListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "biz_xxxxxxxxxxxxxx",
                        title: "Shine Time Auto Detailing"
                    )),
                    adaptivePricingEnabled: true,
                    billingPeriod: Nullable<Double>.value(30),
                    cancelDiscountIntervals: Nullable<Double>.value(3),
                    cancelDiscountPercentage: Nullable<Double>.value(20),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "background_color": JSONValue.string("#0f172a"), 
                        "border_style": JSONValue.string("rounded"), 
                        "button_color": JSONValue.string("#f59e0b"), 
                        "font_family": JSONValue.string("roboto")
                    ]),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currency: "usd",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "field_xxxxxxxxxxxxxx",
                            name: "Vehicle make and model",
                            order: 0,
                            placeholder: Nullable<String>.value("2021 Audi S5"),
                            required: true
                        )
                    ],
                    description: Nullable<String>.value("Two hand washes a month, interior vacuum, and a quarterly sealant top-up."),
                    expirationDays: Nullable<Double>.value(365),
                    formattedPrice: "$59.00 / month",
                    id: "plan_xxxxxxxxxxxxxx",
                    image: Nullable<[String: JSONValue]>.value([
                        "blurhash": JSONValue.string("LA6bDXT$E3b:R6i+RibEIWbp%ej1"), 
                        "url": JSONValue.string("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                    ]),
                    initialPrice: 0,
                    internalNotes: Nullable<String>.value("Maintenance tier. Upsell the interior shampoo add-on at renewal."),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "id": JSONValue.string("inv_xxxxxxxxxxxxxx")
                    ]),
                    memberCount: Nullable<Double>.value(0),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "custom_cta": JSONValue.string("subscribe"), 
                        "custom_cta_url": JSONValue.string("https://shinetime.example/wash-club")
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "disabled": JSONValue.array([
                            JSONValue.string("crypto")
                        ]), 
                        "enabled": JSONValue.array([
                            JSONValue.string("card")
                        ]), 
                        "include_platform_defaults": JSONValue.bool(true)
                    ]),
                    planType: PlanListItemPlanType.renewal,
                    product: Nullable<[String: JSONValue]>.value([
                        "id": JSONValue.string("prod_xxxxxxxxxxxxxx"), 
                        "title": JSONValue.string("Ceramic Coating Package")
                    ]),
                    purchaseUrl: "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                    releaseMethod: PlanListItemReleaseMethod.buyNow,
                    renewalPrice: 59,
                    splitPayRequiredPayments: Nullable<Double>.value(4),
                    stock: Nullable<Double>.value(0),
                    strikeThroughInitialPrice: Nullable<Double>.value(99),
                    strikeThroughRenewalPrice: Nullable<Double>.value(79),
                    threeDsLevel: Nullable<PlanListItemThreeDsLevel>.value(PlanListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("Unlimited Wash Club"),
                    trialPeriodDays: Nullable<Double>.value(7),
                    unlimitedStock: false,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    visibility: PlanListItemVisibility.visible
                )
            ],
            pageInfo: ListPlansResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.plans.list(
            accountId: "account_id",
            releaseMethods: [
                "buy_now"
            ],
            visibilities: [
                "visible"
            ],
            planTypes: [
                "renewal"
            ],
            productIds: [
                "prod_xxxxxxxxxxxxxx"
            ],
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
                  },
                  "adaptive_pricing_enabled": true,
                  "billing_period": 30,
                  "cancel_discount_intervals": 3,
                  "cancel_discount_percentage": 20,
                  "checkout_styling": {
                    "background_color": "#0f172a",
                    "border_style": "rounded",
                    "button_color": "#f59e0b",
                    "font_family": "roboto"
                  },
                  "collect_tax": false,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "custom_fields": [
                    {
                      "field_type": "text",
                      "id": "field_xxxxxxxxxxxxxx",
                      "name": "Vehicle make and model",
                      "order": 0,
                      "placeholder": "2021 Audi S5",
                      "required": true
                    }
                  ],
                  "deletable": true,
                  "description": "Two hand washes a month, interior vacuum, and a quarterly sealant top-up.",
                  "effective_payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "expiration_days": 365,
                  "formatted_price": "$59.00 / month",
                  "id": "plan_xxxxxxxxxxxxxx",
                  "image": {
                    "blurhash": "LA6bDXT$E3b:R6i+RibEIWbp%ej1",
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "initial_price": 0,
                  "internal_notes": "Maintenance tier. Upsell the interior shampoo add-on at renewal.",
                  "invoice": {
                    "id": "inv_xxxxxxxxxxxxxx"
                  },
                  "member_count": 0,
                  "metadata": {
                    "custom_cta": "subscribe",
                    "custom_cta_url": "https://shinetime.example/wash-club"
                  },
                  "offer_cancel_discount": true,
                  "payment_method_configuration": {
                    "disabled": [
                      "crypto"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "plan_type": "renewal",
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "purchase_url": "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                  "release_method": "buy_now",
                  "renewal_price": 59,
                  "split_pay_required_payments": 4,
                  "stock": 0,
                  "strike_through_initial_price": 99,
                  "strike_through_renewal_price": 79,
                  "tax_type": "inclusive",
                  "three_ds_level": "mandate_challenge",
                  "title": "Unlimited Wash Club",
                  "trial_period_days": 7,
                  "unlimited_stock": false,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "visibility": "visible"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Plan(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Shine Time Auto Detailing"
            )),
            adaptivePricingEnabled: true,
            billingPeriod: Nullable<Double>.value(30),
            cancelDiscountIntervals: Nullable<Double>.value(3),
            cancelDiscountPercentage: Nullable<Double>.value(20),
            checkoutStyling: Nullable<[String: JSONValue]>.value([
                "background_color": JSONValue.string("#0f172a"), 
                "border_style": JSONValue.string("rounded"), 
                "button_color": JSONValue.string("#f59e0b"), 
                "font_family": JSONValue.string("roboto")
            ]),
            collectTax: false,
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: PlanCurrency.usd,
            customFields: [
                PlanCustomField(
                    fieldType: PlanCustomFieldFieldType.text,
                    id: "field_xxxxxxxxxxxxxx",
                    name: "Vehicle make and model",
                    order: 0,
                    placeholder: Nullable<String>.value("2021 Audi S5"),
                    required: true
                )
            ],
            deletable: Nullable<Bool>.value(true),
            description: Nullable<String>.value("Two hand washes a month, interior vacuum, and a quarterly sealant top-up."),
            effectivePaymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            expirationDays: Nullable<Double>.value(365),
            formattedPrice: "$59.00 / month",
            id: "plan_xxxxxxxxxxxxxx",
            image: Nullable<[String: JSONValue]>.value([
                "blurhash": JSONValue.string("LA6bDXT$E3b:R6i+RibEIWbp%ej1"), 
                "url": JSONValue.string("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
            ]),
            initialPrice: 0,
            internalNotes: Nullable<String>.value("Maintenance tier. Upsell the interior shampoo add-on at renewal."),
            invoice: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("inv_xxxxxxxxxxxxxx")
            ]),
            memberCount: Nullable<Double>.value(0),
            metadata: Nullable<[String: JSONValue]>.value([
                "custom_cta": JSONValue.string("subscribe"), 
                "custom_cta_url": JSONValue.string("https://shinetime.example/wash-club")
            ]),
            offerCancelDiscount: Nullable<Bool>.value(true),
            paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                "disabled": JSONValue.array([
                    JSONValue.string("crypto")
                ]), 
                "enabled": JSONValue.array([
                    JSONValue.string("card")
                ]), 
                "include_platform_defaults": JSONValue.bool(true)
            ]),
            planType: PlanPlanType.renewal,
            product: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("prod_xxxxxxxxxxxxxx"), 
                "title": JSONValue.string("Ceramic Coating Package")
            ]),
            purchaseUrl: "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
            releaseMethod: PlanReleaseMethod.buyNow,
            renewalPrice: 59,
            splitPayRequiredPayments: Nullable<Double>.value(4),
            stock: Nullable<Double>.value(0),
            strikeThroughInitialPrice: Nullable<Double>.value(99),
            strikeThroughRenewalPrice: Nullable<Double>.value(79),
            taxType: PlanTaxType.inclusive,
            threeDsLevel: Nullable<PlanThreeDsLevel>.value(PlanThreeDsLevel.mandateChallenge),
            title: Nullable<String>.value("Unlimited Wash Club"),
            trialPeriodDays: Nullable<Double>.value(7),
            unlimitedStock: false,
            updatedAt: "2026-01-01T12:00:00.000Z",
            visibility: PlanVisibility.visible
        )
        let response = try await client.plans.create(
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
                  },
                  "adaptive_pricing_enabled": true,
                  "billing_period": 30,
                  "cancel_discount_intervals": 3,
                  "cancel_discount_percentage": 20,
                  "checkout_styling": {
                    "background_color": "#0f172a",
                    "border_style": "rounded",
                    "button_color": "#f59e0b",
                    "font_family": "roboto"
                  },
                  "collect_tax": false,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "custom_fields": [
                    {
                      "field_type": "text",
                      "id": "field_xxxxxxxxxxxxxx",
                      "name": "Vehicle make and model",
                      "order": 0,
                      "placeholder": "2021 Audi S5",
                      "required": true
                    }
                  ],
                  "deletable": true,
                  "description": "Two hand washes a month, interior vacuum, and a quarterly sealant top-up.",
                  "effective_payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "expiration_days": 365,
                  "formatted_price": "$59.00 / month",
                  "id": "plan_xxxxxxxxxxxxxx",
                  "image": {
                    "blurhash": "LA6bDXT$E3b:R6i+RibEIWbp%ej1",
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "initial_price": 0,
                  "internal_notes": "Maintenance tier. Upsell the interior shampoo add-on at renewal.",
                  "invoice": {
                    "id": "inv_xxxxxxxxxxxxxx"
                  },
                  "member_count": 0,
                  "metadata": {
                    "custom_cta": "subscribe",
                    "custom_cta_url": "https://shinetime.example/wash-club"
                  },
                  "offer_cancel_discount": true,
                  "payment_method_configuration": {
                    "disabled": [
                      "crypto"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "plan_type": "renewal",
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "purchase_url": "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                  "release_method": "buy_now",
                  "renewal_price": 59,
                  "split_pay_required_payments": 4,
                  "stock": 0,
                  "strike_through_initial_price": 99,
                  "strike_through_renewal_price": 79,
                  "tax_type": "inclusive",
                  "three_ds_level": "mandate_challenge",
                  "title": "Unlimited Wash Club",
                  "trial_period_days": 7,
                  "unlimited_stock": false,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "visibility": "visible"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Plan(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Shine Time Auto Detailing"
            )),
            adaptivePricingEnabled: true,
            billingPeriod: Nullable<Double>.value(30),
            cancelDiscountIntervals: Nullable<Double>.value(3),
            cancelDiscountPercentage: Nullable<Double>.value(20),
            checkoutStyling: Nullable<[String: JSONValue]>.value([
                "background_color": JSONValue.string("#0f172a"), 
                "border_style": JSONValue.string("rounded"), 
                "button_color": JSONValue.string("#f59e0b"), 
                "font_family": JSONValue.string("roboto")
            ]),
            collectTax: false,
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: PlanCurrency.usd,
            customFields: [
                PlanCustomField(
                    fieldType: PlanCustomFieldFieldType.text,
                    id: "field_xxxxxxxxxxxxxx",
                    name: "Vehicle make and model",
                    order: 0,
                    placeholder: Nullable<String>.value("2021 Audi S5"),
                    required: true
                )
            ],
            deletable: Nullable<Bool>.value(true),
            description: Nullable<String>.value("Two hand washes a month, interior vacuum, and a quarterly sealant top-up."),
            effectivePaymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            expirationDays: Nullable<Double>.value(365),
            formattedPrice: "$59.00 / month",
            id: "plan_xxxxxxxxxxxxxx",
            image: Nullable<[String: JSONValue]>.value([
                "blurhash": JSONValue.string("LA6bDXT$E3b:R6i+RibEIWbp%ej1"), 
                "url": JSONValue.string("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
            ]),
            initialPrice: 0,
            internalNotes: Nullable<String>.value("Maintenance tier. Upsell the interior shampoo add-on at renewal."),
            invoice: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("inv_xxxxxxxxxxxxxx")
            ]),
            memberCount: Nullable<Double>.value(0),
            metadata: Nullable<[String: JSONValue]>.value([
                "custom_cta": JSONValue.string("subscribe"), 
                "custom_cta_url": JSONValue.string("https://shinetime.example/wash-club")
            ]),
            offerCancelDiscount: Nullable<Bool>.value(true),
            paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                "disabled": JSONValue.array([
                    JSONValue.string("crypto")
                ]), 
                "enabled": JSONValue.array([
                    JSONValue.string("card")
                ]), 
                "include_platform_defaults": JSONValue.bool(true)
            ]),
            planType: PlanPlanType.renewal,
            product: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("prod_xxxxxxxxxxxxxx"), 
                "title": JSONValue.string("Ceramic Coating Package")
            ]),
            purchaseUrl: "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
            releaseMethod: PlanReleaseMethod.buyNow,
            renewalPrice: 59,
            splitPayRequiredPayments: Nullable<Double>.value(4),
            stock: Nullable<Double>.value(0),
            strikeThroughInitialPrice: Nullable<Double>.value(99),
            strikeThroughRenewalPrice: Nullable<Double>.value(79),
            taxType: PlanTaxType.inclusive,
            threeDsLevel: Nullable<PlanThreeDsLevel>.value(PlanThreeDsLevel.mandateChallenge),
            title: Nullable<String>.value("Unlimited Wash Club"),
            trialPeriodDays: Nullable<Double>.value(7),
            unlimitedStock: false,
            updatedAt: "2026-01-01T12:00:00.000Z",
            visibility: PlanVisibility.visible
        )
        let response = try await client.plans.retrieve(
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
                  "id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeletePlansResponse(
            deleted: true,
            id: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.plans.delete(
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
                  },
                  "adaptive_pricing_enabled": true,
                  "billing_period": 30,
                  "cancel_discount_intervals": 3,
                  "cancel_discount_percentage": 20,
                  "checkout_styling": {
                    "background_color": "#0f172a",
                    "border_style": "rounded",
                    "button_color": "#f59e0b",
                    "font_family": "roboto"
                  },
                  "collect_tax": false,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "custom_fields": [
                    {
                      "field_type": "text",
                      "id": "field_xxxxxxxxxxxxxx",
                      "name": "Vehicle make and model",
                      "order": 0,
                      "placeholder": "2021 Audi S5",
                      "required": true
                    }
                  ],
                  "deletable": true,
                  "description": "Two hand washes a month, interior vacuum, and a quarterly sealant top-up.",
                  "effective_payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "expiration_days": 365,
                  "formatted_price": "$59.00 / month",
                  "id": "plan_xxxxxxxxxxxxxx",
                  "image": {
                    "blurhash": "LA6bDXT$E3b:R6i+RibEIWbp%ej1",
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "initial_price": 0,
                  "internal_notes": "Maintenance tier. Upsell the interior shampoo add-on at renewal.",
                  "invoice": {
                    "id": "inv_xxxxxxxxxxxxxx"
                  },
                  "member_count": 0,
                  "metadata": {
                    "custom_cta": "subscribe",
                    "custom_cta_url": "https://shinetime.example/wash-club"
                  },
                  "offer_cancel_discount": true,
                  "payment_method_configuration": {
                    "disabled": [
                      "crypto"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "plan_type": "renewal",
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "purchase_url": "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                  "release_method": "buy_now",
                  "renewal_price": 59,
                  "split_pay_required_payments": 4,
                  "stock": 0,
                  "strike_through_initial_price": 99,
                  "strike_through_renewal_price": 79,
                  "tax_type": "inclusive",
                  "three_ds_level": "mandate_challenge",
                  "title": "Unlimited Wash Club",
                  "trial_period_days": 7,
                  "unlimited_stock": false,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "visibility": "visible"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Plan(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Shine Time Auto Detailing"
            )),
            adaptivePricingEnabled: true,
            billingPeriod: Nullable<Double>.value(30),
            cancelDiscountIntervals: Nullable<Double>.value(3),
            cancelDiscountPercentage: Nullable<Double>.value(20),
            checkoutStyling: Nullable<[String: JSONValue]>.value([
                "background_color": JSONValue.string("#0f172a"), 
                "border_style": JSONValue.string("rounded"), 
                "button_color": JSONValue.string("#f59e0b"), 
                "font_family": JSONValue.string("roboto")
            ]),
            collectTax: false,
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: PlanCurrency.usd,
            customFields: [
                PlanCustomField(
                    fieldType: PlanCustomFieldFieldType.text,
                    id: "field_xxxxxxxxxxxxxx",
                    name: "Vehicle make and model",
                    order: 0,
                    placeholder: Nullable<String>.value("2021 Audi S5"),
                    required: true
                )
            ],
            deletable: Nullable<Bool>.value(true),
            description: Nullable<String>.value("Two hand washes a month, interior vacuum, and a quarterly sealant top-up."),
            effectivePaymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            expirationDays: Nullable<Double>.value(365),
            formattedPrice: "$59.00 / month",
            id: "plan_xxxxxxxxxxxxxx",
            image: Nullable<[String: JSONValue]>.value([
                "blurhash": JSONValue.string("LA6bDXT$E3b:R6i+RibEIWbp%ej1"), 
                "url": JSONValue.string("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
            ]),
            initialPrice: 0,
            internalNotes: Nullable<String>.value("Maintenance tier. Upsell the interior shampoo add-on at renewal."),
            invoice: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("inv_xxxxxxxxxxxxxx")
            ]),
            memberCount: Nullable<Double>.value(0),
            metadata: Nullable<[String: JSONValue]>.value([
                "custom_cta": JSONValue.string("subscribe"), 
                "custom_cta_url": JSONValue.string("https://shinetime.example/wash-club")
            ]),
            offerCancelDiscount: Nullable<Bool>.value(true),
            paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                "disabled": JSONValue.array([
                    JSONValue.string("crypto")
                ]), 
                "enabled": JSONValue.array([
                    JSONValue.string("card")
                ]), 
                "include_platform_defaults": JSONValue.bool(true)
            ]),
            planType: PlanPlanType.renewal,
            product: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("prod_xxxxxxxxxxxxxx"), 
                "title": JSONValue.string("Ceramic Coating Package")
            ]),
            purchaseUrl: "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
            releaseMethod: PlanReleaseMethod.buyNow,
            renewalPrice: 59,
            splitPayRequiredPayments: Nullable<Double>.value(4),
            stock: Nullable<Double>.value(0),
            strikeThroughInitialPrice: Nullable<Double>.value(99),
            strikeThroughRenewalPrice: Nullable<Double>.value(79),
            taxType: PlanTaxType.inclusive,
            threeDsLevel: Nullable<PlanThreeDsLevel>.value(PlanThreeDsLevel.mandateChallenge),
            title: Nullable<String>.value("Unlimited Wash Club"),
            trialPeriodDays: Nullable<Double>.value(7),
            unlimitedStock: false,
            updatedAt: "2026-01-01T12:00:00.000Z",
            visibility: PlanVisibility.visible
        )
        let response = try await client.plans.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func calculateTax1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "currency": "usd",
                  "status": "calculated",
                  "subtotal": 1000,
                  "tax_amount": 70,
                  "tax_behavior": "exclusive",
                  "total": 1070
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CalculateTaxPlansResponse(
            currency: "usd",
            status: CalculateTaxPlansResponseStatus.calculated,
            subtotal: 1000,
            taxAmount: 70,
            taxBehavior: CalculateTaxPlansResponseTaxBehavior.exclusive,
            total: 1070
        )
        let response = try await client.plans.calculateTax(
            id: "id",
            request: .init(address: .value(CalculateTaxPlansRequestAddress(
                country: "DE",
                postalCode: .value("10115")
            ))),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}