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
                        "title": "Acme Bookkeeping"
                      },
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": false,
                      "attributes": {},
                      "billing_period": 30,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 1.1,
                      "cancel_discount_percentage": 1.1,
                      "checkout_styling": {
                        "key": "value"
                      },
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "currency": "usd",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "field_xxxxxxxxxxxxxx",
                          "name": "Link your website or main social profile",
                          "order": 1,
                          "placeholder": "https://",
                          "required": false
                        }
                      ],
                      "description": "description",
                      "expiration_days": 1.1,
                      "formatted_price": "$59.00 / month",
                      "id": "plan_xxxxxxxxxxxxxx",
                      "image": {
                        "key": "value"
                      },
                      "initial_price": 0,
                      "initial_price_due": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "internal_notes": "Maintenance tier. Upsell the interior shampoo add-on at renewal.",
                      "invoice": {
                        "key": "value"
                      },
                      "member_count": 0,
                      "metadata": {
                        "custom_cta": "subscribe",
                        "custom_cta_url": "https://shinetime.example/wash-club"
                      },
                      "offer_cancel_discount": false,
                      "payment_method_configuration": {
                        "key": "value"
                      },
                      "product": {
                        "id": "prod_xxxxxxxxxxxxxx",
                        "title": "Ceramic Coating Package"
                      },
                      "purchase_url": "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                      "release_method": "buy_now",
                      "renewal_price": 59,
                      "sku": "sku",
                      "split_pay_required_payments": 1.1,
                      "stock": 0,
                      "strike_through_initial_price": 1.1,
                      "strike_through_renewal_price": 1.1,
                      "three_ds_level": "mandate_challenge",
                      "title": "Unlimited Wash Club",
                      "trial_period_days": 1.1,
                      "unlimited_stock": false,
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "visibility": "visible"
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
        let expectedResponse = ListPlansResponse(
            data: [
                PlanListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "biz_xxxxxxxxxxxxxx",
                        title: "Acme Bookkeeping"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: false,
                    attributes: Nullable<[String: Nullable<String>]>.value([:]),
                    billingPeriod: Nullable<Double>.value(30),
                    billingType: PlanListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(1.1),
                    cancelDiscountPercentage: Nullable<Double>.value(1.1),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currency: "usd",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "field_xxxxxxxxxxxxxx",
                            name: "Link your website or main social profile",
                            order: 1,
                            placeholder: Nullable<String>.value("https://"),
                            required: false
                        )
                    ],
                    description: Nullable<String>.value("description"),
                    expirationDays: Nullable<Double>.value(1.1),
                    formattedPrice: "$59.00 / month",
                    id: "plan_xxxxxxxxxxxxxx",
                    image: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    initialPrice: 0,
                    initialPriceDue: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    internalNotes: Nullable<String>.value("Maintenance tier. Upsell the interior shampoo add-on at renewal."),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    memberCount: Nullable<Double>.value(0),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "custom_cta": JSONValue.string("subscribe"), 
                        "custom_cta_url": JSONValue.string("https://shinetime.example/wash-club")
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(false),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "id": JSONValue.string("prod_xxxxxxxxxxxxxx"), 
                        "title": JSONValue.string("Ceramic Coating Package")
                    ]),
                    purchaseUrl: "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                    releaseMethod: PlanListItemReleaseMethod.buyNow,
                    renewalPrice: 59,
                    sku: Nullable<String>.value("sku"),
                    splitPayRequiredPayments: Nullable<Double>.value(1.1),
                    stock: Nullable<Double>.value(0),
                    strikeThroughInitialPrice: Nullable<Double>.value(1.1),
                    strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
                    threeDsLevel: Nullable<PlanListItemThreeDsLevel>.value(PlanListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("Unlimited Wash Club"),
                    trialPeriodDays: Nullable<Double>.value(1.1),
                    unlimitedStock: false,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    visibility: PlanListItemVisibility.visible
                )
            ],
            pageInfo: ListPlansResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.plans.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": true,
                      "attributes": {
                        "attributes": "attributes"
                      },
                      "billing_period": 1.1,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 1.1,
                      "cancel_discount_percentage": 1.1,
                      "checkout_styling": {
                        "checkout_styling": {
                          "key": "value"
                        }
                      },
                      "created_at": "created_at",
                      "currency": "currency",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        },
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        }
                      ],
                      "description": "description",
                      "expiration_days": 1.1,
                      "formatted_price": "formatted_price",
                      "id": "id",
                      "image": {
                        "image": {
                          "key": "value"
                        }
                      },
                      "initial_price": 1.1,
                      "initial_price_due": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "internal_notes": "internal_notes",
                      "invoice": {
                        "invoice": {
                          "key": "value"
                        }
                      },
                      "member_count": 1.1,
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "payment_method_configuration": {
                          "key": "value"
                        }
                      },
                      "product": {
                        "product": {
                          "key": "value"
                        }
                      },
                      "purchase_url": "purchase_url",
                      "release_method": "buy_now",
                      "renewal_price": 1.1,
                      "sku": "sku",
                      "split_pay_required_payments": 1.1,
                      "stock": 1.1,
                      "strike_through_initial_price": 1.1,
                      "strike_through_renewal_price": 1.1,
                      "three_ds_level": "mandate_challenge",
                      "title": "title",
                      "trial_period_days": 1.1,
                      "unlimited_stock": true,
                      "updated_at": "updated_at",
                      "visibility": "visible"
                    },
                    {
                      "account": {
                        "id": "id",
                        "title": "title"
                      },
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": true,
                      "attributes": {
                        "attributes": "attributes"
                      },
                      "billing_period": 1.1,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 1.1,
                      "cancel_discount_percentage": 1.1,
                      "checkout_styling": {
                        "checkout_styling": {
                          "key": "value"
                        }
                      },
                      "created_at": "created_at",
                      "currency": "currency",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        },
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        }
                      ],
                      "description": "description",
                      "expiration_days": 1.1,
                      "formatted_price": "formatted_price",
                      "id": "id",
                      "image": {
                        "image": {
                          "key": "value"
                        }
                      },
                      "initial_price": 1.1,
                      "initial_price_due": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "internal_notes": "internal_notes",
                      "invoice": {
                        "invoice": {
                          "key": "value"
                        }
                      },
                      "member_count": 1.1,
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "payment_method_configuration": {
                          "key": "value"
                        }
                      },
                      "product": {
                        "product": {
                          "key": "value"
                        }
                      },
                      "purchase_url": "purchase_url",
                      "release_method": "buy_now",
                      "renewal_price": 1.1,
                      "sku": "sku",
                      "split_pay_required_payments": 1.1,
                      "stock": 1.1,
                      "strike_through_initial_price": 1.1,
                      "strike_through_renewal_price": 1.1,
                      "three_ds_level": "mandate_challenge",
                      "title": "title",
                      "trial_period_days": 1.1,
                      "unlimited_stock": true,
                      "updated_at": "updated_at",
                      "visibility": "visible"
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
        let expectedResponse = ListPlansResponse(
            data: [
                PlanListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: true,
                    attributes: Nullable<[String: Nullable<String>]>.value([
                        "attributes": Nullable<String>.value("attributes")
                    ]),
                    billingPeriod: Nullable<Double>.value(1.1),
                    billingType: PlanListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(1.1),
                    cancelDiscountPercentage: Nullable<Double>.value(1.1),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "checkout_styling": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    createdAt: "created_at",
                    currency: "currency",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        ),
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        )
                    ],
                    description: Nullable<String>.value("description"),
                    expirationDays: Nullable<Double>.value(1.1),
                    formattedPrice: "formatted_price",
                    id: "id",
                    image: Nullable<[String: JSONValue]>.value([
                        "image": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    initialPrice: 1.1,
                    initialPriceDue: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    internalNotes: Nullable<String>.value("internal_notes"),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "invoice": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    memberCount: Nullable<Double>.value(1.1),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "payment_method_configuration": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "product": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    purchaseUrl: "purchase_url",
                    releaseMethod: PlanListItemReleaseMethod.buyNow,
                    renewalPrice: 1.1,
                    sku: Nullable<String>.value("sku"),
                    splitPayRequiredPayments: Nullable<Double>.value(1.1),
                    stock: Nullable<Double>.value(1.1),
                    strikeThroughInitialPrice: Nullable<Double>.value(1.1),
                    strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
                    threeDsLevel: Nullable<PlanListItemThreeDsLevel>.value(PlanListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("title"),
                    trialPeriodDays: Nullable<Double>.value(1.1),
                    unlimitedStock: true,
                    updatedAt: "updated_at",
                    visibility: PlanListItemVisibility.visible
                ),
                PlanListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: true,
                    attributes: Nullable<[String: Nullable<String>]>.value([
                        "attributes": Nullable<String>.value("attributes")
                    ]),
                    billingPeriod: Nullable<Double>.value(1.1),
                    billingType: PlanListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(1.1),
                    cancelDiscountPercentage: Nullable<Double>.value(1.1),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "checkout_styling": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    createdAt: "created_at",
                    currency: "currency",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        ),
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        )
                    ],
                    description: Nullable<String>.value("description"),
                    expirationDays: Nullable<Double>.value(1.1),
                    formattedPrice: "formatted_price",
                    id: "id",
                    image: Nullable<[String: JSONValue]>.value([
                        "image": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    initialPrice: 1.1,
                    initialPriceDue: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    internalNotes: Nullable<String>.value("internal_notes"),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "invoice": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    memberCount: Nullable<Double>.value(1.1),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "payment_method_configuration": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "product": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    purchaseUrl: "purchase_url",
                    releaseMethod: PlanListItemReleaseMethod.buyNow,
                    renewalPrice: 1.1,
                    sku: Nullable<String>.value("sku"),
                    splitPayRequiredPayments: Nullable<Double>.value(1.1),
                    stock: Nullable<Double>.value(1.1),
                    strikeThroughInitialPrice: Nullable<Double>.value(1.1),
                    strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
                    threeDsLevel: Nullable<PlanListItemThreeDsLevel>.value(PlanListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("title"),
                    trialPeriodDays: Nullable<Double>.value(1.1),
                    unlimitedStock: true,
                    updatedAt: "updated_at",
                    visibility: PlanListItemVisibility.visible
                )
            ],
            pageInfo: ListPlansResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.plans.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                  "adaptive_pricing_enabled": true,
                  "allow_multiple_quantity": false,
                  "attributes": {
                    "key": "value"
                  },
                  "billing_period": 30,
                  "billing_type": "renewal",
                  "cancel_discount_intervals": 1.1,
                  "cancel_discount_percentage": 1.1,
                  "checkout_styling": {
                    "key": "value"
                  },
                  "collect_tax": true,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "custom_fields": [
                    {
                      "field_type": "text",
                      "id": "field_xxxxxxxxxxxxxx",
                      "name": "Link your website or main social profile",
                      "order": 1,
                      "placeholder": "https://",
                      "required": false
                    }
                  ],
                  "deletable": true,
                  "description": "description",
                  "effective_payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "expiration_days": 1.1,
                  "formatted_price": "$59.00 / month",
                  "id": "plan_xxxxxxxxxxxxxx",
                  "image": {
                    "key": "value"
                  },
                  "initial_price": 0,
                  "initial_price_due": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "internal_notes": "Maintenance tier. Upsell the interior shampoo add-on at renewal.",
                  "invoice": {
                    "key": "value"
                  },
                  "member_count": 0,
                  "metadata": {
                    "custom_cta": "subscribe",
                    "custom_cta_url": "https://shinetime.example/wash-club"
                  },
                  "offer_cancel_discount": false,
                  "payment_method_configuration": {
                    "key": "value"
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "purchase_url": "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                  "release_method": "buy_now",
                  "renewal_price": 59,
                  "sku": "sku",
                  "split_pay_required_payments": 1.1,
                  "stock": 0,
                  "strike_through_initial_price": 1.1,
                  "strike_through_renewal_price": 1.1,
                  "tax_type": "inclusive",
                  "three_ds_level": "mandate_challenge",
                  "title": "Deprecated plan update",
                  "trial_period_days": 1.1,
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
                title: "Acme Bookkeeping"
            )),
            adaptivePricingEnabled: true,
            allowMultipleQuantity: false,
            attributes: Nullable<[String: Nullable<String>]>.value([
                "key": Nullable<String>.value("value")
            ]),
            billingPeriod: Nullable<Double>.value(30),
            billingType: PlanBillingType.renewal,
            cancelDiscountIntervals: Nullable<Double>.value(1.1),
            cancelDiscountPercentage: Nullable<Double>.value(1.1),
            checkoutStyling: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            collectTax: true,
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: PlanCurrency.usd,
            customFields: [
                PlanCustomField(
                    fieldType: PlanCustomFieldFieldType.text,
                    id: "field_xxxxxxxxxxxxxx",
                    name: "Link your website or main social profile",
                    order: 1,
                    placeholder: Nullable<String>.value("https://"),
                    required: false
                )
            ],
            deletable: Nullable<Bool>.value(true),
            description: Nullable<String>.value("description"),
            effectivePaymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            expirationDays: Nullable<Double>.value(1.1),
            formattedPrice: "$59.00 / month",
            id: "plan_xxxxxxxxxxxxxx",
            image: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            initialPrice: 0,
            initialPriceDue: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            internalNotes: Nullable<String>.value("Maintenance tier. Upsell the interior shampoo add-on at renewal."),
            invoice: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            memberCount: Nullable<Double>.value(0),
            metadata: Nullable<[String: JSONValue]>.value([
                "custom_cta": JSONValue.string("subscribe"), 
                "custom_cta_url": JSONValue.string("https://shinetime.example/wash-club")
            ]),
            offerCancelDiscount: Nullable<Bool>.value(false),
            paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            product: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("prod_xxxxxxxxxxxxxx"), 
                "title": JSONValue.string("Ceramic Coating Package")
            ]),
            purchaseUrl: "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
            releaseMethod: PlanReleaseMethod.buyNow,
            renewalPrice: 59,
            sku: Nullable<String>.value("sku"),
            splitPayRequiredPayments: Nullable<Double>.value(1.1),
            stock: Nullable<Double>.value(0),
            strikeThroughInitialPrice: Nullable<Double>.value(1.1),
            strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
            taxType: PlanTaxType.inclusive,
            threeDsLevel: Nullable<PlanThreeDsLevel>.value(PlanThreeDsLevel.mandateChallenge),
            title: Nullable<String>.value("Deprecated plan update"),
            trialPeriodDays: Nullable<Double>.value(1.1),
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
                  "adaptive_pricing_enabled": true,
                  "allow_multiple_quantity": true,
                  "attributes": {
                    "attributes": "attributes"
                  },
                  "billing_period": 1.1,
                  "billing_type": "renewal",
                  "cancel_discount_intervals": 1.1,
                  "cancel_discount_percentage": 1.1,
                  "checkout_styling": {
                    "checkout_styling": {
                      "key": "value"
                    }
                  },
                  "collect_tax": true,
                  "created_at": "created_at",
                  "currency": "usd",
                  "custom_fields": [
                    {
                      "field_type": "text",
                      "id": "id",
                      "name": "name",
                      "order": 1.1,
                      "placeholder": "placeholder",
                      "required": true
                    },
                    {
                      "field_type": "text",
                      "id": "id",
                      "name": "name",
                      "order": 1.1,
                      "placeholder": "placeholder",
                      "required": true
                    }
                  ],
                  "deletable": true,
                  "description": "description",
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
                  "expiration_days": 1.1,
                  "formatted_price": "formatted_price",
                  "id": "id",
                  "image": {
                    "image": {
                      "key": "value"
                    }
                  },
                  "initial_price": 1.1,
                  "initial_price_due": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "internal_notes": "internal_notes",
                  "invoice": {
                    "invoice": {
                      "key": "value"
                    }
                  },
                  "member_count": 1.1,
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "offer_cancel_discount": true,
                  "payment_method_configuration": {
                    "payment_method_configuration": {
                      "key": "value"
                    }
                  },
                  "product": {
                    "product": {
                      "key": "value"
                    }
                  },
                  "purchase_url": "purchase_url",
                  "release_method": "buy_now",
                  "renewal_price": 1.1,
                  "sku": "sku",
                  "split_pay_required_payments": 1.1,
                  "stock": 1.1,
                  "strike_through_initial_price": 1.1,
                  "strike_through_renewal_price": 1.1,
                  "tax_type": "inclusive",
                  "three_ds_level": "mandate_challenge",
                  "title": "title",
                  "trial_period_days": 1.1,
                  "unlimited_stock": true,
                  "updated_at": "updated_at",
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
                id: "id",
                title: "title"
            )),
            adaptivePricingEnabled: true,
            allowMultipleQuantity: true,
            attributes: Nullable<[String: Nullable<String>]>.value([
                "attributes": Nullable<String>.value("attributes")
            ]),
            billingPeriod: Nullable<Double>.value(1.1),
            billingType: PlanBillingType.renewal,
            cancelDiscountIntervals: Nullable<Double>.value(1.1),
            cancelDiscountPercentage: Nullable<Double>.value(1.1),
            checkoutStyling: Nullable<[String: JSONValue]>.value([
                "checkout_styling": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            collectTax: true,
            createdAt: "created_at",
            currency: PlanCurrency.usd,
            customFields: [
                PlanCustomField(
                    fieldType: PlanCustomFieldFieldType.text,
                    id: "id",
                    name: "name",
                    order: 1.1,
                    placeholder: Nullable<String>.value("placeholder"),
                    required: true
                ),
                PlanCustomField(
                    fieldType: PlanCustomFieldFieldType.text,
                    id: "id",
                    name: "name",
                    order: 1.1,
                    placeholder: Nullable<String>.value("placeholder"),
                    required: true
                )
            ],
            deletable: Nullable<Bool>.value(true),
            description: Nullable<String>.value("description"),
            effectivePaymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "disabled",
                    "disabled"
                ],
                enabled: [
                    "enabled",
                    "enabled"
                ],
                includePlatformDefaults: true
            )),
            expirationDays: Nullable<Double>.value(1.1),
            formattedPrice: "formatted_price",
            id: "id",
            image: Nullable<[String: JSONValue]>.value([
                "image": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            initialPrice: 1.1,
            initialPriceDue: Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            ),
            internalNotes: Nullable<String>.value("internal_notes"),
            invoice: Nullable<[String: JSONValue]>.value([
                "invoice": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            memberCount: Nullable<Double>.value(1.1),
            metadata: Nullable<[String: JSONValue]>.value([
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            offerCancelDiscount: Nullable<Bool>.value(true),
            paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                "payment_method_configuration": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            product: Nullable<[String: JSONValue]>.value([
                "product": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            purchaseUrl: "purchase_url",
            releaseMethod: PlanReleaseMethod.buyNow,
            renewalPrice: 1.1,
            sku: Nullable<String>.value("sku"),
            splitPayRequiredPayments: Nullable<Double>.value(1.1),
            stock: Nullable<Double>.value(1.1),
            strikeThroughInitialPrice: Nullable<Double>.value(1.1),
            strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
            taxType: PlanTaxType.inclusive,
            threeDsLevel: Nullable<PlanThreeDsLevel>.value(PlanThreeDsLevel.mandateChallenge),
            title: Nullable<String>.value("title"),
            trialPeriodDays: Nullable<Double>.value(1.1),
            unlimitedStock: true,
            updatedAt: "updated_at",
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
                    "title": "Acme Bookkeeping"
                  },
                  "adaptive_pricing_enabled": true,
                  "allow_multiple_quantity": false,
                  "attributes": {
                    "key": "value"
                  },
                  "billing_period": 30,
                  "billing_type": "renewal",
                  "cancel_discount_intervals": 1.1,
                  "cancel_discount_percentage": 1.1,
                  "checkout_styling": {
                    "key": "value"
                  },
                  "collect_tax": true,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "custom_fields": [
                    {
                      "field_type": "text",
                      "id": "field_xxxxxxxxxxxxxx",
                      "name": "Link your website or main social profile",
                      "order": 1,
                      "placeholder": "https://",
                      "required": false
                    }
                  ],
                  "deletable": true,
                  "description": "description",
                  "effective_payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "expiration_days": 1.1,
                  "formatted_price": "$59.00 / month",
                  "id": "plan_xxxxxxxxxxxxxx",
                  "image": {
                    "key": "value"
                  },
                  "initial_price": 0,
                  "initial_price_due": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "internal_notes": "Maintenance tier. Upsell the interior shampoo add-on at renewal.",
                  "invoice": {
                    "key": "value"
                  },
                  "member_count": 0,
                  "metadata": {
                    "custom_cta": "subscribe",
                    "custom_cta_url": "https://shinetime.example/wash-club"
                  },
                  "offer_cancel_discount": false,
                  "payment_method_configuration": {
                    "key": "value"
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "purchase_url": "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                  "release_method": "buy_now",
                  "renewal_price": 59,
                  "sku": "sku",
                  "split_pay_required_payments": 1.1,
                  "stock": 0,
                  "strike_through_initial_price": 1.1,
                  "strike_through_renewal_price": 1.1,
                  "tax_type": "inclusive",
                  "three_ds_level": "mandate_challenge",
                  "title": "Deprecated plan update",
                  "trial_period_days": 1.1,
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
                title: "Acme Bookkeeping"
            )),
            adaptivePricingEnabled: true,
            allowMultipleQuantity: false,
            attributes: Nullable<[String: Nullable<String>]>.value([
                "key": Nullable<String>.value("value")
            ]),
            billingPeriod: Nullable<Double>.value(30),
            billingType: PlanBillingType.renewal,
            cancelDiscountIntervals: Nullable<Double>.value(1.1),
            cancelDiscountPercentage: Nullable<Double>.value(1.1),
            checkoutStyling: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            collectTax: true,
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: PlanCurrency.usd,
            customFields: [
                PlanCustomField(
                    fieldType: PlanCustomFieldFieldType.text,
                    id: "field_xxxxxxxxxxxxxx",
                    name: "Link your website or main social profile",
                    order: 1,
                    placeholder: Nullable<String>.value("https://"),
                    required: false
                )
            ],
            deletable: Nullable<Bool>.value(true),
            description: Nullable<String>.value("description"),
            effectivePaymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            expirationDays: Nullable<Double>.value(1.1),
            formattedPrice: "$59.00 / month",
            id: "plan_xxxxxxxxxxxxxx",
            image: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            initialPrice: 0,
            initialPriceDue: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            internalNotes: Nullable<String>.value("Maintenance tier. Upsell the interior shampoo add-on at renewal."),
            invoice: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            memberCount: Nullable<Double>.value(0),
            metadata: Nullable<[String: JSONValue]>.value([
                "custom_cta": JSONValue.string("subscribe"), 
                "custom_cta_url": JSONValue.string("https://shinetime.example/wash-club")
            ]),
            offerCancelDiscount: Nullable<Bool>.value(false),
            paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            product: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("prod_xxxxxxxxxxxxxx"), 
                "title": JSONValue.string("Ceramic Coating Package")
            ]),
            purchaseUrl: "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
            releaseMethod: PlanReleaseMethod.buyNow,
            renewalPrice: 59,
            sku: Nullable<String>.value("sku"),
            splitPayRequiredPayments: Nullable<Double>.value(1.1),
            stock: Nullable<Double>.value(0),
            strikeThroughInitialPrice: Nullable<Double>.value(1.1),
            strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
            taxType: PlanTaxType.inclusive,
            threeDsLevel: Nullable<PlanThreeDsLevel>.value(PlanThreeDsLevel.mandateChallenge),
            title: Nullable<String>.value("Deprecated plan update"),
            trialPeriodDays: Nullable<Double>.value(1.1),
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
                  "adaptive_pricing_enabled": true,
                  "allow_multiple_quantity": true,
                  "attributes": {
                    "attributes": "attributes"
                  },
                  "billing_period": 1.1,
                  "billing_type": "renewal",
                  "cancel_discount_intervals": 1.1,
                  "cancel_discount_percentage": 1.1,
                  "checkout_styling": {
                    "checkout_styling": {
                      "key": "value"
                    }
                  },
                  "collect_tax": true,
                  "created_at": "created_at",
                  "currency": "usd",
                  "custom_fields": [
                    {
                      "field_type": "text",
                      "id": "id",
                      "name": "name",
                      "order": 1.1,
                      "placeholder": "placeholder",
                      "required": true
                    },
                    {
                      "field_type": "text",
                      "id": "id",
                      "name": "name",
                      "order": 1.1,
                      "placeholder": "placeholder",
                      "required": true
                    }
                  ],
                  "deletable": true,
                  "description": "description",
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
                  "expiration_days": 1.1,
                  "formatted_price": "formatted_price",
                  "id": "id",
                  "image": {
                    "image": {
                      "key": "value"
                    }
                  },
                  "initial_price": 1.1,
                  "initial_price_due": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "internal_notes": "internal_notes",
                  "invoice": {
                    "invoice": {
                      "key": "value"
                    }
                  },
                  "member_count": 1.1,
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "offer_cancel_discount": true,
                  "payment_method_configuration": {
                    "payment_method_configuration": {
                      "key": "value"
                    }
                  },
                  "product": {
                    "product": {
                      "key": "value"
                    }
                  },
                  "purchase_url": "purchase_url",
                  "release_method": "buy_now",
                  "renewal_price": 1.1,
                  "sku": "sku",
                  "split_pay_required_payments": 1.1,
                  "stock": 1.1,
                  "strike_through_initial_price": 1.1,
                  "strike_through_renewal_price": 1.1,
                  "tax_type": "inclusive",
                  "three_ds_level": "mandate_challenge",
                  "title": "title",
                  "trial_period_days": 1.1,
                  "unlimited_stock": true,
                  "updated_at": "updated_at",
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
                id: "id",
                title: "title"
            )),
            adaptivePricingEnabled: true,
            allowMultipleQuantity: true,
            attributes: Nullable<[String: Nullable<String>]>.value([
                "attributes": Nullable<String>.value("attributes")
            ]),
            billingPeriod: Nullable<Double>.value(1.1),
            billingType: PlanBillingType.renewal,
            cancelDiscountIntervals: Nullable<Double>.value(1.1),
            cancelDiscountPercentage: Nullable<Double>.value(1.1),
            checkoutStyling: Nullable<[String: JSONValue]>.value([
                "checkout_styling": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            collectTax: true,
            createdAt: "created_at",
            currency: PlanCurrency.usd,
            customFields: [
                PlanCustomField(
                    fieldType: PlanCustomFieldFieldType.text,
                    id: "id",
                    name: "name",
                    order: 1.1,
                    placeholder: Nullable<String>.value("placeholder"),
                    required: true
                ),
                PlanCustomField(
                    fieldType: PlanCustomFieldFieldType.text,
                    id: "id",
                    name: "name",
                    order: 1.1,
                    placeholder: Nullable<String>.value("placeholder"),
                    required: true
                )
            ],
            deletable: Nullable<Bool>.value(true),
            description: Nullable<String>.value("description"),
            effectivePaymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "disabled",
                    "disabled"
                ],
                enabled: [
                    "enabled",
                    "enabled"
                ],
                includePlatformDefaults: true
            )),
            expirationDays: Nullable<Double>.value(1.1),
            formattedPrice: "formatted_price",
            id: "id",
            image: Nullable<[String: JSONValue]>.value([
                "image": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            initialPrice: 1.1,
            initialPriceDue: Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            ),
            internalNotes: Nullable<String>.value("internal_notes"),
            invoice: Nullable<[String: JSONValue]>.value([
                "invoice": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            memberCount: Nullable<Double>.value(1.1),
            metadata: Nullable<[String: JSONValue]>.value([
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            offerCancelDiscount: Nullable<Bool>.value(true),
            paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                "payment_method_configuration": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            product: Nullable<[String: JSONValue]>.value([
                "product": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            purchaseUrl: "purchase_url",
            releaseMethod: PlanReleaseMethod.buyNow,
            renewalPrice: 1.1,
            sku: Nullable<String>.value("sku"),
            splitPayRequiredPayments: Nullable<Double>.value(1.1),
            stock: Nullable<Double>.value(1.1),
            strikeThroughInitialPrice: Nullable<Double>.value(1.1),
            strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
            taxType: PlanTaxType.inclusive,
            threeDsLevel: Nullable<PlanThreeDsLevel>.value(PlanThreeDsLevel.mandateChallenge),
            title: Nullable<String>.value("title"),
            trialPeriodDays: Nullable<Double>.value(1.1),
            unlimitedStock: true,
            updatedAt: "updated_at",
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
        let expectedResponse = DeletePlansResponse(
            deleted: true,
            id: "id"
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
                    "title": "Acme Bookkeeping"
                  },
                  "adaptive_pricing_enabled": true,
                  "allow_multiple_quantity": false,
                  "attributes": {
                    "key": "value"
                  },
                  "billing_period": 30,
                  "billing_type": "renewal",
                  "cancel_discount_intervals": 1.1,
                  "cancel_discount_percentage": 1.1,
                  "checkout_styling": {
                    "key": "value"
                  },
                  "collect_tax": true,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "custom_fields": [
                    {
                      "field_type": "text",
                      "id": "field_xxxxxxxxxxxxxx",
                      "name": "Link your website or main social profile",
                      "order": 1,
                      "placeholder": "https://",
                      "required": false
                    }
                  ],
                  "deletable": true,
                  "description": "description",
                  "effective_payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "expiration_days": 1.1,
                  "formatted_price": "$59.00 / month",
                  "id": "plan_xxxxxxxxxxxxxx",
                  "image": {
                    "key": "value"
                  },
                  "initial_price": 0,
                  "initial_price_due": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "internal_notes": "Maintenance tier. Upsell the interior shampoo add-on at renewal.",
                  "invoice": {
                    "key": "value"
                  },
                  "member_count": 0,
                  "metadata": {
                    "custom_cta": "subscribe",
                    "custom_cta_url": "https://shinetime.example/wash-club"
                  },
                  "offer_cancel_discount": false,
                  "payment_method_configuration": {
                    "key": "value"
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "purchase_url": "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                  "release_method": "buy_now",
                  "renewal_price": 59,
                  "sku": "sku",
                  "split_pay_required_payments": 1.1,
                  "stock": 0,
                  "strike_through_initial_price": 1.1,
                  "strike_through_renewal_price": 1.1,
                  "tax_type": "inclusive",
                  "three_ds_level": "mandate_challenge",
                  "title": "Deprecated plan update",
                  "trial_period_days": 1.1,
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
                title: "Acme Bookkeeping"
            )),
            adaptivePricingEnabled: true,
            allowMultipleQuantity: false,
            attributes: Nullable<[String: Nullable<String>]>.value([
                "key": Nullable<String>.value("value")
            ]),
            billingPeriod: Nullable<Double>.value(30),
            billingType: PlanBillingType.renewal,
            cancelDiscountIntervals: Nullable<Double>.value(1.1),
            cancelDiscountPercentage: Nullable<Double>.value(1.1),
            checkoutStyling: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            collectTax: true,
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: PlanCurrency.usd,
            customFields: [
                PlanCustomField(
                    fieldType: PlanCustomFieldFieldType.text,
                    id: "field_xxxxxxxxxxxxxx",
                    name: "Link your website or main social profile",
                    order: 1,
                    placeholder: Nullable<String>.value("https://"),
                    required: false
                )
            ],
            deletable: Nullable<Bool>.value(true),
            description: Nullable<String>.value("description"),
            effectivePaymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            expirationDays: Nullable<Double>.value(1.1),
            formattedPrice: "$59.00 / month",
            id: "plan_xxxxxxxxxxxxxx",
            image: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            initialPrice: 0,
            initialPriceDue: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            internalNotes: Nullable<String>.value("Maintenance tier. Upsell the interior shampoo add-on at renewal."),
            invoice: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            memberCount: Nullable<Double>.value(0),
            metadata: Nullable<[String: JSONValue]>.value([
                "custom_cta": JSONValue.string("subscribe"), 
                "custom_cta_url": JSONValue.string("https://shinetime.example/wash-club")
            ]),
            offerCancelDiscount: Nullable<Bool>.value(false),
            paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            product: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("prod_xxxxxxxxxxxxxx"), 
                "title": JSONValue.string("Ceramic Coating Package")
            ]),
            purchaseUrl: "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
            releaseMethod: PlanReleaseMethod.buyNow,
            renewalPrice: 59,
            sku: Nullable<String>.value("sku"),
            splitPayRequiredPayments: Nullable<Double>.value(1.1),
            stock: Nullable<Double>.value(0),
            strikeThroughInitialPrice: Nullable<Double>.value(1.1),
            strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
            taxType: PlanTaxType.inclusive,
            threeDsLevel: Nullable<PlanThreeDsLevel>.value(PlanThreeDsLevel.mandateChallenge),
            title: Nullable<String>.value("Deprecated plan update"),
            trialPeriodDays: Nullable<Double>.value(1.1),
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

    @Test func update2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "adaptive_pricing_enabled": true,
                  "allow_multiple_quantity": true,
                  "attributes": {
                    "attributes": "attributes"
                  },
                  "billing_period": 1.1,
                  "billing_type": "renewal",
                  "cancel_discount_intervals": 1.1,
                  "cancel_discount_percentage": 1.1,
                  "checkout_styling": {
                    "checkout_styling": {
                      "key": "value"
                    }
                  },
                  "collect_tax": true,
                  "created_at": "created_at",
                  "currency": "usd",
                  "custom_fields": [
                    {
                      "field_type": "text",
                      "id": "id",
                      "name": "name",
                      "order": 1.1,
                      "placeholder": "placeholder",
                      "required": true
                    },
                    {
                      "field_type": "text",
                      "id": "id",
                      "name": "name",
                      "order": 1.1,
                      "placeholder": "placeholder",
                      "required": true
                    }
                  ],
                  "deletable": true,
                  "description": "description",
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
                  "expiration_days": 1.1,
                  "formatted_price": "formatted_price",
                  "id": "id",
                  "image": {
                    "image": {
                      "key": "value"
                    }
                  },
                  "initial_price": 1.1,
                  "initial_price_due": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "internal_notes": "internal_notes",
                  "invoice": {
                    "invoice": {
                      "key": "value"
                    }
                  },
                  "member_count": 1.1,
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "offer_cancel_discount": true,
                  "payment_method_configuration": {
                    "payment_method_configuration": {
                      "key": "value"
                    }
                  },
                  "product": {
                    "product": {
                      "key": "value"
                    }
                  },
                  "purchase_url": "purchase_url",
                  "release_method": "buy_now",
                  "renewal_price": 1.1,
                  "sku": "sku",
                  "split_pay_required_payments": 1.1,
                  "stock": 1.1,
                  "strike_through_initial_price": 1.1,
                  "strike_through_renewal_price": 1.1,
                  "tax_type": "inclusive",
                  "three_ds_level": "mandate_challenge",
                  "title": "title",
                  "trial_period_days": 1.1,
                  "unlimited_stock": true,
                  "updated_at": "updated_at",
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
                id: "id",
                title: "title"
            )),
            adaptivePricingEnabled: true,
            allowMultipleQuantity: true,
            attributes: Nullable<[String: Nullable<String>]>.value([
                "attributes": Nullable<String>.value("attributes")
            ]),
            billingPeriod: Nullable<Double>.value(1.1),
            billingType: PlanBillingType.renewal,
            cancelDiscountIntervals: Nullable<Double>.value(1.1),
            cancelDiscountPercentage: Nullable<Double>.value(1.1),
            checkoutStyling: Nullable<[String: JSONValue]>.value([
                "checkout_styling": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            collectTax: true,
            createdAt: "created_at",
            currency: PlanCurrency.usd,
            customFields: [
                PlanCustomField(
                    fieldType: PlanCustomFieldFieldType.text,
                    id: "id",
                    name: "name",
                    order: 1.1,
                    placeholder: Nullable<String>.value("placeholder"),
                    required: true
                ),
                PlanCustomField(
                    fieldType: PlanCustomFieldFieldType.text,
                    id: "id",
                    name: "name",
                    order: 1.1,
                    placeholder: Nullable<String>.value("placeholder"),
                    required: true
                )
            ],
            deletable: Nullable<Bool>.value(true),
            description: Nullable<String>.value("description"),
            effectivePaymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "disabled",
                    "disabled"
                ],
                enabled: [
                    "enabled",
                    "enabled"
                ],
                includePlatformDefaults: true
            )),
            expirationDays: Nullable<Double>.value(1.1),
            formattedPrice: "formatted_price",
            id: "id",
            image: Nullable<[String: JSONValue]>.value([
                "image": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            initialPrice: 1.1,
            initialPriceDue: Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            ),
            internalNotes: Nullable<String>.value("internal_notes"),
            invoice: Nullable<[String: JSONValue]>.value([
                "invoice": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            memberCount: Nullable<Double>.value(1.1),
            metadata: Nullable<[String: JSONValue]>.value([
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            offerCancelDiscount: Nullable<Bool>.value(true),
            paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                "payment_method_configuration": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            product: Nullable<[String: JSONValue]>.value([
                "product": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            purchaseUrl: "purchase_url",
            releaseMethod: PlanReleaseMethod.buyNow,
            renewalPrice: 1.1,
            sku: Nullable<String>.value("sku"),
            splitPayRequiredPayments: Nullable<Double>.value(1.1),
            stock: Nullable<Double>.value(1.1),
            strikeThroughInitialPrice: Nullable<Double>.value(1.1),
            strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
            taxType: PlanTaxType.inclusive,
            threeDsLevel: Nullable<PlanThreeDsLevel>.value(PlanThreeDsLevel.mandateChallenge),
            title: Nullable<String>.value("title"),
            trialPeriodDays: Nullable<Double>.value(1.1),
            unlimitedStock: true,
            updatedAt: "updated_at",
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
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func calculateTax2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "currency": "currency",
                  "status": "calculated",
                  "subtotal": 1,
                  "tax_amount": 1,
                  "tax_behavior": "exclusive",
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
        let expectedResponse = CalculateTaxPlansResponse(
            currency: "currency",
            status: CalculateTaxPlansResponseStatus.calculated,
            subtotal: 1,
            taxAmount: 1,
            taxBehavior: CalculateTaxPlansResponseTaxBehavior.exclusive,
            total: 1
        )
        let response = try await client.plans.calculateTax(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}