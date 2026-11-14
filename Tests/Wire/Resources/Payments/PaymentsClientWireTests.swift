import Foundation
import Testing
import WhopSDK

@Suite("PaymentsClient Wire Tests") struct PaymentsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "amount_after_fees": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "auto_capture_at": "auto_capture_at",
                      "auto_refunded": false,
                      "billing_address": {
                        "city": "Austin",
                        "country": "US",
                        "line1": "1114 Bouldin Ave",
                        "line2": "Unit B",
                        "name": "Dana Whitfield",
                        "postal_code": "78704",
                        "state": "TX"
                      },
                      "billing_reason": "subscription_create",
                      "capture_expires_at": "capture_expires_at",
                      "checkout_configuration_id": "checkout_configuration_id",
                      "checkout_origin": "checkout_origin",
                      "checkout_surface": "hosted_checkout",
                      "client_secret": "pay_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "currency": "usd",
                      "customer_email": "marcus@shinetime.example",
                      "customer_phone": "+xxxxxxxxxxx",
                      "decline_code": "insufficient_funds",
                      "dispute_alerted_at": "dispute_alerted_at",
                      "dispute_created_at": "dispute_created_at",
                      "failure_message": "failure_message",
                      "financing_installments_count": 1.1,
                      "holds": [
                        {
                          "amount": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": null,
                          "release_at": null,
                          "type": "reserve"
                        }
                      ],
                      "id": "pay_xxxxxxxxxxxxxx",
                      "ip_address": "ip_address",
                      "last_payment_attempt_at": "last_payment_attempt_at",
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
                      "member_id": "mber_xxxxxxxxxxxxxx",
                      "membership_id": "mem_xxxxxxxxxxxxxx",
                      "metadata": {
                        "order_ref": "SHINE-4417"
                      },
                      "missing_tracking": false,
                      "needs_tracking": false,
                      "next_payment_attempt_at": "next_payment_attempt_at",
                      "paid_at": "2026-01-01T12:00:00.000Z",
                      "payment_instrument": {
                        "card": {
                          "brand": "visa",
                          "exp_month": 10,
                          "exp_year": 2031,
                          "issuer_identification_number": "41111111",
                          "last4": "4242",
                          "network_transaction_id": "016153570198200"
                        },
                        "display_name": "Visa •••• 4242",
                        "icons": {
                          "card": {
                            "dark": {
                              "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                              "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                              "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                              "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            },
                            "light": {
                              "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                              "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                              "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                              "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            }
                          },
                          "square": {
                            "dark": {
                              "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                              "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                              "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                              "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            },
                            "light": {
                              "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                              "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                              "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                              "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            }
                          }
                        },
                        "installment_count": null,
                        "payment_method_type": "card"
                      },
                      "payment_method_id": "payt_xxxxxxxxxxxxxx",
                      "payment_method_type": "acss_debit",
                      "payment_rule_matches": [
                        {
                          "action": "allow",
                          "id": "id",
                          "name": null
                        }
                      ],
                      "payments_failed": 0,
                      "presentment_refunded_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "presentment_tax_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "presentment_total": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "promo_code_id": "promo_code_id",
                      "quote_id": "quote_id",
                      "recovery_url": "recovery_url",
                      "refundable": false,
                      "refunded_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "refunded_at": "refunded_at",
                      "response_due_at": "response_due_at",
                      "retryable": true,
                      "risk_score": 1.1,
                      "risk_signals": {
                        "key": "value"
                      },
                      "settlement_time_at": "settlement_time_at",
                      "shipment_id": "shipment_id",
                      "shipping_address": {
                        "city": "Austin",
                        "country": "US",
                        "line1": "1114 Bouldin Ave",
                        "line2": "Unit B",
                        "name": "Dana Whitfield",
                        "postal_code": "78704",
                        "state": "TX"
                      },
                      "status": "draft",
                      "substatus": "succeeded",
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
                      "tax_behavior": "exclusive",
                      "tax_refunded_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "three_ds_verified": false,
                      "total": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "usd_total": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "user": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "danawhitfield"
                      },
                      "user_agent": "user_agent",
                      "variant_id": "plan_xxxxxxxxxxxxxx",
                      "verification_checks": {
                        "address_line1": "PASS",
                        "arn": "74123456789",
                        "authorization_code": "A1B2C3",
                        "card_holder_name": "PASS",
                        "card_security_code": "PASS",
                        "zip_code": "PASS"
                      },
                      "voidable": false,
                      "wuid": "wuid"
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
        let expectedResponse = ListPaymentsResponse(
            data: [
                Payment(
                    accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    amountAfterFees: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    autoCaptureAt: Nullable<String>.value("auto_capture_at"),
                    autoRefunded: false,
                    billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                        city: Nullable<String>.value("Austin"),
                        country: Nullable<String>.value("US"),
                        line1: Nullable<String>.value("1114 Bouldin Ave"),
                        line2: Nullable<String>.value("Unit B"),
                        name: Nullable<String>.value("Dana Whitfield"),
                        postalCode: Nullable<String>.value("78704"),
                        state: Nullable<String>.value("TX")
                    )),
                    billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
                    captureExpiresAt: Nullable<String>.value("capture_expires_at"),
                    checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
                    checkoutOrigin: Nullable<String>.value("checkout_origin"),
                    checkoutSurface: Nullable<PaymentCheckoutSurface>.value(PaymentCheckoutSurface.hostedCheckout),
                    clientSecret: Nullable<String>.value("pay_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currency: Currencies.usd,
                    customerEmail: Nullable<String>.value("marcus@shinetime.example"),
                    customerPhone: Nullable<String>.value("+xxxxxxxxxxx"),
                    declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
                    disputeAlertedAt: Nullable<String>.value("dispute_alerted_at"),
                    disputeCreatedAt: Nullable<String>.value("dispute_created_at"),
                    failureMessage: Nullable<String>.value("failure_message"),
                    financingInstallmentsCount: Nullable<Double>.value(1.1),
                    holds: [
                        PaymentHold(
                            amount: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            percentage: .null,
                            releaseAt: .null,
                            type: PaymentHoldType.reserve
                        )
                    ],
                    id: "pay_xxxxxxxxxxxxxx",
                    ipAddress: Nullable<String>.value("ip_address"),
                    lastPaymentAttemptAt: Nullable<String>.value("last_payment_attempt_at"),
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
                    memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                    membershipId: Nullable<String>.value("mem_xxxxxxxxxxxxxx"),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "order_ref": JSONValue.string("SHINE-4417")
                    ]),
                    missingTracking: Nullable<Bool>.value(false),
                    needsTracking: Nullable<Bool>.value(false),
                    nextPaymentAttemptAt: Nullable<String>.value("next_payment_attempt_at"),
                    paidAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                        card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                            brand: Nullable<String>.value("visa"),
                            expMonth: Nullable<Double>.value(10),
                            expYear: Nullable<Double>.value(2031),
                            issuerIdentificationNumber: Nullable<String>.value("41111111"),
                            last4: Nullable<String>.value("4242"),
                            networkTransactionId: Nullable<String>.value("016153570198200")
                        )),
                        displayName: "Visa •••• 4242",
                        icons: PaymentMethodIcons(
                            card: PaymentMethodIconVariants(
                                dark: PaymentMethodIconFiles(
                                    png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                    png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                    png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                    svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                                ),
                                light: PaymentMethodIconFiles(
                                    png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                    png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                    png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                    svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                                )
                            ),
                            square: PaymentMethodIconVariants(
                                dark: PaymentMethodIconFiles(
                                    png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                    png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                    png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                    svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                                ),
                                light: PaymentMethodIconFiles(
                                    png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                    png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                    png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                    svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                                )
                            )
                        ),
                        installmentCount: .null,
                        paymentMethodType: "card"
                    )),
                    paymentMethodId: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
                    paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
                    paymentRuleMatches: [
                        PaymentRuleMatch(
                            action: PaymentRuleMatchAction.allow,
                            id: "id",
                            name: .null
                        )
                    ],
                    paymentsFailed: 0,
                    presentmentRefundedAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    presentmentTaxAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    presentmentTotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    promoCodeId: Nullable<String>.value("promo_code_id"),
                    quoteId: Nullable<String>.value("quote_id"),
                    recoveryUrl: Nullable<String>.value("recovery_url"),
                    refundable: false,
                    refundedAmount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    refundedAt: Nullable<String>.value("refunded_at"),
                    responseDueAt: Nullable<String>.value("response_due_at"),
                    retryable: true,
                    riskScore: Nullable<Double>.value(1.1),
                    riskSignals: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    settlementTimeAt: Nullable<String>.value("settlement_time_at"),
                    shipmentId: Nullable<String>.value("shipment_id"),
                    shippingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                        city: Nullable<String>.value("Austin"),
                        country: Nullable<String>.value("US"),
                        line1: Nullable<String>.value("1114 Bouldin Ave"),
                        line2: Nullable<String>.value("Unit B"),
                        name: Nullable<String>.value("Dana Whitfield"),
                        postalCode: Nullable<String>.value("78704"),
                        state: Nullable<String>.value("TX")
                    )),
                    status: ReceiptStatus.draft,
                    substatus: FriendlyReceiptStatus.succeeded,
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
                    taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
                    taxRefundedAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    threeDsVerified: false,
                    total: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    usdTotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    user: Nullable<UserSummary>.value(UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    )),
                    userAgent: Nullable<String>.value("user_agent"),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
                    verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                        addressLine1: Nullable<String>.value("PASS"),
                        arn: Nullable<String>.value("74123456789"),
                        authorizationCode: Nullable<String>.value("A1B2C3"),
                        cardHolderName: Nullable<String>.value("PASS"),
                        cardSecurityCode: Nullable<String>.value("PASS"),
                        zipCode: Nullable<String>.value("PASS")
                    )),
                    voidable: false,
                    wuid: Nullable<String>.value("wuid")
                )
            ],
            pageInfo: ListPaymentsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                totalCount: Nullable<Int>.value(1),
                totalCountCapped: true
            )
        )
        let response = try await client.payments.list(
            currencies: [
                "eur"
            ],
            minAmount: 995,
            maxAmount: 995,
            variantIds: [
                "plan_xxxxxxxxxxxxx"
            ],
            productIds: [
                "prod_xxxxxxxxxxxxx"
            ],
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
                      "amount_after_fees": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "auto_capture_at": "auto_capture_at",
                      "auto_refunded": true,
                      "billing_address": {
                        "city": "city",
                        "country": "country",
                        "line1": "line1",
                        "line2": "line2",
                        "name": "name",
                        "postal_code": "postal_code",
                        "state": "state"
                      },
                      "billing_reason": "subscription_create",
                      "capture_expires_at": "capture_expires_at",
                      "checkout_configuration_id": "checkout_configuration_id",
                      "checkout_origin": "checkout_origin",
                      "checkout_surface": "hosted_checkout",
                      "client_secret": "client_secret",
                      "created_at": "created_at",
                      "currency": "usd",
                      "customer_email": "customer_email",
                      "customer_phone": "customer_phone",
                      "decline_code": "insufficient_funds",
                      "dispute_alerted_at": "dispute_alerted_at",
                      "dispute_created_at": "dispute_created_at",
                      "failure_message": "failure_message",
                      "financing_installments_count": 1.1,
                      "holds": [
                        {
                          "amount": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "percentage": 1.1,
                          "release_at": "release_at",
                          "type": "reserve"
                        },
                        {
                          "amount": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "percentage": 1.1,
                          "release_at": "release_at",
                          "type": "reserve"
                        }
                      ],
                      "id": "id",
                      "ip_address": "ip_address",
                      "last_payment_attempt_at": "last_payment_attempt_at",
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
                      "member_id": "member_id",
                      "membership_id": "membership_id",
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "missing_tracking": true,
                      "needs_tracking": true,
                      "next_payment_attempt_at": "next_payment_attempt_at",
                      "paid_at": "paid_at",
                      "payment_instrument": {
                        "card": {
                          "brand": "brand",
                          "exp_month": 1.1,
                          "exp_year": 1.1,
                          "issuer_identification_number": "issuer_identification_number",
                          "last4": "last4",
                          "network_transaction_id": "network_transaction_id"
                        },
                        "display_name": "display_name",
                        "icons": {
                          "card": {
                            "dark": {
                              "png_1x": "png_1x",
                              "png_2x": "png_2x",
                              "png_4x": "png_4x",
                              "svg": "svg"
                            },
                            "light": {
                              "png_1x": "png_1x",
                              "png_2x": "png_2x",
                              "png_4x": "png_4x",
                              "svg": "svg"
                            }
                          },
                          "square": {
                            "dark": {
                              "png_1x": "png_1x",
                              "png_2x": "png_2x",
                              "png_4x": "png_4x",
                              "svg": "svg"
                            },
                            "light": {
                              "png_1x": "png_1x",
                              "png_2x": "png_2x",
                              "png_4x": "png_4x",
                              "svg": "svg"
                            }
                          }
                        },
                        "installment_count": 1.1,
                        "payment_method_type": "payment_method_type"
                      },
                      "payment_method_id": "payment_method_id",
                      "payment_method_type": "acss_debit",
                      "payment_rule_matches": [
                        {
                          "action": "allow",
                          "id": "id",
                          "name": "name"
                        },
                        {
                          "action": "allow",
                          "id": "id",
                          "name": "name"
                        }
                      ],
                      "payments_failed": 1.1,
                      "presentment_refunded_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "presentment_tax_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "presentment_total": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "product_id": "product_id",
                      "promo_code_id": "promo_code_id",
                      "quote_id": "quote_id",
                      "recovery_url": "recovery_url",
                      "refundable": true,
                      "refunded_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "refunded_at": "refunded_at",
                      "response_due_at": "response_due_at",
                      "retryable": true,
                      "risk_score": 1.1,
                      "risk_signals": {
                        "risk_signals": {
                          "key": "value"
                        }
                      },
                      "settlement_time_at": "settlement_time_at",
                      "shipment_id": "shipment_id",
                      "shipping_address": {
                        "city": "city",
                        "country": "country",
                        "line1": "line1",
                        "line2": "line2",
                        "name": "name",
                        "postal_code": "postal_code",
                        "state": "state"
                      },
                      "status": "draft",
                      "substatus": "succeeded",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "tax_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "tax_behavior": "exclusive",
                      "tax_refunded_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "three_ds_verified": true,
                      "total": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "updated_at": "updated_at",
                      "usd_total": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "user_agent": "user_agent",
                      "variant_id": "variant_id",
                      "verification_checks": {
                        "address_line1": "address_line1",
                        "arn": "arn",
                        "authorization_code": "authorization_code",
                        "card_holder_name": "card_holder_name",
                        "card_security_code": "card_security_code",
                        "zip_code": "zip_code"
                      },
                      "voidable": true,
                      "wuid": "wuid"
                    },
                    {
                      "account_id": "account_id",
                      "amount_after_fees": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "auto_capture_at": "auto_capture_at",
                      "auto_refunded": true,
                      "billing_address": {
                        "city": "city",
                        "country": "country",
                        "line1": "line1",
                        "line2": "line2",
                        "name": "name",
                        "postal_code": "postal_code",
                        "state": "state"
                      },
                      "billing_reason": "subscription_create",
                      "capture_expires_at": "capture_expires_at",
                      "checkout_configuration_id": "checkout_configuration_id",
                      "checkout_origin": "checkout_origin",
                      "checkout_surface": "hosted_checkout",
                      "client_secret": "client_secret",
                      "created_at": "created_at",
                      "currency": "usd",
                      "customer_email": "customer_email",
                      "customer_phone": "customer_phone",
                      "decline_code": "insufficient_funds",
                      "dispute_alerted_at": "dispute_alerted_at",
                      "dispute_created_at": "dispute_created_at",
                      "failure_message": "failure_message",
                      "financing_installments_count": 1.1,
                      "holds": [
                        {
                          "amount": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "percentage": 1.1,
                          "release_at": "release_at",
                          "type": "reserve"
                        },
                        {
                          "amount": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "percentage": 1.1,
                          "release_at": "release_at",
                          "type": "reserve"
                        }
                      ],
                      "id": "id",
                      "ip_address": "ip_address",
                      "last_payment_attempt_at": "last_payment_attempt_at",
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
                      "member_id": "member_id",
                      "membership_id": "membership_id",
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "missing_tracking": true,
                      "needs_tracking": true,
                      "next_payment_attempt_at": "next_payment_attempt_at",
                      "paid_at": "paid_at",
                      "payment_instrument": {
                        "card": {
                          "brand": "brand",
                          "exp_month": 1.1,
                          "exp_year": 1.1,
                          "issuer_identification_number": "issuer_identification_number",
                          "last4": "last4",
                          "network_transaction_id": "network_transaction_id"
                        },
                        "display_name": "display_name",
                        "icons": {
                          "card": {
                            "dark": {
                              "png_1x": "png_1x",
                              "png_2x": "png_2x",
                              "png_4x": "png_4x",
                              "svg": "svg"
                            },
                            "light": {
                              "png_1x": "png_1x",
                              "png_2x": "png_2x",
                              "png_4x": "png_4x",
                              "svg": "svg"
                            }
                          },
                          "square": {
                            "dark": {
                              "png_1x": "png_1x",
                              "png_2x": "png_2x",
                              "png_4x": "png_4x",
                              "svg": "svg"
                            },
                            "light": {
                              "png_1x": "png_1x",
                              "png_2x": "png_2x",
                              "png_4x": "png_4x",
                              "svg": "svg"
                            }
                          }
                        },
                        "installment_count": 1.1,
                        "payment_method_type": "payment_method_type"
                      },
                      "payment_method_id": "payment_method_id",
                      "payment_method_type": "acss_debit",
                      "payment_rule_matches": [
                        {
                          "action": "allow",
                          "id": "id",
                          "name": "name"
                        },
                        {
                          "action": "allow",
                          "id": "id",
                          "name": "name"
                        }
                      ],
                      "payments_failed": 1.1,
                      "presentment_refunded_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "presentment_tax_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "presentment_total": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "product_id": "product_id",
                      "promo_code_id": "promo_code_id",
                      "quote_id": "quote_id",
                      "recovery_url": "recovery_url",
                      "refundable": true,
                      "refunded_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "refunded_at": "refunded_at",
                      "response_due_at": "response_due_at",
                      "retryable": true,
                      "risk_score": 1.1,
                      "risk_signals": {
                        "risk_signals": {
                          "key": "value"
                        }
                      },
                      "settlement_time_at": "settlement_time_at",
                      "shipment_id": "shipment_id",
                      "shipping_address": {
                        "city": "city",
                        "country": "country",
                        "line1": "line1",
                        "line2": "line2",
                        "name": "name",
                        "postal_code": "postal_code",
                        "state": "state"
                      },
                      "status": "draft",
                      "substatus": "succeeded",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "tax_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "tax_behavior": "exclusive",
                      "tax_refunded_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "three_ds_verified": true,
                      "total": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "updated_at": "updated_at",
                      "usd_total": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "user_agent": "user_agent",
                      "variant_id": "variant_id",
                      "verification_checks": {
                        "address_line1": "address_line1",
                        "arn": "arn",
                        "authorization_code": "authorization_code",
                        "card_holder_name": "card_holder_name",
                        "card_security_code": "card_security_code",
                        "zip_code": "zip_code"
                      },
                      "voidable": true,
                      "wuid": "wuid"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": true,
                    "has_previous_page": true,
                    "start_cursor": "start_cursor",
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
        let expectedResponse = ListPaymentsResponse(
            data: [
                Payment(
                    accountId: Nullable<String>.value("account_id"),
                    amountAfterFees: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    autoCaptureAt: Nullable<String>.value("auto_capture_at"),
                    autoRefunded: true,
                    billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                        city: Nullable<String>.value("city"),
                        country: Nullable<String>.value("country"),
                        line1: Nullable<String>.value("line1"),
                        line2: Nullable<String>.value("line2"),
                        name: Nullable<String>.value("name"),
                        postalCode: Nullable<String>.value("postal_code"),
                        state: Nullable<String>.value("state")
                    )),
                    billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
                    captureExpiresAt: Nullable<String>.value("capture_expires_at"),
                    checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
                    checkoutOrigin: Nullable<String>.value("checkout_origin"),
                    checkoutSurface: Nullable<PaymentCheckoutSurface>.value(PaymentCheckoutSurface.hostedCheckout),
                    clientSecret: Nullable<String>.value("client_secret"),
                    createdAt: "created_at",
                    currency: Currencies.usd,
                    customerEmail: Nullable<String>.value("customer_email"),
                    customerPhone: Nullable<String>.value("customer_phone"),
                    declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
                    disputeAlertedAt: Nullable<String>.value("dispute_alerted_at"),
                    disputeCreatedAt: Nullable<String>.value("dispute_created_at"),
                    failureMessage: Nullable<String>.value("failure_message"),
                    financingInstallmentsCount: Nullable<Double>.value(1.1),
                    holds: [
                        PaymentHold(
                            amount: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            percentage: Nullable<Double>.value(1.1),
                            releaseAt: Nullable<String>.value("release_at"),
                            type: PaymentHoldType.reserve
                        ),
                        PaymentHold(
                            amount: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            percentage: Nullable<Double>.value(1.1),
                            releaseAt: Nullable<String>.value("release_at"),
                            type: PaymentHoldType.reserve
                        )
                    ],
                    id: "id",
                    ipAddress: Nullable<String>.value("ip_address"),
                    lastPaymentAttemptAt: Nullable<String>.value("last_payment_attempt_at"),
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
                    memberId: Nullable<String>.value("member_id"),
                    membershipId: Nullable<String>.value("membership_id"),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    missingTracking: Nullable<Bool>.value(true),
                    needsTracking: Nullable<Bool>.value(true),
                    nextPaymentAttemptAt: Nullable<String>.value("next_payment_attempt_at"),
                    paidAt: Nullable<String>.value("paid_at"),
                    paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                        card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                            brand: Nullable<String>.value("brand"),
                            expMonth: Nullable<Double>.value(1.1),
                            expYear: Nullable<Double>.value(1.1),
                            issuerIdentificationNumber: Nullable<String>.value("issuer_identification_number"),
                            last4: Nullable<String>.value("last4"),
                            networkTransactionId: Nullable<String>.value("network_transaction_id")
                        )),
                        displayName: "display_name",
                        icons: PaymentMethodIcons(
                            card: PaymentMethodIconVariants(
                                dark: PaymentMethodIconFiles(
                                    png1X: "png_1x",
                                    png2X: "png_2x",
                                    png4X: "png_4x",
                                    svg: "svg"
                                ),
                                light: PaymentMethodIconFiles(
                                    png1X: "png_1x",
                                    png2X: "png_2x",
                                    png4X: "png_4x",
                                    svg: "svg"
                                )
                            ),
                            square: PaymentMethodIconVariants(
                                dark: PaymentMethodIconFiles(
                                    png1X: "png_1x",
                                    png2X: "png_2x",
                                    png4X: "png_4x",
                                    svg: "svg"
                                ),
                                light: PaymentMethodIconFiles(
                                    png1X: "png_1x",
                                    png2X: "png_2x",
                                    png4X: "png_4x",
                                    svg: "svg"
                                )
                            )
                        ),
                        installmentCount: Nullable<Double>.value(1.1),
                        paymentMethodType: "payment_method_type"
                    )),
                    paymentMethodId: Nullable<String>.value("payment_method_id"),
                    paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
                    paymentRuleMatches: [
                        PaymentRuleMatch(
                            action: PaymentRuleMatchAction.allow,
                            id: "id",
                            name: Nullable<String>.value("name")
                        ),
                        PaymentRuleMatch(
                            action: PaymentRuleMatchAction.allow,
                            id: "id",
                            name: Nullable<String>.value("name")
                        )
                    ],
                    paymentsFailed: 1.1,
                    presentmentRefundedAmount: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    presentmentTaxAmount: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    presentmentTotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    productId: Nullable<String>.value("product_id"),
                    promoCodeId: Nullable<String>.value("promo_code_id"),
                    quoteId: Nullable<String>.value("quote_id"),
                    recoveryUrl: Nullable<String>.value("recovery_url"),
                    refundable: true,
                    refundedAmount: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    refundedAt: Nullable<String>.value("refunded_at"),
                    responseDueAt: Nullable<String>.value("response_due_at"),
                    retryable: true,
                    riskScore: Nullable<Double>.value(1.1),
                    riskSignals: Nullable<[String: JSONValue]>.value([
                        "risk_signals": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    settlementTimeAt: Nullable<String>.value("settlement_time_at"),
                    shipmentId: Nullable<String>.value("shipment_id"),
                    shippingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                        city: Nullable<String>.value("city"),
                        country: Nullable<String>.value("country"),
                        line1: Nullable<String>.value("line1"),
                        line2: Nullable<String>.value("line2"),
                        name: Nullable<String>.value("name"),
                        postalCode: Nullable<String>.value("postal_code"),
                        state: Nullable<String>.value("state")
                    )),
                    status: ReceiptStatus.draft,
                    substatus: FriendlyReceiptStatus.succeeded,
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    taxAmount: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
                    taxRefundedAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    threeDsVerified: true,
                    total: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    updatedAt: "updated_at",
                    usdTotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    user: Nullable<UserSummary>.value(UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )),
                    userAgent: Nullable<String>.value("user_agent"),
                    variantId: Nullable<String>.value("variant_id"),
                    verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                        addressLine1: Nullable<String>.value("address_line1"),
                        arn: Nullable<String>.value("arn"),
                        authorizationCode: Nullable<String>.value("authorization_code"),
                        cardHolderName: Nullable<String>.value("card_holder_name"),
                        cardSecurityCode: Nullable<String>.value("card_security_code"),
                        zipCode: Nullable<String>.value("zip_code")
                    )),
                    voidable: true,
                    wuid: Nullable<String>.value("wuid")
                ),
                Payment(
                    accountId: Nullable<String>.value("account_id"),
                    amountAfterFees: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    autoCaptureAt: Nullable<String>.value("auto_capture_at"),
                    autoRefunded: true,
                    billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                        city: Nullable<String>.value("city"),
                        country: Nullable<String>.value("country"),
                        line1: Nullable<String>.value("line1"),
                        line2: Nullable<String>.value("line2"),
                        name: Nullable<String>.value("name"),
                        postalCode: Nullable<String>.value("postal_code"),
                        state: Nullable<String>.value("state")
                    )),
                    billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
                    captureExpiresAt: Nullable<String>.value("capture_expires_at"),
                    checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
                    checkoutOrigin: Nullable<String>.value("checkout_origin"),
                    checkoutSurface: Nullable<PaymentCheckoutSurface>.value(PaymentCheckoutSurface.hostedCheckout),
                    clientSecret: Nullable<String>.value("client_secret"),
                    createdAt: "created_at",
                    currency: Currencies.usd,
                    customerEmail: Nullable<String>.value("customer_email"),
                    customerPhone: Nullable<String>.value("customer_phone"),
                    declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
                    disputeAlertedAt: Nullable<String>.value("dispute_alerted_at"),
                    disputeCreatedAt: Nullable<String>.value("dispute_created_at"),
                    failureMessage: Nullable<String>.value("failure_message"),
                    financingInstallmentsCount: Nullable<Double>.value(1.1),
                    holds: [
                        PaymentHold(
                            amount: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            percentage: Nullable<Double>.value(1.1),
                            releaseAt: Nullable<String>.value("release_at"),
                            type: PaymentHoldType.reserve
                        ),
                        PaymentHold(
                            amount: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            percentage: Nullable<Double>.value(1.1),
                            releaseAt: Nullable<String>.value("release_at"),
                            type: PaymentHoldType.reserve
                        )
                    ],
                    id: "id",
                    ipAddress: Nullable<String>.value("ip_address"),
                    lastPaymentAttemptAt: Nullable<String>.value("last_payment_attempt_at"),
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
                    memberId: Nullable<String>.value("member_id"),
                    membershipId: Nullable<String>.value("membership_id"),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    missingTracking: Nullable<Bool>.value(true),
                    needsTracking: Nullable<Bool>.value(true),
                    nextPaymentAttemptAt: Nullable<String>.value("next_payment_attempt_at"),
                    paidAt: Nullable<String>.value("paid_at"),
                    paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                        card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                            brand: Nullable<String>.value("brand"),
                            expMonth: Nullable<Double>.value(1.1),
                            expYear: Nullable<Double>.value(1.1),
                            issuerIdentificationNumber: Nullable<String>.value("issuer_identification_number"),
                            last4: Nullable<String>.value("last4"),
                            networkTransactionId: Nullable<String>.value("network_transaction_id")
                        )),
                        displayName: "display_name",
                        icons: PaymentMethodIcons(
                            card: PaymentMethodIconVariants(
                                dark: PaymentMethodIconFiles(
                                    png1X: "png_1x",
                                    png2X: "png_2x",
                                    png4X: "png_4x",
                                    svg: "svg"
                                ),
                                light: PaymentMethodIconFiles(
                                    png1X: "png_1x",
                                    png2X: "png_2x",
                                    png4X: "png_4x",
                                    svg: "svg"
                                )
                            ),
                            square: PaymentMethodIconVariants(
                                dark: PaymentMethodIconFiles(
                                    png1X: "png_1x",
                                    png2X: "png_2x",
                                    png4X: "png_4x",
                                    svg: "svg"
                                ),
                                light: PaymentMethodIconFiles(
                                    png1X: "png_1x",
                                    png2X: "png_2x",
                                    png4X: "png_4x",
                                    svg: "svg"
                                )
                            )
                        ),
                        installmentCount: Nullable<Double>.value(1.1),
                        paymentMethodType: "payment_method_type"
                    )),
                    paymentMethodId: Nullable<String>.value("payment_method_id"),
                    paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
                    paymentRuleMatches: [
                        PaymentRuleMatch(
                            action: PaymentRuleMatchAction.allow,
                            id: "id",
                            name: Nullable<String>.value("name")
                        ),
                        PaymentRuleMatch(
                            action: PaymentRuleMatchAction.allow,
                            id: "id",
                            name: Nullable<String>.value("name")
                        )
                    ],
                    paymentsFailed: 1.1,
                    presentmentRefundedAmount: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    presentmentTaxAmount: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    presentmentTotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    productId: Nullable<String>.value("product_id"),
                    promoCodeId: Nullable<String>.value("promo_code_id"),
                    quoteId: Nullable<String>.value("quote_id"),
                    recoveryUrl: Nullable<String>.value("recovery_url"),
                    refundable: true,
                    refundedAmount: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    refundedAt: Nullable<String>.value("refunded_at"),
                    responseDueAt: Nullable<String>.value("response_due_at"),
                    retryable: true,
                    riskScore: Nullable<Double>.value(1.1),
                    riskSignals: Nullable<[String: JSONValue]>.value([
                        "risk_signals": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    settlementTimeAt: Nullable<String>.value("settlement_time_at"),
                    shipmentId: Nullable<String>.value("shipment_id"),
                    shippingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                        city: Nullable<String>.value("city"),
                        country: Nullable<String>.value("country"),
                        line1: Nullable<String>.value("line1"),
                        line2: Nullable<String>.value("line2"),
                        name: Nullable<String>.value("name"),
                        postalCode: Nullable<String>.value("postal_code"),
                        state: Nullable<String>.value("state")
                    )),
                    status: ReceiptStatus.draft,
                    substatus: FriendlyReceiptStatus.succeeded,
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    taxAmount: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
                    taxRefundedAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    threeDsVerified: true,
                    total: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    updatedAt: "updated_at",
                    usdTotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    user: Nullable<UserSummary>.value(UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )),
                    userAgent: Nullable<String>.value("user_agent"),
                    variantId: Nullable<String>.value("variant_id"),
                    verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                        addressLine1: Nullable<String>.value("address_line1"),
                        arn: Nullable<String>.value("arn"),
                        authorizationCode: Nullable<String>.value("authorization_code"),
                        cardHolderName: Nullable<String>.value("card_holder_name"),
                        cardSecurityCode: Nullable<String>.value("card_security_code"),
                        zipCode: Nullable<String>.value("zip_code")
                    )),
                    voidable: true,
                    wuid: Nullable<String>.value("wuid")
                )
            ],
            pageInfo: ListPaymentsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor"),
                totalCount: Nullable<Int>.value(1),
                totalCountCapped: true
            )
        )
        let response = try await client.payments.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount_after_fees": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "auto_capture_at": "auto_capture_at",
                  "auto_refunded": false,
                  "billing_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "billing_reason": "subscription_create",
                  "capture_expires_at": "capture_expires_at",
                  "checkout_configuration_id": "checkout_configuration_id",
                  "checkout_origin": "checkout_origin",
                  "checkout_surface": "hosted_checkout",
                  "client_secret": "pay_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "customer_email": "marcus@shinetime.example",
                  "customer_phone": "+xxxxxxxxxxx",
                  "decline_code": "insufficient_funds",
                  "dispute_alerted_at": "dispute_alerted_at",
                  "dispute_created_at": "dispute_created_at",
                  "failure_message": "failure_message",
                  "financing_installments_count": 1.1,
                  "holds": [
                    {
                      "amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    }
                  ],
                  "id": "pay_xxxxxxxxxxxxxx",
                  "ip_address": "ip_address",
                  "last_payment_attempt_at": "last_payment_attempt_at",
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
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "membership_id": "mem_xxxxxxxxxxxxxx",
                  "metadata": {
                    "order_ref": "SHINE-4417"
                  },
                  "missing_tracking": false,
                  "needs_tracking": false,
                  "next_payment_attempt_at": "next_payment_attempt_at",
                  "paid_at": "2026-01-01T12:00:00.000Z",
                  "payment_instrument": {
                    "card": {
                      "brand": "visa",
                      "exp_month": 10,
                      "exp_year": 2031,
                      "issuer_identification_number": "41111111",
                      "last4": "4242",
                      "network_transaction_id": "016153570198200"
                    },
                    "display_name": "Visa •••• 4242",
                    "icons": {
                      "card": {
                        "dark": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        },
                        "light": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        }
                      },
                      "square": {
                        "dark": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        },
                        "light": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        }
                      }
                    },
                    "installment_count": 1.1,
                    "payment_method_type": "card"
                  },
                  "payment_method_id": "payt_xxxxxxxxxxxxxx",
                  "payment_method_type": "acss_debit",
                  "payment_rule_matches": [
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    }
                  ],
                  "payments_failed": 0,
                  "presentment_refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "presentment_tax_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "presentment_total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_code_id",
                  "quote_id": "quote_id",
                  "recovery_url": "recovery_url",
                  "refundable": false,
                  "refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "refunded_at": "refunded_at",
                  "response_due_at": "response_due_at",
                  "retryable": true,
                  "risk_score": 1.1,
                  "risk_signals": {
                    "key": "value"
                  },
                  "settlement_time_at": "settlement_time_at",
                  "shipment_id": "shipment_id",
                  "shipping_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "status": "draft",
                  "substatus": "succeeded",
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
                  "tax_behavior": "exclusive",
                  "tax_refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "three_ds_verified": false,
                  "total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "usd_total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_agent": "user_agent",
                  "variant_id": "plan_xxxxxxxxxxxxxx",
                  "verification_checks": {
                    "address_line1": "PASS",
                    "arn": "74123456789",
                    "authorization_code": "A1B2C3",
                    "card_holder_name": "PASS",
                    "card_security_code": "PASS",
                    "zip_code": "PASS"
                  },
                  "voidable": false,
                  "wuid": "wuid"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Payment(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amountAfterFees: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            autoRefunded: false,
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
            captureExpiresAt: Nullable<String>.value("capture_expires_at"),
            checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
            checkoutOrigin: Nullable<String>.value("checkout_origin"),
            checkoutSurface: Nullable<PaymentCheckoutSurface>.value(PaymentCheckoutSurface.hostedCheckout),
            clientSecret: Nullable<String>.value("pay_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: Currencies.usd,
            customerEmail: Nullable<String>.value("marcus@shinetime.example"),
            customerPhone: Nullable<String>.value("+xxxxxxxxxxx"),
            declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
            disputeAlertedAt: Nullable<String>.value("dispute_alerted_at"),
            disputeCreatedAt: Nullable<String>.value("dispute_created_at"),
            failureMessage: Nullable<String>.value("failure_message"),
            financingInstallmentsCount: Nullable<Double>.value(1.1),
            holds: [
                PaymentHold(
                    amount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                )
            ],
            id: "pay_xxxxxxxxxxxxxx",
            ipAddress: Nullable<String>.value("ip_address"),
            lastPaymentAttemptAt: Nullable<String>.value("last_payment_attempt_at"),
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
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            membershipId: Nullable<String>.value("mem_xxxxxxxxxxxxxx"),
            metadata: Nullable<[String: JSONValue]>.value([
                "order_ref": JSONValue.string("SHINE-4417")
            ]),
            missingTracking: Nullable<Bool>.value(false),
            needsTracking: Nullable<Bool>.value(false),
            nextPaymentAttemptAt: Nullable<String>.value("next_payment_attempt_at"),
            paidAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                    brand: Nullable<String>.value("visa"),
                    expMonth: Nullable<Double>.value(10),
                    expYear: Nullable<Double>.value(2031),
                    issuerIdentificationNumber: Nullable<String>.value("41111111"),
                    last4: Nullable<String>.value("4242"),
                    networkTransactionId: Nullable<String>.value("016153570198200")
                )),
                displayName: "Visa •••• 4242",
                icons: PaymentMethodIcons(
                    card: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        )
                    ),
                    square: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        )
                    )
                ),
                installmentCount: Nullable<Double>.value(1.1),
                paymentMethodType: "card"
            )),
            paymentMethodId: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
            paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
            paymentRuleMatches: [
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                )
            ],
            paymentsFailed: 0,
            presentmentRefundedAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            presentmentTaxAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            presentmentTotal: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            promoCodeId: Nullable<String>.value("promo_code_id"),
            quoteId: Nullable<String>.value("quote_id"),
            recoveryUrl: Nullable<String>.value("recovery_url"),
            refundable: false,
            refundedAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            refundedAt: Nullable<String>.value("refunded_at"),
            responseDueAt: Nullable<String>.value("response_due_at"),
            retryable: true,
            riskScore: Nullable<Double>.value(1.1),
            riskSignals: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            settlementTimeAt: Nullable<String>.value("settlement_time_at"),
            shipmentId: Nullable<String>.value("shipment_id"),
            shippingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            status: ReceiptStatus.draft,
            substatus: FriendlyReceiptStatus.succeeded,
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
            taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
            taxRefundedAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            threeDsVerified: false,
            total: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            updatedAt: "2026-01-01T12:00:00.000Z",
            usdTotal: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            user: Nullable<UserSummary>.value(UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            )),
            userAgent: Nullable<String>.value("user_agent"),
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
            verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                addressLine1: Nullable<String>.value("PASS"),
                arn: Nullable<String>.value("74123456789"),
                authorizationCode: Nullable<String>.value("A1B2C3"),
                cardHolderName: Nullable<String>.value("PASS"),
                cardSecurityCode: Nullable<String>.value("PASS"),
                zipCode: Nullable<String>.value("PASS")
            )),
            voidable: false,
            wuid: Nullable<String>.value("wuid")
        )
        let response = try await client.payments.create(
            request: .init(accountId: "biz_xxxxxxxxxxxxxx"),
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
                  "amount_after_fees": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "auto_capture_at": "auto_capture_at",
                  "auto_refunded": true,
                  "billing_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "name": "name",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "billing_reason": "subscription_create",
                  "capture_expires_at": "capture_expires_at",
                  "checkout_configuration_id": "checkout_configuration_id",
                  "checkout_origin": "checkout_origin",
                  "checkout_surface": "hosted_checkout",
                  "client_secret": "client_secret",
                  "created_at": "created_at",
                  "currency": "usd",
                  "customer_email": "customer_email",
                  "customer_phone": "customer_phone",
                  "decline_code": "insufficient_funds",
                  "dispute_alerted_at": "dispute_alerted_at",
                  "dispute_created_at": "dispute_created_at",
                  "failure_message": "failure_message",
                  "financing_installments_count": 1.1,
                  "holds": [
                    {
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    },
                    {
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    }
                  ],
                  "id": "id",
                  "ip_address": "ip_address",
                  "last_payment_attempt_at": "last_payment_attempt_at",
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
                  "member_id": "member_id",
                  "membership_id": "membership_id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "missing_tracking": true,
                  "needs_tracking": true,
                  "next_payment_attempt_at": "next_payment_attempt_at",
                  "paid_at": "paid_at",
                  "payment_instrument": {
                    "card": {
                      "brand": "brand",
                      "exp_month": 1.1,
                      "exp_year": 1.1,
                      "issuer_identification_number": "issuer_identification_number",
                      "last4": "last4",
                      "network_transaction_id": "network_transaction_id"
                    },
                    "display_name": "display_name",
                    "icons": {
                      "card": {
                        "dark": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        },
                        "light": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        }
                      },
                      "square": {
                        "dark": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        },
                        "light": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        }
                      }
                    },
                    "installment_count": 1.1,
                    "payment_method_type": "payment_method_type"
                  },
                  "payment_method_id": "payment_method_id",
                  "payment_method_type": "acss_debit",
                  "payment_rule_matches": [
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    },
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    }
                  ],
                  "payments_failed": 1.1,
                  "presentment_refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "presentment_tax_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "presentment_total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "product_id": "product_id",
                  "promo_code_id": "promo_code_id",
                  "quote_id": "quote_id",
                  "recovery_url": "recovery_url",
                  "refundable": true,
                  "refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "refunded_at": "refunded_at",
                  "response_due_at": "response_due_at",
                  "retryable": true,
                  "risk_score": 1.1,
                  "risk_signals": {
                    "risk_signals": {
                      "key": "value"
                    }
                  },
                  "settlement_time_at": "settlement_time_at",
                  "shipment_id": "shipment_id",
                  "shipping_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "name": "name",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "status": "draft",
                  "substatus": "succeeded",
                  "subtotal": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "tax_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "tax_behavior": "exclusive",
                  "tax_refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "three_ds_verified": true,
                  "total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "updated_at": "updated_at",
                  "usd_total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "user_agent": "user_agent",
                  "variant_id": "variant_id",
                  "verification_checks": {
                    "address_line1": "address_line1",
                    "arn": "arn",
                    "authorization_code": "authorization_code",
                    "card_holder_name": "card_holder_name",
                    "card_security_code": "card_security_code",
                    "zip_code": "zip_code"
                  },
                  "voidable": true,
                  "wuid": "wuid"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Payment(
            accountId: Nullable<String>.value("account_id"),
            amountAfterFees: Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            ),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            autoRefunded: true,
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
            captureExpiresAt: Nullable<String>.value("capture_expires_at"),
            checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
            checkoutOrigin: Nullable<String>.value("checkout_origin"),
            checkoutSurface: Nullable<PaymentCheckoutSurface>.value(PaymentCheckoutSurface.hostedCheckout),
            clientSecret: Nullable<String>.value("client_secret"),
            createdAt: "created_at",
            currency: Currencies.usd,
            customerEmail: Nullable<String>.value("customer_email"),
            customerPhone: Nullable<String>.value("customer_phone"),
            declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
            disputeAlertedAt: Nullable<String>.value("dispute_alerted_at"),
            disputeCreatedAt: Nullable<String>.value("dispute_created_at"),
            failureMessage: Nullable<String>.value("failure_message"),
            financingInstallmentsCount: Nullable<Double>.value(1.1),
            holds: [
                PaymentHold(
                    amount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                ),
                PaymentHold(
                    amount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                )
            ],
            id: "id",
            ipAddress: Nullable<String>.value("ip_address"),
            lastPaymentAttemptAt: Nullable<String>.value("last_payment_attempt_at"),
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
            memberId: Nullable<String>.value("member_id"),
            membershipId: Nullable<String>.value("membership_id"),
            metadata: Nullable<[String: JSONValue]>.value([
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            missingTracking: Nullable<Bool>.value(true),
            needsTracking: Nullable<Bool>.value(true),
            nextPaymentAttemptAt: Nullable<String>.value("next_payment_attempt_at"),
            paidAt: Nullable<String>.value("paid_at"),
            paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                    brand: Nullable<String>.value("brand"),
                    expMonth: Nullable<Double>.value(1.1),
                    expYear: Nullable<Double>.value(1.1),
                    issuerIdentificationNumber: Nullable<String>.value("issuer_identification_number"),
                    last4: Nullable<String>.value("last4"),
                    networkTransactionId: Nullable<String>.value("network_transaction_id")
                )),
                displayName: "display_name",
                icons: PaymentMethodIcons(
                    card: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    ),
                    square: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    )
                ),
                installmentCount: Nullable<Double>.value(1.1),
                paymentMethodType: "payment_method_type"
            )),
            paymentMethodId: Nullable<String>.value("payment_method_id"),
            paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
            paymentRuleMatches: [
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                ),
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                )
            ],
            paymentsFailed: 1.1,
            presentmentRefundedAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            presentmentTaxAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            presentmentTotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            productId: Nullable<String>.value("product_id"),
            promoCodeId: Nullable<String>.value("promo_code_id"),
            quoteId: Nullable<String>.value("quote_id"),
            recoveryUrl: Nullable<String>.value("recovery_url"),
            refundable: true,
            refundedAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            refundedAt: Nullable<String>.value("refunded_at"),
            responseDueAt: Nullable<String>.value("response_due_at"),
            retryable: true,
            riskScore: Nullable<Double>.value(1.1),
            riskSignals: Nullable<[String: JSONValue]>.value([
                "risk_signals": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            settlementTimeAt: Nullable<String>.value("settlement_time_at"),
            shipmentId: Nullable<String>.value("shipment_id"),
            shippingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            status: ReceiptStatus.draft,
            substatus: FriendlyReceiptStatus.succeeded,
            subtotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            taxAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
            taxRefundedAmount: Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            ),
            threeDsVerified: true,
            total: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            updatedAt: "updated_at",
            usdTotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            user: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )),
            userAgent: Nullable<String>.value("user_agent"),
            variantId: Nullable<String>.value("variant_id"),
            verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                addressLine1: Nullable<String>.value("address_line1"),
                arn: Nullable<String>.value("arn"),
                authorizationCode: Nullable<String>.value("authorization_code"),
                cardHolderName: Nullable<String>.value("card_holder_name"),
                cardSecurityCode: Nullable<String>.value("card_security_code"),
                zipCode: Nullable<String>.value("zip_code")
            )),
            voidable: true,
            wuid: Nullable<String>.value("wuid")
        )
        let response = try await client.payments.create(
            request: .init(accountId: "account_id"),
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
                    "currency": {
                      "usd": 1
                    },
                    "substatus": {
                      "auto_refunded": 0,
                      "blocked": 0,
                      "canceled": 0,
                      "dispute_closed": 0,
                      "dispute_lost": 0,
                      "dispute_needs_response": 0,
                      "dispute_under_review": 0,
                      "dispute_warning": 0,
                      "dispute_warning_closed": 0,
                      "dispute_warning_needs_response": 0,
                      "dispute_warning_under_review": 0,
                      "dispute_won": 0,
                      "drafted": 0,
                      "failed": 0,
                      "incomplete": 1,
                      "partially_refunded": 0,
                      "past_due": 0,
                      "pending": 0,
                      "price_too_low": 0,
                      "refunded": 0,
                      "requires_capture": 0,
                      "resolution_lost": 0,
                      "resolution_needs_response": 0,
                      "resolution_under_review": 0,
                      "resolution_won": 0,
                      "succeeded": 0,
                      "uncollectible": 0,
                      "unresolved": 0
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
        let expectedResponse = SummaryPaymentsResponse(
            groups: SummaryPaymentsResponseGroups(
                currency: Optional([
                    "usd": 1
                ]),
                substatus: Optional(SummaryPaymentsResponseGroupsSubstatus(
                    autoRefunded: 0,
                    blocked: 0,
                    canceled: 0,
                    disputeClosed: 0,
                    disputeLost: 0,
                    disputeNeedsResponse: 0,
                    disputeUnderReview: 0,
                    disputeWarning: 0,
                    disputeWarningClosed: 0,
                    disputeWarningNeedsResponse: 0,
                    disputeWarningUnderReview: 0,
                    disputeWon: 0,
                    drafted: 0,
                    failed: 0,
                    incomplete: 1,
                    partiallyRefunded: 0,
                    pastDue: 0,
                    pending: 0,
                    priceTooLow: 0,
                    refunded: 0,
                    requiresCapture: 0,
                    resolutionLost: 0,
                    resolutionNeedsResponse: 0,
                    resolutionUnderReview: 0,
                    resolutionWon: 0,
                    succeeded: 0,
                    uncollectible: 0,
                    unresolved: 0
                ))
            ),
            total: 1
        )
        let response = try await client.payments.summary(
            currencies: [
                "usd"
            ],
            minAmount: 995,
            maxAmount: 995,
            variantIds: [
                "plan_xxxxxxxxxxxxx"
            ],
            productIds: [
                "prod_xxxxxxxxxxxxx"
            ],
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func summary2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "groups": {
                    "currency": {
                      "currency": 1
                    },
                    "substatus": {
                      "auto_refunded": 1,
                      "blocked": 1,
                      "canceled": 1,
                      "dispute_closed": 1,
                      "dispute_lost": 1,
                      "dispute_needs_response": 1,
                      "dispute_under_review": 1,
                      "dispute_warning": 1,
                      "dispute_warning_closed": 1,
                      "dispute_warning_needs_response": 1,
                      "dispute_warning_under_review": 1,
                      "dispute_won": 1,
                      "drafted": 1,
                      "failed": 1,
                      "incomplete": 1,
                      "partially_refunded": 1,
                      "past_due": 1,
                      "pending": 1,
                      "price_too_low": 1,
                      "refunded": 1,
                      "requires_capture": 1,
                      "resolution_lost": 1,
                      "resolution_needs_response": 1,
                      "resolution_under_review": 1,
                      "resolution_won": 1,
                      "succeeded": 1,
                      "uncollectible": 1,
                      "unresolved": 1
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
        let expectedResponse = SummaryPaymentsResponse(
            groups: SummaryPaymentsResponseGroups(
                currency: Optional([
                    "currency": 1
                ]),
                substatus: Optional(SummaryPaymentsResponseGroupsSubstatus(
                    autoRefunded: 1,
                    blocked: 1,
                    canceled: 1,
                    disputeClosed: 1,
                    disputeLost: 1,
                    disputeNeedsResponse: 1,
                    disputeUnderReview: 1,
                    disputeWarning: 1,
                    disputeWarningClosed: 1,
                    disputeWarningNeedsResponse: 1,
                    disputeWarningUnderReview: 1,
                    disputeWon: 1,
                    drafted: 1,
                    failed: 1,
                    incomplete: 1,
                    partiallyRefunded: 1,
                    pastDue: 1,
                    pending: 1,
                    priceTooLow: 1,
                    refunded: 1,
                    requiresCapture: 1,
                    resolutionLost: 1,
                    resolutionNeedsResponse: 1,
                    resolutionUnderReview: 1,
                    resolutionWon: 1,
                    succeeded: 1,
                    uncollectible: 1,
                    unresolved: 1
                ))
            ),
            total: 1
        )
        let response = try await client.payments.summary(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount_after_fees": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "auto_capture_at": "auto_capture_at",
                  "auto_refunded": false,
                  "billing_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "billing_reason": "subscription_create",
                  "capture_expires_at": "capture_expires_at",
                  "checkout_configuration_id": "checkout_configuration_id",
                  "checkout_origin": "checkout_origin",
                  "checkout_surface": "hosted_checkout",
                  "client_secret": "pay_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "customer_email": "marcus@shinetime.example",
                  "customer_phone": "+xxxxxxxxxxx",
                  "decline_code": "insufficient_funds",
                  "dispute_alerted_at": "dispute_alerted_at",
                  "dispute_created_at": "dispute_created_at",
                  "failure_message": "failure_message",
                  "financing_installments_count": 1.1,
                  "holds": [
                    {
                      "amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    }
                  ],
                  "id": "pay_xxxxxxxxxxxxxx",
                  "ip_address": "ip_address",
                  "last_payment_attempt_at": "last_payment_attempt_at",
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
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "membership_id": "mem_xxxxxxxxxxxxxx",
                  "metadata": {
                    "order_ref": "SHINE-4417"
                  },
                  "missing_tracking": false,
                  "needs_tracking": false,
                  "next_payment_attempt_at": "next_payment_attempt_at",
                  "paid_at": "2026-01-01T12:00:00.000Z",
                  "payment_instrument": {
                    "card": {
                      "brand": "visa",
                      "exp_month": 10,
                      "exp_year": 2031,
                      "issuer_identification_number": "41111111",
                      "last4": "4242",
                      "network_transaction_id": "016153570198200"
                    },
                    "display_name": "Visa •••• 4242",
                    "icons": {
                      "card": {
                        "dark": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        },
                        "light": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        }
                      },
                      "square": {
                        "dark": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        },
                        "light": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        }
                      }
                    },
                    "installment_count": 1.1,
                    "payment_method_type": "card"
                  },
                  "payment_method_id": "payt_xxxxxxxxxxxxxx",
                  "payment_method_type": "acss_debit",
                  "payment_rule_matches": [
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    }
                  ],
                  "payments_failed": 0,
                  "presentment_refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "presentment_tax_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "presentment_total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_code_id",
                  "quote_id": "quote_id",
                  "recovery_url": "recovery_url",
                  "refundable": false,
                  "refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "refunded_at": "refunded_at",
                  "response_due_at": "response_due_at",
                  "retryable": true,
                  "risk_score": 1.1,
                  "risk_signals": {
                    "key": "value"
                  },
                  "settlement_time_at": "settlement_time_at",
                  "shipment_id": "shipment_id",
                  "shipping_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "status": "draft",
                  "substatus": "succeeded",
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
                  "tax_behavior": "exclusive",
                  "tax_refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "three_ds_verified": false,
                  "total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "usd_total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_agent": "user_agent",
                  "variant_id": "plan_xxxxxxxxxxxxxx",
                  "verification_checks": {
                    "address_line1": "PASS",
                    "arn": "74123456789",
                    "authorization_code": "A1B2C3",
                    "card_holder_name": "PASS",
                    "card_security_code": "PASS",
                    "zip_code": "PASS"
                  },
                  "voidable": false,
                  "wuid": "wuid"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Payment(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amountAfterFees: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            autoRefunded: false,
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
            captureExpiresAt: Nullable<String>.value("capture_expires_at"),
            checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
            checkoutOrigin: Nullable<String>.value("checkout_origin"),
            checkoutSurface: Nullable<PaymentCheckoutSurface>.value(PaymentCheckoutSurface.hostedCheckout),
            clientSecret: Nullable<String>.value("pay_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: Currencies.usd,
            customerEmail: Nullable<String>.value("marcus@shinetime.example"),
            customerPhone: Nullable<String>.value("+xxxxxxxxxxx"),
            declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
            disputeAlertedAt: Nullable<String>.value("dispute_alerted_at"),
            disputeCreatedAt: Nullable<String>.value("dispute_created_at"),
            failureMessage: Nullable<String>.value("failure_message"),
            financingInstallmentsCount: Nullable<Double>.value(1.1),
            holds: [
                PaymentHold(
                    amount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                )
            ],
            id: "pay_xxxxxxxxxxxxxx",
            ipAddress: Nullable<String>.value("ip_address"),
            lastPaymentAttemptAt: Nullable<String>.value("last_payment_attempt_at"),
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
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            membershipId: Nullable<String>.value("mem_xxxxxxxxxxxxxx"),
            metadata: Nullable<[String: JSONValue]>.value([
                "order_ref": JSONValue.string("SHINE-4417")
            ]),
            missingTracking: Nullable<Bool>.value(false),
            needsTracking: Nullable<Bool>.value(false),
            nextPaymentAttemptAt: Nullable<String>.value("next_payment_attempt_at"),
            paidAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                    brand: Nullable<String>.value("visa"),
                    expMonth: Nullable<Double>.value(10),
                    expYear: Nullable<Double>.value(2031),
                    issuerIdentificationNumber: Nullable<String>.value("41111111"),
                    last4: Nullable<String>.value("4242"),
                    networkTransactionId: Nullable<String>.value("016153570198200")
                )),
                displayName: "Visa •••• 4242",
                icons: PaymentMethodIcons(
                    card: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        )
                    ),
                    square: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        )
                    )
                ),
                installmentCount: Nullable<Double>.value(1.1),
                paymentMethodType: "card"
            )),
            paymentMethodId: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
            paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
            paymentRuleMatches: [
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                )
            ],
            paymentsFailed: 0,
            presentmentRefundedAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            presentmentTaxAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            presentmentTotal: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            promoCodeId: Nullable<String>.value("promo_code_id"),
            quoteId: Nullable<String>.value("quote_id"),
            recoveryUrl: Nullable<String>.value("recovery_url"),
            refundable: false,
            refundedAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            refundedAt: Nullable<String>.value("refunded_at"),
            responseDueAt: Nullable<String>.value("response_due_at"),
            retryable: true,
            riskScore: Nullable<Double>.value(1.1),
            riskSignals: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            settlementTimeAt: Nullable<String>.value("settlement_time_at"),
            shipmentId: Nullable<String>.value("shipment_id"),
            shippingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            status: ReceiptStatus.draft,
            substatus: FriendlyReceiptStatus.succeeded,
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
            taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
            taxRefundedAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            threeDsVerified: false,
            total: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            updatedAt: "2026-01-01T12:00:00.000Z",
            usdTotal: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            user: Nullable<UserSummary>.value(UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            )),
            userAgent: Nullable<String>.value("user_agent"),
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
            verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                addressLine1: Nullable<String>.value("PASS"),
                arn: Nullable<String>.value("74123456789"),
                authorizationCode: Nullable<String>.value("A1B2C3"),
                cardHolderName: Nullable<String>.value("PASS"),
                cardSecurityCode: Nullable<String>.value("PASS"),
                zipCode: Nullable<String>.value("PASS")
            )),
            voidable: false,
            wuid: Nullable<String>.value("wuid")
        )
        let response = try await client.payments.retrieve(
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
                  "amount_after_fees": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "auto_capture_at": "auto_capture_at",
                  "auto_refunded": true,
                  "billing_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "name": "name",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "billing_reason": "subscription_create",
                  "capture_expires_at": "capture_expires_at",
                  "checkout_configuration_id": "checkout_configuration_id",
                  "checkout_origin": "checkout_origin",
                  "checkout_surface": "hosted_checkout",
                  "client_secret": "client_secret",
                  "created_at": "created_at",
                  "currency": "usd",
                  "customer_email": "customer_email",
                  "customer_phone": "customer_phone",
                  "decline_code": "insufficient_funds",
                  "dispute_alerted_at": "dispute_alerted_at",
                  "dispute_created_at": "dispute_created_at",
                  "failure_message": "failure_message",
                  "financing_installments_count": 1.1,
                  "holds": [
                    {
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    },
                    {
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    }
                  ],
                  "id": "id",
                  "ip_address": "ip_address",
                  "last_payment_attempt_at": "last_payment_attempt_at",
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
                  "member_id": "member_id",
                  "membership_id": "membership_id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "missing_tracking": true,
                  "needs_tracking": true,
                  "next_payment_attempt_at": "next_payment_attempt_at",
                  "paid_at": "paid_at",
                  "payment_instrument": {
                    "card": {
                      "brand": "brand",
                      "exp_month": 1.1,
                      "exp_year": 1.1,
                      "issuer_identification_number": "issuer_identification_number",
                      "last4": "last4",
                      "network_transaction_id": "network_transaction_id"
                    },
                    "display_name": "display_name",
                    "icons": {
                      "card": {
                        "dark": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        },
                        "light": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        }
                      },
                      "square": {
                        "dark": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        },
                        "light": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        }
                      }
                    },
                    "installment_count": 1.1,
                    "payment_method_type": "payment_method_type"
                  },
                  "payment_method_id": "payment_method_id",
                  "payment_method_type": "acss_debit",
                  "payment_rule_matches": [
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    },
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    }
                  ],
                  "payments_failed": 1.1,
                  "presentment_refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "presentment_tax_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "presentment_total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "product_id": "product_id",
                  "promo_code_id": "promo_code_id",
                  "quote_id": "quote_id",
                  "recovery_url": "recovery_url",
                  "refundable": true,
                  "refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "refunded_at": "refunded_at",
                  "response_due_at": "response_due_at",
                  "retryable": true,
                  "risk_score": 1.1,
                  "risk_signals": {
                    "risk_signals": {
                      "key": "value"
                    }
                  },
                  "settlement_time_at": "settlement_time_at",
                  "shipment_id": "shipment_id",
                  "shipping_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "name": "name",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "status": "draft",
                  "substatus": "succeeded",
                  "subtotal": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "tax_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "tax_behavior": "exclusive",
                  "tax_refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "three_ds_verified": true,
                  "total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "updated_at": "updated_at",
                  "usd_total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "user_agent": "user_agent",
                  "variant_id": "variant_id",
                  "verification_checks": {
                    "address_line1": "address_line1",
                    "arn": "arn",
                    "authorization_code": "authorization_code",
                    "card_holder_name": "card_holder_name",
                    "card_security_code": "card_security_code",
                    "zip_code": "zip_code"
                  },
                  "voidable": true,
                  "wuid": "wuid"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Payment(
            accountId: Nullable<String>.value("account_id"),
            amountAfterFees: Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            ),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            autoRefunded: true,
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
            captureExpiresAt: Nullable<String>.value("capture_expires_at"),
            checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
            checkoutOrigin: Nullable<String>.value("checkout_origin"),
            checkoutSurface: Nullable<PaymentCheckoutSurface>.value(PaymentCheckoutSurface.hostedCheckout),
            clientSecret: Nullable<String>.value("client_secret"),
            createdAt: "created_at",
            currency: Currencies.usd,
            customerEmail: Nullable<String>.value("customer_email"),
            customerPhone: Nullable<String>.value("customer_phone"),
            declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
            disputeAlertedAt: Nullable<String>.value("dispute_alerted_at"),
            disputeCreatedAt: Nullable<String>.value("dispute_created_at"),
            failureMessage: Nullable<String>.value("failure_message"),
            financingInstallmentsCount: Nullable<Double>.value(1.1),
            holds: [
                PaymentHold(
                    amount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                ),
                PaymentHold(
                    amount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                )
            ],
            id: "id",
            ipAddress: Nullable<String>.value("ip_address"),
            lastPaymentAttemptAt: Nullable<String>.value("last_payment_attempt_at"),
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
            memberId: Nullable<String>.value("member_id"),
            membershipId: Nullable<String>.value("membership_id"),
            metadata: Nullable<[String: JSONValue]>.value([
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            missingTracking: Nullable<Bool>.value(true),
            needsTracking: Nullable<Bool>.value(true),
            nextPaymentAttemptAt: Nullable<String>.value("next_payment_attempt_at"),
            paidAt: Nullable<String>.value("paid_at"),
            paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                    brand: Nullable<String>.value("brand"),
                    expMonth: Nullable<Double>.value(1.1),
                    expYear: Nullable<Double>.value(1.1),
                    issuerIdentificationNumber: Nullable<String>.value("issuer_identification_number"),
                    last4: Nullable<String>.value("last4"),
                    networkTransactionId: Nullable<String>.value("network_transaction_id")
                )),
                displayName: "display_name",
                icons: PaymentMethodIcons(
                    card: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    ),
                    square: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    )
                ),
                installmentCount: Nullable<Double>.value(1.1),
                paymentMethodType: "payment_method_type"
            )),
            paymentMethodId: Nullable<String>.value("payment_method_id"),
            paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
            paymentRuleMatches: [
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                ),
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                )
            ],
            paymentsFailed: 1.1,
            presentmentRefundedAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            presentmentTaxAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            presentmentTotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            productId: Nullable<String>.value("product_id"),
            promoCodeId: Nullable<String>.value("promo_code_id"),
            quoteId: Nullable<String>.value("quote_id"),
            recoveryUrl: Nullable<String>.value("recovery_url"),
            refundable: true,
            refundedAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            refundedAt: Nullable<String>.value("refunded_at"),
            responseDueAt: Nullable<String>.value("response_due_at"),
            retryable: true,
            riskScore: Nullable<Double>.value(1.1),
            riskSignals: Nullable<[String: JSONValue]>.value([
                "risk_signals": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            settlementTimeAt: Nullable<String>.value("settlement_time_at"),
            shipmentId: Nullable<String>.value("shipment_id"),
            shippingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            status: ReceiptStatus.draft,
            substatus: FriendlyReceiptStatus.succeeded,
            subtotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            taxAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
            taxRefundedAmount: Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            ),
            threeDsVerified: true,
            total: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            updatedAt: "updated_at",
            usdTotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            user: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )),
            userAgent: Nullable<String>.value("user_agent"),
            variantId: Nullable<String>.value("variant_id"),
            verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                addressLine1: Nullable<String>.value("address_line1"),
                arn: Nullable<String>.value("arn"),
                authorizationCode: Nullable<String>.value("authorization_code"),
                cardHolderName: Nullable<String>.value("card_holder_name"),
                cardSecurityCode: Nullable<String>.value("card_security_code"),
                zipCode: Nullable<String>.value("zip_code")
            )),
            voidable: true,
            wuid: Nullable<String>.value("wuid")
        )
        let response = try await client.payments.retrieve(
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
                  "amount_after_fees": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "auto_capture_at": "auto_capture_at",
                  "auto_refunded": false,
                  "billing_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "billing_reason": "subscription_create",
                  "capture_expires_at": "capture_expires_at",
                  "checkout_configuration_id": "checkout_configuration_id",
                  "checkout_origin": "checkout_origin",
                  "checkout_surface": "hosted_checkout",
                  "client_secret": "pay_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "customer_email": "marcus@shinetime.example",
                  "customer_phone": "+xxxxxxxxxxx",
                  "decline_code": "insufficient_funds",
                  "dispute_alerted_at": "dispute_alerted_at",
                  "dispute_created_at": "dispute_created_at",
                  "failure_message": "failure_message",
                  "financing_installments_count": 1.1,
                  "holds": [
                    {
                      "amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    }
                  ],
                  "id": "pay_xxxxxxxxxxxxxx",
                  "ip_address": "ip_address",
                  "last_payment_attempt_at": "last_payment_attempt_at",
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
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "membership_id": "mem_xxxxxxxxxxxxxx",
                  "metadata": {
                    "order_ref": "SHINE-4417"
                  },
                  "missing_tracking": false,
                  "needs_tracking": false,
                  "next_payment_attempt_at": "next_payment_attempt_at",
                  "paid_at": "2026-01-01T12:00:00.000Z",
                  "payment_instrument": {
                    "card": {
                      "brand": "visa",
                      "exp_month": 10,
                      "exp_year": 2031,
                      "issuer_identification_number": "41111111",
                      "last4": "4242",
                      "network_transaction_id": "016153570198200"
                    },
                    "display_name": "Visa •••• 4242",
                    "icons": {
                      "card": {
                        "dark": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        },
                        "light": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        }
                      },
                      "square": {
                        "dark": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        },
                        "light": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        }
                      }
                    },
                    "installment_count": 1.1,
                    "payment_method_type": "card"
                  },
                  "payment_method_id": "payt_xxxxxxxxxxxxxx",
                  "payment_method_type": "acss_debit",
                  "payment_rule_matches": [
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    }
                  ],
                  "payments_failed": 0,
                  "presentment_refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "presentment_tax_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "presentment_total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_code_id",
                  "quote_id": "quote_id",
                  "recovery_url": "recovery_url",
                  "refundable": false,
                  "refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "refunded_at": "refunded_at",
                  "response_due_at": "response_due_at",
                  "retryable": true,
                  "risk_score": 1.1,
                  "risk_signals": {
                    "key": "value"
                  },
                  "settlement_time_at": "settlement_time_at",
                  "shipment_id": "shipment_id",
                  "shipping_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "status": "draft",
                  "substatus": "succeeded",
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
                  "tax_behavior": "exclusive",
                  "tax_refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "three_ds_verified": false,
                  "total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "usd_total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_agent": "user_agent",
                  "variant_id": "plan_xxxxxxxxxxxxxx",
                  "verification_checks": {
                    "address_line1": "PASS",
                    "arn": "74123456789",
                    "authorization_code": "A1B2C3",
                    "card_holder_name": "PASS",
                    "card_security_code": "PASS",
                    "zip_code": "PASS"
                  },
                  "voidable": false,
                  "wuid": "wuid"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Payment(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amountAfterFees: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            autoRefunded: false,
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
            captureExpiresAt: Nullable<String>.value("capture_expires_at"),
            checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
            checkoutOrigin: Nullable<String>.value("checkout_origin"),
            checkoutSurface: Nullable<PaymentCheckoutSurface>.value(PaymentCheckoutSurface.hostedCheckout),
            clientSecret: Nullable<String>.value("pay_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: Currencies.usd,
            customerEmail: Nullable<String>.value("marcus@shinetime.example"),
            customerPhone: Nullable<String>.value("+xxxxxxxxxxx"),
            declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
            disputeAlertedAt: Nullable<String>.value("dispute_alerted_at"),
            disputeCreatedAt: Nullable<String>.value("dispute_created_at"),
            failureMessage: Nullable<String>.value("failure_message"),
            financingInstallmentsCount: Nullable<Double>.value(1.1),
            holds: [
                PaymentHold(
                    amount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                )
            ],
            id: "pay_xxxxxxxxxxxxxx",
            ipAddress: Nullable<String>.value("ip_address"),
            lastPaymentAttemptAt: Nullable<String>.value("last_payment_attempt_at"),
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
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            membershipId: Nullable<String>.value("mem_xxxxxxxxxxxxxx"),
            metadata: Nullable<[String: JSONValue]>.value([
                "order_ref": JSONValue.string("SHINE-4417")
            ]),
            missingTracking: Nullable<Bool>.value(false),
            needsTracking: Nullable<Bool>.value(false),
            nextPaymentAttemptAt: Nullable<String>.value("next_payment_attempt_at"),
            paidAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                    brand: Nullable<String>.value("visa"),
                    expMonth: Nullable<Double>.value(10),
                    expYear: Nullable<Double>.value(2031),
                    issuerIdentificationNumber: Nullable<String>.value("41111111"),
                    last4: Nullable<String>.value("4242"),
                    networkTransactionId: Nullable<String>.value("016153570198200")
                )),
                displayName: "Visa •••• 4242",
                icons: PaymentMethodIcons(
                    card: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        )
                    ),
                    square: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        )
                    )
                ),
                installmentCount: Nullable<Double>.value(1.1),
                paymentMethodType: "card"
            )),
            paymentMethodId: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
            paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
            paymentRuleMatches: [
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                )
            ],
            paymentsFailed: 0,
            presentmentRefundedAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            presentmentTaxAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            presentmentTotal: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            promoCodeId: Nullable<String>.value("promo_code_id"),
            quoteId: Nullable<String>.value("quote_id"),
            recoveryUrl: Nullable<String>.value("recovery_url"),
            refundable: false,
            refundedAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            refundedAt: Nullable<String>.value("refunded_at"),
            responseDueAt: Nullable<String>.value("response_due_at"),
            retryable: true,
            riskScore: Nullable<Double>.value(1.1),
            riskSignals: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            settlementTimeAt: Nullable<String>.value("settlement_time_at"),
            shipmentId: Nullable<String>.value("shipment_id"),
            shippingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            status: ReceiptStatus.draft,
            substatus: FriendlyReceiptStatus.succeeded,
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
            taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
            taxRefundedAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            threeDsVerified: false,
            total: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            updatedAt: "2026-01-01T12:00:00.000Z",
            usdTotal: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            user: Nullable<UserSummary>.value(UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            )),
            userAgent: Nullable<String>.value("user_agent"),
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
            verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                addressLine1: Nullable<String>.value("PASS"),
                arn: Nullable<String>.value("74123456789"),
                authorizationCode: Nullable<String>.value("A1B2C3"),
                cardHolderName: Nullable<String>.value("PASS"),
                cardSecurityCode: Nullable<String>.value("PASS"),
                zipCode: Nullable<String>.value("PASS")
            )),
            voidable: false,
            wuid: Nullable<String>.value("wuid")
        )
        let response = try await client.payments.update(
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
                  "account_id": "account_id",
                  "amount_after_fees": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "auto_capture_at": "auto_capture_at",
                  "auto_refunded": true,
                  "billing_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "name": "name",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "billing_reason": "subscription_create",
                  "capture_expires_at": "capture_expires_at",
                  "checkout_configuration_id": "checkout_configuration_id",
                  "checkout_origin": "checkout_origin",
                  "checkout_surface": "hosted_checkout",
                  "client_secret": "client_secret",
                  "created_at": "created_at",
                  "currency": "usd",
                  "customer_email": "customer_email",
                  "customer_phone": "customer_phone",
                  "decline_code": "insufficient_funds",
                  "dispute_alerted_at": "dispute_alerted_at",
                  "dispute_created_at": "dispute_created_at",
                  "failure_message": "failure_message",
                  "financing_installments_count": 1.1,
                  "holds": [
                    {
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    },
                    {
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    }
                  ],
                  "id": "id",
                  "ip_address": "ip_address",
                  "last_payment_attempt_at": "last_payment_attempt_at",
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
                  "member_id": "member_id",
                  "membership_id": "membership_id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "missing_tracking": true,
                  "needs_tracking": true,
                  "next_payment_attempt_at": "next_payment_attempt_at",
                  "paid_at": "paid_at",
                  "payment_instrument": {
                    "card": {
                      "brand": "brand",
                      "exp_month": 1.1,
                      "exp_year": 1.1,
                      "issuer_identification_number": "issuer_identification_number",
                      "last4": "last4",
                      "network_transaction_id": "network_transaction_id"
                    },
                    "display_name": "display_name",
                    "icons": {
                      "card": {
                        "dark": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        },
                        "light": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        }
                      },
                      "square": {
                        "dark": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        },
                        "light": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        }
                      }
                    },
                    "installment_count": 1.1,
                    "payment_method_type": "payment_method_type"
                  },
                  "payment_method_id": "payment_method_id",
                  "payment_method_type": "acss_debit",
                  "payment_rule_matches": [
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    },
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    }
                  ],
                  "payments_failed": 1.1,
                  "presentment_refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "presentment_tax_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "presentment_total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "product_id": "product_id",
                  "promo_code_id": "promo_code_id",
                  "quote_id": "quote_id",
                  "recovery_url": "recovery_url",
                  "refundable": true,
                  "refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "refunded_at": "refunded_at",
                  "response_due_at": "response_due_at",
                  "retryable": true,
                  "risk_score": 1.1,
                  "risk_signals": {
                    "risk_signals": {
                      "key": "value"
                    }
                  },
                  "settlement_time_at": "settlement_time_at",
                  "shipment_id": "shipment_id",
                  "shipping_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "name": "name",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "status": "draft",
                  "substatus": "succeeded",
                  "subtotal": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "tax_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "tax_behavior": "exclusive",
                  "tax_refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "three_ds_verified": true,
                  "total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "updated_at": "updated_at",
                  "usd_total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "user_agent": "user_agent",
                  "variant_id": "variant_id",
                  "verification_checks": {
                    "address_line1": "address_line1",
                    "arn": "arn",
                    "authorization_code": "authorization_code",
                    "card_holder_name": "card_holder_name",
                    "card_security_code": "card_security_code",
                    "zip_code": "zip_code"
                  },
                  "voidable": true,
                  "wuid": "wuid"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Payment(
            accountId: Nullable<String>.value("account_id"),
            amountAfterFees: Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            ),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            autoRefunded: true,
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
            captureExpiresAt: Nullable<String>.value("capture_expires_at"),
            checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
            checkoutOrigin: Nullable<String>.value("checkout_origin"),
            checkoutSurface: Nullable<PaymentCheckoutSurface>.value(PaymentCheckoutSurface.hostedCheckout),
            clientSecret: Nullable<String>.value("client_secret"),
            createdAt: "created_at",
            currency: Currencies.usd,
            customerEmail: Nullable<String>.value("customer_email"),
            customerPhone: Nullable<String>.value("customer_phone"),
            declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
            disputeAlertedAt: Nullable<String>.value("dispute_alerted_at"),
            disputeCreatedAt: Nullable<String>.value("dispute_created_at"),
            failureMessage: Nullable<String>.value("failure_message"),
            financingInstallmentsCount: Nullable<Double>.value(1.1),
            holds: [
                PaymentHold(
                    amount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                ),
                PaymentHold(
                    amount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                )
            ],
            id: "id",
            ipAddress: Nullable<String>.value("ip_address"),
            lastPaymentAttemptAt: Nullable<String>.value("last_payment_attempt_at"),
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
            memberId: Nullable<String>.value("member_id"),
            membershipId: Nullable<String>.value("membership_id"),
            metadata: Nullable<[String: JSONValue]>.value([
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            missingTracking: Nullable<Bool>.value(true),
            needsTracking: Nullable<Bool>.value(true),
            nextPaymentAttemptAt: Nullable<String>.value("next_payment_attempt_at"),
            paidAt: Nullable<String>.value("paid_at"),
            paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                    brand: Nullable<String>.value("brand"),
                    expMonth: Nullable<Double>.value(1.1),
                    expYear: Nullable<Double>.value(1.1),
                    issuerIdentificationNumber: Nullable<String>.value("issuer_identification_number"),
                    last4: Nullable<String>.value("last4"),
                    networkTransactionId: Nullable<String>.value("network_transaction_id")
                )),
                displayName: "display_name",
                icons: PaymentMethodIcons(
                    card: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    ),
                    square: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    )
                ),
                installmentCount: Nullable<Double>.value(1.1),
                paymentMethodType: "payment_method_type"
            )),
            paymentMethodId: Nullable<String>.value("payment_method_id"),
            paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
            paymentRuleMatches: [
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                ),
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                )
            ],
            paymentsFailed: 1.1,
            presentmentRefundedAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            presentmentTaxAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            presentmentTotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            productId: Nullable<String>.value("product_id"),
            promoCodeId: Nullable<String>.value("promo_code_id"),
            quoteId: Nullable<String>.value("quote_id"),
            recoveryUrl: Nullable<String>.value("recovery_url"),
            refundable: true,
            refundedAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            refundedAt: Nullable<String>.value("refunded_at"),
            responseDueAt: Nullable<String>.value("response_due_at"),
            retryable: true,
            riskScore: Nullable<Double>.value(1.1),
            riskSignals: Nullable<[String: JSONValue]>.value([
                "risk_signals": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            settlementTimeAt: Nullable<String>.value("settlement_time_at"),
            shipmentId: Nullable<String>.value("shipment_id"),
            shippingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            status: ReceiptStatus.draft,
            substatus: FriendlyReceiptStatus.succeeded,
            subtotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            taxAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
            taxRefundedAmount: Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            ),
            threeDsVerified: true,
            total: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            updatedAt: "updated_at",
            usdTotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            user: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )),
            userAgent: Nullable<String>.value("user_agent"),
            variantId: Nullable<String>.value("variant_id"),
            verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                addressLine1: Nullable<String>.value("address_line1"),
                arn: Nullable<String>.value("arn"),
                authorizationCode: Nullable<String>.value("authorization_code"),
                cardHolderName: Nullable<String>.value("card_holder_name"),
                cardSecurityCode: Nullable<String>.value("card_security_code"),
                zipCode: Nullable<String>.value("zip_code")
            )),
            voidable: true,
            wuid: Nullable<String>.value("wuid")
        )
        let response = try await client.payments.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func capture1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "auto_capture_at": "auto_capture_at",
                  "capture_expires_at": "2026-01-01T12:00:00.000Z",
                  "id": "pay_xxxxxxxxxxxxxx",
                  "last_payment_error": {
                    "code": "processing_error",
                    "decline_code": "insufficient_funds",
                    "message": "Your card was declined."
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
                  "object": "payment_status",
                  "processing_details": {
                    "expected_by": "2026-01-01T12:00:00.000Z"
                  },
                  "return_url": "https://shinetime.example/checkout/done",
                  "status": "requires_confirmation"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentStatus(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            captureExpiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "pay_xxxxxxxxxxxxxx",
            lastPaymentError: Nullable<PaymentLastPaymentError>.value(PaymentLastPaymentError(
                code: Nullable<String>.value("processing_error"),
                declineCode: Nullable<PaymentLastPaymentErrorDeclineCode>.value(PaymentLastPaymentErrorDeclineCode.insufficientFunds),
                message: Nullable<String>.value("Your card was declined.")
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
            object: "payment_status",
            processingDetails: Nullable<PaymentProcessingDetails>.value(PaymentProcessingDetails(
                expectedBy: Nullable<String>.value("2026-01-01T12:00:00.000Z")
            )),
            returnUrl: Nullable<String>.value("https://shinetime.example/checkout/done"),
            status: PaymentStatusStatus.requiresConfirmation
        )
        let response = try await client.payments.capture(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func capture2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "auto_capture_at": "auto_capture_at",
                  "capture_expires_at": "capture_expires_at",
                  "id": "id",
                  "last_payment_error": {
                    "code": "code",
                    "decline_code": "insufficient_funds",
                    "message": "message"
                  },
                  "next_action": {
                    "type": "await_confirmation",
                    "data": {
                      "expires_at": "expires_at"
                    },
                    "render": [
                      "inline",
                      "inline"
                    ]
                  },
                  "object": "object",
                  "processing_details": {
                    "expected_by": "expected_by"
                  },
                  "return_url": "return_url",
                  "status": "requires_confirmation"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentStatus(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            captureExpiresAt: Nullable<String>.value("capture_expires_at"),
            id: "id",
            lastPaymentError: Nullable<PaymentLastPaymentError>.value(PaymentLastPaymentError(
                code: Nullable<String>.value("code"),
                declineCode: Nullable<PaymentLastPaymentErrorDeclineCode>.value(PaymentLastPaymentErrorDeclineCode.insufficientFunds),
                message: Nullable<String>.value("message")
            )),
            nextAction: Nullable<PaymentNextAction>.value(PaymentNextAction.awaitConfirmation(
                .init(
                    data: PaymentNextActionAwaitConfirmationData(
                        expiresAt: "expires_at"
                    ),
                    render: [
                        PaymentNextActionAwaitConfirmationRenderItem.inline,
                        PaymentNextActionAwaitConfirmationRenderItem.inline
                    ],
                    additionalProperties: [
                        "type": JSONValue.string("await_confirmation")
                    ]
                )
            )),
            object: "object",
            processingDetails: Nullable<PaymentProcessingDetails>.value(PaymentProcessingDetails(
                expectedBy: Nullable<String>.value("expected_by")
            )),
            returnUrl: Nullable<String>.value("return_url"),
            status: PaymentStatusStatus.requiresConfirmation
        )
        let response = try await client.payments.capture(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func listFees1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "collected_at": "2026-01-01T12:00:00.000Z",
                      "description": "description",
                      "label": "Processing fee",
                      "origin": "stripe_domestic_processing_fee",
                      "settlement_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "type": "whop_fee"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
                    "has_previous_page": false,
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
        let expectedResponse = ListFeesPaymentsResponse(
            data: [
                PaymentFee(
                    amount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    collectedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    description: Nullable<String>.value("description"),
                    label: "Processing fee",
                    origin: PaymentFeeOrigin.stripeDomesticProcessingFee,
                    settlementAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    type: PaymentFeeType.whopFee
                )
            ],
            pageInfo: ListFeesPaymentsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.payments.listFees(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func listFees2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "collected_at": "collected_at",
                      "description": "description",
                      "label": "label",
                      "origin": "stripe_domestic_processing_fee",
                      "settlement_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "type": "whop_fee"
                    },
                    {
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "collected_at": "collected_at",
                      "description": "description",
                      "label": "label",
                      "origin": "stripe_domestic_processing_fee",
                      "settlement_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "type": "whop_fee"
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
        let expectedResponse = ListFeesPaymentsResponse(
            data: [
                PaymentFee(
                    amount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    collectedAt: Nullable<String>.value("collected_at"),
                    description: Nullable<String>.value("description"),
                    label: "label",
                    origin: PaymentFeeOrigin.stripeDomesticProcessingFee,
                    settlementAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    type: PaymentFeeType.whopFee
                ),
                PaymentFee(
                    amount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    collectedAt: Nullable<String>.value("collected_at"),
                    description: Nullable<String>.value("description"),
                    label: "label",
                    origin: PaymentFeeOrigin.stripeDomesticProcessingFee,
                    settlementAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    type: PaymentFeeType.whopFee
                )
            ],
            pageInfo: ListFeesPaymentsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.payments.listFees(
            id: "id",
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
        let expectedResponse = PaymentPdf(
            expiresAt: "2026-01-01T12:00:00.000Z",
            url: "https://content.whop.com/exports/2026-01-01/pdfs/receipt_pay_xxxxxxxxxxxxxx.pdf"
        )
        let response = try await client.payments.generatePdf(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func generatePdf2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "expires_at": "expires_at",
                  "url": "url"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentPdf(
            expiresAt: "expires_at",
            url: "url"
        )
        let response = try await client.payments.generatePdf(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func refund1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount_after_fees": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "auto_capture_at": "auto_capture_at",
                  "auto_refunded": false,
                  "billing_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "billing_reason": "subscription_create",
                  "capture_expires_at": "capture_expires_at",
                  "checkout_configuration_id": "checkout_configuration_id",
                  "checkout_origin": "checkout_origin",
                  "checkout_surface": "hosted_checkout",
                  "client_secret": "pay_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "customer_email": "marcus@shinetime.example",
                  "customer_phone": "+xxxxxxxxxxx",
                  "decline_code": "insufficient_funds",
                  "dispute_alerted_at": "dispute_alerted_at",
                  "dispute_created_at": "dispute_created_at",
                  "failure_message": "failure_message",
                  "financing_installments_count": 1.1,
                  "holds": [
                    {
                      "amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    }
                  ],
                  "id": "pay_xxxxxxxxxxxxxx",
                  "ip_address": "ip_address",
                  "last_payment_attempt_at": "last_payment_attempt_at",
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
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "membership_id": "mem_xxxxxxxxxxxxxx",
                  "metadata": {
                    "order_ref": "SHINE-4417"
                  },
                  "missing_tracking": false,
                  "needs_tracking": false,
                  "next_payment_attempt_at": "next_payment_attempt_at",
                  "paid_at": "2026-01-01T12:00:00.000Z",
                  "payment_instrument": {
                    "card": {
                      "brand": "visa",
                      "exp_month": 10,
                      "exp_year": 2031,
                      "issuer_identification_number": "41111111",
                      "last4": "4242",
                      "network_transaction_id": "016153570198200"
                    },
                    "display_name": "Visa •••• 4242",
                    "icons": {
                      "card": {
                        "dark": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        },
                        "light": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        }
                      },
                      "square": {
                        "dark": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        },
                        "light": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        }
                      }
                    },
                    "installment_count": 1.1,
                    "payment_method_type": "card"
                  },
                  "payment_method_id": "payt_xxxxxxxxxxxxxx",
                  "payment_method_type": "acss_debit",
                  "payment_rule_matches": [
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    }
                  ],
                  "payments_failed": 0,
                  "presentment_refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "presentment_tax_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "presentment_total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_code_id",
                  "quote_id": "quote_id",
                  "recovery_url": "recovery_url",
                  "refundable": false,
                  "refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "refunded_at": "refunded_at",
                  "response_due_at": "response_due_at",
                  "retryable": true,
                  "risk_score": 1.1,
                  "risk_signals": {
                    "key": "value"
                  },
                  "settlement_time_at": "settlement_time_at",
                  "shipment_id": "shipment_id",
                  "shipping_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "status": "draft",
                  "substatus": "succeeded",
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
                  "tax_behavior": "exclusive",
                  "tax_refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "three_ds_verified": false,
                  "total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "usd_total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_agent": "user_agent",
                  "variant_id": "plan_xxxxxxxxxxxxxx",
                  "verification_checks": {
                    "address_line1": "PASS",
                    "arn": "74123456789",
                    "authorization_code": "A1B2C3",
                    "card_holder_name": "PASS",
                    "card_security_code": "PASS",
                    "zip_code": "PASS"
                  },
                  "voidable": false,
                  "wuid": "wuid"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Payment(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amountAfterFees: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            autoRefunded: false,
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
            captureExpiresAt: Nullable<String>.value("capture_expires_at"),
            checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
            checkoutOrigin: Nullable<String>.value("checkout_origin"),
            checkoutSurface: Nullable<PaymentCheckoutSurface>.value(PaymentCheckoutSurface.hostedCheckout),
            clientSecret: Nullable<String>.value("pay_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: Currencies.usd,
            customerEmail: Nullable<String>.value("marcus@shinetime.example"),
            customerPhone: Nullable<String>.value("+xxxxxxxxxxx"),
            declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
            disputeAlertedAt: Nullable<String>.value("dispute_alerted_at"),
            disputeCreatedAt: Nullable<String>.value("dispute_created_at"),
            failureMessage: Nullable<String>.value("failure_message"),
            financingInstallmentsCount: Nullable<Double>.value(1.1),
            holds: [
                PaymentHold(
                    amount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                )
            ],
            id: "pay_xxxxxxxxxxxxxx",
            ipAddress: Nullable<String>.value("ip_address"),
            lastPaymentAttemptAt: Nullable<String>.value("last_payment_attempt_at"),
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
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            membershipId: Nullable<String>.value("mem_xxxxxxxxxxxxxx"),
            metadata: Nullable<[String: JSONValue]>.value([
                "order_ref": JSONValue.string("SHINE-4417")
            ]),
            missingTracking: Nullable<Bool>.value(false),
            needsTracking: Nullable<Bool>.value(false),
            nextPaymentAttemptAt: Nullable<String>.value("next_payment_attempt_at"),
            paidAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                    brand: Nullable<String>.value("visa"),
                    expMonth: Nullable<Double>.value(10),
                    expYear: Nullable<Double>.value(2031),
                    issuerIdentificationNumber: Nullable<String>.value("41111111"),
                    last4: Nullable<String>.value("4242"),
                    networkTransactionId: Nullable<String>.value("016153570198200")
                )),
                displayName: "Visa •••• 4242",
                icons: PaymentMethodIcons(
                    card: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        )
                    ),
                    square: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        )
                    )
                ),
                installmentCount: Nullable<Double>.value(1.1),
                paymentMethodType: "card"
            )),
            paymentMethodId: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
            paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
            paymentRuleMatches: [
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                )
            ],
            paymentsFailed: 0,
            presentmentRefundedAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            presentmentTaxAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            presentmentTotal: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            promoCodeId: Nullable<String>.value("promo_code_id"),
            quoteId: Nullable<String>.value("quote_id"),
            recoveryUrl: Nullable<String>.value("recovery_url"),
            refundable: false,
            refundedAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            refundedAt: Nullable<String>.value("refunded_at"),
            responseDueAt: Nullable<String>.value("response_due_at"),
            retryable: true,
            riskScore: Nullable<Double>.value(1.1),
            riskSignals: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            settlementTimeAt: Nullable<String>.value("settlement_time_at"),
            shipmentId: Nullable<String>.value("shipment_id"),
            shippingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            status: ReceiptStatus.draft,
            substatus: FriendlyReceiptStatus.succeeded,
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
            taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
            taxRefundedAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            threeDsVerified: false,
            total: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            updatedAt: "2026-01-01T12:00:00.000Z",
            usdTotal: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            user: Nullable<UserSummary>.value(UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            )),
            userAgent: Nullable<String>.value("user_agent"),
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
            verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                addressLine1: Nullable<String>.value("PASS"),
                arn: Nullable<String>.value("74123456789"),
                authorizationCode: Nullable<String>.value("A1B2C3"),
                cardHolderName: Nullable<String>.value("PASS"),
                cardSecurityCode: Nullable<String>.value("PASS"),
                zipCode: Nullable<String>.value("PASS")
            )),
            voidable: false,
            wuid: Nullable<String>.value("wuid")
        )
        let response = try await client.payments.refund(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func refund2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "amount_after_fees": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "auto_capture_at": "auto_capture_at",
                  "auto_refunded": true,
                  "billing_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "name": "name",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "billing_reason": "subscription_create",
                  "capture_expires_at": "capture_expires_at",
                  "checkout_configuration_id": "checkout_configuration_id",
                  "checkout_origin": "checkout_origin",
                  "checkout_surface": "hosted_checkout",
                  "client_secret": "client_secret",
                  "created_at": "created_at",
                  "currency": "usd",
                  "customer_email": "customer_email",
                  "customer_phone": "customer_phone",
                  "decline_code": "insufficient_funds",
                  "dispute_alerted_at": "dispute_alerted_at",
                  "dispute_created_at": "dispute_created_at",
                  "failure_message": "failure_message",
                  "financing_installments_count": 1.1,
                  "holds": [
                    {
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    },
                    {
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    }
                  ],
                  "id": "id",
                  "ip_address": "ip_address",
                  "last_payment_attempt_at": "last_payment_attempt_at",
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
                  "member_id": "member_id",
                  "membership_id": "membership_id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "missing_tracking": true,
                  "needs_tracking": true,
                  "next_payment_attempt_at": "next_payment_attempt_at",
                  "paid_at": "paid_at",
                  "payment_instrument": {
                    "card": {
                      "brand": "brand",
                      "exp_month": 1.1,
                      "exp_year": 1.1,
                      "issuer_identification_number": "issuer_identification_number",
                      "last4": "last4",
                      "network_transaction_id": "network_transaction_id"
                    },
                    "display_name": "display_name",
                    "icons": {
                      "card": {
                        "dark": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        },
                        "light": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        }
                      },
                      "square": {
                        "dark": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        },
                        "light": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        }
                      }
                    },
                    "installment_count": 1.1,
                    "payment_method_type": "payment_method_type"
                  },
                  "payment_method_id": "payment_method_id",
                  "payment_method_type": "acss_debit",
                  "payment_rule_matches": [
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    },
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    }
                  ],
                  "payments_failed": 1.1,
                  "presentment_refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "presentment_tax_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "presentment_total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "product_id": "product_id",
                  "promo_code_id": "promo_code_id",
                  "quote_id": "quote_id",
                  "recovery_url": "recovery_url",
                  "refundable": true,
                  "refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "refunded_at": "refunded_at",
                  "response_due_at": "response_due_at",
                  "retryable": true,
                  "risk_score": 1.1,
                  "risk_signals": {
                    "risk_signals": {
                      "key": "value"
                    }
                  },
                  "settlement_time_at": "settlement_time_at",
                  "shipment_id": "shipment_id",
                  "shipping_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "name": "name",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "status": "draft",
                  "substatus": "succeeded",
                  "subtotal": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "tax_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "tax_behavior": "exclusive",
                  "tax_refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "three_ds_verified": true,
                  "total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "updated_at": "updated_at",
                  "usd_total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "user_agent": "user_agent",
                  "variant_id": "variant_id",
                  "verification_checks": {
                    "address_line1": "address_line1",
                    "arn": "arn",
                    "authorization_code": "authorization_code",
                    "card_holder_name": "card_holder_name",
                    "card_security_code": "card_security_code",
                    "zip_code": "zip_code"
                  },
                  "voidable": true,
                  "wuid": "wuid"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Payment(
            accountId: Nullable<String>.value("account_id"),
            amountAfterFees: Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            ),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            autoRefunded: true,
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
            captureExpiresAt: Nullable<String>.value("capture_expires_at"),
            checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
            checkoutOrigin: Nullable<String>.value("checkout_origin"),
            checkoutSurface: Nullable<PaymentCheckoutSurface>.value(PaymentCheckoutSurface.hostedCheckout),
            clientSecret: Nullable<String>.value("client_secret"),
            createdAt: "created_at",
            currency: Currencies.usd,
            customerEmail: Nullable<String>.value("customer_email"),
            customerPhone: Nullable<String>.value("customer_phone"),
            declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
            disputeAlertedAt: Nullable<String>.value("dispute_alerted_at"),
            disputeCreatedAt: Nullable<String>.value("dispute_created_at"),
            failureMessage: Nullable<String>.value("failure_message"),
            financingInstallmentsCount: Nullable<Double>.value(1.1),
            holds: [
                PaymentHold(
                    amount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                ),
                PaymentHold(
                    amount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                )
            ],
            id: "id",
            ipAddress: Nullable<String>.value("ip_address"),
            lastPaymentAttemptAt: Nullable<String>.value("last_payment_attempt_at"),
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
            memberId: Nullable<String>.value("member_id"),
            membershipId: Nullable<String>.value("membership_id"),
            metadata: Nullable<[String: JSONValue]>.value([
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            missingTracking: Nullable<Bool>.value(true),
            needsTracking: Nullable<Bool>.value(true),
            nextPaymentAttemptAt: Nullable<String>.value("next_payment_attempt_at"),
            paidAt: Nullable<String>.value("paid_at"),
            paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                    brand: Nullable<String>.value("brand"),
                    expMonth: Nullable<Double>.value(1.1),
                    expYear: Nullable<Double>.value(1.1),
                    issuerIdentificationNumber: Nullable<String>.value("issuer_identification_number"),
                    last4: Nullable<String>.value("last4"),
                    networkTransactionId: Nullable<String>.value("network_transaction_id")
                )),
                displayName: "display_name",
                icons: PaymentMethodIcons(
                    card: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    ),
                    square: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    )
                ),
                installmentCount: Nullable<Double>.value(1.1),
                paymentMethodType: "payment_method_type"
            )),
            paymentMethodId: Nullable<String>.value("payment_method_id"),
            paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
            paymentRuleMatches: [
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                ),
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                )
            ],
            paymentsFailed: 1.1,
            presentmentRefundedAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            presentmentTaxAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            presentmentTotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            productId: Nullable<String>.value("product_id"),
            promoCodeId: Nullable<String>.value("promo_code_id"),
            quoteId: Nullable<String>.value("quote_id"),
            recoveryUrl: Nullable<String>.value("recovery_url"),
            refundable: true,
            refundedAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            refundedAt: Nullable<String>.value("refunded_at"),
            responseDueAt: Nullable<String>.value("response_due_at"),
            retryable: true,
            riskScore: Nullable<Double>.value(1.1),
            riskSignals: Nullable<[String: JSONValue]>.value([
                "risk_signals": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            settlementTimeAt: Nullable<String>.value("settlement_time_at"),
            shipmentId: Nullable<String>.value("shipment_id"),
            shippingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            status: ReceiptStatus.draft,
            substatus: FriendlyReceiptStatus.succeeded,
            subtotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            taxAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
            taxRefundedAmount: Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            ),
            threeDsVerified: true,
            total: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            updatedAt: "updated_at",
            usdTotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            user: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )),
            userAgent: Nullable<String>.value("user_agent"),
            variantId: Nullable<String>.value("variant_id"),
            verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                addressLine1: Nullable<String>.value("address_line1"),
                arn: Nullable<String>.value("arn"),
                authorizationCode: Nullable<String>.value("authorization_code"),
                cardHolderName: Nullable<String>.value("card_holder_name"),
                cardSecurityCode: Nullable<String>.value("card_security_code"),
                zipCode: Nullable<String>.value("zip_code")
            )),
            voidable: true,
            wuid: Nullable<String>.value("wuid")
        )
        let response = try await client.payments.refund(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retry1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount_after_fees": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "auto_capture_at": "auto_capture_at",
                  "auto_refunded": false,
                  "billing_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "billing_reason": "subscription_create",
                  "capture_expires_at": "capture_expires_at",
                  "checkout_configuration_id": "checkout_configuration_id",
                  "checkout_origin": "checkout_origin",
                  "checkout_surface": "hosted_checkout",
                  "client_secret": "pay_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "customer_email": "marcus@shinetime.example",
                  "customer_phone": "+xxxxxxxxxxx",
                  "decline_code": "insufficient_funds",
                  "dispute_alerted_at": "dispute_alerted_at",
                  "dispute_created_at": "dispute_created_at",
                  "failure_message": "failure_message",
                  "financing_installments_count": 1.1,
                  "holds": [
                    {
                      "amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    }
                  ],
                  "id": "pay_xxxxxxxxxxxxxx",
                  "ip_address": "ip_address",
                  "last_payment_attempt_at": "last_payment_attempt_at",
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
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "membership_id": "mem_xxxxxxxxxxxxxx",
                  "metadata": {
                    "order_ref": "SHINE-4417"
                  },
                  "missing_tracking": false,
                  "needs_tracking": false,
                  "next_payment_attempt_at": "next_payment_attempt_at",
                  "paid_at": "2026-01-01T12:00:00.000Z",
                  "payment_instrument": {
                    "card": {
                      "brand": "visa",
                      "exp_month": 10,
                      "exp_year": 2031,
                      "issuer_identification_number": "41111111",
                      "last4": "4242",
                      "network_transaction_id": "016153570198200"
                    },
                    "display_name": "Visa •••• 4242",
                    "icons": {
                      "card": {
                        "dark": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        },
                        "light": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        }
                      },
                      "square": {
                        "dark": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        },
                        "light": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        }
                      }
                    },
                    "installment_count": 1.1,
                    "payment_method_type": "card"
                  },
                  "payment_method_id": "payt_xxxxxxxxxxxxxx",
                  "payment_method_type": "acss_debit",
                  "payment_rule_matches": [
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    }
                  ],
                  "payments_failed": 0,
                  "presentment_refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "presentment_tax_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "presentment_total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_code_id",
                  "quote_id": "quote_id",
                  "recovery_url": "recovery_url",
                  "refundable": false,
                  "refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "refunded_at": "refunded_at",
                  "response_due_at": "response_due_at",
                  "retryable": true,
                  "risk_score": 1.1,
                  "risk_signals": {
                    "key": "value"
                  },
                  "settlement_time_at": "settlement_time_at",
                  "shipment_id": "shipment_id",
                  "shipping_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "status": "draft",
                  "substatus": "succeeded",
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
                  "tax_behavior": "exclusive",
                  "tax_refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "three_ds_verified": false,
                  "total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "usd_total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_agent": "user_agent",
                  "variant_id": "plan_xxxxxxxxxxxxxx",
                  "verification_checks": {
                    "address_line1": "PASS",
                    "arn": "74123456789",
                    "authorization_code": "A1B2C3",
                    "card_holder_name": "PASS",
                    "card_security_code": "PASS",
                    "zip_code": "PASS"
                  },
                  "voidable": false,
                  "wuid": "wuid"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Payment(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amountAfterFees: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            autoRefunded: false,
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
            captureExpiresAt: Nullable<String>.value("capture_expires_at"),
            checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
            checkoutOrigin: Nullable<String>.value("checkout_origin"),
            checkoutSurface: Nullable<PaymentCheckoutSurface>.value(PaymentCheckoutSurface.hostedCheckout),
            clientSecret: Nullable<String>.value("pay_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: Currencies.usd,
            customerEmail: Nullable<String>.value("marcus@shinetime.example"),
            customerPhone: Nullable<String>.value("+xxxxxxxxxxx"),
            declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
            disputeAlertedAt: Nullable<String>.value("dispute_alerted_at"),
            disputeCreatedAt: Nullable<String>.value("dispute_created_at"),
            failureMessage: Nullable<String>.value("failure_message"),
            financingInstallmentsCount: Nullable<Double>.value(1.1),
            holds: [
                PaymentHold(
                    amount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                )
            ],
            id: "pay_xxxxxxxxxxxxxx",
            ipAddress: Nullable<String>.value("ip_address"),
            lastPaymentAttemptAt: Nullable<String>.value("last_payment_attempt_at"),
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
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            membershipId: Nullable<String>.value("mem_xxxxxxxxxxxxxx"),
            metadata: Nullable<[String: JSONValue]>.value([
                "order_ref": JSONValue.string("SHINE-4417")
            ]),
            missingTracking: Nullable<Bool>.value(false),
            needsTracking: Nullable<Bool>.value(false),
            nextPaymentAttemptAt: Nullable<String>.value("next_payment_attempt_at"),
            paidAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                    brand: Nullable<String>.value("visa"),
                    expMonth: Nullable<Double>.value(10),
                    expYear: Nullable<Double>.value(2031),
                    issuerIdentificationNumber: Nullable<String>.value("41111111"),
                    last4: Nullable<String>.value("4242"),
                    networkTransactionId: Nullable<String>.value("016153570198200")
                )),
                displayName: "Visa •••• 4242",
                icons: PaymentMethodIcons(
                    card: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        )
                    ),
                    square: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        )
                    )
                ),
                installmentCount: Nullable<Double>.value(1.1),
                paymentMethodType: "card"
            )),
            paymentMethodId: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
            paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
            paymentRuleMatches: [
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                )
            ],
            paymentsFailed: 0,
            presentmentRefundedAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            presentmentTaxAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            presentmentTotal: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            promoCodeId: Nullable<String>.value("promo_code_id"),
            quoteId: Nullable<String>.value("quote_id"),
            recoveryUrl: Nullable<String>.value("recovery_url"),
            refundable: false,
            refundedAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            refundedAt: Nullable<String>.value("refunded_at"),
            responseDueAt: Nullable<String>.value("response_due_at"),
            retryable: true,
            riskScore: Nullable<Double>.value(1.1),
            riskSignals: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            settlementTimeAt: Nullable<String>.value("settlement_time_at"),
            shipmentId: Nullable<String>.value("shipment_id"),
            shippingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            status: ReceiptStatus.draft,
            substatus: FriendlyReceiptStatus.succeeded,
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
            taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
            taxRefundedAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            threeDsVerified: false,
            total: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            updatedAt: "2026-01-01T12:00:00.000Z",
            usdTotal: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            user: Nullable<UserSummary>.value(UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            )),
            userAgent: Nullable<String>.value("user_agent"),
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
            verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                addressLine1: Nullable<String>.value("PASS"),
                arn: Nullable<String>.value("74123456789"),
                authorizationCode: Nullable<String>.value("A1B2C3"),
                cardHolderName: Nullable<String>.value("PASS"),
                cardSecurityCode: Nullable<String>.value("PASS"),
                zipCode: Nullable<String>.value("PASS")
            )),
            voidable: false,
            wuid: Nullable<String>.value("wuid")
        )
        let response = try await client.payments.retry(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retry2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "amount_after_fees": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "auto_capture_at": "auto_capture_at",
                  "auto_refunded": true,
                  "billing_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "name": "name",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "billing_reason": "subscription_create",
                  "capture_expires_at": "capture_expires_at",
                  "checkout_configuration_id": "checkout_configuration_id",
                  "checkout_origin": "checkout_origin",
                  "checkout_surface": "hosted_checkout",
                  "client_secret": "client_secret",
                  "created_at": "created_at",
                  "currency": "usd",
                  "customer_email": "customer_email",
                  "customer_phone": "customer_phone",
                  "decline_code": "insufficient_funds",
                  "dispute_alerted_at": "dispute_alerted_at",
                  "dispute_created_at": "dispute_created_at",
                  "failure_message": "failure_message",
                  "financing_installments_count": 1.1,
                  "holds": [
                    {
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    },
                    {
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    }
                  ],
                  "id": "id",
                  "ip_address": "ip_address",
                  "last_payment_attempt_at": "last_payment_attempt_at",
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
                  "member_id": "member_id",
                  "membership_id": "membership_id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "missing_tracking": true,
                  "needs_tracking": true,
                  "next_payment_attempt_at": "next_payment_attempt_at",
                  "paid_at": "paid_at",
                  "payment_instrument": {
                    "card": {
                      "brand": "brand",
                      "exp_month": 1.1,
                      "exp_year": 1.1,
                      "issuer_identification_number": "issuer_identification_number",
                      "last4": "last4",
                      "network_transaction_id": "network_transaction_id"
                    },
                    "display_name": "display_name",
                    "icons": {
                      "card": {
                        "dark": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        },
                        "light": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        }
                      },
                      "square": {
                        "dark": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        },
                        "light": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        }
                      }
                    },
                    "installment_count": 1.1,
                    "payment_method_type": "payment_method_type"
                  },
                  "payment_method_id": "payment_method_id",
                  "payment_method_type": "acss_debit",
                  "payment_rule_matches": [
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    },
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    }
                  ],
                  "payments_failed": 1.1,
                  "presentment_refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "presentment_tax_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "presentment_total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "product_id": "product_id",
                  "promo_code_id": "promo_code_id",
                  "quote_id": "quote_id",
                  "recovery_url": "recovery_url",
                  "refundable": true,
                  "refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "refunded_at": "refunded_at",
                  "response_due_at": "response_due_at",
                  "retryable": true,
                  "risk_score": 1.1,
                  "risk_signals": {
                    "risk_signals": {
                      "key": "value"
                    }
                  },
                  "settlement_time_at": "settlement_time_at",
                  "shipment_id": "shipment_id",
                  "shipping_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "name": "name",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "status": "draft",
                  "substatus": "succeeded",
                  "subtotal": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "tax_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "tax_behavior": "exclusive",
                  "tax_refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "three_ds_verified": true,
                  "total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "updated_at": "updated_at",
                  "usd_total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "user_agent": "user_agent",
                  "variant_id": "variant_id",
                  "verification_checks": {
                    "address_line1": "address_line1",
                    "arn": "arn",
                    "authorization_code": "authorization_code",
                    "card_holder_name": "card_holder_name",
                    "card_security_code": "card_security_code",
                    "zip_code": "zip_code"
                  },
                  "voidable": true,
                  "wuid": "wuid"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Payment(
            accountId: Nullable<String>.value("account_id"),
            amountAfterFees: Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            ),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            autoRefunded: true,
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
            captureExpiresAt: Nullable<String>.value("capture_expires_at"),
            checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
            checkoutOrigin: Nullable<String>.value("checkout_origin"),
            checkoutSurface: Nullable<PaymentCheckoutSurface>.value(PaymentCheckoutSurface.hostedCheckout),
            clientSecret: Nullable<String>.value("client_secret"),
            createdAt: "created_at",
            currency: Currencies.usd,
            customerEmail: Nullable<String>.value("customer_email"),
            customerPhone: Nullable<String>.value("customer_phone"),
            declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
            disputeAlertedAt: Nullable<String>.value("dispute_alerted_at"),
            disputeCreatedAt: Nullable<String>.value("dispute_created_at"),
            failureMessage: Nullable<String>.value("failure_message"),
            financingInstallmentsCount: Nullable<Double>.value(1.1),
            holds: [
                PaymentHold(
                    amount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                ),
                PaymentHold(
                    amount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                )
            ],
            id: "id",
            ipAddress: Nullable<String>.value("ip_address"),
            lastPaymentAttemptAt: Nullable<String>.value("last_payment_attempt_at"),
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
            memberId: Nullable<String>.value("member_id"),
            membershipId: Nullable<String>.value("membership_id"),
            metadata: Nullable<[String: JSONValue]>.value([
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            missingTracking: Nullable<Bool>.value(true),
            needsTracking: Nullable<Bool>.value(true),
            nextPaymentAttemptAt: Nullable<String>.value("next_payment_attempt_at"),
            paidAt: Nullable<String>.value("paid_at"),
            paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                    brand: Nullable<String>.value("brand"),
                    expMonth: Nullable<Double>.value(1.1),
                    expYear: Nullable<Double>.value(1.1),
                    issuerIdentificationNumber: Nullable<String>.value("issuer_identification_number"),
                    last4: Nullable<String>.value("last4"),
                    networkTransactionId: Nullable<String>.value("network_transaction_id")
                )),
                displayName: "display_name",
                icons: PaymentMethodIcons(
                    card: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    ),
                    square: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    )
                ),
                installmentCount: Nullable<Double>.value(1.1),
                paymentMethodType: "payment_method_type"
            )),
            paymentMethodId: Nullable<String>.value("payment_method_id"),
            paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
            paymentRuleMatches: [
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                ),
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                )
            ],
            paymentsFailed: 1.1,
            presentmentRefundedAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            presentmentTaxAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            presentmentTotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            productId: Nullable<String>.value("product_id"),
            promoCodeId: Nullable<String>.value("promo_code_id"),
            quoteId: Nullable<String>.value("quote_id"),
            recoveryUrl: Nullable<String>.value("recovery_url"),
            refundable: true,
            refundedAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            refundedAt: Nullable<String>.value("refunded_at"),
            responseDueAt: Nullable<String>.value("response_due_at"),
            retryable: true,
            riskScore: Nullable<Double>.value(1.1),
            riskSignals: Nullable<[String: JSONValue]>.value([
                "risk_signals": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            settlementTimeAt: Nullable<String>.value("settlement_time_at"),
            shipmentId: Nullable<String>.value("shipment_id"),
            shippingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            status: ReceiptStatus.draft,
            substatus: FriendlyReceiptStatus.succeeded,
            subtotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            taxAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
            taxRefundedAmount: Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            ),
            threeDsVerified: true,
            total: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            updatedAt: "updated_at",
            usdTotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            user: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )),
            userAgent: Nullable<String>.value("user_agent"),
            variantId: Nullable<String>.value("variant_id"),
            verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                addressLine1: Nullable<String>.value("address_line1"),
                arn: Nullable<String>.value("arn"),
                authorizationCode: Nullable<String>.value("authorization_code"),
                cardHolderName: Nullable<String>.value("card_holder_name"),
                cardSecurityCode: Nullable<String>.value("card_security_code"),
                zipCode: Nullable<String>.value("zip_code")
            )),
            voidable: true,
            wuid: Nullable<String>.value("wuid")
        )
        let response = try await client.payments.retry(
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
                  "amount_after_fees": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "auto_capture_at": "auto_capture_at",
                  "auto_refunded": false,
                  "billing_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "billing_reason": "subscription_create",
                  "capture_expires_at": "capture_expires_at",
                  "checkout_configuration_id": "checkout_configuration_id",
                  "checkout_origin": "checkout_origin",
                  "checkout_surface": "hosted_checkout",
                  "client_secret": "pay_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "customer_email": "marcus@shinetime.example",
                  "customer_phone": "+xxxxxxxxxxx",
                  "decline_code": "insufficient_funds",
                  "dispute_alerted_at": "dispute_alerted_at",
                  "dispute_created_at": "dispute_created_at",
                  "failure_message": "failure_message",
                  "financing_installments_count": 1.1,
                  "holds": [
                    {
                      "amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    }
                  ],
                  "id": "pay_xxxxxxxxxxxxxx",
                  "ip_address": "ip_address",
                  "last_payment_attempt_at": "last_payment_attempt_at",
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
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "membership_id": "mem_xxxxxxxxxxxxxx",
                  "metadata": {
                    "order_ref": "SHINE-4417"
                  },
                  "missing_tracking": false,
                  "needs_tracking": false,
                  "next_payment_attempt_at": "next_payment_attempt_at",
                  "paid_at": "2026-01-01T12:00:00.000Z",
                  "payment_instrument": {
                    "card": {
                      "brand": "visa",
                      "exp_month": 10,
                      "exp_year": 2031,
                      "issuer_identification_number": "41111111",
                      "last4": "4242",
                      "network_transaction_id": "016153570198200"
                    },
                    "display_name": "Visa •••• 4242",
                    "icons": {
                      "card": {
                        "dark": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        },
                        "light": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        }
                      },
                      "square": {
                        "dark": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        },
                        "light": {
                          "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                          "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                          "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                          "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        }
                      }
                    },
                    "installment_count": 1.1,
                    "payment_method_type": "card"
                  },
                  "payment_method_id": "payt_xxxxxxxxxxxxxx",
                  "payment_method_type": "acss_debit",
                  "payment_rule_matches": [
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    }
                  ],
                  "payments_failed": 0,
                  "presentment_refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "presentment_tax_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "presentment_total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_code_id",
                  "quote_id": "quote_id",
                  "recovery_url": "recovery_url",
                  "refundable": false,
                  "refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "refunded_at": "refunded_at",
                  "response_due_at": "response_due_at",
                  "retryable": true,
                  "risk_score": 1.1,
                  "risk_signals": {
                    "key": "value"
                  },
                  "settlement_time_at": "settlement_time_at",
                  "shipment_id": "shipment_id",
                  "shipping_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "status": "draft",
                  "substatus": "succeeded",
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
                  "tax_behavior": "exclusive",
                  "tax_refunded_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "three_ds_verified": false,
                  "total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "usd_total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_agent": "user_agent",
                  "variant_id": "plan_xxxxxxxxxxxxxx",
                  "verification_checks": {
                    "address_line1": "PASS",
                    "arn": "74123456789",
                    "authorization_code": "A1B2C3",
                    "card_holder_name": "PASS",
                    "card_security_code": "PASS",
                    "zip_code": "PASS"
                  },
                  "voidable": false,
                  "wuid": "wuid"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Payment(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amountAfterFees: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            autoRefunded: false,
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
            captureExpiresAt: Nullable<String>.value("capture_expires_at"),
            checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
            checkoutOrigin: Nullable<String>.value("checkout_origin"),
            checkoutSurface: Nullable<PaymentCheckoutSurface>.value(PaymentCheckoutSurface.hostedCheckout),
            clientSecret: Nullable<String>.value("pay_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: Currencies.usd,
            customerEmail: Nullable<String>.value("marcus@shinetime.example"),
            customerPhone: Nullable<String>.value("+xxxxxxxxxxx"),
            declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
            disputeAlertedAt: Nullable<String>.value("dispute_alerted_at"),
            disputeCreatedAt: Nullable<String>.value("dispute_created_at"),
            failureMessage: Nullable<String>.value("failure_message"),
            financingInstallmentsCount: Nullable<Double>.value(1.1),
            holds: [
                PaymentHold(
                    amount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                )
            ],
            id: "pay_xxxxxxxxxxxxxx",
            ipAddress: Nullable<String>.value("ip_address"),
            lastPaymentAttemptAt: Nullable<String>.value("last_payment_attempt_at"),
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
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            membershipId: Nullable<String>.value("mem_xxxxxxxxxxxxxx"),
            metadata: Nullable<[String: JSONValue]>.value([
                "order_ref": JSONValue.string("SHINE-4417")
            ]),
            missingTracking: Nullable<Bool>.value(false),
            needsTracking: Nullable<Bool>.value(false),
            nextPaymentAttemptAt: Nullable<String>.value("next_payment_attempt_at"),
            paidAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                    brand: Nullable<String>.value("visa"),
                    expMonth: Nullable<Double>.value(10),
                    expYear: Nullable<Double>.value(2031),
                    issuerIdentificationNumber: Nullable<String>.value("41111111"),
                    last4: Nullable<String>.value("4242"),
                    networkTransactionId: Nullable<String>.value("016153570198200")
                )),
                displayName: "Visa •••• 4242",
                icons: PaymentMethodIcons(
                    card: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        )
                    ),
                    square: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                        )
                    )
                ),
                installmentCount: Nullable<Double>.value(1.1),
                paymentMethodType: "card"
            )),
            paymentMethodId: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
            paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
            paymentRuleMatches: [
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                )
            ],
            paymentsFailed: 0,
            presentmentRefundedAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            presentmentTaxAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            presentmentTotal: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            promoCodeId: Nullable<String>.value("promo_code_id"),
            quoteId: Nullable<String>.value("quote_id"),
            recoveryUrl: Nullable<String>.value("recovery_url"),
            refundable: false,
            refundedAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            refundedAt: Nullable<String>.value("refunded_at"),
            responseDueAt: Nullable<String>.value("response_due_at"),
            retryable: true,
            riskScore: Nullable<Double>.value(1.1),
            riskSignals: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            settlementTimeAt: Nullable<String>.value("settlement_time_at"),
            shipmentId: Nullable<String>.value("shipment_id"),
            shippingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            status: ReceiptStatus.draft,
            substatus: FriendlyReceiptStatus.succeeded,
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
            taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
            taxRefundedAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            threeDsVerified: false,
            total: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            updatedAt: "2026-01-01T12:00:00.000Z",
            usdTotal: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            user: Nullable<UserSummary>.value(UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            )),
            userAgent: Nullable<String>.value("user_agent"),
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
            verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                addressLine1: Nullable<String>.value("PASS"),
                arn: Nullable<String>.value("74123456789"),
                authorizationCode: Nullable<String>.value("A1B2C3"),
                cardHolderName: Nullable<String>.value("PASS"),
                cardSecurityCode: Nullable<String>.value("PASS"),
                zipCode: Nullable<String>.value("PASS")
            )),
            voidable: false,
            wuid: Nullable<String>.value("wuid")
        )
        let response = try await client.payments.void(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func void2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "amount_after_fees": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "auto_capture_at": "auto_capture_at",
                  "auto_refunded": true,
                  "billing_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "name": "name",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "billing_reason": "subscription_create",
                  "capture_expires_at": "capture_expires_at",
                  "checkout_configuration_id": "checkout_configuration_id",
                  "checkout_origin": "checkout_origin",
                  "checkout_surface": "hosted_checkout",
                  "client_secret": "client_secret",
                  "created_at": "created_at",
                  "currency": "usd",
                  "customer_email": "customer_email",
                  "customer_phone": "customer_phone",
                  "decline_code": "insufficient_funds",
                  "dispute_alerted_at": "dispute_alerted_at",
                  "dispute_created_at": "dispute_created_at",
                  "failure_message": "failure_message",
                  "financing_installments_count": 1.1,
                  "holds": [
                    {
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    },
                    {
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1,
                      "release_at": "release_at",
                      "type": "reserve"
                    }
                  ],
                  "id": "id",
                  "ip_address": "ip_address",
                  "last_payment_attempt_at": "last_payment_attempt_at",
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
                  "member_id": "member_id",
                  "membership_id": "membership_id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "missing_tracking": true,
                  "needs_tracking": true,
                  "next_payment_attempt_at": "next_payment_attempt_at",
                  "paid_at": "paid_at",
                  "payment_instrument": {
                    "card": {
                      "brand": "brand",
                      "exp_month": 1.1,
                      "exp_year": 1.1,
                      "issuer_identification_number": "issuer_identification_number",
                      "last4": "last4",
                      "network_transaction_id": "network_transaction_id"
                    },
                    "display_name": "display_name",
                    "icons": {
                      "card": {
                        "dark": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        },
                        "light": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        }
                      },
                      "square": {
                        "dark": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        },
                        "light": {
                          "png_1x": "png_1x",
                          "png_2x": "png_2x",
                          "png_4x": "png_4x",
                          "svg": "svg"
                        }
                      }
                    },
                    "installment_count": 1.1,
                    "payment_method_type": "payment_method_type"
                  },
                  "payment_method_id": "payment_method_id",
                  "payment_method_type": "acss_debit",
                  "payment_rule_matches": [
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    },
                    {
                      "action": "allow",
                      "id": "id",
                      "name": "name"
                    }
                  ],
                  "payments_failed": 1.1,
                  "presentment_refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "presentment_tax_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "presentment_total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "product_id": "product_id",
                  "promo_code_id": "promo_code_id",
                  "quote_id": "quote_id",
                  "recovery_url": "recovery_url",
                  "refundable": true,
                  "refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "refunded_at": "refunded_at",
                  "response_due_at": "response_due_at",
                  "retryable": true,
                  "risk_score": 1.1,
                  "risk_signals": {
                    "risk_signals": {
                      "key": "value"
                    }
                  },
                  "settlement_time_at": "settlement_time_at",
                  "shipment_id": "shipment_id",
                  "shipping_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "name": "name",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "status": "draft",
                  "substatus": "succeeded",
                  "subtotal": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "tax_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "tax_behavior": "exclusive",
                  "tax_refunded_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "three_ds_verified": true,
                  "total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "updated_at": "updated_at",
                  "usd_total": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "user_agent": "user_agent",
                  "variant_id": "variant_id",
                  "verification_checks": {
                    "address_line1": "address_line1",
                    "arn": "arn",
                    "authorization_code": "authorization_code",
                    "card_holder_name": "card_holder_name",
                    "card_security_code": "card_security_code",
                    "zip_code": "zip_code"
                  },
                  "voidable": true,
                  "wuid": "wuid"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Payment(
            accountId: Nullable<String>.value("account_id"),
            amountAfterFees: Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            ),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            autoRefunded: true,
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
            captureExpiresAt: Nullable<String>.value("capture_expires_at"),
            checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
            checkoutOrigin: Nullable<String>.value("checkout_origin"),
            checkoutSurface: Nullable<PaymentCheckoutSurface>.value(PaymentCheckoutSurface.hostedCheckout),
            clientSecret: Nullable<String>.value("client_secret"),
            createdAt: "created_at",
            currency: Currencies.usd,
            customerEmail: Nullable<String>.value("customer_email"),
            customerPhone: Nullable<String>.value("customer_phone"),
            declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
            disputeAlertedAt: Nullable<String>.value("dispute_alerted_at"),
            disputeCreatedAt: Nullable<String>.value("dispute_created_at"),
            failureMessage: Nullable<String>.value("failure_message"),
            financingInstallmentsCount: Nullable<Double>.value(1.1),
            holds: [
                PaymentHold(
                    amount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                ),
                PaymentHold(
                    amount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    percentage: Nullable<Double>.value(1.1),
                    releaseAt: Nullable<String>.value("release_at"),
                    type: PaymentHoldType.reserve
                )
            ],
            id: "id",
            ipAddress: Nullable<String>.value("ip_address"),
            lastPaymentAttemptAt: Nullable<String>.value("last_payment_attempt_at"),
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
            memberId: Nullable<String>.value("member_id"),
            membershipId: Nullable<String>.value("membership_id"),
            metadata: Nullable<[String: JSONValue]>.value([
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            missingTracking: Nullable<Bool>.value(true),
            needsTracking: Nullable<Bool>.value(true),
            nextPaymentAttemptAt: Nullable<String>.value("next_payment_attempt_at"),
            paidAt: Nullable<String>.value("paid_at"),
            paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                    brand: Nullable<String>.value("brand"),
                    expMonth: Nullable<Double>.value(1.1),
                    expYear: Nullable<Double>.value(1.1),
                    issuerIdentificationNumber: Nullable<String>.value("issuer_identification_number"),
                    last4: Nullable<String>.value("last4"),
                    networkTransactionId: Nullable<String>.value("network_transaction_id")
                )),
                displayName: "display_name",
                icons: PaymentMethodIcons(
                    card: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    ),
                    square: PaymentMethodIconVariants(
                        dark: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentMethodIconFiles(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    )
                ),
                installmentCount: Nullable<Double>.value(1.1),
                paymentMethodType: "payment_method_type"
            )),
            paymentMethodId: Nullable<String>.value("payment_method_id"),
            paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
            paymentRuleMatches: [
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                ),
                PaymentRuleMatch(
                    action: PaymentRuleMatchAction.allow,
                    id: "id",
                    name: Nullable<String>.value("name")
                )
            ],
            paymentsFailed: 1.1,
            presentmentRefundedAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            presentmentTaxAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            presentmentTotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            productId: Nullable<String>.value("product_id"),
            promoCodeId: Nullable<String>.value("promo_code_id"),
            quoteId: Nullable<String>.value("quote_id"),
            recoveryUrl: Nullable<String>.value("recovery_url"),
            refundable: true,
            refundedAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            refundedAt: Nullable<String>.value("refunded_at"),
            responseDueAt: Nullable<String>.value("response_due_at"),
            retryable: true,
            riskScore: Nullable<Double>.value(1.1),
            riskSignals: Nullable<[String: JSONValue]>.value([
                "risk_signals": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            settlementTimeAt: Nullable<String>.value("settlement_time_at"),
            shipmentId: Nullable<String>.value("shipment_id"),
            shippingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            status: ReceiptStatus.draft,
            substatus: FriendlyReceiptStatus.succeeded,
            subtotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            taxAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
            taxRefundedAmount: Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            ),
            threeDsVerified: true,
            total: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            updatedAt: "updated_at",
            usdTotal: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            user: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )),
            userAgent: Nullable<String>.value("user_agent"),
            variantId: Nullable<String>.value("variant_id"),
            verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                addressLine1: Nullable<String>.value("address_line1"),
                arn: Nullable<String>.value("arn"),
                authorizationCode: Nullable<String>.value("authorization_code"),
                cardHolderName: Nullable<String>.value("card_holder_name"),
                cardSecurityCode: Nullable<String>.value("card_security_code"),
                zipCode: Nullable<String>.value("zip_code")
            )),
            voidable: true,
            wuid: Nullable<String>.value("wuid")
        )
        let response = try await client.payments.void(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func resume1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "auto_capture_at": "auto_capture_at",
                  "capture_expires_at": "2026-01-01T12:00:00.000Z",
                  "id": "pay_xxxxxxxxxxxxxx",
                  "last_payment_error": {
                    "code": "processing_error",
                    "decline_code": "insufficient_funds",
                    "message": "Your card was declined."
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
                  "object": "payment_status",
                  "processing_details": {
                    "expected_by": "2026-01-01T12:00:00.000Z"
                  },
                  "return_url": "https://shinetime.example/checkout/done",
                  "status": "requires_confirmation"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentStatus(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            captureExpiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "pay_xxxxxxxxxxxxxx",
            lastPaymentError: Nullable<PaymentLastPaymentError>.value(PaymentLastPaymentError(
                code: Nullable<String>.value("processing_error"),
                declineCode: Nullable<PaymentLastPaymentErrorDeclineCode>.value(PaymentLastPaymentErrorDeclineCode.insufficientFunds),
                message: Nullable<String>.value("Your card was declined.")
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
            object: "payment_status",
            processingDetails: Nullable<PaymentProcessingDetails>.value(PaymentProcessingDetails(
                expectedBy: Nullable<String>.value("2026-01-01T12:00:00.000Z")
            )),
            returnUrl: Nullable<String>.value("https://shinetime.example/checkout/done"),
            status: PaymentStatusStatus.requiresConfirmation
        )
        let response = try await client.payments.resume(
            paymentId: "payment_id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func resume2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "auto_capture_at": "auto_capture_at",
                  "capture_expires_at": "capture_expires_at",
                  "id": "id",
                  "last_payment_error": {
                    "code": "code",
                    "decline_code": "insufficient_funds",
                    "message": "message"
                  },
                  "next_action": {
                    "type": "await_confirmation",
                    "data": {
                      "expires_at": "expires_at"
                    },
                    "render": [
                      "inline",
                      "inline"
                    ]
                  },
                  "object": "object",
                  "processing_details": {
                    "expected_by": "expected_by"
                  },
                  "return_url": "return_url",
                  "status": "requires_confirmation"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentStatus(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            captureExpiresAt: Nullable<String>.value("capture_expires_at"),
            id: "id",
            lastPaymentError: Nullable<PaymentLastPaymentError>.value(PaymentLastPaymentError(
                code: Nullable<String>.value("code"),
                declineCode: Nullable<PaymentLastPaymentErrorDeclineCode>.value(PaymentLastPaymentErrorDeclineCode.insufficientFunds),
                message: Nullable<String>.value("message")
            )),
            nextAction: Nullable<PaymentNextAction>.value(PaymentNextAction.awaitConfirmation(
                .init(
                    data: PaymentNextActionAwaitConfirmationData(
                        expiresAt: "expires_at"
                    ),
                    render: [
                        PaymentNextActionAwaitConfirmationRenderItem.inline,
                        PaymentNextActionAwaitConfirmationRenderItem.inline
                    ],
                    additionalProperties: [
                        "type": JSONValue.string("await_confirmation")
                    ]
                )
            )),
            object: "object",
            processingDetails: Nullable<PaymentProcessingDetails>.value(PaymentProcessingDetails(
                expectedBy: Nullable<String>.value("expected_by")
            )),
            returnUrl: Nullable<String>.value("return_url"),
            status: PaymentStatusStatus.requiresConfirmation
        )
        let response = try await client.payments.resume(
            paymentId: "payment_id",
            request: .init(),
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "auto_capture_at": "auto_capture_at",
                  "capture_expires_at": "2026-01-01T12:00:00.000Z",
                  "id": "pay_xxxxxxxxxxxxxx",
                  "last_payment_error": {
                    "code": "processing_error",
                    "decline_code": "insufficient_funds",
                    "message": "Your card was declined."
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
                  "object": "payment_status",
                  "processing_details": {
                    "expected_by": "2026-01-01T12:00:00.000Z"
                  },
                  "return_url": "https://shinetime.example/checkout/done",
                  "status": "requires_confirmation"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentStatus(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            captureExpiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "pay_xxxxxxxxxxxxxx",
            lastPaymentError: Nullable<PaymentLastPaymentError>.value(PaymentLastPaymentError(
                code: Nullable<String>.value("processing_error"),
                declineCode: Nullable<PaymentLastPaymentErrorDeclineCode>.value(PaymentLastPaymentErrorDeclineCode.insufficientFunds),
                message: Nullable<String>.value("Your card was declined.")
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
            object: "payment_status",
            processingDetails: Nullable<PaymentProcessingDetails>.value(PaymentProcessingDetails(
                expectedBy: Nullable<String>.value("2026-01-01T12:00:00.000Z")
            )),
            returnUrl: Nullable<String>.value("https://shinetime.example/checkout/done"),
            status: PaymentStatusStatus.requiresConfirmation
        )
        let response = try await client.payments.updateReturnUrl(
            paymentId: "payment_id",
            request: .init(returnUrl: "https://shinetime.example/checkout/thanks"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func updateReturnUrl2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "auto_capture_at": "auto_capture_at",
                  "capture_expires_at": "capture_expires_at",
                  "id": "id",
                  "last_payment_error": {
                    "code": "code",
                    "decline_code": "insufficient_funds",
                    "message": "message"
                  },
                  "next_action": {
                    "type": "await_confirmation",
                    "data": {
                      "expires_at": "expires_at"
                    },
                    "render": [
                      "inline",
                      "inline"
                    ]
                  },
                  "object": "object",
                  "processing_details": {
                    "expected_by": "expected_by"
                  },
                  "return_url": "return_url",
                  "status": "requires_confirmation"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentStatus(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            captureExpiresAt: Nullable<String>.value("capture_expires_at"),
            id: "id",
            lastPaymentError: Nullable<PaymentLastPaymentError>.value(PaymentLastPaymentError(
                code: Nullable<String>.value("code"),
                declineCode: Nullable<PaymentLastPaymentErrorDeclineCode>.value(PaymentLastPaymentErrorDeclineCode.insufficientFunds),
                message: Nullable<String>.value("message")
            )),
            nextAction: Nullable<PaymentNextAction>.value(PaymentNextAction.awaitConfirmation(
                .init(
                    data: PaymentNextActionAwaitConfirmationData(
                        expiresAt: "expires_at"
                    ),
                    render: [
                        PaymentNextActionAwaitConfirmationRenderItem.inline,
                        PaymentNextActionAwaitConfirmationRenderItem.inline
                    ],
                    additionalProperties: [
                        "type": JSONValue.string("await_confirmation")
                    ]
                )
            )),
            object: "object",
            processingDetails: Nullable<PaymentProcessingDetails>.value(PaymentProcessingDetails(
                expectedBy: Nullable<String>.value("expected_by")
            )),
            returnUrl: Nullable<String>.value("return_url"),
            status: PaymentStatusStatus.requiresConfirmation
        )
        let response = try await client.payments.updateReturnUrl(
            paymentId: "payment_id",
            request: .init(returnUrl: "return_url"),
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "auto_capture_at": "auto_capture_at",
                  "capture_expires_at": "2026-01-01T12:00:00.000Z",
                  "id": "pay_xxxxxxxxxxxxxx",
                  "last_payment_error": {
                    "code": "processing_error",
                    "decline_code": "insufficient_funds",
                    "message": "Your card was declined."
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
                  "object": "payment_status",
                  "processing_details": {
                    "expected_by": "2026-01-01T12:00:00.000Z"
                  },
                  "return_url": "https://shinetime.example/checkout/done",
                  "status": "requires_confirmation"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentStatus(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            captureExpiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "pay_xxxxxxxxxxxxxx",
            lastPaymentError: Nullable<PaymentLastPaymentError>.value(PaymentLastPaymentError(
                code: Nullable<String>.value("processing_error"),
                declineCode: Nullable<PaymentLastPaymentErrorDeclineCode>.value(PaymentLastPaymentErrorDeclineCode.insufficientFunds),
                message: Nullable<String>.value("Your card was declined.")
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
            object: "payment_status",
            processingDetails: Nullable<PaymentProcessingDetails>.value(PaymentProcessingDetails(
                expectedBy: Nullable<String>.value("2026-01-01T12:00:00.000Z")
            )),
            returnUrl: Nullable<String>.value("https://shinetime.example/checkout/done"),
            status: PaymentStatusStatus.requiresConfirmation
        )
        let response = try await client.payments.retrieveStatus(
            paymentId: "payment_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retrieveStatus2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "auto_capture_at": "auto_capture_at",
                  "capture_expires_at": "capture_expires_at",
                  "id": "id",
                  "last_payment_error": {
                    "code": "code",
                    "decline_code": "insufficient_funds",
                    "message": "message"
                  },
                  "next_action": {
                    "type": "await_confirmation",
                    "data": {
                      "expires_at": "expires_at"
                    },
                    "render": [
                      "inline",
                      "inline"
                    ]
                  },
                  "object": "object",
                  "processing_details": {
                    "expected_by": "expected_by"
                  },
                  "return_url": "return_url",
                  "status": "requires_confirmation"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentStatus(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            autoCaptureAt: Nullable<String>.value("auto_capture_at"),
            captureExpiresAt: Nullable<String>.value("capture_expires_at"),
            id: "id",
            lastPaymentError: Nullable<PaymentLastPaymentError>.value(PaymentLastPaymentError(
                code: Nullable<String>.value("code"),
                declineCode: Nullable<PaymentLastPaymentErrorDeclineCode>.value(PaymentLastPaymentErrorDeclineCode.insufficientFunds),
                message: Nullable<String>.value("message")
            )),
            nextAction: Nullable<PaymentNextAction>.value(PaymentNextAction.awaitConfirmation(
                .init(
                    data: PaymentNextActionAwaitConfirmationData(
                        expiresAt: "expires_at"
                    ),
                    render: [
                        PaymentNextActionAwaitConfirmationRenderItem.inline,
                        PaymentNextActionAwaitConfirmationRenderItem.inline
                    ],
                    additionalProperties: [
                        "type": JSONValue.string("await_confirmation")
                    ]
                )
            )),
            object: "object",
            processingDetails: Nullable<PaymentProcessingDetails>.value(PaymentProcessingDetails(
                expectedBy: Nullable<String>.value("expected_by")
            )),
            returnUrl: Nullable<String>.value("return_url"),
            status: PaymentStatusStatus.requiresConfirmation
        )
        let response = try await client.payments.retrieveStatus(
            paymentId: "payment_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}