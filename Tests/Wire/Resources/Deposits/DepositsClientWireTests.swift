import Foundation
import Testing
import WhopSDK

@Suite("DepositsClient Wire Tests") struct DepositsClientWireTests {
    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount": "50.00",
                  "hosted_url": "https://whop.com/deposit/biz_xxxxxxxxxxxxxx/",
                  "methods": {
                    "bank": {
                      "currencies": [
                        {
                          "account_number": "8825310472",
                          "currency": "USD",
                          "deposit_bank_address": "2115 Linwood Avenue, Fort Lee, New Jersey 07024",
                          "deposit_bank_name": "Cross River Bank",
                          "deposit_beneficiary_name": "Shine Time Auto Detailing",
                          "deposit_reference": "SHINE-1042",
                          "rails": [
                            "ach"
                          ],
                          "routing_number": "021214891",
                          "swift_bic": "CHASUS33XXX"
                        }
                      ]
                    },
                    "card": {
                      "metadata": {
                        "attempt_id": "att_8f2k1"
                      },
                      "payment_id": "pay_xxxxxxxxxxxxxx",
                      "payment_method_id": "payt_xxxxxxxxxxxxxx"
                    },
                    "crypto": [
                      {
                        "deposit_address": "soladdr",
                        "icon_url": "https://whop.com/_static/images/crypto/solana.svg",
                        "name": "Ethereum",
                        "supported_currencies": [
                          {
                            "icon_url": "https://whop.com/_static/images/crypto/pyusd.svg",
                            "name": "ARB"
                          }
                        ]
                      }
                    ]
                  },
                  "object": "deposit"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateDepositsResponse(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: Optional("50.00"),
            hostedUrl: Nullable<String>.value("https://whop.com/deposit/biz_xxxxxxxxxxxxxx/"),
            methods: CreateDepositsResponseMethods(
                bank: Nullable<CreateDepositsResponseMethodsBank>.value(CreateDepositsResponseMethodsBank(
                    currencies: [
                        CreateDepositsResponseMethodsBankCurrenciesItem(
                            accountNumber: Nullable<String>.value("8825310472"),
                            currency: "USD",
                            depositBankAddress: Nullable<String>.value("2115 Linwood Avenue, Fort Lee, New Jersey 07024"),
                            depositBankName: Nullable<String>.value("Cross River Bank"),
                            depositBeneficiaryName: Nullable<String>.value("Shine Time Auto Detailing"),
                            depositReference: Nullable<String>.value("SHINE-1042"),
                            rails: [
                                CreateDepositsResponseMethodsBankCurrenciesItemRailsItem.ach
                            ],
                            routingNumber: Nullable<String>.value("021214891"),
                            swiftBic: Nullable<String>.value("CHASUS33XXX")
                        )
                    ]
                )),
                card: Nullable<CreateDepositsResponseMethodsCard>.value(CreateDepositsResponseMethodsCard(
                    metadata: Nullable<[String: Nullable<String>]>.value([
                        "attempt_id": Nullable<String>.value("att_8f2k1")
                    ]),
                    paymentId: "pay_xxxxxxxxxxxxxx",
                    paymentMethodId: "payt_xxxxxxxxxxxxxx"
                )),
                crypto: [
                    CreateDepositsResponseMethodsCryptoItem(
                        depositAddress: Nullable<String>.value("soladdr"),
                        iconUrl: Nullable<String>.value("https://whop.com/_static/images/crypto/solana.svg"),
                        name: CreateDepositsResponseMethodsCryptoItemName.ethereum,
                        supportedCurrencies: [
                            CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItem(
                                iconUrl: Nullable<String>.value("https://whop.com/_static/images/crypto/pyusd.svg"),
                                name: CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItemName.arb
                            )
                        ]
                    )
                ]
            ),
            object: CreateDepositsResponseObject.deposit
        )
        let response = try await client.deposits.create(
            request: .init(destination: "biz_xxxxxxxxxxxxxx"),
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
                  "amount": "amount",
                  "hosted_url": "hosted_url",
                  "methods": {
                    "bank": {
                      "currencies": [
                        {
                          "account_number": "account_number",
                          "currency": "currency",
                          "deposit_bank_address": "deposit_bank_address",
                          "deposit_bank_name": "deposit_bank_name",
                          "deposit_beneficiary_name": "deposit_beneficiary_name",
                          "deposit_reference": "deposit_reference",
                          "rails": [
                            "ach",
                            "ach"
                          ],
                          "routing_number": "routing_number",
                          "swift_bic": "swift_bic"
                        },
                        {
                          "account_number": "account_number",
                          "currency": "currency",
                          "deposit_bank_address": "deposit_bank_address",
                          "deposit_bank_name": "deposit_bank_name",
                          "deposit_beneficiary_name": "deposit_beneficiary_name",
                          "deposit_reference": "deposit_reference",
                          "rails": [
                            "ach",
                            "ach"
                          ],
                          "routing_number": "routing_number",
                          "swift_bic": "swift_bic"
                        }
                      ]
                    },
                    "card": {
                      "metadata": {
                        "metadata": "metadata"
                      },
                      "payment_id": "payment_id",
                      "payment_method_id": "payment_method_id"
                    },
                    "crypto": [
                      {
                        "deposit_address": "deposit_address",
                        "icon_url": "icon_url",
                        "name": "Ethereum",
                        "supported_currencies": [
                          {
                            "icon_url": "icon_url",
                            "name": "ARB"
                          },
                          {
                            "icon_url": "icon_url",
                            "name": "ARB"
                          }
                        ]
                      },
                      {
                        "deposit_address": "deposit_address",
                        "icon_url": "icon_url",
                        "name": "Ethereum",
                        "supported_currencies": [
                          {
                            "icon_url": "icon_url",
                            "name": "ARB"
                          },
                          {
                            "icon_url": "icon_url",
                            "name": "ARB"
                          }
                        ]
                      }
                    ]
                  },
                  "object": "deposit"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateDepositsResponse(
            accountId: Nullable<String>.value("account_id"),
            amount: Optional("amount"),
            hostedUrl: Nullable<String>.value("hosted_url"),
            methods: CreateDepositsResponseMethods(
                bank: Nullable<CreateDepositsResponseMethodsBank>.value(CreateDepositsResponseMethodsBank(
                    currencies: [
                        CreateDepositsResponseMethodsBankCurrenciesItem(
                            accountNumber: Nullable<String>.value("account_number"),
                            currency: "currency",
                            depositBankAddress: Nullable<String>.value("deposit_bank_address"),
                            depositBankName: Nullable<String>.value("deposit_bank_name"),
                            depositBeneficiaryName: Nullable<String>.value("deposit_beneficiary_name"),
                            depositReference: Nullable<String>.value("deposit_reference"),
                            rails: [
                                CreateDepositsResponseMethodsBankCurrenciesItemRailsItem.ach,
                                CreateDepositsResponseMethodsBankCurrenciesItemRailsItem.ach
                            ],
                            routingNumber: Nullable<String>.value("routing_number"),
                            swiftBic: Nullable<String>.value("swift_bic")
                        ),
                        CreateDepositsResponseMethodsBankCurrenciesItem(
                            accountNumber: Nullable<String>.value("account_number"),
                            currency: "currency",
                            depositBankAddress: Nullable<String>.value("deposit_bank_address"),
                            depositBankName: Nullable<String>.value("deposit_bank_name"),
                            depositBeneficiaryName: Nullable<String>.value("deposit_beneficiary_name"),
                            depositReference: Nullable<String>.value("deposit_reference"),
                            rails: [
                                CreateDepositsResponseMethodsBankCurrenciesItemRailsItem.ach,
                                CreateDepositsResponseMethodsBankCurrenciesItemRailsItem.ach
                            ],
                            routingNumber: Nullable<String>.value("routing_number"),
                            swiftBic: Nullable<String>.value("swift_bic")
                        )
                    ]
                )),
                card: Nullable<CreateDepositsResponseMethodsCard>.value(CreateDepositsResponseMethodsCard(
                    metadata: Nullable<[String: Nullable<String>]>.value([
                        "metadata": Nullable<String>.value("metadata")
                    ]),
                    paymentId: "payment_id",
                    paymentMethodId: "payment_method_id"
                )),
                crypto: [
                    CreateDepositsResponseMethodsCryptoItem(
                        depositAddress: Nullable<String>.value("deposit_address"),
                        iconUrl: Nullable<String>.value("icon_url"),
                        name: CreateDepositsResponseMethodsCryptoItemName.ethereum,
                        supportedCurrencies: [
                            CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItem(
                                iconUrl: Nullable<String>.value("icon_url"),
                                name: CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItemName.arb
                            ),
                            CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItem(
                                iconUrl: Nullable<String>.value("icon_url"),
                                name: CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItemName.arb
                            )
                        ]
                    ),
                    CreateDepositsResponseMethodsCryptoItem(
                        depositAddress: Nullable<String>.value("deposit_address"),
                        iconUrl: Nullable<String>.value("icon_url"),
                        name: CreateDepositsResponseMethodsCryptoItemName.ethereum,
                        supportedCurrencies: [
                            CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItem(
                                iconUrl: Nullable<String>.value("icon_url"),
                                name: CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItemName.arb
                            ),
                            CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItem(
                                iconUrl: Nullable<String>.value("icon_url"),
                                name: CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItemName.arb
                            )
                        ]
                    )
                ]
            ),
            object: CreateDepositsResponseObject.deposit
        )
        let response = try await client.deposits.create(
            request: .init(destination: "destination"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func reverse1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing",
                    "object": "account"
                  },
                  "amount": "2375000000",
                  "available_at": "2026-01-01T12:00:00Z",
                  "currency": {
                    "code": "usd",
                    "precision": "100000000"
                  },
                  "id": "line_3",
                  "ledger_account_id": "ldgr_xxxxxxxxxxxxxx",
                  "line_type": "psp_payment_receivable",
                  "object": "ledger_activity",
                  "payment": {
                    "amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "card_brand": "card_brand",
                    "card_last4": "card_last4",
                    "created_at": "2024-01-15T09:30:00Z",
                    "id": "id",
                    "object": "payment",
                    "payment_method_type": "payment_method_type",
                    "payment_processor": "payment_processor",
                    "plan": {
                      "id": "id",
                      "name": "name"
                    },
                    "product": {
                      "id": "id",
                      "name": "name"
                    },
                    "user": {
                      "email": "email",
                      "id": "id",
                      "name": "name"
                    }
                  },
                  "payment_id": "payment_id",
                  "plan_id": "plan_id",
                  "plan_name": "plan_name",
                  "posted_at": "2026-01-01T12:00:00Z",
                  "product_id": "product_id",
                  "product_name": "product_name",
                  "resource": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo",
                    "object": "account",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
                  },
                  "source": {
                    "amount_float": 1500,
                    "card_brand": "card_brand",
                    "chain": "plasma",
                    "claim_url": "https://whop.com/claim",
                    "created_at": "2026-01-01T12:00:00Z",
                    "created_by_user": {
                      "id": "user_xxxxxxxxxxxxxx",
                      "name": "Dana Whitfield",
                      "profile_picture": {
                        "url": "https://ui-avatars.com/api/"
                      },
                      "username": "danawhitfield"
                    },
                    "estimated_arrival": "2026-01-01T12:00:00Z",
                    "fee_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "fee_kind": "payout",
                    "fee_type": "exclusive",
                    "from_amount": "502.51",
                    "from_currency": "usdt",
                    "id": "airdrp_xxxxxxxxxxxxxx",
                    "notes": "notes",
                    "object": "airdrop_link",
                    "payer_name": "MassPay",
                    "payment_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "payment_method_type": "payment_method_type",
                    "payment_processor": "payment_processor",
                    "payout_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "payout_destination": {
                      "icon_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/ach-activity-icon",
                      "payer_name": "ACH Bank Deposit",
                      "security_answer": "security_answer"
                    },
                    "payout_token_nickname": "Ops checking",
                    "reason": "bounty_payout",
                    "risk_review_hold": true,
                    "sender_address": "0x8a4de51b9c37f2e6a0d1b8c94e5f7a2d3c6b0e19",
                    "status": "fully_claimed",
                    "to_amount": "500.0",
                    "to_currency": "usd",
                    "trace_code": "trace_code",
                    "tx_hash": "0x5d84a1c7e2f9b036d48c5a7e1b9f2d6c3a8e0b4f7c1d9e5a2b6f8c0d3e7a1b52"
                  },
                  "usd_amount": "23.75",
                  "user_email": "user_email",
                  "user_id": "user_id",
                  "user_name": "user_name"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = LedgerActivity(
            account: Optional(LedgerActivityAccount.account(
                .init(
                    id: "biz_xxxxxxxxxxxxxx",
                    logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo"),
                    route: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    title: Nullable<String>.value("Shine Time Auto Detailing"),
                    additionalProperties: [
                        "object": JSONValue.string("account")
                    ]
                )
            )),
            amount: "2375000000",
            availableAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
            currency: LedgerActivityCurrency(
                code: "usd",
                precision: "100000000"
            ),
            id: "line_3",
            ledgerAccountId: Optional(Nullable<String>.value("ldgr_xxxxxxxxxxxxxx")),
            lineType: LedgerActivityLineType.pspPaymentReceivable,
            object: LedgerActivityObject.ledgerActivity,
            payment: Optional(Nullable<LedgerActivityPayment>.value(LedgerActivityPayment(
                amount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                cardBrand: Nullable<String>.value("card_brand"),
                cardLast4: Nullable<String>.value("card_last4"),
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                id: "id",
                object: LedgerActivityPaymentObject.payment,
                paymentMethodType: Nullable<String>.value("payment_method_type"),
                paymentProcessor: Nullable<String>.value("payment_processor"),
                plan: Nullable<LedgerActivityPaymentPlan>.value(LedgerActivityPaymentPlan(
                    id: "id",
                    name: Nullable<String>.value("name")
                )),
                product: Nullable<LedgerActivityPaymentProduct>.value(LedgerActivityPaymentProduct(
                    id: "id",
                    name: "name"
                )),
                user: Nullable<LedgerActivityPaymentUser>.value(LedgerActivityPaymentUser(
                    email: Nullable<String>.value("email"),
                    id: "id",
                    name: "name"
                ))
            ))),
            paymentId: Optional(Nullable<String>.value("payment_id")),
            planId: Optional(Nullable<String>.value("plan_id")),
            planName: Optional(Nullable<String>.value("plan_name")),
            postedAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
            productId: Optional(Nullable<String>.value("product_id")),
            productName: Optional(Nullable<String>.value("product_name")),
            resource: Nullable<LedgerActivityResource>.value(LedgerActivityResource.ledgerActivityResourceLogoUrl(
                LedgerActivityResourceLogoUrl(
                    id: "biz_xxxxxxxxxxxxxx",
                    logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo"),
                    object: LedgerActivityResourceLogoUrlObject.account,
                    route: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    title: Nullable<String>.value("Shine Time Auto Detailing")
                )
            )),
            source: Nullable<LedgerActivitySource>.value(LedgerActivitySource(
                amountFloat: Optional(Nullable<Double>.value(1500)),
                cardBrand: Optional(Nullable<String>.value("card_brand")),
                chain: Optional(Nullable<String>.value("plasma")),
                claimUrl: Optional(Nullable<String>.value("https://whop.com/claim")),
                createdAt: Optional(Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601))),
                createdByUser: Optional(Nullable<UserSummary>.value(UserSummary(
                    id: "user_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Dana Whitfield"),
                    profilePicture: UserProfilePicture(
                        url: "https://ui-avatars.com/api/"
                    ),
                    username: "danawhitfield"
                ))),
                estimatedArrival: Optional(Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601))),
                feeAmount: Optional(Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ))),
                feeKind: Optional(Nullable<LedgerActivitySourceFeeKind>.value(LedgerActivitySourceFeeKind.payout)),
                feeType: Optional(Nullable<LedgerActivitySourceFeeType>.value(LedgerActivitySourceFeeType.exclusive)),
                fromAmount: Optional(Nullable<String>.value("502.51")),
                fromCurrency: Optional(Nullable<String>.value("usdt")),
                id: "airdrp_xxxxxxxxxxxxxx",
                notes: Optional(Nullable<String>.value("notes")),
                object: "airdrop_link",
                payerName: Optional(Nullable<String>.value("MassPay")),
                paymentAmount: Optional(Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ))),
                paymentMethodType: Optional(Nullable<String>.value("payment_method_type")),
                paymentProcessor: Optional(Nullable<String>.value("payment_processor")),
                payoutAmount: Optional(Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ))),
                payoutDestination: Optional(Nullable<LedgerActivitySourcePayoutDestination>.value(LedgerActivitySourcePayoutDestination(
                    iconUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/ach-activity-icon")),
                    payerName: Optional(Nullable<String>.value("ACH Bank Deposit")),
                    securityAnswer: Optional(Nullable<String>.value("security_answer"))
                ))),
                payoutTokenNickname: Optional(Nullable<String>.value("Ops checking")),
                reason: Optional(Nullable<String>.value("bounty_payout")),
                riskReviewHold: Optional(Nullable<Bool>.value(true)),
                senderAddress: Optional(Nullable<String>.value("0x8a4de51b9c37f2e6a0d1b8c94e5f7a2d3c6b0e19")),
                status: Optional(Nullable<String>.value("fully_claimed")),
                toAmount: Optional(Nullable<String>.value("500.0")),
                toCurrency: Optional(Nullable<String>.value("usd")),
                traceCode: Optional(Nullable<String>.value("trace_code")),
                txHash: Optional(Nullable<String>.value("0x5d84a1c7e2f9b036d48c5a7e1b9f2d6c3a8e0b4f7c1d9e5a2b6f8c0d3e7a1b52"))
            )),
            usdAmount: Nullable<String>.value("23.75"),
            userEmail: Optional(Nullable<String>.value("user_email")),
            userId: Optional(Nullable<String>.value("user_id")),
            userName: Optional(Nullable<String>.value("user_name"))
        )
        let response = try await client.deposits.reverse(
            id: "vbt_xxxxxxxxxxxxxx",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func reverse2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "object": "account",
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "amount": "amount",
                  "available_at": "2024-01-15T09:30:00Z",
                  "currency": {
                    "code": "code",
                    "precision": "precision"
                  },
                  "id": "id",
                  "ledger_account_id": "ledger_account_id",
                  "line_type": "psp_payment_receivable",
                  "object": "ledger_activity",
                  "payment": {
                    "amount": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "card_brand": "card_brand",
                    "card_last4": "card_last4",
                    "created_at": "2024-01-15T09:30:00Z",
                    "id": "id",
                    "object": "payment",
                    "payment_method_type": "payment_method_type",
                    "payment_processor": "payment_processor",
                    "plan": {
                      "id": "id",
                      "name": "name"
                    },
                    "product": {
                      "id": "id",
                      "name": "name"
                    },
                    "user": {
                      "email": "email",
                      "id": "id",
                      "name": "name"
                    }
                  },
                  "payment_id": "payment_id",
                  "plan_id": "plan_id",
                  "plan_name": "plan_name",
                  "posted_at": "2024-01-15T09:30:00Z",
                  "product_id": "product_id",
                  "product_name": "product_name",
                  "resource": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "object": "account",
                    "route": "route",
                    "title": "title"
                  },
                  "source": {
                    "amount_float": 1.1,
                    "card_brand": "card_brand",
                    "chain": "chain",
                    "claim_url": "claim_url",
                    "created_at": "2024-01-15T09:30:00Z",
                    "created_by_user": {
                      "id": "id",
                      "name": "name",
                      "profile_picture": {
                        "url": "url"
                      },
                      "username": "username"
                    },
                    "estimated_arrival": "2024-01-15T09:30:00Z",
                    "fee_amount": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "fee_kind": "payout",
                    "fee_type": "exclusive",
                    "from_amount": "from_amount",
                    "from_currency": "from_currency",
                    "id": "id",
                    "notes": "notes",
                    "object": "object",
                    "payer_name": "payer_name",
                    "payment_amount": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "payment_method_type": "payment_method_type",
                    "payment_processor": "payment_processor",
                    "payout_amount": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "payout_destination": {
                      "icon_url": "icon_url",
                      "payer_name": "payer_name",
                      "security_answer": "security_answer"
                    },
                    "payout_token_nickname": "payout_token_nickname",
                    "reason": "reason",
                    "risk_review_hold": true,
                    "sender_address": "sender_address",
                    "status": "status",
                    "to_amount": "to_amount",
                    "to_currency": "to_currency",
                    "trace_code": "trace_code",
                    "tx_hash": "tx_hash"
                  },
                  "usd_amount": "usd_amount",
                  "user_email": "user_email",
                  "user_id": "user_id",
                  "user_name": "user_name"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = LedgerActivity(
            account: Optional(LedgerActivityAccount.account(
                .init(
                    id: "id",
                    logoUrl: Nullable<String>.value("logo_url"),
                    route: Nullable<String>.value("route"),
                    title: Nullable<String>.value("title"),
                    additionalProperties: [
                        "object": JSONValue.string("account")
                    ]
                )
            )),
            amount: "amount",
            availableAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            currency: LedgerActivityCurrency(
                code: "code",
                precision: "precision"
            ),
            id: "id",
            ledgerAccountId: Optional(Nullable<String>.value("ledger_account_id")),
            lineType: LedgerActivityLineType.pspPaymentReceivable,
            object: LedgerActivityObject.ledgerActivity,
            payment: Optional(Nullable<LedgerActivityPayment>.value(LedgerActivityPayment(
                amount: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                cardBrand: Nullable<String>.value("card_brand"),
                cardLast4: Nullable<String>.value("card_last4"),
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                id: "id",
                object: LedgerActivityPaymentObject.payment,
                paymentMethodType: Nullable<String>.value("payment_method_type"),
                paymentProcessor: Nullable<String>.value("payment_processor"),
                plan: Nullable<LedgerActivityPaymentPlan>.value(LedgerActivityPaymentPlan(
                    id: "id",
                    name: Nullable<String>.value("name")
                )),
                product: Nullable<LedgerActivityPaymentProduct>.value(LedgerActivityPaymentProduct(
                    id: "id",
                    name: "name"
                )),
                user: Nullable<LedgerActivityPaymentUser>.value(LedgerActivityPaymentUser(
                    email: Nullable<String>.value("email"),
                    id: "id",
                    name: "name"
                ))
            ))),
            paymentId: Optional(Nullable<String>.value("payment_id")),
            planId: Optional(Nullable<String>.value("plan_id")),
            planName: Optional(Nullable<String>.value("plan_name")),
            postedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            productId: Optional(Nullable<String>.value("product_id")),
            productName: Optional(Nullable<String>.value("product_name")),
            resource: Nullable<LedgerActivityResource>.value(LedgerActivityResource.ledgerActivityResourceLogoUrl(
                LedgerActivityResourceLogoUrl(
                    id: "id",
                    logoUrl: Nullable<String>.value("logo_url"),
                    object: LedgerActivityResourceLogoUrlObject.account,
                    route: Nullable<String>.value("route"),
                    title: Nullable<String>.value("title")
                )
            )),
            source: Nullable<LedgerActivitySource>.value(LedgerActivitySource(
                amountFloat: Optional(Nullable<Double>.value(1.1)),
                cardBrand: Optional(Nullable<String>.value("card_brand")),
                chain: Optional(Nullable<String>.value("chain")),
                claimUrl: Optional(Nullable<String>.value("claim_url")),
                createdAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                createdByUser: Optional(Nullable<UserSummary>.value(UserSummary(
                    id: "id",
                    name: Nullable<String>.value("name"),
                    profilePicture: UserProfilePicture(
                        url: "url"
                    ),
                    username: "username"
                ))),
                estimatedArrival: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                feeAmount: Optional(Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ))),
                feeKind: Optional(Nullable<LedgerActivitySourceFeeKind>.value(LedgerActivitySourceFeeKind.payout)),
                feeType: Optional(Nullable<LedgerActivitySourceFeeType>.value(LedgerActivitySourceFeeType.exclusive)),
                fromAmount: Optional(Nullable<String>.value("from_amount")),
                fromCurrency: Optional(Nullable<String>.value("from_currency")),
                id: "id",
                notes: Optional(Nullable<String>.value("notes")),
                object: "object",
                payerName: Optional(Nullable<String>.value("payer_name")),
                paymentAmount: Optional(Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ))),
                paymentMethodType: Optional(Nullable<String>.value("payment_method_type")),
                paymentProcessor: Optional(Nullable<String>.value("payment_processor")),
                payoutAmount: Optional(Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ))),
                payoutDestination: Optional(Nullable<LedgerActivitySourcePayoutDestination>.value(LedgerActivitySourcePayoutDestination(
                    iconUrl: Optional(Nullable<String>.value("icon_url")),
                    payerName: Optional(Nullable<String>.value("payer_name")),
                    securityAnswer: Optional(Nullable<String>.value("security_answer"))
                ))),
                payoutTokenNickname: Optional(Nullable<String>.value("payout_token_nickname")),
                reason: Optional(Nullable<String>.value("reason")),
                riskReviewHold: Optional(Nullable<Bool>.value(true)),
                senderAddress: Optional(Nullable<String>.value("sender_address")),
                status: Optional(Nullable<String>.value("status")),
                toAmount: Optional(Nullable<String>.value("to_amount")),
                toCurrency: Optional(Nullable<String>.value("to_currency")),
                traceCode: Optional(Nullable<String>.value("trace_code")),
                txHash: Optional(Nullable<String>.value("tx_hash"))
            )),
            usdAmount: Nullable<String>.value("usd_amount"),
            userEmail: Optional(Nullable<String>.value("user_email")),
            userId: Optional(Nullable<String>.value("user_id")),
            userName: Optional(Nullable<String>.value("user_name"))
        )
        let response = try await client.deposits.reverse(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}