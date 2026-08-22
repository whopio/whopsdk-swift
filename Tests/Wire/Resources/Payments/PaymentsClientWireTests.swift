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
                      "amount_after_fees": 6.9,
                      "application_fee": {
                        "amount": 6.9,
                        "amount_captured": 6.9,
                        "amount_refunded": 6.9,
                        "created_at": "2023-12-01T05:00:00Z",
                        "currency": "usd",
                        "id": "apfee_xxxxxxxxxxxx"
                      },
                      "auto_refunded": true,
                      "billing_address": {
                        "city": null,
                        "country": null,
                        "line1": null,
                        "line2": null,
                        "name": null,
                        "postal_code": null,
                        "state": null
                      },
                      "billing_reason": "subscription_create",
                      "card_brand": "mastercard",
                      "card_last4": "4242",
                      "checkout_configuration_id": "ch_xxxxxxxxxxxxxxx",
                      "company": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "route": "route",
                        "title": "title"
                      },
                      "created_at": "2023-12-01T05:00:00Z",
                      "currency": "usd",
                      "customer_phone": "customer_phone",
                      "decline_code": "insufficient_funds",
                      "dispute_alerted_at": "2023-12-01T05:00:00Z",
                      "failure_message": "failure_message",
                      "id": "pay_xxxxxxxxxxxxxx",
                      "last_payment_attempt": "2023-12-01T05:00:00Z",
                      "member": {
                        "id": "id",
                        "phone": null
                      },
                      "membership": {
                        "id": "mem_xxxxxxxxxxxxxx",
                        "phone_number": null,
                        "status": "trialing"
                      },
                      "metadata": {
                        "key": "value"
                      },
                      "needs_tracking": true,
                      "next_payment_attempt": "2023-12-01T05:00:00Z",
                      "paid_at": "2023-12-01T05:00:00Z",
                      "payment_instrument": {
                        "card": null,
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
                        "installment_count": 42,
                        "payment_method_type": "payment_method_type"
                      },
                      "payment_method": {
                        "card": {
                          "brand": null,
                          "exp_month": 42,
                          "exp_year": 42,
                          "fingerprint": null,
                          "last4": "4242"
                        },
                        "created_at": "2023-12-01T05:00:00Z",
                        "id": "payt_xxxxxxxxxxxxx",
                        "payment_method_type": "acss_debit"
                      },
                      "payment_method_type": "acss_debit",
                      "payments_failed": 42,
                      "plan": {
                        "id": "plan_xxxxxxxxxxxxx",
                        "internal_notes": null,
                        "metadata": null
                      },
                      "product": {
                        "id": "prod_xxxxxxxxxxxxx",
                        "metadata": null,
                        "route": "pickaxe-analytics",
                        "title": "Pickaxe Analytics"
                      },
                      "promo_code": {
                        "amount_off": 6.9,
                        "base_currency": "usd",
                        "code": null,
                        "id": "promo_xxxxxxxxxxxx",
                        "number_of_intervals": 42,
                        "promo_type": "percentage"
                      },
                      "refundable": true,
                      "refunded_amount": 6.9,
                      "refunded_at": "2023-12-01T05:00:00Z",
                      "retryable": true,
                      "settlement_currency": "usd",
                      "shipment": {
                        "carrier": "usps",
                        "id": "ship_xxxxxxxxxxxxx",
                        "status": "unknown",
                        "tracking_number": "9400111899223456789012",
                        "tracking_url": "https://track.aftership.com/9400111899223456789012"
                      },
                      "shipping_address": {
                        "city": null,
                        "country": null,
                        "line1": null,
                        "line2": null,
                        "name": null,
                        "postal_code": null,
                        "state": null
                      },
                      "status": "draft",
                      "substatus": "succeeded",
                      "subtotal": 6.9,
                      "tax_amount": 6.9,
                      "tax_behavior": "exclusive",
                      "total": 6.9,
                      "updated_at": "2023-12-01T05:00:00Z",
                      "usd_total": 6.9,
                      "user": {
                        "email": "john.doe@example.com",
                        "id": "user_xxxxxxxxxxxxx",
                        "name": "John Doe",
                        "username": "johndoe42"
                      },
                      "voidable": true
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
        let expectedResponse = ListPaymentsResponse(
            data: [
                PaymentListItem(
                    amountAfterFees: 6.9,
                    applicationFee: Nullable<PaymentListItemApplicationFee>.value(PaymentListItemApplicationFee(
                        amount: 6.9,
                        amountCaptured: 6.9,
                        amountRefunded: 6.9,
                        createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                        currency: Currencies.usd,
                        id: "apfee_xxxxxxxxxxxx"
                    )),
                    autoRefunded: true,
                    billingAddress: Nullable<PaymentListItemBillingAddress>.value(PaymentListItemBillingAddress(
                        city: .null,
                        country: .null,
                        line1: .null,
                        line2: .null,
                        name: .null,
                        postalCode: .null,
                        state: .null
                    )),
                    billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
                    cardBrand: Nullable<CardBrands>.value(CardBrands.mastercard),
                    cardLast4: Nullable<String>.value("4242"),
                    checkoutConfigurationId: Nullable<String>.value("ch_xxxxxxxxxxxxxxx"),
                    company: Nullable<PaymentListItemCompany>.value(PaymentListItemCompany(
                        id: "biz_xxxxxxxxxxxxxx",
                        route: "route",
                        title: "title"
                    )),
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    currency: Currencies.usd,
                    customerPhone: Nullable<String>.value("customer_phone"),
                    declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
                    disputeAlertedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    failureMessage: Nullable<String>.value("failure_message"),
                    id: "pay_xxxxxxxxxxxxxx",
                    lastPaymentAttempt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    member: Nullable<PaymentListItemMember>.value(PaymentListItemMember(
                        id: "id",
                        phone: .null
                    )),
                    membership: Nullable<PaymentListItemMembership>.value(PaymentListItemMembership(
                        id: "mem_xxxxxxxxxxxxxx",
                        phoneNumber: .null,
                        status: MembershipStatus.trialing
                    )),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    needsTracking: Nullable<Bool>.value(true),
                    nextPaymentAttempt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    paidAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    paymentInstrument: Nullable<PaymentListItemPaymentInstrument>.value(PaymentListItemPaymentInstrument(
                        card: .null,
                        displayName: "display_name",
                        icons: PaymentListItemPaymentInstrumentIcons(
                            card: PaymentListItemPaymentInstrumentIconsCard(
                                dark: PaymentListItemPaymentInstrumentIconsCardDark(
                                    png1X: "png_1x",
                                    png2X: "png_2x",
                                    png4X: "png_4x",
                                    svg: "svg"
                                ),
                                light: PaymentListItemPaymentInstrumentIconsCardLight(
                                    png1X: "png_1x",
                                    png2X: "png_2x",
                                    png4X: "png_4x",
                                    svg: "svg"
                                )
                            ),
                            square: PaymentListItemPaymentInstrumentIconsSquare(
                                dark: PaymentListItemPaymentInstrumentIconsSquareDark(
                                    png1X: "png_1x",
                                    png2X: "png_2x",
                                    png4X: "png_4x",
                                    svg: "svg"
                                ),
                                light: PaymentListItemPaymentInstrumentIconsSquareLight(
                                    png1X: "png_1x",
                                    png2X: "png_2x",
                                    png4X: "png_4x",
                                    svg: "svg"
                                )
                            )
                        ),
                        installmentCount: Nullable<Int>.value(42),
                        paymentMethodType: "payment_method_type"
                    )),
                    paymentMethod: Nullable<PaymentListItemPaymentMethod>.value(PaymentListItemPaymentMethod(
                        card: Nullable<PaymentListItemPaymentMethodCard>.value(PaymentListItemPaymentMethodCard(
                            brand: .null,
                            expMonth: Nullable<Int>.value(42),
                            expYear: Nullable<Int>.value(42),
                            fingerprint: .null,
                            last4: Nullable<String>.value("4242")
                        )),
                        createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                        id: "payt_xxxxxxxxxxxxx",
                        paymentMethodType: PaymentMethodTypes.acssDebit
                    )),
                    paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
                    paymentsFailed: Nullable<Int>.value(42),
                    plan: Nullable<PaymentListItemPlan>.value(PaymentListItemPlan(
                        id: "plan_xxxxxxxxxxxxx",
                        internalNotes: .null,
                        metadata: .null
                    )),
                    product: Nullable<PaymentListItemProduct>.value(PaymentListItemProduct(
                        id: "prod_xxxxxxxxxxxxx",
                        metadata: .null,
                        route: "pickaxe-analytics",
                        title: "Pickaxe Analytics"
                    )),
                    promoCode: Nullable<PaymentListItemPromoCode>.value(PaymentListItemPromoCode(
                        amountOff: 6.9,
                        baseCurrency: Currencies.usd,
                        code: .null,
                        id: "promo_xxxxxxxxxxxx",
                        numberOfIntervals: Nullable<Int>.value(42),
                        promoType: PromoTypes.percentage
                    )),
                    refundable: true,
                    refundedAmount: Nullable<Double>.value(6.9),
                    refundedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    retryable: true,
                    settlementCurrency: Currencies.usd,
                    shipment: Nullable<PaymentListItemShipment>.value(PaymentListItemShipment(
                        carrier: Nullable<String>.value("usps"),
                        id: "ship_xxxxxxxxxxxxx",
                        status: ShipmentStatuses.unknown,
                        trackingNumber: "9400111899223456789012",
                        trackingUrl: "https://track.aftership.com/9400111899223456789012"
                    )),
                    shippingAddress: Nullable<PaymentListItemShippingAddress>.value(PaymentListItemShippingAddress(
                        city: .null,
                        country: .null,
                        line1: .null,
                        line2: .null,
                        name: .null,
                        postalCode: .null,
                        state: .null
                    )),
                    status: Nullable<ReceiptStatus>.value(ReceiptStatus.draft),
                    substatus: FriendlyReceiptStatus.succeeded,
                    subtotal: Nullable<Double>.value(6.9),
                    taxAmount: Nullable<Double>.value(6.9),
                    taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
                    total: Nullable<Double>.value(6.9),
                    updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    usdTotal: Nullable<Double>.value(6.9),
                    user: Nullable<PaymentListItemUser>.value(PaymentListItemUser(
                        email: Nullable<String>.value("john.doe@example.com"),
                        id: "user_xxxxxxxxxxxxx",
                        name: Nullable<String>.value("John Doe"),
                        username: "johndoe42"
                    )),
                    voidable: true
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.payments.list(
            first: 42,
            last: 42,
            companyId: "biz_xxxxxxxxxxxxxx",
            createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            updatedBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            updatedAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
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
                  "amount_after_fees": 6.9,
                  "application_fee": {
                    "amount": 6.9,
                    "amount_captured": 6.9,
                    "amount_refunded": 6.9,
                    "created_at": "2023-12-01T05:00:00Z",
                    "currency": "usd",
                    "id": "apfee_xxxxxxxxxxxx"
                  },
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
                  "card_brand": "mastercard",
                  "card_exp_month": 6,
                  "card_exp_year": 2027,
                  "card_last4": "4242",
                  "checkout_configuration_id": "ch_xxxxxxxxxxxxxxx",
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "route",
                    "title": "title"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "currency": "usd",
                  "customer_phone": "customer_phone",
                  "decline_code": "insufficient_funds",
                  "dispute_alerted_at": "2023-12-01T05:00:00Z",
                  "disputes": [
                    {
                      "amount": 6.9,
                      "currency": "usd",
                      "editable": true,
                      "id": "dspt_xxxxxxxxxxxxx",
                      "needs_response_by": "2023-12-01T05:00:00Z",
                      "notes": "Customer used the product for 3 months before disputing.",
                      "reason": "Product Not Received",
                      "status": "warning_needs_response"
                    }
                  ],
                  "failure_message": "failure_message",
                  "financing_installments_count": 42,
                  "financing_transactions": [
                    {
                      "amount": 6.9,
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "ptx_xxxxxxxxxxxxxx",
                      "status": "succeeded",
                      "transaction_type": "purchase"
                    }
                  ],
                  "id": "pay_xxxxxxxxxxxxxx",
                  "last_payment_attempt": "2023-12-01T05:00:00Z",
                  "member": {
                    "id": "id",
                    "phone": "phone"
                  },
                  "membership": {
                    "id": "mem_xxxxxxxxxxxxxx",
                    "phone_number": "phone_number",
                    "status": "trialing"
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "needs_tracking": true,
                  "next_payment_attempt": "2023-12-01T05:00:00Z",
                  "paid_at": "2023-12-01T05:00:00Z",
                  "payment_instrument": {
                    "card": {
                      "brand": "brand",
                      "last4": "last4"
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
                    "installment_count": 42,
                    "payment_method_type": "payment_method_type"
                  },
                  "payment_method": {
                    "card": {
                      "brand": "mastercard",
                      "exp_month": 42,
                      "exp_year": 42,
                      "fingerprint": "fingerprint",
                      "last4": "4242"
                    },
                    "created_at": "2023-12-01T05:00:00Z",
                    "id": "payt_xxxxxxxxxxxxx",
                    "payment_method_type": "acss_debit"
                  },
                  "payment_method_type": "acss_debit",
                  "payments_failed": 42,
                  "plan": {
                    "id": "plan_xxxxxxxxxxxxx",
                    "internal_notes": "internal_notes",
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxx",
                    "metadata": {
                      "key": "value"
                    },
                    "route": "pickaxe-analytics",
                    "title": "Pickaxe Analytics"
                  },
                  "promo_code": {
                    "amount_off": 6.9,
                    "base_currency": "usd",
                    "code": "code",
                    "id": "promo_xxxxxxxxxxxx",
                    "number_of_intervals": 42,
                    "promo_type": "percentage"
                  },
                  "refundable": true,
                  "refunded_amount": 6.9,
                  "refunded_at": "2023-12-01T05:00:00Z",
                  "refunds": [
                    {
                      "amount": 6.9,
                      "created_at": "2023-12-01T05:00:00Z",
                      "currency": "usd",
                      "id": "rf_xxxxxxxxxxxxxxx",
                      "status": "pending"
                    }
                  ],
                  "resolutions": [
                    {
                      "customer_appealed": true,
                      "customer_response_actions": [
                        "respond"
                      ],
                      "due_date": "2023-12-01T05:00:00Z",
                      "id": "reso_xxxxxxxxxxxxx",
                      "issue": "forgot_to_cancel",
                      "merchant_appealed": true,
                      "merchant_response_actions": [
                        "accept"
                      ],
                      "platform_response_actions": [
                        "request_buyer_info"
                      ],
                      "status": "merchant_response_needed"
                    }
                  ],
                  "retryable": true,
                  "risk_score": 42,
                  "risk_signals": {
                    "key": "value"
                  },
                  "settlement_amount": 6.9,
                  "settlement_currency": "usd",
                  "settlement_exchange_rate": 6.9,
                  "settlement_time_at": "2023-12-01T05:00:00Z",
                  "shipment": {
                    "carrier": "usps",
                    "id": "ship_xxxxxxxxxxxxx",
                    "status": "unknown",
                    "tracking_number": "9400111899223456789012",
                    "tracking_url": "https://track.aftership.com/9400111899223456789012"
                  },
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
                  "subtotal": 6.9,
                  "tax_amount": 6.9,
                  "tax_behavior": "exclusive",
                  "tax_refunded_amount": 6.9,
                  "three_ds_verified": true,
                  "total": 6.9,
                  "updated_at": "2023-12-01T05:00:00Z",
                  "usd_total": 6.9,
                  "user": {
                    "email": "john.doe@example.com",
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "verification_checks": {
                    "address_line1": "address_line1",
                    "card_holder_name": "card_holder_name",
                    "card_security_code": "card_security_code",
                    "zip_code": "zip_code"
                  },
                  "voidable": true,
                  "client_secret": "pay_xxxxxxxxxxxxxx_secret_v1_xxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreatePaymentsResponse(
            amountAfterFees: 6.9,
            applicationFee: Nullable<PaymentApplicationFee>.value(PaymentApplicationFee(
                amount: 6.9,
                amountCaptured: 6.9,
                amountRefunded: 6.9,
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                currency: Currencies.usd,
                id: "apfee_xxxxxxxxxxxx"
            )),
            autoRefunded: true,
            billingAddress: Nullable<PaymentBillingAddress>.value(PaymentBillingAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
            cardBrand: Nullable<CardBrands>.value(CardBrands.mastercard),
            cardExpMonth: Nullable<Int>.value(6),
            cardExpYear: Nullable<Int>.value(2027),
            cardLast4: Nullable<String>.value("4242"),
            checkoutConfigurationId: Nullable<String>.value("ch_xxxxxxxxxxxxxxx"),
            company: Nullable<PaymentCompany>.value(PaymentCompany(
                id: "biz_xxxxxxxxxxxxxx",
                route: "route",
                title: "title"
            )),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            currency: Currencies.usd,
            customerPhone: Nullable<String>.value("customer_phone"),
            declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
            disputeAlertedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            disputes: Nullable<[PaymentDisputesItem]>.value([
                PaymentDisputesItem(
                    amount: 6.9,
                    currency: Currencies.usd,
                    editable: Nullable<Bool>.value(true),
                    id: "dspt_xxxxxxxxxxxxx",
                    needsResponseBy: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    notes: Nullable<String>.value("Customer used the product for 3 months before disputing."),
                    reason: Nullable<String>.value("Product Not Received"),
                    status: DisputeStatuses.warningNeedsResponse
                )
            ]),
            failureMessage: Nullable<String>.value("failure_message"),
            financingInstallmentsCount: Nullable<Int>.value(42),
            financingTransactions: [
                PaymentFinancingTransactionsItem(
                    amount: 6.9,
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "ptx_xxxxxxxxxxxxxx",
                    status: PaymentTransactionStatuses.succeeded,
                    transactionType: PaymentTransactionTypes.purchase
                )
            ],
            id: "pay_xxxxxxxxxxxxxx",
            lastPaymentAttempt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            member: Nullable<PaymentMember>.value(PaymentMember(
                id: "id",
                phone: Nullable<String>.value("phone")
            )),
            membership: Nullable<PaymentMembership>.value(PaymentMembership(
                id: "mem_xxxxxxxxxxxxxx",
                phoneNumber: Nullable<String>.value("phone_number"),
                status: MembershipStatus.trialing
            )),
            metadata: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            needsTracking: Nullable<Bool>.value(true),
            nextPaymentAttempt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            paidAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            paymentInstrument: Nullable<PaymentPaymentInstrument>.value(PaymentPaymentInstrument(
                card: Nullable<PaymentPaymentInstrumentCard>.value(PaymentPaymentInstrumentCard(
                    brand: "brand",
                    last4: Nullable<String>.value("last4")
                )),
                displayName: "display_name",
                icons: PaymentPaymentInstrumentIcons(
                    card: PaymentPaymentInstrumentIconsCard(
                        dark: PaymentPaymentInstrumentIconsCardDark(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentPaymentInstrumentIconsCardLight(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    ),
                    square: PaymentPaymentInstrumentIconsSquare(
                        dark: PaymentPaymentInstrumentIconsSquareDark(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentPaymentInstrumentIconsSquareLight(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    )
                ),
                installmentCount: Nullable<Int>.value(42),
                paymentMethodType: "payment_method_type"
            )),
            paymentMethod: Nullable<PaymentPaymentMethod>.value(PaymentPaymentMethod(
                card: Nullable<PaymentPaymentMethodCard>.value(PaymentPaymentMethodCard(
                    brand: Nullable<CardBrands>.value(CardBrands.mastercard),
                    expMonth: Nullable<Int>.value(42),
                    expYear: Nullable<Int>.value(42),
                    fingerprint: Nullable<String>.value("fingerprint"),
                    last4: Nullable<String>.value("4242")
                )),
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                id: "payt_xxxxxxxxxxxxx",
                paymentMethodType: PaymentMethodTypes.acssDebit
            )),
            paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
            paymentsFailed: Nullable<Int>.value(42),
            plan: Nullable<PaymentPlan>.value(PaymentPlan(
                id: "plan_xxxxxxxxxxxxx",
                internalNotes: Nullable<String>.value("internal_notes"),
                metadata: Nullable<[String: JSONValue]>.value([
                    "key": JSONValue.string("value")
                ])
            )),
            product: Nullable<PaymentProduct>.value(PaymentProduct(
                id: "prod_xxxxxxxxxxxxx",
                metadata: Nullable<[String: JSONValue]>.value([
                    "key": JSONValue.string("value")
                ]),
                route: "pickaxe-analytics",
                title: "Pickaxe Analytics"
            )),
            promoCode: Nullable<PaymentPromoCode>.value(PaymentPromoCode(
                amountOff: 6.9,
                baseCurrency: Currencies.usd,
                code: Nullable<String>.value("code"),
                id: "promo_xxxxxxxxxxxx",
                numberOfIntervals: Nullable<Int>.value(42),
                promoType: PromoTypes.percentage
            )),
            refundable: true,
            refundedAmount: Nullable<Double>.value(6.9),
            refundedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            refunds: [
                PaymentRefundsItem(
                    amount: 6.9,
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    currency: Currencies.usd,
                    id: "rf_xxxxxxxxxxxxxxx",
                    status: RefundStatuses.pending
                )
            ],
            resolutions: Nullable<[PaymentResolutionsItem]>.value([
                PaymentResolutionsItem(
                    customerAppealed: true,
                    customerResponseActions: [
                        ResolutionCenterCaseCustomerResponses.respond
                    ],
                    dueDate: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    id: "reso_xxxxxxxxxxxxx",
                    issue: ResolutionCenterCaseIssueTypes.forgotToCancel,
                    merchantAppealed: true,
                    merchantResponseActions: [
                        ResolutionCenterCaseMerchantResponses.accept
                    ],
                    platformResponseActions: [
                        ResolutionCenterCasePlatformResponses.requestBuyerInfo
                    ],
                    status: ResolutionCenterCaseStatuses.merchantResponseNeeded
                )
            ]),
            retryable: true,
            riskScore: Nullable<Int>.value(42),
            riskSignals: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            settlementAmount: 6.9,
            settlementCurrency: Currencies.usd,
            settlementExchangeRate: Nullable<Double>.value(6.9),
            settlementTimeAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            shipment: Nullable<PaymentShipment>.value(PaymentShipment(
                carrier: Nullable<String>.value("usps"),
                id: "ship_xxxxxxxxxxxxx",
                status: ShipmentStatuses.unknown,
                trackingNumber: "9400111899223456789012",
                trackingUrl: "https://track.aftership.com/9400111899223456789012"
            )),
            shippingAddress: Nullable<PaymentShippingAddress>.value(PaymentShippingAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            status: Nullable<ReceiptStatus>.value(ReceiptStatus.draft),
            substatus: FriendlyReceiptStatus.succeeded,
            subtotal: Nullable<Double>.value(6.9),
            taxAmount: Nullable<Double>.value(6.9),
            taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
            taxRefundedAmount: Nullable<Double>.value(6.9),
            threeDsVerified: true,
            total: Nullable<Double>.value(6.9),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            usdTotal: Nullable<Double>.value(6.9),
            user: Nullable<PaymentUser>.value(PaymentUser(
                email: Nullable<String>.value("john.doe@example.com"),
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )),
            verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                addressLine1: Nullable<String>.value("address_line1"),
                cardHolderName: Nullable<String>.value("card_holder_name"),
                cardSecurityCode: Nullable<String>.value("card_security_code"),
                zipCode: Nullable<String>.value("zip_code")
            )),
            voidable: true,
            clientSecret: Nullable<String>.value("pay_xxxxxxxxxxxxxx_secret_v1_xxxx")
        )
        let response = try await client.payments.create(
            request: CreatePaymentsRequest.createPaymentsRequestZero(
                CreatePaymentsRequestZero(
                    companyId: "biz_xxxxxxxxxxxxxx",
                    confirmationToken: "confirmation_token",
                    plan: CreatePaymentsRequestZeroPlan(
                        currency: .usd
                    )
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
                  "amount_after_fees": 6.9,
                  "application_fee": {
                    "amount": 6.9,
                    "amount_captured": 6.9,
                    "amount_refunded": 6.9,
                    "created_at": "2023-12-01T05:00:00Z",
                    "currency": "usd",
                    "id": "apfee_xxxxxxxxxxxx"
                  },
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
                  "card_brand": "mastercard",
                  "card_exp_month": 6,
                  "card_exp_year": 2027,
                  "card_last4": "4242",
                  "checkout_configuration_id": "ch_xxxxxxxxxxxxxxx",
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "route",
                    "title": "title"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "currency": "usd",
                  "customer_phone": "customer_phone",
                  "decline_code": "insufficient_funds",
                  "dispute_alerted_at": "2023-12-01T05:00:00Z",
                  "disputes": [
                    {
                      "amount": 6.9,
                      "currency": "usd",
                      "editable": true,
                      "id": "dspt_xxxxxxxxxxxxx",
                      "needs_response_by": "2023-12-01T05:00:00Z",
                      "notes": "Customer used the product for 3 months before disputing.",
                      "reason": "Product Not Received",
                      "status": "warning_needs_response"
                    }
                  ],
                  "failure_message": "failure_message",
                  "financing_installments_count": 42,
                  "financing_transactions": [
                    {
                      "amount": 6.9,
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "ptx_xxxxxxxxxxxxxx",
                      "status": "succeeded",
                      "transaction_type": "purchase"
                    }
                  ],
                  "id": "pay_xxxxxxxxxxxxxx",
                  "last_payment_attempt": "2023-12-01T05:00:00Z",
                  "member": {
                    "id": "id",
                    "phone": "phone"
                  },
                  "membership": {
                    "id": "mem_xxxxxxxxxxxxxx",
                    "phone_number": "phone_number",
                    "status": "trialing"
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "needs_tracking": true,
                  "next_payment_attempt": "2023-12-01T05:00:00Z",
                  "paid_at": "2023-12-01T05:00:00Z",
                  "payment_instrument": {
                    "card": {
                      "brand": "brand",
                      "last4": "last4"
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
                    "installment_count": 42,
                    "payment_method_type": "payment_method_type"
                  },
                  "payment_method": {
                    "card": {
                      "brand": "mastercard",
                      "exp_month": 42,
                      "exp_year": 42,
                      "fingerprint": "fingerprint",
                      "last4": "4242"
                    },
                    "created_at": "2023-12-01T05:00:00Z",
                    "id": "payt_xxxxxxxxxxxxx",
                    "payment_method_type": "acss_debit"
                  },
                  "payment_method_type": "acss_debit",
                  "payments_failed": 42,
                  "plan": {
                    "id": "plan_xxxxxxxxxxxxx",
                    "internal_notes": "internal_notes",
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxx",
                    "metadata": {
                      "key": "value"
                    },
                    "route": "pickaxe-analytics",
                    "title": "Pickaxe Analytics"
                  },
                  "promo_code": {
                    "amount_off": 6.9,
                    "base_currency": "usd",
                    "code": "code",
                    "id": "promo_xxxxxxxxxxxx",
                    "number_of_intervals": 42,
                    "promo_type": "percentage"
                  },
                  "refundable": true,
                  "refunded_amount": 6.9,
                  "refunded_at": "2023-12-01T05:00:00Z",
                  "refunds": [
                    {
                      "amount": 6.9,
                      "created_at": "2023-12-01T05:00:00Z",
                      "currency": "usd",
                      "id": "rf_xxxxxxxxxxxxxxx",
                      "status": "pending"
                    }
                  ],
                  "resolutions": [
                    {
                      "customer_appealed": true,
                      "customer_response_actions": [
                        "respond"
                      ],
                      "due_date": "2023-12-01T05:00:00Z",
                      "id": "reso_xxxxxxxxxxxxx",
                      "issue": "forgot_to_cancel",
                      "merchant_appealed": true,
                      "merchant_response_actions": [
                        "accept"
                      ],
                      "platform_response_actions": [
                        "request_buyer_info"
                      ],
                      "status": "merchant_response_needed"
                    }
                  ],
                  "retryable": true,
                  "risk_score": 42,
                  "risk_signals": {
                    "key": "value"
                  },
                  "settlement_amount": 6.9,
                  "settlement_currency": "usd",
                  "settlement_exchange_rate": 6.9,
                  "settlement_time_at": "2023-12-01T05:00:00Z",
                  "shipment": {
                    "carrier": "usps",
                    "id": "ship_xxxxxxxxxxxxx",
                    "status": "unknown",
                    "tracking_number": "9400111899223456789012",
                    "tracking_url": "https://track.aftership.com/9400111899223456789012"
                  },
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
                  "subtotal": 6.9,
                  "tax_amount": 6.9,
                  "tax_behavior": "exclusive",
                  "tax_refunded_amount": 6.9,
                  "three_ds_verified": true,
                  "total": 6.9,
                  "updated_at": "2023-12-01T05:00:00Z",
                  "usd_total": 6.9,
                  "user": {
                    "email": "john.doe@example.com",
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "verification_checks": {
                    "address_line1": "address_line1",
                    "card_holder_name": "card_holder_name",
                    "card_security_code": "card_security_code",
                    "zip_code": "zip_code"
                  },
                  "voidable": true,
                  "client_secret": "pay_xxxxxxxxxxxxxx_secret_v1_xxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RetrievePaymentsResponse(
            amountAfterFees: 6.9,
            applicationFee: Nullable<PaymentApplicationFee>.value(PaymentApplicationFee(
                amount: 6.9,
                amountCaptured: 6.9,
                amountRefunded: 6.9,
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                currency: Currencies.usd,
                id: "apfee_xxxxxxxxxxxx"
            )),
            autoRefunded: true,
            billingAddress: Nullable<PaymentBillingAddress>.value(PaymentBillingAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
            cardBrand: Nullable<CardBrands>.value(CardBrands.mastercard),
            cardExpMonth: Nullable<Int>.value(6),
            cardExpYear: Nullable<Int>.value(2027),
            cardLast4: Nullable<String>.value("4242"),
            checkoutConfigurationId: Nullable<String>.value("ch_xxxxxxxxxxxxxxx"),
            company: Nullable<PaymentCompany>.value(PaymentCompany(
                id: "biz_xxxxxxxxxxxxxx",
                route: "route",
                title: "title"
            )),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            currency: Currencies.usd,
            customerPhone: Nullable<String>.value("customer_phone"),
            declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
            disputeAlertedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            disputes: Nullable<[PaymentDisputesItem]>.value([
                PaymentDisputesItem(
                    amount: 6.9,
                    currency: Currencies.usd,
                    editable: Nullable<Bool>.value(true),
                    id: "dspt_xxxxxxxxxxxxx",
                    needsResponseBy: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    notes: Nullable<String>.value("Customer used the product for 3 months before disputing."),
                    reason: Nullable<String>.value("Product Not Received"),
                    status: DisputeStatuses.warningNeedsResponse
                )
            ]),
            failureMessage: Nullable<String>.value("failure_message"),
            financingInstallmentsCount: Nullable<Int>.value(42),
            financingTransactions: [
                PaymentFinancingTransactionsItem(
                    amount: 6.9,
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "ptx_xxxxxxxxxxxxxx",
                    status: PaymentTransactionStatuses.succeeded,
                    transactionType: PaymentTransactionTypes.purchase
                )
            ],
            id: "pay_xxxxxxxxxxxxxx",
            lastPaymentAttempt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            member: Nullable<PaymentMember>.value(PaymentMember(
                id: "id",
                phone: Nullable<String>.value("phone")
            )),
            membership: Nullable<PaymentMembership>.value(PaymentMembership(
                id: "mem_xxxxxxxxxxxxxx",
                phoneNumber: Nullable<String>.value("phone_number"),
                status: MembershipStatus.trialing
            )),
            metadata: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            needsTracking: Nullable<Bool>.value(true),
            nextPaymentAttempt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            paidAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            paymentInstrument: Nullable<PaymentPaymentInstrument>.value(PaymentPaymentInstrument(
                card: Nullable<PaymentPaymentInstrumentCard>.value(PaymentPaymentInstrumentCard(
                    brand: "brand",
                    last4: Nullable<String>.value("last4")
                )),
                displayName: "display_name",
                icons: PaymentPaymentInstrumentIcons(
                    card: PaymentPaymentInstrumentIconsCard(
                        dark: PaymentPaymentInstrumentIconsCardDark(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentPaymentInstrumentIconsCardLight(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    ),
                    square: PaymentPaymentInstrumentIconsSquare(
                        dark: PaymentPaymentInstrumentIconsSquareDark(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentPaymentInstrumentIconsSquareLight(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    )
                ),
                installmentCount: Nullable<Int>.value(42),
                paymentMethodType: "payment_method_type"
            )),
            paymentMethod: Nullable<PaymentPaymentMethod>.value(PaymentPaymentMethod(
                card: Nullable<PaymentPaymentMethodCard>.value(PaymentPaymentMethodCard(
                    brand: Nullable<CardBrands>.value(CardBrands.mastercard),
                    expMonth: Nullable<Int>.value(42),
                    expYear: Nullable<Int>.value(42),
                    fingerprint: Nullable<String>.value("fingerprint"),
                    last4: Nullable<String>.value("4242")
                )),
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                id: "payt_xxxxxxxxxxxxx",
                paymentMethodType: PaymentMethodTypes.acssDebit
            )),
            paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
            paymentsFailed: Nullable<Int>.value(42),
            plan: Nullable<PaymentPlan>.value(PaymentPlan(
                id: "plan_xxxxxxxxxxxxx",
                internalNotes: Nullable<String>.value("internal_notes"),
                metadata: Nullable<[String: JSONValue]>.value([
                    "key": JSONValue.string("value")
                ])
            )),
            product: Nullable<PaymentProduct>.value(PaymentProduct(
                id: "prod_xxxxxxxxxxxxx",
                metadata: Nullable<[String: JSONValue]>.value([
                    "key": JSONValue.string("value")
                ]),
                route: "pickaxe-analytics",
                title: "Pickaxe Analytics"
            )),
            promoCode: Nullable<PaymentPromoCode>.value(PaymentPromoCode(
                amountOff: 6.9,
                baseCurrency: Currencies.usd,
                code: Nullable<String>.value("code"),
                id: "promo_xxxxxxxxxxxx",
                numberOfIntervals: Nullable<Int>.value(42),
                promoType: PromoTypes.percentage
            )),
            refundable: true,
            refundedAmount: Nullable<Double>.value(6.9),
            refundedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            refunds: [
                PaymentRefundsItem(
                    amount: 6.9,
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    currency: Currencies.usd,
                    id: "rf_xxxxxxxxxxxxxxx",
                    status: RefundStatuses.pending
                )
            ],
            resolutions: Nullable<[PaymentResolutionsItem]>.value([
                PaymentResolutionsItem(
                    customerAppealed: true,
                    customerResponseActions: [
                        ResolutionCenterCaseCustomerResponses.respond
                    ],
                    dueDate: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    id: "reso_xxxxxxxxxxxxx",
                    issue: ResolutionCenterCaseIssueTypes.forgotToCancel,
                    merchantAppealed: true,
                    merchantResponseActions: [
                        ResolutionCenterCaseMerchantResponses.accept
                    ],
                    platformResponseActions: [
                        ResolutionCenterCasePlatformResponses.requestBuyerInfo
                    ],
                    status: ResolutionCenterCaseStatuses.merchantResponseNeeded
                )
            ]),
            retryable: true,
            riskScore: Nullable<Int>.value(42),
            riskSignals: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            settlementAmount: 6.9,
            settlementCurrency: Currencies.usd,
            settlementExchangeRate: Nullable<Double>.value(6.9),
            settlementTimeAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            shipment: Nullable<PaymentShipment>.value(PaymentShipment(
                carrier: Nullable<String>.value("usps"),
                id: "ship_xxxxxxxxxxxxx",
                status: ShipmentStatuses.unknown,
                trackingNumber: "9400111899223456789012",
                trackingUrl: "https://track.aftership.com/9400111899223456789012"
            )),
            shippingAddress: Nullable<PaymentShippingAddress>.value(PaymentShippingAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            status: Nullable<ReceiptStatus>.value(ReceiptStatus.draft),
            substatus: FriendlyReceiptStatus.succeeded,
            subtotal: Nullable<Double>.value(6.9),
            taxAmount: Nullable<Double>.value(6.9),
            taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
            taxRefundedAmount: Nullable<Double>.value(6.9),
            threeDsVerified: true,
            total: Nullable<Double>.value(6.9),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            usdTotal: Nullable<Double>.value(6.9),
            user: Nullable<PaymentUser>.value(PaymentUser(
                email: Nullable<String>.value("john.doe@example.com"),
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )),
            verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                addressLine1: Nullable<String>.value("address_line1"),
                cardHolderName: Nullable<String>.value("card_holder_name"),
                cardSecurityCode: Nullable<String>.value("card_security_code"),
                zipCode: Nullable<String>.value("zip_code")
            )),
            voidable: true,
            clientSecret: Nullable<String>.value("pay_xxxxxxxxxxxxxx_secret_v1_xxxx")
        )
        let response = try await client.payments.retrieve(
            id: "pay_xxxxxxxxxxxxxx",
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
                      "amount": 6.9,
                      "currency": "usd",
                      "name": "name",
                      "type": "stripe_domestic_processing_fee"
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
                ListFeesPaymentsResponseDataItem(
                    amount: 6.9,
                    currency: Currencies.usd,
                    name: "name",
                    type: SpecificFeeOrigins.stripeDomesticProcessingFee
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.payments.listFees(
            id: "pay_xxxxxxxxxxxxxx",
            first: 42,
            last: 42,
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
                  "amount_after_fees": 6.9,
                  "application_fee": {
                    "amount": 6.9,
                    "amount_captured": 6.9,
                    "amount_refunded": 6.9,
                    "created_at": "2023-12-01T05:00:00Z",
                    "currency": "usd",
                    "id": "apfee_xxxxxxxxxxxx"
                  },
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
                  "card_brand": "mastercard",
                  "card_exp_month": 6,
                  "card_exp_year": 2027,
                  "card_last4": "4242",
                  "checkout_configuration_id": "ch_xxxxxxxxxxxxxxx",
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "route",
                    "title": "title"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "currency": "usd",
                  "customer_phone": "customer_phone",
                  "decline_code": "insufficient_funds",
                  "dispute_alerted_at": "2023-12-01T05:00:00Z",
                  "disputes": [
                    {
                      "amount": 6.9,
                      "currency": "usd",
                      "editable": true,
                      "id": "dspt_xxxxxxxxxxxxx",
                      "needs_response_by": "2023-12-01T05:00:00Z",
                      "notes": "Customer used the product for 3 months before disputing.",
                      "reason": "Product Not Received",
                      "status": "warning_needs_response"
                    }
                  ],
                  "failure_message": "failure_message",
                  "financing_installments_count": 42,
                  "financing_transactions": [
                    {
                      "amount": 6.9,
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "ptx_xxxxxxxxxxxxxx",
                      "status": "succeeded",
                      "transaction_type": "purchase"
                    }
                  ],
                  "id": "pay_xxxxxxxxxxxxxx",
                  "last_payment_attempt": "2023-12-01T05:00:00Z",
                  "member": {
                    "id": "id",
                    "phone": "phone"
                  },
                  "membership": {
                    "id": "mem_xxxxxxxxxxxxxx",
                    "phone_number": "phone_number",
                    "status": "trialing"
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "needs_tracking": true,
                  "next_payment_attempt": "2023-12-01T05:00:00Z",
                  "paid_at": "2023-12-01T05:00:00Z",
                  "payment_instrument": {
                    "card": {
                      "brand": "brand",
                      "last4": "last4"
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
                    "installment_count": 42,
                    "payment_method_type": "payment_method_type"
                  },
                  "payment_method": {
                    "card": {
                      "brand": "mastercard",
                      "exp_month": 42,
                      "exp_year": 42,
                      "fingerprint": "fingerprint",
                      "last4": "4242"
                    },
                    "created_at": "2023-12-01T05:00:00Z",
                    "id": "payt_xxxxxxxxxxxxx",
                    "payment_method_type": "acss_debit"
                  },
                  "payment_method_type": "acss_debit",
                  "payments_failed": 42,
                  "plan": {
                    "id": "plan_xxxxxxxxxxxxx",
                    "internal_notes": "internal_notes",
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxx",
                    "metadata": {
                      "key": "value"
                    },
                    "route": "pickaxe-analytics",
                    "title": "Pickaxe Analytics"
                  },
                  "promo_code": {
                    "amount_off": 6.9,
                    "base_currency": "usd",
                    "code": "code",
                    "id": "promo_xxxxxxxxxxxx",
                    "number_of_intervals": 42,
                    "promo_type": "percentage"
                  },
                  "refundable": true,
                  "refunded_amount": 6.9,
                  "refunded_at": "2023-12-01T05:00:00Z",
                  "refunds": [
                    {
                      "amount": 6.9,
                      "created_at": "2023-12-01T05:00:00Z",
                      "currency": "usd",
                      "id": "rf_xxxxxxxxxxxxxxx",
                      "status": "pending"
                    }
                  ],
                  "resolutions": [
                    {
                      "customer_appealed": true,
                      "customer_response_actions": [
                        "respond"
                      ],
                      "due_date": "2023-12-01T05:00:00Z",
                      "id": "reso_xxxxxxxxxxxxx",
                      "issue": "forgot_to_cancel",
                      "merchant_appealed": true,
                      "merchant_response_actions": [
                        "accept"
                      ],
                      "platform_response_actions": [
                        "request_buyer_info"
                      ],
                      "status": "merchant_response_needed"
                    }
                  ],
                  "retryable": true,
                  "risk_score": 42,
                  "risk_signals": {
                    "key": "value"
                  },
                  "settlement_amount": 6.9,
                  "settlement_currency": "usd",
                  "settlement_exchange_rate": 6.9,
                  "settlement_time_at": "2023-12-01T05:00:00Z",
                  "shipment": {
                    "carrier": "usps",
                    "id": "ship_xxxxxxxxxxxxx",
                    "status": "unknown",
                    "tracking_number": "9400111899223456789012",
                    "tracking_url": "https://track.aftership.com/9400111899223456789012"
                  },
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
                  "subtotal": 6.9,
                  "tax_amount": 6.9,
                  "tax_behavior": "exclusive",
                  "tax_refunded_amount": 6.9,
                  "three_ds_verified": true,
                  "total": 6.9,
                  "updated_at": "2023-12-01T05:00:00Z",
                  "usd_total": 6.9,
                  "user": {
                    "email": "john.doe@example.com",
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "verification_checks": {
                    "address_line1": "address_line1",
                    "card_holder_name": "card_holder_name",
                    "card_security_code": "card_security_code",
                    "zip_code": "zip_code"
                  },
                  "voidable": true
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
            amountAfterFees: 6.9,
            applicationFee: Nullable<PaymentApplicationFee>.value(PaymentApplicationFee(
                amount: 6.9,
                amountCaptured: 6.9,
                amountRefunded: 6.9,
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                currency: Currencies.usd,
                id: "apfee_xxxxxxxxxxxx"
            )),
            autoRefunded: true,
            billingAddress: Nullable<PaymentBillingAddress>.value(PaymentBillingAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
            cardBrand: Nullable<CardBrands>.value(CardBrands.mastercard),
            cardExpMonth: Nullable<Int>.value(6),
            cardExpYear: Nullable<Int>.value(2027),
            cardLast4: Nullable<String>.value("4242"),
            checkoutConfigurationId: Nullable<String>.value("ch_xxxxxxxxxxxxxxx"),
            company: Nullable<PaymentCompany>.value(PaymentCompany(
                id: "biz_xxxxxxxxxxxxxx",
                route: "route",
                title: "title"
            )),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            currency: Currencies.usd,
            customerPhone: Nullable<String>.value("customer_phone"),
            declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
            disputeAlertedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            disputes: Nullable<[PaymentDisputesItem]>.value([
                PaymentDisputesItem(
                    amount: 6.9,
                    currency: Currencies.usd,
                    editable: Nullable<Bool>.value(true),
                    id: "dspt_xxxxxxxxxxxxx",
                    needsResponseBy: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    notes: Nullable<String>.value("Customer used the product for 3 months before disputing."),
                    reason: Nullable<String>.value("Product Not Received"),
                    status: DisputeStatuses.warningNeedsResponse
                )
            ]),
            failureMessage: Nullable<String>.value("failure_message"),
            financingInstallmentsCount: Nullable<Int>.value(42),
            financingTransactions: [
                PaymentFinancingTransactionsItem(
                    amount: 6.9,
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "ptx_xxxxxxxxxxxxxx",
                    status: PaymentTransactionStatuses.succeeded,
                    transactionType: PaymentTransactionTypes.purchase
                )
            ],
            id: "pay_xxxxxxxxxxxxxx",
            lastPaymentAttempt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            member: Nullable<PaymentMember>.value(PaymentMember(
                id: "id",
                phone: Nullable<String>.value("phone")
            )),
            membership: Nullable<PaymentMembership>.value(PaymentMembership(
                id: "mem_xxxxxxxxxxxxxx",
                phoneNumber: Nullable<String>.value("phone_number"),
                status: MembershipStatus.trialing
            )),
            metadata: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            needsTracking: Nullable<Bool>.value(true),
            nextPaymentAttempt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            paidAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            paymentInstrument: Nullable<PaymentPaymentInstrument>.value(PaymentPaymentInstrument(
                card: Nullable<PaymentPaymentInstrumentCard>.value(PaymentPaymentInstrumentCard(
                    brand: "brand",
                    last4: Nullable<String>.value("last4")
                )),
                displayName: "display_name",
                icons: PaymentPaymentInstrumentIcons(
                    card: PaymentPaymentInstrumentIconsCard(
                        dark: PaymentPaymentInstrumentIconsCardDark(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentPaymentInstrumentIconsCardLight(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    ),
                    square: PaymentPaymentInstrumentIconsSquare(
                        dark: PaymentPaymentInstrumentIconsSquareDark(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentPaymentInstrumentIconsSquareLight(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    )
                ),
                installmentCount: Nullable<Int>.value(42),
                paymentMethodType: "payment_method_type"
            )),
            paymentMethod: Nullable<PaymentPaymentMethod>.value(PaymentPaymentMethod(
                card: Nullable<PaymentPaymentMethodCard>.value(PaymentPaymentMethodCard(
                    brand: Nullable<CardBrands>.value(CardBrands.mastercard),
                    expMonth: Nullable<Int>.value(42),
                    expYear: Nullable<Int>.value(42),
                    fingerprint: Nullable<String>.value("fingerprint"),
                    last4: Nullable<String>.value("4242")
                )),
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                id: "payt_xxxxxxxxxxxxx",
                paymentMethodType: PaymentMethodTypes.acssDebit
            )),
            paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
            paymentsFailed: Nullable<Int>.value(42),
            plan: Nullable<PaymentPlan>.value(PaymentPlan(
                id: "plan_xxxxxxxxxxxxx",
                internalNotes: Nullable<String>.value("internal_notes"),
                metadata: Nullable<[String: JSONValue]>.value([
                    "key": JSONValue.string("value")
                ])
            )),
            product: Nullable<PaymentProduct>.value(PaymentProduct(
                id: "prod_xxxxxxxxxxxxx",
                metadata: Nullable<[String: JSONValue]>.value([
                    "key": JSONValue.string("value")
                ]),
                route: "pickaxe-analytics",
                title: "Pickaxe Analytics"
            )),
            promoCode: Nullable<PaymentPromoCode>.value(PaymentPromoCode(
                amountOff: 6.9,
                baseCurrency: Currencies.usd,
                code: Nullable<String>.value("code"),
                id: "promo_xxxxxxxxxxxx",
                numberOfIntervals: Nullable<Int>.value(42),
                promoType: PromoTypes.percentage
            )),
            refundable: true,
            refundedAmount: Nullable<Double>.value(6.9),
            refundedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            refunds: [
                PaymentRefundsItem(
                    amount: 6.9,
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    currency: Currencies.usd,
                    id: "rf_xxxxxxxxxxxxxxx",
                    status: RefundStatuses.pending
                )
            ],
            resolutions: Nullable<[PaymentResolutionsItem]>.value([
                PaymentResolutionsItem(
                    customerAppealed: true,
                    customerResponseActions: [
                        ResolutionCenterCaseCustomerResponses.respond
                    ],
                    dueDate: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    id: "reso_xxxxxxxxxxxxx",
                    issue: ResolutionCenterCaseIssueTypes.forgotToCancel,
                    merchantAppealed: true,
                    merchantResponseActions: [
                        ResolutionCenterCaseMerchantResponses.accept
                    ],
                    platformResponseActions: [
                        ResolutionCenterCasePlatformResponses.requestBuyerInfo
                    ],
                    status: ResolutionCenterCaseStatuses.merchantResponseNeeded
                )
            ]),
            retryable: true,
            riskScore: Nullable<Int>.value(42),
            riskSignals: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            settlementAmount: 6.9,
            settlementCurrency: Currencies.usd,
            settlementExchangeRate: Nullable<Double>.value(6.9),
            settlementTimeAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            shipment: Nullable<PaymentShipment>.value(PaymentShipment(
                carrier: Nullable<String>.value("usps"),
                id: "ship_xxxxxxxxxxxxx",
                status: ShipmentStatuses.unknown,
                trackingNumber: "9400111899223456789012",
                trackingUrl: "https://track.aftership.com/9400111899223456789012"
            )),
            shippingAddress: Nullable<PaymentShippingAddress>.value(PaymentShippingAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            status: Nullable<ReceiptStatus>.value(ReceiptStatus.draft),
            substatus: FriendlyReceiptStatus.succeeded,
            subtotal: Nullable<Double>.value(6.9),
            taxAmount: Nullable<Double>.value(6.9),
            taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
            taxRefundedAmount: Nullable<Double>.value(6.9),
            threeDsVerified: true,
            total: Nullable<Double>.value(6.9),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            usdTotal: Nullable<Double>.value(6.9),
            user: Nullable<PaymentUser>.value(PaymentUser(
                email: Nullable<String>.value("john.doe@example.com"),
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )),
            verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                addressLine1: Nullable<String>.value("address_line1"),
                cardHolderName: Nullable<String>.value("card_holder_name"),
                cardSecurityCode: Nullable<String>.value("card_security_code"),
                zipCode: Nullable<String>.value("zip_code")
            )),
            voidable: true
        )
        let response = try await client.payments.refund(
            id: "pay_xxxxxxxxxxxxxx",
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
                  "amount_after_fees": 6.9,
                  "application_fee": {
                    "amount": 6.9,
                    "amount_captured": 6.9,
                    "amount_refunded": 6.9,
                    "created_at": "2023-12-01T05:00:00Z",
                    "currency": "usd",
                    "id": "apfee_xxxxxxxxxxxx"
                  },
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
                  "card_brand": "mastercard",
                  "card_exp_month": 6,
                  "card_exp_year": 2027,
                  "card_last4": "4242",
                  "checkout_configuration_id": "ch_xxxxxxxxxxxxxxx",
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "route",
                    "title": "title"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "currency": "usd",
                  "customer_phone": "customer_phone",
                  "decline_code": "insufficient_funds",
                  "dispute_alerted_at": "2023-12-01T05:00:00Z",
                  "disputes": [
                    {
                      "amount": 6.9,
                      "currency": "usd",
                      "editable": true,
                      "id": "dspt_xxxxxxxxxxxxx",
                      "needs_response_by": "2023-12-01T05:00:00Z",
                      "notes": "Customer used the product for 3 months before disputing.",
                      "reason": "Product Not Received",
                      "status": "warning_needs_response"
                    }
                  ],
                  "failure_message": "failure_message",
                  "financing_installments_count": 42,
                  "financing_transactions": [
                    {
                      "amount": 6.9,
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "ptx_xxxxxxxxxxxxxx",
                      "status": "succeeded",
                      "transaction_type": "purchase"
                    }
                  ],
                  "id": "pay_xxxxxxxxxxxxxx",
                  "last_payment_attempt": "2023-12-01T05:00:00Z",
                  "member": {
                    "id": "id",
                    "phone": "phone"
                  },
                  "membership": {
                    "id": "mem_xxxxxxxxxxxxxx",
                    "phone_number": "phone_number",
                    "status": "trialing"
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "needs_tracking": true,
                  "next_payment_attempt": "2023-12-01T05:00:00Z",
                  "paid_at": "2023-12-01T05:00:00Z",
                  "payment_instrument": {
                    "card": {
                      "brand": "brand",
                      "last4": "last4"
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
                    "installment_count": 42,
                    "payment_method_type": "payment_method_type"
                  },
                  "payment_method": {
                    "card": {
                      "brand": "mastercard",
                      "exp_month": 42,
                      "exp_year": 42,
                      "fingerprint": "fingerprint",
                      "last4": "4242"
                    },
                    "created_at": "2023-12-01T05:00:00Z",
                    "id": "payt_xxxxxxxxxxxxx",
                    "payment_method_type": "acss_debit"
                  },
                  "payment_method_type": "acss_debit",
                  "payments_failed": 42,
                  "plan": {
                    "id": "plan_xxxxxxxxxxxxx",
                    "internal_notes": "internal_notes",
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxx",
                    "metadata": {
                      "key": "value"
                    },
                    "route": "pickaxe-analytics",
                    "title": "Pickaxe Analytics"
                  },
                  "promo_code": {
                    "amount_off": 6.9,
                    "base_currency": "usd",
                    "code": "code",
                    "id": "promo_xxxxxxxxxxxx",
                    "number_of_intervals": 42,
                    "promo_type": "percentage"
                  },
                  "refundable": true,
                  "refunded_amount": 6.9,
                  "refunded_at": "2023-12-01T05:00:00Z",
                  "refunds": [
                    {
                      "amount": 6.9,
                      "created_at": "2023-12-01T05:00:00Z",
                      "currency": "usd",
                      "id": "rf_xxxxxxxxxxxxxxx",
                      "status": "pending"
                    }
                  ],
                  "resolutions": [
                    {
                      "customer_appealed": true,
                      "customer_response_actions": [
                        "respond"
                      ],
                      "due_date": "2023-12-01T05:00:00Z",
                      "id": "reso_xxxxxxxxxxxxx",
                      "issue": "forgot_to_cancel",
                      "merchant_appealed": true,
                      "merchant_response_actions": [
                        "accept"
                      ],
                      "platform_response_actions": [
                        "request_buyer_info"
                      ],
                      "status": "merchant_response_needed"
                    }
                  ],
                  "retryable": true,
                  "risk_score": 42,
                  "risk_signals": {
                    "key": "value"
                  },
                  "settlement_amount": 6.9,
                  "settlement_currency": "usd",
                  "settlement_exchange_rate": 6.9,
                  "settlement_time_at": "2023-12-01T05:00:00Z",
                  "shipment": {
                    "carrier": "usps",
                    "id": "ship_xxxxxxxxxxxxx",
                    "status": "unknown",
                    "tracking_number": "9400111899223456789012",
                    "tracking_url": "https://track.aftership.com/9400111899223456789012"
                  },
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
                  "subtotal": 6.9,
                  "tax_amount": 6.9,
                  "tax_behavior": "exclusive",
                  "tax_refunded_amount": 6.9,
                  "three_ds_verified": true,
                  "total": 6.9,
                  "updated_at": "2023-12-01T05:00:00Z",
                  "usd_total": 6.9,
                  "user": {
                    "email": "john.doe@example.com",
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "verification_checks": {
                    "address_line1": "address_line1",
                    "card_holder_name": "card_holder_name",
                    "card_security_code": "card_security_code",
                    "zip_code": "zip_code"
                  },
                  "voidable": true
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
            amountAfterFees: 6.9,
            applicationFee: Nullable<PaymentApplicationFee>.value(PaymentApplicationFee(
                amount: 6.9,
                amountCaptured: 6.9,
                amountRefunded: 6.9,
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                currency: Currencies.usd,
                id: "apfee_xxxxxxxxxxxx"
            )),
            autoRefunded: true,
            billingAddress: Nullable<PaymentBillingAddress>.value(PaymentBillingAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
            cardBrand: Nullable<CardBrands>.value(CardBrands.mastercard),
            cardExpMonth: Nullable<Int>.value(6),
            cardExpYear: Nullable<Int>.value(2027),
            cardLast4: Nullable<String>.value("4242"),
            checkoutConfigurationId: Nullable<String>.value("ch_xxxxxxxxxxxxxxx"),
            company: Nullable<PaymentCompany>.value(PaymentCompany(
                id: "biz_xxxxxxxxxxxxxx",
                route: "route",
                title: "title"
            )),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            currency: Currencies.usd,
            customerPhone: Nullable<String>.value("customer_phone"),
            declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
            disputeAlertedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            disputes: Nullable<[PaymentDisputesItem]>.value([
                PaymentDisputesItem(
                    amount: 6.9,
                    currency: Currencies.usd,
                    editable: Nullable<Bool>.value(true),
                    id: "dspt_xxxxxxxxxxxxx",
                    needsResponseBy: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    notes: Nullable<String>.value("Customer used the product for 3 months before disputing."),
                    reason: Nullable<String>.value("Product Not Received"),
                    status: DisputeStatuses.warningNeedsResponse
                )
            ]),
            failureMessage: Nullable<String>.value("failure_message"),
            financingInstallmentsCount: Nullable<Int>.value(42),
            financingTransactions: [
                PaymentFinancingTransactionsItem(
                    amount: 6.9,
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "ptx_xxxxxxxxxxxxxx",
                    status: PaymentTransactionStatuses.succeeded,
                    transactionType: PaymentTransactionTypes.purchase
                )
            ],
            id: "pay_xxxxxxxxxxxxxx",
            lastPaymentAttempt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            member: Nullable<PaymentMember>.value(PaymentMember(
                id: "id",
                phone: Nullable<String>.value("phone")
            )),
            membership: Nullable<PaymentMembership>.value(PaymentMembership(
                id: "mem_xxxxxxxxxxxxxx",
                phoneNumber: Nullable<String>.value("phone_number"),
                status: MembershipStatus.trialing
            )),
            metadata: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            needsTracking: Nullable<Bool>.value(true),
            nextPaymentAttempt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            paidAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            paymentInstrument: Nullable<PaymentPaymentInstrument>.value(PaymentPaymentInstrument(
                card: Nullable<PaymentPaymentInstrumentCard>.value(PaymentPaymentInstrumentCard(
                    brand: "brand",
                    last4: Nullable<String>.value("last4")
                )),
                displayName: "display_name",
                icons: PaymentPaymentInstrumentIcons(
                    card: PaymentPaymentInstrumentIconsCard(
                        dark: PaymentPaymentInstrumentIconsCardDark(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentPaymentInstrumentIconsCardLight(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    ),
                    square: PaymentPaymentInstrumentIconsSquare(
                        dark: PaymentPaymentInstrumentIconsSquareDark(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentPaymentInstrumentIconsSquareLight(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    )
                ),
                installmentCount: Nullable<Int>.value(42),
                paymentMethodType: "payment_method_type"
            )),
            paymentMethod: Nullable<PaymentPaymentMethod>.value(PaymentPaymentMethod(
                card: Nullable<PaymentPaymentMethodCard>.value(PaymentPaymentMethodCard(
                    brand: Nullable<CardBrands>.value(CardBrands.mastercard),
                    expMonth: Nullable<Int>.value(42),
                    expYear: Nullable<Int>.value(42),
                    fingerprint: Nullable<String>.value("fingerprint"),
                    last4: Nullable<String>.value("4242")
                )),
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                id: "payt_xxxxxxxxxxxxx",
                paymentMethodType: PaymentMethodTypes.acssDebit
            )),
            paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
            paymentsFailed: Nullable<Int>.value(42),
            plan: Nullable<PaymentPlan>.value(PaymentPlan(
                id: "plan_xxxxxxxxxxxxx",
                internalNotes: Nullable<String>.value("internal_notes"),
                metadata: Nullable<[String: JSONValue]>.value([
                    "key": JSONValue.string("value")
                ])
            )),
            product: Nullable<PaymentProduct>.value(PaymentProduct(
                id: "prod_xxxxxxxxxxxxx",
                metadata: Nullable<[String: JSONValue]>.value([
                    "key": JSONValue.string("value")
                ]),
                route: "pickaxe-analytics",
                title: "Pickaxe Analytics"
            )),
            promoCode: Nullable<PaymentPromoCode>.value(PaymentPromoCode(
                amountOff: 6.9,
                baseCurrency: Currencies.usd,
                code: Nullable<String>.value("code"),
                id: "promo_xxxxxxxxxxxx",
                numberOfIntervals: Nullable<Int>.value(42),
                promoType: PromoTypes.percentage
            )),
            refundable: true,
            refundedAmount: Nullable<Double>.value(6.9),
            refundedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            refunds: [
                PaymentRefundsItem(
                    amount: 6.9,
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    currency: Currencies.usd,
                    id: "rf_xxxxxxxxxxxxxxx",
                    status: RefundStatuses.pending
                )
            ],
            resolutions: Nullable<[PaymentResolutionsItem]>.value([
                PaymentResolutionsItem(
                    customerAppealed: true,
                    customerResponseActions: [
                        ResolutionCenterCaseCustomerResponses.respond
                    ],
                    dueDate: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    id: "reso_xxxxxxxxxxxxx",
                    issue: ResolutionCenterCaseIssueTypes.forgotToCancel,
                    merchantAppealed: true,
                    merchantResponseActions: [
                        ResolutionCenterCaseMerchantResponses.accept
                    ],
                    platformResponseActions: [
                        ResolutionCenterCasePlatformResponses.requestBuyerInfo
                    ],
                    status: ResolutionCenterCaseStatuses.merchantResponseNeeded
                )
            ]),
            retryable: true,
            riskScore: Nullable<Int>.value(42),
            riskSignals: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            settlementAmount: 6.9,
            settlementCurrency: Currencies.usd,
            settlementExchangeRate: Nullable<Double>.value(6.9),
            settlementTimeAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            shipment: Nullable<PaymentShipment>.value(PaymentShipment(
                carrier: Nullable<String>.value("usps"),
                id: "ship_xxxxxxxxxxxxx",
                status: ShipmentStatuses.unknown,
                trackingNumber: "9400111899223456789012",
                trackingUrl: "https://track.aftership.com/9400111899223456789012"
            )),
            shippingAddress: Nullable<PaymentShippingAddress>.value(PaymentShippingAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            status: Nullable<ReceiptStatus>.value(ReceiptStatus.draft),
            substatus: FriendlyReceiptStatus.succeeded,
            subtotal: Nullable<Double>.value(6.9),
            taxAmount: Nullable<Double>.value(6.9),
            taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
            taxRefundedAmount: Nullable<Double>.value(6.9),
            threeDsVerified: true,
            total: Nullable<Double>.value(6.9),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            usdTotal: Nullable<Double>.value(6.9),
            user: Nullable<PaymentUser>.value(PaymentUser(
                email: Nullable<String>.value("john.doe@example.com"),
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )),
            verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                addressLine1: Nullable<String>.value("address_line1"),
                cardHolderName: Nullable<String>.value("card_holder_name"),
                cardSecurityCode: Nullable<String>.value("card_security_code"),
                zipCode: Nullable<String>.value("zip_code")
            )),
            voidable: true
        )
        let response = try await client.payments.retry(
            id: "pay_xxxxxxxxxxxxxx",
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
                  "amount_after_fees": 6.9,
                  "application_fee": {
                    "amount": 6.9,
                    "amount_captured": 6.9,
                    "amount_refunded": 6.9,
                    "created_at": "2023-12-01T05:00:00Z",
                    "currency": "usd",
                    "id": "apfee_xxxxxxxxxxxx"
                  },
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
                  "card_brand": "mastercard",
                  "card_exp_month": 6,
                  "card_exp_year": 2027,
                  "card_last4": "4242",
                  "checkout_configuration_id": "ch_xxxxxxxxxxxxxxx",
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "route",
                    "title": "title"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "currency": "usd",
                  "customer_phone": "customer_phone",
                  "decline_code": "insufficient_funds",
                  "dispute_alerted_at": "2023-12-01T05:00:00Z",
                  "disputes": [
                    {
                      "amount": 6.9,
                      "currency": "usd",
                      "editable": true,
                      "id": "dspt_xxxxxxxxxxxxx",
                      "needs_response_by": "2023-12-01T05:00:00Z",
                      "notes": "Customer used the product for 3 months before disputing.",
                      "reason": "Product Not Received",
                      "status": "warning_needs_response"
                    }
                  ],
                  "failure_message": "failure_message",
                  "financing_installments_count": 42,
                  "financing_transactions": [
                    {
                      "amount": 6.9,
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "ptx_xxxxxxxxxxxxxx",
                      "status": "succeeded",
                      "transaction_type": "purchase"
                    }
                  ],
                  "id": "pay_xxxxxxxxxxxxxx",
                  "last_payment_attempt": "2023-12-01T05:00:00Z",
                  "member": {
                    "id": "id",
                    "phone": "phone"
                  },
                  "membership": {
                    "id": "mem_xxxxxxxxxxxxxx",
                    "phone_number": "phone_number",
                    "status": "trialing"
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "needs_tracking": true,
                  "next_payment_attempt": "2023-12-01T05:00:00Z",
                  "paid_at": "2023-12-01T05:00:00Z",
                  "payment_instrument": {
                    "card": {
                      "brand": "brand",
                      "last4": "last4"
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
                    "installment_count": 42,
                    "payment_method_type": "payment_method_type"
                  },
                  "payment_method": {
                    "card": {
                      "brand": "mastercard",
                      "exp_month": 42,
                      "exp_year": 42,
                      "fingerprint": "fingerprint",
                      "last4": "4242"
                    },
                    "created_at": "2023-12-01T05:00:00Z",
                    "id": "payt_xxxxxxxxxxxxx",
                    "payment_method_type": "acss_debit"
                  },
                  "payment_method_type": "acss_debit",
                  "payments_failed": 42,
                  "plan": {
                    "id": "plan_xxxxxxxxxxxxx",
                    "internal_notes": "internal_notes",
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxx",
                    "metadata": {
                      "key": "value"
                    },
                    "route": "pickaxe-analytics",
                    "title": "Pickaxe Analytics"
                  },
                  "promo_code": {
                    "amount_off": 6.9,
                    "base_currency": "usd",
                    "code": "code",
                    "id": "promo_xxxxxxxxxxxx",
                    "number_of_intervals": 42,
                    "promo_type": "percentage"
                  },
                  "refundable": true,
                  "refunded_amount": 6.9,
                  "refunded_at": "2023-12-01T05:00:00Z",
                  "refunds": [
                    {
                      "amount": 6.9,
                      "created_at": "2023-12-01T05:00:00Z",
                      "currency": "usd",
                      "id": "rf_xxxxxxxxxxxxxxx",
                      "status": "pending"
                    }
                  ],
                  "resolutions": [
                    {
                      "customer_appealed": true,
                      "customer_response_actions": [
                        "respond"
                      ],
                      "due_date": "2023-12-01T05:00:00Z",
                      "id": "reso_xxxxxxxxxxxxx",
                      "issue": "forgot_to_cancel",
                      "merchant_appealed": true,
                      "merchant_response_actions": [
                        "accept"
                      ],
                      "platform_response_actions": [
                        "request_buyer_info"
                      ],
                      "status": "merchant_response_needed"
                    }
                  ],
                  "retryable": true,
                  "risk_score": 42,
                  "risk_signals": {
                    "key": "value"
                  },
                  "settlement_amount": 6.9,
                  "settlement_currency": "usd",
                  "settlement_exchange_rate": 6.9,
                  "settlement_time_at": "2023-12-01T05:00:00Z",
                  "shipment": {
                    "carrier": "usps",
                    "id": "ship_xxxxxxxxxxxxx",
                    "status": "unknown",
                    "tracking_number": "9400111899223456789012",
                    "tracking_url": "https://track.aftership.com/9400111899223456789012"
                  },
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
                  "subtotal": 6.9,
                  "tax_amount": 6.9,
                  "tax_behavior": "exclusive",
                  "tax_refunded_amount": 6.9,
                  "three_ds_verified": true,
                  "total": 6.9,
                  "updated_at": "2023-12-01T05:00:00Z",
                  "usd_total": 6.9,
                  "user": {
                    "email": "john.doe@example.com",
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "verification_checks": {
                    "address_line1": "address_line1",
                    "card_holder_name": "card_holder_name",
                    "card_security_code": "card_security_code",
                    "zip_code": "zip_code"
                  },
                  "voidable": true
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
            amountAfterFees: 6.9,
            applicationFee: Nullable<PaymentApplicationFee>.value(PaymentApplicationFee(
                amount: 6.9,
                amountCaptured: 6.9,
                amountRefunded: 6.9,
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                currency: Currencies.usd,
                id: "apfee_xxxxxxxxxxxx"
            )),
            autoRefunded: true,
            billingAddress: Nullable<PaymentBillingAddress>.value(PaymentBillingAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            billingReason: Nullable<BillingReasons>.value(BillingReasons.subscriptionCreate),
            cardBrand: Nullable<CardBrands>.value(CardBrands.mastercard),
            cardExpMonth: Nullable<Int>.value(6),
            cardExpYear: Nullable<Int>.value(2027),
            cardLast4: Nullable<String>.value("4242"),
            checkoutConfigurationId: Nullable<String>.value("ch_xxxxxxxxxxxxxxx"),
            company: Nullable<PaymentCompany>.value(PaymentCompany(
                id: "biz_xxxxxxxxxxxxxx",
                route: "route",
                title: "title"
            )),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            currency: Currencies.usd,
            customerPhone: Nullable<String>.value("customer_phone"),
            declineCode: Nullable<PaymentDeclineCodes>.value(PaymentDeclineCodes.insufficientFunds),
            disputeAlertedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            disputes: Nullable<[PaymentDisputesItem]>.value([
                PaymentDisputesItem(
                    amount: 6.9,
                    currency: Currencies.usd,
                    editable: Nullable<Bool>.value(true),
                    id: "dspt_xxxxxxxxxxxxx",
                    needsResponseBy: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    notes: Nullable<String>.value("Customer used the product for 3 months before disputing."),
                    reason: Nullable<String>.value("Product Not Received"),
                    status: DisputeStatuses.warningNeedsResponse
                )
            ]),
            failureMessage: Nullable<String>.value("failure_message"),
            financingInstallmentsCount: Nullable<Int>.value(42),
            financingTransactions: [
                PaymentFinancingTransactionsItem(
                    amount: 6.9,
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "ptx_xxxxxxxxxxxxxx",
                    status: PaymentTransactionStatuses.succeeded,
                    transactionType: PaymentTransactionTypes.purchase
                )
            ],
            id: "pay_xxxxxxxxxxxxxx",
            lastPaymentAttempt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            member: Nullable<PaymentMember>.value(PaymentMember(
                id: "id",
                phone: Nullable<String>.value("phone")
            )),
            membership: Nullable<PaymentMembership>.value(PaymentMembership(
                id: "mem_xxxxxxxxxxxxxx",
                phoneNumber: Nullable<String>.value("phone_number"),
                status: MembershipStatus.trialing
            )),
            metadata: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            needsTracking: Nullable<Bool>.value(true),
            nextPaymentAttempt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            paidAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            paymentInstrument: Nullable<PaymentPaymentInstrument>.value(PaymentPaymentInstrument(
                card: Nullable<PaymentPaymentInstrumentCard>.value(PaymentPaymentInstrumentCard(
                    brand: "brand",
                    last4: Nullable<String>.value("last4")
                )),
                displayName: "display_name",
                icons: PaymentPaymentInstrumentIcons(
                    card: PaymentPaymentInstrumentIconsCard(
                        dark: PaymentPaymentInstrumentIconsCardDark(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentPaymentInstrumentIconsCardLight(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    ),
                    square: PaymentPaymentInstrumentIconsSquare(
                        dark: PaymentPaymentInstrumentIconsSquareDark(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentPaymentInstrumentIconsSquareLight(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    )
                ),
                installmentCount: Nullable<Int>.value(42),
                paymentMethodType: "payment_method_type"
            )),
            paymentMethod: Nullable<PaymentPaymentMethod>.value(PaymentPaymentMethod(
                card: Nullable<PaymentPaymentMethodCard>.value(PaymentPaymentMethodCard(
                    brand: Nullable<CardBrands>.value(CardBrands.mastercard),
                    expMonth: Nullable<Int>.value(42),
                    expYear: Nullable<Int>.value(42),
                    fingerprint: Nullable<String>.value("fingerprint"),
                    last4: Nullable<String>.value("4242")
                )),
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                id: "payt_xxxxxxxxxxxxx",
                paymentMethodType: PaymentMethodTypes.acssDebit
            )),
            paymentMethodType: Nullable<PaymentMethodTypes>.value(PaymentMethodTypes.acssDebit),
            paymentsFailed: Nullable<Int>.value(42),
            plan: Nullable<PaymentPlan>.value(PaymentPlan(
                id: "plan_xxxxxxxxxxxxx",
                internalNotes: Nullable<String>.value("internal_notes"),
                metadata: Nullable<[String: JSONValue]>.value([
                    "key": JSONValue.string("value")
                ])
            )),
            product: Nullable<PaymentProduct>.value(PaymentProduct(
                id: "prod_xxxxxxxxxxxxx",
                metadata: Nullable<[String: JSONValue]>.value([
                    "key": JSONValue.string("value")
                ]),
                route: "pickaxe-analytics",
                title: "Pickaxe Analytics"
            )),
            promoCode: Nullable<PaymentPromoCode>.value(PaymentPromoCode(
                amountOff: 6.9,
                baseCurrency: Currencies.usd,
                code: Nullable<String>.value("code"),
                id: "promo_xxxxxxxxxxxx",
                numberOfIntervals: Nullable<Int>.value(42),
                promoType: PromoTypes.percentage
            )),
            refundable: true,
            refundedAmount: Nullable<Double>.value(6.9),
            refundedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            refunds: [
                PaymentRefundsItem(
                    amount: 6.9,
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    currency: Currencies.usd,
                    id: "rf_xxxxxxxxxxxxxxx",
                    status: RefundStatuses.pending
                )
            ],
            resolutions: Nullable<[PaymentResolutionsItem]>.value([
                PaymentResolutionsItem(
                    customerAppealed: true,
                    customerResponseActions: [
                        ResolutionCenterCaseCustomerResponses.respond
                    ],
                    dueDate: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    id: "reso_xxxxxxxxxxxxx",
                    issue: ResolutionCenterCaseIssueTypes.forgotToCancel,
                    merchantAppealed: true,
                    merchantResponseActions: [
                        ResolutionCenterCaseMerchantResponses.accept
                    ],
                    platformResponseActions: [
                        ResolutionCenterCasePlatformResponses.requestBuyerInfo
                    ],
                    status: ResolutionCenterCaseStatuses.merchantResponseNeeded
                )
            ]),
            retryable: true,
            riskScore: Nullable<Int>.value(42),
            riskSignals: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            settlementAmount: 6.9,
            settlementCurrency: Currencies.usd,
            settlementExchangeRate: Nullable<Double>.value(6.9),
            settlementTimeAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            shipment: Nullable<PaymentShipment>.value(PaymentShipment(
                carrier: Nullable<String>.value("usps"),
                id: "ship_xxxxxxxxxxxxx",
                status: ShipmentStatuses.unknown,
                trackingNumber: "9400111899223456789012",
                trackingUrl: "https://track.aftership.com/9400111899223456789012"
            )),
            shippingAddress: Nullable<PaymentShippingAddress>.value(PaymentShippingAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            status: Nullable<ReceiptStatus>.value(ReceiptStatus.draft),
            substatus: FriendlyReceiptStatus.succeeded,
            subtotal: Nullable<Double>.value(6.9),
            taxAmount: Nullable<Double>.value(6.9),
            taxBehavior: Nullable<ReceiptTaxBehaviors>.value(ReceiptTaxBehaviors.exclusive),
            taxRefundedAmount: Nullable<Double>.value(6.9),
            threeDsVerified: true,
            total: Nullable<Double>.value(6.9),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            usdTotal: Nullable<Double>.value(6.9),
            user: Nullable<PaymentUser>.value(PaymentUser(
                email: Nullable<String>.value("john.doe@example.com"),
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )),
            verificationChecks: Nullable<PaymentVerificationChecks>.value(PaymentVerificationChecks(
                addressLine1: Nullable<String>.value("address_line1"),
                cardHolderName: Nullable<String>.value("card_holder_name"),
                cardSecurityCode: Nullable<String>.value("card_security_code"),
                zipCode: Nullable<String>.value("zip_code")
            )),
            voidable: true
        )
        let response = try await client.payments.void(
            id: "pay_xxxxxxxxxxxxxx",
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

    @Test func retrieveStatus1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
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
}