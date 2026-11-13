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
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "checkout_configuration_id": "checkout_configuration_id",
                      "client_secret": "sint_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "id": "sint_xxxxxxxxxxxxxx",
                      "last_setup_error": {
                        "code": "enrollment_declined",
                        "message": "The bank declined the enrollment."
                      },
                      "member_id": "mber_xxxxxxxxxxxxxx",
                      "metadata": {
                        "customer_id": "cus_4417"
                      },
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
                      "return_url": "https://shinetime.example/billing/saved",
                      "status": "processing",
                      "three_ds_level": "mandate_challenge",
                      "three_ds_verified": false,
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "user": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "danawhitfield"
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
        let expectedResponse = ListSetupIntentsResponse(
            data: [
                SetupIntent(
                    accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
                    clientSecret: Nullable<String>.value("sint_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    id: "sint_xxxxxxxxxxxxxx",
                    lastSetupError: Nullable<SetupLastSetupError>.value(SetupLastSetupError(
                        code: Nullable<String>.value("enrollment_declined"),
                        message: Nullable<String>.value("The bank declined the enrollment.")
                    )),
                    memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "customer_id": JSONValue.string("cus_4417")
                    ]),
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
                    returnUrl: Nullable<String>.value("https://shinetime.example/billing/saved"),
                    status: SetupIntentStatus.processing,
                    threeDsLevel: Nullable<SetupIntentThreeDsLevel>.value(SetupIntentThreeDsLevel.mandateChallenge),
                    threeDsVerified: false,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    user: Nullable<UserSummary>.value(UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    ))
                )
            ],
            pageInfo: ListSetupIntentsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.setupIntents.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "checkout_configuration_id": "checkout_configuration_id",
                  "client_secret": "sint_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "sint_xxxxxxxxxxxxxx",
                  "last_setup_error": {
                    "code": "enrollment_declined",
                    "message": "The bank declined the enrollment."
                  },
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "metadata": {
                    "customer_id": "cus_4417"
                  },
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
                  "return_url": "https://shinetime.example/billing/saved",
                  "status": "processing",
                  "three_ds_level": "mandate_challenge",
                  "three_ds_verified": false,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
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
        let expectedResponse = SetupIntent(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
            clientSecret: Nullable<String>.value("sint_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            id: "sint_xxxxxxxxxxxxxx",
            lastSetupError: Nullable<SetupLastSetupError>.value(SetupLastSetupError(
                code: Nullable<String>.value("enrollment_declined"),
                message: Nullable<String>.value("The bank declined the enrollment.")
            )),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            metadata: Nullable<[String: JSONValue]>.value([
                "customer_id": JSONValue.string("cus_4417")
            ]),
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
            returnUrl: Nullable<String>.value("https://shinetime.example/billing/saved"),
            status: SetupIntentStatus.processing,
            threeDsLevel: Nullable<SetupIntentThreeDsLevel>.value(SetupIntentThreeDsLevel.mandateChallenge),
            threeDsVerified: false,
            updatedAt: "2026-01-01T12:00:00.000Z",
            user: Nullable<UserSummary>.value(UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ))
        )
        let response = try await client.setupIntents.create(
            request: .init(accountId: "biz_xxxxxxxxxxxxxx"),
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
                  "checkout_configuration_id": "checkout_configuration_id",
                  "client_secret": "sint_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "sint_xxxxxxxxxxxxxx",
                  "last_setup_error": {
                    "code": "enrollment_declined",
                    "message": "The bank declined the enrollment."
                  },
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "metadata": {
                    "customer_id": "cus_4417"
                  },
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
                  "return_url": "https://shinetime.example/billing/saved",
                  "status": "processing",
                  "three_ds_level": "mandate_challenge",
                  "three_ds_verified": false,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
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
        let expectedResponse = SetupIntent(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            checkoutConfigurationId: Nullable<String>.value("checkout_configuration_id"),
            clientSecret: Nullable<String>.value("sint_xxxxxxxxxxxxxx_secret_vdefault_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            id: "sint_xxxxxxxxxxxxxx",
            lastSetupError: Nullable<SetupLastSetupError>.value(SetupLastSetupError(
                code: Nullable<String>.value("enrollment_declined"),
                message: Nullable<String>.value("The bank declined the enrollment.")
            )),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            metadata: Nullable<[String: JSONValue]>.value([
                "customer_id": JSONValue.string("cus_4417")
            ]),
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
            returnUrl: Nullable<String>.value("https://shinetime.example/billing/saved"),
            status: SetupIntentStatus.processing,
            threeDsLevel: Nullable<SetupIntentThreeDsLevel>.value(SetupIntentThreeDsLevel.mandateChallenge),
            threeDsVerified: false,
            updatedAt: "2026-01-01T12:00:00.000Z",
            user: Nullable<UserSummary>.value(UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ))
        )
        let response = try await client.setupIntents.retrieve(
            id: "id",
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
                    "message": "The bank declined the enrollment."
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
                message: Nullable<String>.value("The bank declined the enrollment.")
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
                    "message": "The bank declined the enrollment."
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
                message: Nullable<String>.value("The bank declined the enrollment.")
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