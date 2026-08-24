import Foundation
import Testing
import WhopSDK

@Suite("AccountsClient Wire Tests") struct AccountsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "balances": [
                        {
                          "balance": "50.0",
                          "breakdown": {
                            "available": "1500.0",
                            "in_transit": "0",
                            "pending": "0",
                            "pending_settlements": [
                              {
                                "amount": "12.5",
                                "date": "2026-01-01"
                              }
                            ],
                            "reserve": "0"
                          },
                          "icon_url": "https://assets.whop.com/tokens/usd.png",
                          "name": "US Dollar",
                          "price_usd": 1,
                          "symbol": "USD",
                          "value_usd": "50.00"
                        }
                      ],
                      "banner_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "business_address": {
                        "city": "Austin",
                        "country": "US",
                        "line1": "4180 Burnet Rd",
                        "line2": "Suite 2",
                        "postal_code": "78756",
                        "state": "TX"
                      },
                      "business_name": "Shine Time Auto Detailing, LLC",
                      "business_type": "education_program",
                      "can_transfer_pending_balance_to_children": false,
                      "capabilities": {
                        "accept_bank_payments": "active",
                        "accept_bnpl_payments": "active",
                        "accept_card_payments": "active",
                        "bank_deposit": "active",
                        "card_deposit": "active",
                        "card_issuing": "active",
                        "crypto_deposit": "active",
                        "crypto_payout": "active",
                        "instant_payout": "active",
                        "run_ads": "active",
                        "standard_payout": "active",
                        "transfer": "active"
                      },
                      "cards": {
                        "kind": null,
                        "status": "approved"
                      },
                      "collect_vat_id": true,
                      "company_formation": {
                        "documents": [
                          {
                            "id": "file_xxxxxxxxxxxxxx",
                            "name": "Articles of Organization",
                            "type": "articles_of_organization",
                            "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                          }
                        ],
                        "ein_registered": false,
                        "legal_name": "Shine Time Auto Detailing, LLC",
                        "signatures": {
                          "form8821": {
                            "expires_at": "2026-01-01T12:00:00.000Z",
                            "status": "pending",
                            "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                          },
                          "ss4": {
                            "expires_at": "2026-01-01T12:00:00.000Z",
                            "status": "pending",
                            "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                          }
                        },
                        "state_registered": true
                      },
                      "country": "us",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "description": "Mobile ceramic coating, paint correction, and interior detailing across the Austin metro.",
                      "email": "marcus@shinetime.example",
                      "home_preferences": [
                        "hide_member_count"
                      ],
                      "id": "biz_xxxxxxxxxxxxxx",
                      "industry_group": "academic_and_test_prep",
                      "industry_type": "other",
                      "invoice_prefix": "SHINE",
                      "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "metadata": {
                        "external_id": "shop_4417",
                        "region": "austin"
                      },
                      "onboarding_type": "platform",
                      "opengraph_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "opengraph_image_variant": "white",
                      "other_business_description": "Mobile auto detailing",
                      "other_industry_description": "Automotive services",
                      "owner": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "danawhitfield"
                      },
                      "parent_account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "route": "shine-time-holdings",
                        "title": "Shine Time Holdings"
                      },
                      "payment_controls": {
                        "dispute_alert_auto_refund": {
                          "locked": false,
                          "threshold_usd": 500
                        },
                        "dispute_alert_fee_usd": 29,
                        "enforce_3ds": false,
                        "financing_disabled": false,
                        "high_risk_processing_fee_percentage": 0,
                        "pending_auto_topup_fee_percentage": 2,
                        "pending_balance_delay_days": 0,
                        "reserve": {
                          "hold_period_days": 14,
                          "percentage": 15
                        },
                        "resolution_center_auto_refund": {
                          "card_threshold_usd": 50,
                          "financing_threshold_usd": 25,
                          "locked": false,
                          "paypal_threshold_usd": 40
                        },
                        "restricted_payment_methods": [
                          "card_visa"
                        ]
                      },
                      "product_tax_code": {
                        "id": "ptc_xxxxxxxxxxxxxx",
                        "name": "General - Digital Goods",
                        "product_type": "digital"
                      },
                      "recommended_actions": [
                        {
                          "action": "theme_business",
                          "blocked_capabilities": [
                            "accept_bnpl_payments"
                          ],
                          "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/settings/payments/",
                          "cta_label": "Apply",
                          "description": "Let customers pay over time with buy now, pay later.",
                          "icon_url": "https://whop.com/illustrations/orange/piggy-bank.svg",
                          "impact_score": 86,
                          "reasoning": "Financing lifts conversion on the $249 ceramic coating, the priciest job on the menu.",
                          "status": "optional",
                          "title": "Offer financing at checkout"
                        }
                      ],
                      "require_2fa": true,
                      "required_actions": [
                        {
                          "action": "deposit_funds",
                          "blocked_capabilities": [
                            "standard_payout"
                          ],
                          "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/",
                          "cta_label": "Verify now",
                          "description": "Complete verification to withdraw your earnings.",
                          "icon_url": "https://whop.com/illustrations/orange/shield.svg",
                          "status": "required",
                          "title": "Complete your identity verification"
                        }
                      ],
                      "route": "biz_xxxxxxxxxxxxxx",
                      "send_customer_emails": false,
                      "show_joined_whops": false,
                      "show_reviews_dtc": false,
                      "show_user_directory": false,
                      "social_links": [
                        {
                          "id": "social_1",
                          "title": "@shinetimedetail",
                          "url": "https://instagram.com/shinetimedetail",
                          "website": "x"
                        }
                      ],
                      "stablecoin_rails": false,
                      "status": "active",
                      "status_reason": "Payments are paused while we review recent chargebacks on this account.",
                      "store_page_config": {
                        "accent_color": null,
                        "layout": null,
                        "profile_variant": null,
                        "whop_affiliate_link": true
                      },
                      "target_audience": "Owners of new and enthusiast vehicles in Austin, TX",
                      "tax_collection_enabled_states": [
                        "TX"
                      ],
                      "tax_identifiers": [
                        {
                          "id": "txid_xxxxxxxxxxxxxx",
                          "tax_id_type": "ad_nrt",
                          "tax_id_value": "DE123456789"
                        }
                      ],
                      "tax_remitted_by": "whop",
                      "tax_type": "inclusive",
                      "three_ds_level": "mandate_challenge",
                      "title": "Shine Time Auto Detailing",
                      "total_earned_usd": 0,
                      "total_usd": "50.00",
                      "use_logo_as_opengraph_image_fallback": true,
                      "verification": {},
                      "volume_usd": 1.1,
                      "wallet": {
                        "address": "0xabc123",
                        "id": "cwal_xxxxxxxxxxxxxx",
                        "network": "solana"
                      }
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
        let expectedResponse = ListAccountsResponse(
            data: [
                Account(
                    balances: [
                        AccountBalanceToken(
                            balance: "50.0",
                            breakdown: AccountBalanceBreakdown(
                                available: "1500.0",
                                inTransit: "0",
                                pending: "0",
                                pendingSettlements: [
                                    AccountBalanceSettlement(
                                        amount: "12.5",
                                        date: "2026-01-01"
                                    )
                                ],
                                reserve: "0"
                            ),
                            iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usd.png"),
                            name: "US Dollar",
                            priceUsd: Nullable<Double>.value(1),
                            symbol: "USD",
                            valueUsd: Nullable<String>.value("50.00")
                        )
                    ],
                    bannerImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    businessAddress: Nullable<[String: JSONValue]>.value([
                        "city": JSONValue.string("Austin"), 
                        "country": JSONValue.string("US"), 
                        "line1": JSONValue.string("4180 Burnet Rd"), 
                        "line2": JSONValue.string("Suite 2"), 
                        "postal_code": JSONValue.string("78756"), 
                        "state": JSONValue.string("TX")
                    ]),
                    businessName: Nullable<String>.value("Shine Time Auto Detailing, LLC"),
                    businessType: Nullable<AccountBusinessType>.value(AccountBusinessType.educationProgram),
                    canTransferPendingBalanceToChildren: false,
                    capabilities: Nullable<AccountCapabilities>.value(AccountCapabilities(
                        acceptBankPayments: AccountCapabilitiesAcceptBankPayments.active,
                        acceptBnplPayments: AccountCapabilitiesAcceptBnplPayments.active,
                        acceptCardPayments: AccountCapabilitiesAcceptCardPayments.active,
                        bankDeposit: AccountCapabilitiesBankDeposit.active,
                        cardDeposit: AccountCapabilitiesCardDeposit.active,
                        cardIssuing: AccountCapabilitiesCardIssuing.active,
                        cryptoDeposit: AccountCapabilitiesCryptoDeposit.active,
                        cryptoPayout: AccountCapabilitiesCryptoPayout.active,
                        instantPayout: AccountCapabilitiesInstantPayout.active,
                        runAds: AccountCapabilitiesRunAds.active,
                        standardPayout: AccountCapabilitiesStandardPayout.active,
                        transfer: AccountCapabilitiesTransfer.active
                    )),
                    cards: Nullable<AccountCards>.value(AccountCards(
                        kind: .null,
                        status: AccountCardsStatus.approved
                    )),
                    collectVatId: true,
                    companyFormation: AccountCompanyFormation(
                        documents: Optional([
                            AccountCompanyFormationDocument(
                                id: "file_xxxxxxxxxxxxxx",
                                name: "Articles of Organization",
                                type: "articles_of_organization",
                                url: "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                            )
                        ]),
                        einRegistered: Optional(false),
                        legalName: Optional(Nullable<String>.value("Shine Time Auto Detailing, LLC")),
                        signatures: Optional(AccountCompanyFormationSignatures(
                            form8821: Optional(AccountCompanyFormationSignatureRequest(
                                expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                                status: AccountCompanyFormationSignatureRequestStatus.pending,
                                url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                            )),
                            ss4: Optional(AccountCompanyFormationSignatureRequest(
                                expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                                status: AccountCompanyFormationSignatureRequestStatus.pending,
                                url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                            ))
                        )),
                        stateRegistered: Optional(true)
                    ),
                    country: Nullable<String>.value("us"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    description: Nullable<String>.value("Mobile ceramic coating, paint correction, and interior detailing across the Austin metro."),
                    email: Nullable<String>.value("marcus@shinetime.example"),
                    homePreferences: [
                        AccountHomePreferencesItem.hideMemberCount
                    ],
                    id: "biz_xxxxxxxxxxxxxx",
                    industryGroup: Nullable<AccountIndustryGroup>.value(AccountIndustryGroup.academicAndTestPrep),
                    industryType: Nullable<String>.value("other"),
                    invoicePrefix: Nullable<String>.value("SHINE"),
                    logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    metadata: [
                        "external_id": JSONValue.string("shop_4417"), 
                        "region": JSONValue.string("austin")
                    ],
                    onboardingType: Nullable<AccountOnboardingType>.value(AccountOnboardingType.platform),
                    opengraphImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    opengraphImageVariant: Nullable<AccountOpengraphImageVariant>.value(AccountOpengraphImageVariant.white),
                    otherBusinessDescription: Nullable<String>.value("Mobile auto detailing"),
                    otherIndustryDescription: Nullable<String>.value("Automotive services"),
                    owner: UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    ),
                    parentAccount: Nullable<AccountParent>.value(AccountParent(
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        route: "shine-time-holdings",
                        title: "Shine Time Holdings"
                    )),
                    paymentControls: Nullable<AccountPaymentControls>.value(AccountPaymentControls(
                        disputeAlertAutoRefund: AccountDisputeAlertAutoRefundControl(
                            locked: false,
                            thresholdUsd: Nullable<Double>.value(500)
                        ),
                        disputeAlertFeeUsd: Nullable<Double>.value(29),
                        enforce3Ds: false,
                        financingDisabled: false,
                        highRiskProcessingFeePercentage: 0,
                        pendingAutoTopupFeePercentage: 2,
                        pendingBalanceDelayDays: 0,
                        reserve: AccountReserveControl(
                            holdPeriodDays: 14,
                            percentage: Nullable<Double>.value(15)
                        ),
                        resolutionCenterAutoRefund: AccountResolutionCenterAutoRefundControl(
                            cardThresholdUsd: Nullable<Double>.value(50),
                            financingThresholdUsd: Nullable<Double>.value(25),
                            locked: false,
                            paypalThresholdUsd: Nullable<Double>.value(40)
                        ),
                        restrictedPaymentMethods: [
                            AccountPaymentControlsRestrictedPaymentMethodsItem.cardVisa
                        ]
                    )),
                    productTaxCode: Nullable<[String: JSONValue]>.value([
                        "id": JSONValue.string("ptc_xxxxxxxxxxxxxx"), 
                        "name": JSONValue.string("General - Digital Goods"), 
                        "product_type": JSONValue.string("digital")
                    ]),
                    recommendedActions: Nullable<[AccountRecommendedAction]>.value([
                        AccountRecommendedAction(
                            action: AccountRecommendedActionAction.themeBusiness,
                            blockedCapabilities: [
                                "accept_bnpl_payments"
                            ],
                            cta: "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/settings/payments/",
                            ctaLabel: "Apply",
                            description: "Let customers pay over time with buy now, pay later.",
                            iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/piggy-bank.svg"),
                            impactScore: Nullable<Int>.value(86),
                            reasoning: Nullable<String>.value("Financing lifts conversion on the $249 ceramic coating, the priciest job on the menu."),
                            status: AccountRecommendedActionStatus.optional,
                            title: "Offer financing at checkout"
                        )
                    ]),
                    require2Fa: true,
                    requiredActions: Nullable<[AccountRequiredAction]>.value([
                        AccountRequiredAction(
                            action: AccountRequiredActionAction.depositFunds,
                            blockedCapabilities: [
                                "standard_payout"
                            ],
                            cta: Nullable<String>.value("https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/"),
                            ctaLabel: "Verify now",
                            description: "Complete verification to withdraw your earnings.",
                            iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/shield.svg"),
                            status: AccountRequiredActionStatus.required,
                            title: "Complete your identity verification"
                        )
                    ]),
                    route: "biz_xxxxxxxxxxxxxx",
                    sendCustomerEmails: false,
                    showJoinedWhops: false,
                    showReviewsDtc: false,
                    showUserDirectory: false,
                    socialLinks: [
                        AccountSocialLink(
                            id: "social_1",
                            title: Nullable<String>.value("@shinetimedetail"),
                            url: "https://instagram.com/shinetimedetail",
                            website: AccountSocialLinkWebsite.x
                        )
                    ],
                    stablecoinRails: false,
                    status: Nullable<String>.value("active"),
                    statusReason: Nullable<String>.value("Payments are paused while we review recent chargebacks on this account."),
                    storePageConfig: AccountStorePageConfig(
                        accentColor: .null,
                        layout: .null,
                        profileVariant: .null,
                        whopAffiliateLink: true
                    ),
                    targetAudience: Nullable<String>.value("Owners of new and enthusiast vehicles in Austin, TX"),
                    taxCollectionEnabledStates: [
                        "TX"
                    ],
                    taxIdentifiers: [
                        AccountTaxIdentifier(
                            id: "txid_xxxxxxxxxxxxxx",
                            taxIdType: AccountTaxIdentifierTaxIdType.adNrt,
                            taxIdValue: "DE123456789"
                        )
                    ],
                    taxRemittedBy: Nullable<AccountTaxRemittedBy>.value(AccountTaxRemittedBy.whop),
                    taxType: Nullable<AccountTaxType>.value(AccountTaxType.inclusive),
                    threeDsLevel: Nullable<AccountThreeDsLevel>.value(AccountThreeDsLevel.mandateChallenge),
                    title: "Shine Time Auto Detailing",
                    totalEarnedUsd: Nullable<Double>.value(0),
                    totalUsd: Nullable<String>.value("50.00"),
                    useLogoAsOpengraphImageFallback: true,
                    verification: [:],
                    volumeUsd: Nullable<Double>.value(1.1),
                    wallet: Nullable<AccountWallet>.value(AccountWallet(
                        address: "0xabc123",
                        id: "cwal_xxxxxxxxxxxxxx",
                        network: AccountWalletNetwork.solana
                    ))
                )
            ],
            pageInfo: ListAccountsResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.accounts.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "balances": [
                    {
                      "balance": "50.0",
                      "breakdown": {
                        "available": "1500.0",
                        "in_transit": "0",
                        "pending": "0",
                        "pending_settlements": [
                          {
                            "amount": "12.5",
                            "date": "2026-01-01"
                          }
                        ],
                        "reserve": "0"
                      },
                      "icon_url": "https://assets.whop.com/tokens/usd.png",
                      "name": "US Dollar",
                      "price_usd": 1,
                      "symbol": "USD",
                      "value_usd": "50.00"
                    }
                  ],
                  "banner_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "business_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "4180 Burnet Rd",
                    "line2": "Suite 2",
                    "postal_code": "78756",
                    "state": "TX"
                  },
                  "business_name": "Shine Time Auto Detailing, LLC",
                  "business_type": "education_program",
                  "can_transfer_pending_balance_to_children": false,
                  "capabilities": {
                    "accept_bank_payments": "active",
                    "accept_bnpl_payments": "active",
                    "accept_card_payments": "active",
                    "bank_deposit": "active",
                    "card_deposit": "active",
                    "card_issuing": "active",
                    "crypto_deposit": "active",
                    "crypto_payout": "active",
                    "instant_payout": "active",
                    "run_ads": "active",
                    "standard_payout": "active",
                    "transfer": "active"
                  },
                  "cards": {
                    "kind": "individual",
                    "status": "approved"
                  },
                  "collect_vat_id": true,
                  "company_formation": {
                    "documents": [
                      {
                        "id": "file_xxxxxxxxxxxxxx",
                        "name": "Articles of Organization",
                        "type": "articles_of_organization",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      }
                    ],
                    "ein_registered": false,
                    "legal_name": "Shine Time Auto Detailing, LLC",
                    "signatures": {
                      "form8821": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      },
                      "ss4": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      }
                    },
                    "state_registered": true,
                    "status": "draft"
                  },
                  "country": "us",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "description": "Mobile ceramic coating, paint correction, and interior detailing across the Austin metro.",
                  "email": "marcus@shinetime.example",
                  "home_preferences": [
                    "hide_member_count"
                  ],
                  "id": "biz_xxxxxxxxxxxxxx",
                  "industry_group": "academic_and_test_prep",
                  "industry_type": "other",
                  "invoice_prefix": "SHINE",
                  "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "metadata": {
                    "external_id": "shop_4417",
                    "region": "austin"
                  },
                  "onboarding_type": "platform",
                  "opengraph_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "opengraph_image_variant": "white",
                  "other_business_description": "Mobile auto detailing",
                  "other_industry_description": "Automotive services",
                  "owner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "parent_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-holdings",
                    "title": "Shine Time Holdings"
                  },
                  "payment_controls": {
                    "dispute_alert_auto_refund": {
                      "locked": false,
                      "threshold_usd": 500
                    },
                    "dispute_alert_fee_usd": 29,
                    "enforce_3ds": false,
                    "financing_disabled": false,
                    "high_risk_processing_fee_percentage": 0,
                    "pending_auto_topup_fee_percentage": 2,
                    "pending_balance_delay_days": 0,
                    "reserve": {
                      "hold_period_days": 14,
                      "percentage": 15
                    },
                    "resolution_center_auto_refund": {
                      "card_threshold_usd": 50,
                      "financing_threshold_usd": 25,
                      "locked": false,
                      "paypal_threshold_usd": 40
                    },
                    "restricted_payment_methods": [
                      "card_visa"
                    ]
                  },
                  "product_tax_code": {
                    "id": "ptc_xxxxxxxxxxxxxx",
                    "name": "General - Digital Goods",
                    "product_type": "digital"
                  },
                  "recommended_actions": [
                    {
                      "action": "theme_business",
                      "blocked_capabilities": [
                        "accept_bnpl_payments"
                      ],
                      "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/settings/payments/",
                      "cta_label": "Apply",
                      "description": "Let customers pay over time with buy now, pay later.",
                      "icon_url": "https://whop.com/illustrations/orange/piggy-bank.svg",
                      "impact_score": 86,
                      "reasoning": "Financing lifts conversion on the $249 ceramic coating, the priciest job on the menu.",
                      "status": "optional",
                      "title": "Offer financing at checkout"
                    }
                  ],
                  "require_2fa": true,
                  "required_actions": [
                    {
                      "action": "deposit_funds",
                      "blocked_capabilities": [
                        "standard_payout"
                      ],
                      "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/",
                      "cta_label": "Verify now",
                      "description": "Complete verification to withdraw your earnings.",
                      "icon_url": "https://whop.com/illustrations/orange/shield.svg",
                      "status": "required",
                      "title": "Complete your identity verification"
                    }
                  ],
                  "route": "biz_xxxxxxxxxxxxxx",
                  "send_customer_emails": false,
                  "show_joined_whops": false,
                  "show_reviews_dtc": false,
                  "show_user_directory": false,
                  "social_links": [
                    {
                      "id": "social_1",
                      "title": "@shinetimedetail",
                      "url": "https://instagram.com/shinetimedetail",
                      "website": "x"
                    }
                  ],
                  "stablecoin_rails": false,
                  "status": "active",
                  "status_reason": "Payments are paused while we review recent chargebacks on this account.",
                  "store_page_config": {
                    "accent_color": "ruby",
                    "layout": "featured",
                    "profile_variant": "personal",
                    "whop_affiliate_link": true
                  },
                  "target_audience": "Owners of new and enthusiast vehicles in Austin, TX",
                  "tax_collection_enabled_states": [
                    "TX"
                  ],
                  "tax_identifiers": [
                    {
                      "id": "txid_xxxxxxxxxxxxxx",
                      "tax_id_type": "ad_nrt",
                      "tax_id_value": "DE123456789"
                    }
                  ],
                  "tax_remitted_by": "whop",
                  "tax_type": "inclusive",
                  "three_ds_level": "mandate_challenge",
                  "title": "Shine Time Auto Detailing",
                  "total_earned_usd": 0,
                  "total_usd": "50.00",
                  "use_logo_as_opengraph_image_fallback": true,
                  "verification": {
                    "business": {
                      "key": "value"
                    },
                    "individual": {
                      "key": "value"
                    }
                  },
                  "volume_usd": 1.1,
                  "wallet": {
                    "address": "0xabc123",
                    "id": "cwal_xxxxxxxxxxxxxx",
                    "network": "solana"
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
        let expectedResponse = Account(
            balances: [
                AccountBalanceToken(
                    balance: "50.0",
                    breakdown: AccountBalanceBreakdown(
                        available: "1500.0",
                        inTransit: "0",
                        pending: "0",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "12.5",
                                date: "2026-01-01"
                            )
                        ],
                        reserve: "0"
                    ),
                    iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usd.png"),
                    name: "US Dollar",
                    priceUsd: Nullable<Double>.value(1),
                    symbol: "USD",
                    valueUsd: Nullable<String>.value("50.00")
                )
            ],
            bannerImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            businessAddress: Nullable<[String: JSONValue]>.value([
                "city": JSONValue.string("Austin"), 
                "country": JSONValue.string("US"), 
                "line1": JSONValue.string("4180 Burnet Rd"), 
                "line2": JSONValue.string("Suite 2"), 
                "postal_code": JSONValue.string("78756"), 
                "state": JSONValue.string("TX")
            ]),
            businessName: Nullable<String>.value("Shine Time Auto Detailing, LLC"),
            businessType: Nullable<AccountBusinessType>.value(AccountBusinessType.educationProgram),
            canTransferPendingBalanceToChildren: false,
            capabilities: Nullable<AccountCapabilities>.value(AccountCapabilities(
                acceptBankPayments: AccountCapabilitiesAcceptBankPayments.active,
                acceptBnplPayments: AccountCapabilitiesAcceptBnplPayments.active,
                acceptCardPayments: AccountCapabilitiesAcceptCardPayments.active,
                bankDeposit: AccountCapabilitiesBankDeposit.active,
                cardDeposit: AccountCapabilitiesCardDeposit.active,
                cardIssuing: AccountCapabilitiesCardIssuing.active,
                cryptoDeposit: AccountCapabilitiesCryptoDeposit.active,
                cryptoPayout: AccountCapabilitiesCryptoPayout.active,
                instantPayout: AccountCapabilitiesInstantPayout.active,
                runAds: AccountCapabilitiesRunAds.active,
                standardPayout: AccountCapabilitiesStandardPayout.active,
                transfer: AccountCapabilitiesTransfer.active
            )),
            cards: Nullable<AccountCards>.value(AccountCards(
                kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                status: AccountCardsStatus.approved
            )),
            collectVatId: true,
            companyFormation: AccountCompanyFormation(
                documents: Optional([
                    AccountCompanyFormationDocument(
                        id: "file_xxxxxxxxxxxxxx",
                        name: "Articles of Organization",
                        type: "articles_of_organization",
                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    )
                ]),
                einRegistered: Optional(false),
                legalName: Optional(Nullable<String>.value("Shine Time Auto Detailing, LLC")),
                signatures: Optional(AccountCompanyFormationSignatures(
                    form8821: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    )),
                    ss4: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    ))
                )),
                stateRegistered: Optional(true),
                status: Optional(AccountCompanyFormationStatus.draft)
            ),
            country: Nullable<String>.value("us"),
            createdAt: "2026-01-01T12:00:00.000Z",
            description: Nullable<String>.value("Mobile ceramic coating, paint correction, and interior detailing across the Austin metro."),
            email: Nullable<String>.value("marcus@shinetime.example"),
            homePreferences: [
                AccountHomePreferencesItem.hideMemberCount
            ],
            id: "biz_xxxxxxxxxxxxxx",
            industryGroup: Nullable<AccountIndustryGroup>.value(AccountIndustryGroup.academicAndTestPrep),
            industryType: Nullable<String>.value("other"),
            invoicePrefix: Nullable<String>.value("SHINE"),
            logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            metadata: [
                "external_id": JSONValue.string("shop_4417"), 
                "region": JSONValue.string("austin")
            ],
            onboardingType: Nullable<AccountOnboardingType>.value(AccountOnboardingType.platform),
            opengraphImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            opengraphImageVariant: Nullable<AccountOpengraphImageVariant>.value(AccountOpengraphImageVariant.white),
            otherBusinessDescription: Nullable<String>.value("Mobile auto detailing"),
            otherIndustryDescription: Nullable<String>.value("Automotive services"),
            owner: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            parentAccount: Nullable<AccountParent>.value(AccountParent(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-holdings",
                title: "Shine Time Holdings"
            )),
            paymentControls: Nullable<AccountPaymentControls>.value(AccountPaymentControls(
                disputeAlertAutoRefund: AccountDisputeAlertAutoRefundControl(
                    locked: false,
                    thresholdUsd: Nullable<Double>.value(500)
                ),
                disputeAlertFeeUsd: Nullable<Double>.value(29),
                enforce3Ds: false,
                financingDisabled: false,
                highRiskProcessingFeePercentage: 0,
                pendingAutoTopupFeePercentage: 2,
                pendingBalanceDelayDays: 0,
                reserve: AccountReserveControl(
                    holdPeriodDays: 14,
                    percentage: Nullable<Double>.value(15)
                ),
                resolutionCenterAutoRefund: AccountResolutionCenterAutoRefundControl(
                    cardThresholdUsd: Nullable<Double>.value(50),
                    financingThresholdUsd: Nullable<Double>.value(25),
                    locked: false,
                    paypalThresholdUsd: Nullable<Double>.value(40)
                ),
                restrictedPaymentMethods: [
                    AccountPaymentControlsRestrictedPaymentMethodsItem.cardVisa
                ]
            )),
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("ptc_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("General - Digital Goods"), 
                "product_type": JSONValue.string("digital")
            ]),
            recommendedActions: Nullable<[AccountRecommendedAction]>.value([
                AccountRecommendedAction(
                    action: AccountRecommendedActionAction.themeBusiness,
                    blockedCapabilities: [
                        "accept_bnpl_payments"
                    ],
                    cta: "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/settings/payments/",
                    ctaLabel: "Apply",
                    description: "Let customers pay over time with buy now, pay later.",
                    iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/piggy-bank.svg"),
                    impactScore: Nullable<Int>.value(86),
                    reasoning: Nullable<String>.value("Financing lifts conversion on the $249 ceramic coating, the priciest job on the menu."),
                    status: AccountRecommendedActionStatus.optional,
                    title: "Offer financing at checkout"
                )
            ]),
            require2Fa: true,
            requiredActions: Nullable<[AccountRequiredAction]>.value([
                AccountRequiredAction(
                    action: AccountRequiredActionAction.depositFunds,
                    blockedCapabilities: [
                        "standard_payout"
                    ],
                    cta: Nullable<String>.value("https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/"),
                    ctaLabel: "Verify now",
                    description: "Complete verification to withdraw your earnings.",
                    iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/shield.svg"),
                    status: AccountRequiredActionStatus.required,
                    title: "Complete your identity verification"
                )
            ]),
            route: "biz_xxxxxxxxxxxxxx",
            sendCustomerEmails: false,
            showJoinedWhops: false,
            showReviewsDtc: false,
            showUserDirectory: false,
            socialLinks: [
                AccountSocialLink(
                    id: "social_1",
                    title: Nullable<String>.value("@shinetimedetail"),
                    url: "https://instagram.com/shinetimedetail",
                    website: AccountSocialLinkWebsite.x
                )
            ],
            stablecoinRails: false,
            status: Nullable<String>.value("active"),
            statusReason: Nullable<String>.value("Payments are paused while we review recent chargebacks on this account."),
            storePageConfig: AccountStorePageConfig(
                accentColor: Nullable<AccountStorePageConfigAccentColor>.value(AccountStorePageConfigAccentColor.ruby),
                layout: Nullable<AccountStorePageConfigLayout>.value(AccountStorePageConfigLayout.featured),
                profileVariant: Nullable<AccountStorePageConfigProfileVariant>.value(AccountStorePageConfigProfileVariant.personal),
                whopAffiliateLink: true
            ),
            targetAudience: Nullable<String>.value("Owners of new and enthusiast vehicles in Austin, TX"),
            taxCollectionEnabledStates: [
                "TX"
            ],
            taxIdentifiers: [
                AccountTaxIdentifier(
                    id: "txid_xxxxxxxxxxxxxx",
                    taxIdType: AccountTaxIdentifierTaxIdType.adNrt,
                    taxIdValue: "DE123456789"
                )
            ],
            taxRemittedBy: Nullable<AccountTaxRemittedBy>.value(AccountTaxRemittedBy.whop),
            taxType: Nullable<AccountTaxType>.value(AccountTaxType.inclusive),
            threeDsLevel: Nullable<AccountThreeDsLevel>.value(AccountThreeDsLevel.mandateChallenge),
            title: "Shine Time Auto Detailing",
            totalEarnedUsd: Nullable<Double>.value(0),
            totalUsd: Nullable<String>.value("50.00"),
            useLogoAsOpengraphImageFallback: true,
            verification: [
                "business": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                ), 
                "individual": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            volumeUsd: Nullable<Double>.value(1.1),
            wallet: Nullable<AccountWallet>.value(AccountWallet(
                address: "0xabc123",
                id: "cwal_xxxxxxxxxxxxxx",
                network: AccountWalletNetwork.solana
            ))
        )
        let response = try await client.accounts.create(
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func me1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "balances": [
                    {
                      "balance": "50.0",
                      "breakdown": {
                        "available": "1500.0",
                        "in_transit": "0",
                        "pending": "0",
                        "pending_settlements": [
                          {
                            "amount": "12.5",
                            "date": "2026-01-01"
                          }
                        ],
                        "reserve": "0"
                      },
                      "icon_url": "https://assets.whop.com/tokens/usd.png",
                      "name": "US Dollar",
                      "price_usd": 1,
                      "symbol": "USD",
                      "value_usd": "50.00"
                    }
                  ],
                  "banner_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "business_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "4180 Burnet Rd",
                    "line2": "Suite 2",
                    "postal_code": "78756",
                    "state": "TX"
                  },
                  "business_name": "Shine Time Auto Detailing, LLC",
                  "business_type": "education_program",
                  "can_transfer_pending_balance_to_children": false,
                  "capabilities": {
                    "accept_bank_payments": "active",
                    "accept_bnpl_payments": "active",
                    "accept_card_payments": "active",
                    "bank_deposit": "active",
                    "card_deposit": "active",
                    "card_issuing": "active",
                    "crypto_deposit": "active",
                    "crypto_payout": "active",
                    "instant_payout": "active",
                    "run_ads": "active",
                    "standard_payout": "active",
                    "transfer": "active"
                  },
                  "cards": {
                    "kind": "individual",
                    "status": "approved"
                  },
                  "collect_vat_id": true,
                  "company_formation": {
                    "documents": [
                      {
                        "id": "file_xxxxxxxxxxxxxx",
                        "name": "Articles of Organization",
                        "type": "articles_of_organization",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      }
                    ],
                    "ein_registered": false,
                    "legal_name": "Shine Time Auto Detailing, LLC",
                    "signatures": {
                      "form8821": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      },
                      "ss4": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      }
                    },
                    "state_registered": true,
                    "status": "draft"
                  },
                  "country": "us",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "description": "Mobile ceramic coating, paint correction, and interior detailing across the Austin metro.",
                  "email": "marcus@shinetime.example",
                  "home_preferences": [
                    "hide_member_count"
                  ],
                  "id": "biz_xxxxxxxxxxxxxx",
                  "industry_group": "academic_and_test_prep",
                  "industry_type": "other",
                  "invoice_prefix": "SHINE",
                  "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "metadata": {
                    "external_id": "shop_4417",
                    "region": "austin"
                  },
                  "onboarding_type": "platform",
                  "opengraph_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "opengraph_image_variant": "white",
                  "other_business_description": "Mobile auto detailing",
                  "other_industry_description": "Automotive services",
                  "owner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "parent_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-holdings",
                    "title": "Shine Time Holdings"
                  },
                  "payment_controls": {
                    "dispute_alert_auto_refund": {
                      "locked": false,
                      "threshold_usd": 500
                    },
                    "dispute_alert_fee_usd": 29,
                    "enforce_3ds": false,
                    "financing_disabled": false,
                    "high_risk_processing_fee_percentage": 0,
                    "pending_auto_topup_fee_percentage": 2,
                    "pending_balance_delay_days": 0,
                    "reserve": {
                      "hold_period_days": 14,
                      "percentage": 15
                    },
                    "resolution_center_auto_refund": {
                      "card_threshold_usd": 50,
                      "financing_threshold_usd": 25,
                      "locked": false,
                      "paypal_threshold_usd": 40
                    },
                    "restricted_payment_methods": [
                      "card_visa"
                    ]
                  },
                  "product_tax_code": {
                    "id": "ptc_xxxxxxxxxxxxxx",
                    "name": "General - Digital Goods",
                    "product_type": "digital"
                  },
                  "recommended_actions": [
                    {
                      "action": "theme_business",
                      "blocked_capabilities": [
                        "accept_bnpl_payments"
                      ],
                      "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/settings/payments/",
                      "cta_label": "Apply",
                      "description": "Let customers pay over time with buy now, pay later.",
                      "icon_url": "https://whop.com/illustrations/orange/piggy-bank.svg",
                      "impact_score": 86,
                      "reasoning": "Financing lifts conversion on the $249 ceramic coating, the priciest job on the menu.",
                      "status": "optional",
                      "title": "Offer financing at checkout"
                    }
                  ],
                  "require_2fa": true,
                  "required_actions": [
                    {
                      "action": "deposit_funds",
                      "blocked_capabilities": [
                        "standard_payout"
                      ],
                      "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/",
                      "cta_label": "Verify now",
                      "description": "Complete verification to withdraw your earnings.",
                      "icon_url": "https://whop.com/illustrations/orange/shield.svg",
                      "status": "required",
                      "title": "Complete your identity verification"
                    }
                  ],
                  "route": "biz_xxxxxxxxxxxxxx",
                  "send_customer_emails": false,
                  "show_joined_whops": false,
                  "show_reviews_dtc": false,
                  "show_user_directory": false,
                  "social_links": [
                    {
                      "id": "social_1",
                      "title": "@shinetimedetail",
                      "url": "https://instagram.com/shinetimedetail",
                      "website": "x"
                    }
                  ],
                  "stablecoin_rails": false,
                  "status": "active",
                  "status_reason": "Payments are paused while we review recent chargebacks on this account.",
                  "store_page_config": {
                    "accent_color": "ruby",
                    "layout": "featured",
                    "profile_variant": "personal",
                    "whop_affiliate_link": true
                  },
                  "target_audience": "Owners of new and enthusiast vehicles in Austin, TX",
                  "tax_collection_enabled_states": [
                    "TX"
                  ],
                  "tax_identifiers": [
                    {
                      "id": "txid_xxxxxxxxxxxxxx",
                      "tax_id_type": "ad_nrt",
                      "tax_id_value": "DE123456789"
                    }
                  ],
                  "tax_remitted_by": "whop",
                  "tax_type": "inclusive",
                  "three_ds_level": "mandate_challenge",
                  "title": "Shine Time Auto Detailing",
                  "total_earned_usd": 0,
                  "total_usd": "50.00",
                  "use_logo_as_opengraph_image_fallback": true,
                  "verification": {
                    "business": {
                      "key": "value"
                    },
                    "individual": {
                      "key": "value"
                    }
                  },
                  "volume_usd": 1.1,
                  "wallet": {
                    "address": "0xabc123",
                    "id": "cwal_xxxxxxxxxxxxxx",
                    "network": "solana"
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
        let expectedResponse = Account(
            balances: [
                AccountBalanceToken(
                    balance: "50.0",
                    breakdown: AccountBalanceBreakdown(
                        available: "1500.0",
                        inTransit: "0",
                        pending: "0",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "12.5",
                                date: "2026-01-01"
                            )
                        ],
                        reserve: "0"
                    ),
                    iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usd.png"),
                    name: "US Dollar",
                    priceUsd: Nullable<Double>.value(1),
                    symbol: "USD",
                    valueUsd: Nullable<String>.value("50.00")
                )
            ],
            bannerImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            businessAddress: Nullable<[String: JSONValue]>.value([
                "city": JSONValue.string("Austin"), 
                "country": JSONValue.string("US"), 
                "line1": JSONValue.string("4180 Burnet Rd"), 
                "line2": JSONValue.string("Suite 2"), 
                "postal_code": JSONValue.string("78756"), 
                "state": JSONValue.string("TX")
            ]),
            businessName: Nullable<String>.value("Shine Time Auto Detailing, LLC"),
            businessType: Nullable<AccountBusinessType>.value(AccountBusinessType.educationProgram),
            canTransferPendingBalanceToChildren: false,
            capabilities: Nullable<AccountCapabilities>.value(AccountCapabilities(
                acceptBankPayments: AccountCapabilitiesAcceptBankPayments.active,
                acceptBnplPayments: AccountCapabilitiesAcceptBnplPayments.active,
                acceptCardPayments: AccountCapabilitiesAcceptCardPayments.active,
                bankDeposit: AccountCapabilitiesBankDeposit.active,
                cardDeposit: AccountCapabilitiesCardDeposit.active,
                cardIssuing: AccountCapabilitiesCardIssuing.active,
                cryptoDeposit: AccountCapabilitiesCryptoDeposit.active,
                cryptoPayout: AccountCapabilitiesCryptoPayout.active,
                instantPayout: AccountCapabilitiesInstantPayout.active,
                runAds: AccountCapabilitiesRunAds.active,
                standardPayout: AccountCapabilitiesStandardPayout.active,
                transfer: AccountCapabilitiesTransfer.active
            )),
            cards: Nullable<AccountCards>.value(AccountCards(
                kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                status: AccountCardsStatus.approved
            )),
            collectVatId: true,
            companyFormation: AccountCompanyFormation(
                documents: Optional([
                    AccountCompanyFormationDocument(
                        id: "file_xxxxxxxxxxxxxx",
                        name: "Articles of Organization",
                        type: "articles_of_organization",
                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    )
                ]),
                einRegistered: Optional(false),
                legalName: Optional(Nullable<String>.value("Shine Time Auto Detailing, LLC")),
                signatures: Optional(AccountCompanyFormationSignatures(
                    form8821: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    )),
                    ss4: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    ))
                )),
                stateRegistered: Optional(true),
                status: Optional(AccountCompanyFormationStatus.draft)
            ),
            country: Nullable<String>.value("us"),
            createdAt: "2026-01-01T12:00:00.000Z",
            description: Nullable<String>.value("Mobile ceramic coating, paint correction, and interior detailing across the Austin metro."),
            email: Nullable<String>.value("marcus@shinetime.example"),
            homePreferences: [
                AccountHomePreferencesItem.hideMemberCount
            ],
            id: "biz_xxxxxxxxxxxxxx",
            industryGroup: Nullable<AccountIndustryGroup>.value(AccountIndustryGroup.academicAndTestPrep),
            industryType: Nullable<String>.value("other"),
            invoicePrefix: Nullable<String>.value("SHINE"),
            logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            metadata: [
                "external_id": JSONValue.string("shop_4417"), 
                "region": JSONValue.string("austin")
            ],
            onboardingType: Nullable<AccountOnboardingType>.value(AccountOnboardingType.platform),
            opengraphImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            opengraphImageVariant: Nullable<AccountOpengraphImageVariant>.value(AccountOpengraphImageVariant.white),
            otherBusinessDescription: Nullable<String>.value("Mobile auto detailing"),
            otherIndustryDescription: Nullable<String>.value("Automotive services"),
            owner: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            parentAccount: Nullable<AccountParent>.value(AccountParent(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-holdings",
                title: "Shine Time Holdings"
            )),
            paymentControls: Nullable<AccountPaymentControls>.value(AccountPaymentControls(
                disputeAlertAutoRefund: AccountDisputeAlertAutoRefundControl(
                    locked: false,
                    thresholdUsd: Nullable<Double>.value(500)
                ),
                disputeAlertFeeUsd: Nullable<Double>.value(29),
                enforce3Ds: false,
                financingDisabled: false,
                highRiskProcessingFeePercentage: 0,
                pendingAutoTopupFeePercentage: 2,
                pendingBalanceDelayDays: 0,
                reserve: AccountReserveControl(
                    holdPeriodDays: 14,
                    percentage: Nullable<Double>.value(15)
                ),
                resolutionCenterAutoRefund: AccountResolutionCenterAutoRefundControl(
                    cardThresholdUsd: Nullable<Double>.value(50),
                    financingThresholdUsd: Nullable<Double>.value(25),
                    locked: false,
                    paypalThresholdUsd: Nullable<Double>.value(40)
                ),
                restrictedPaymentMethods: [
                    AccountPaymentControlsRestrictedPaymentMethodsItem.cardVisa
                ]
            )),
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("ptc_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("General - Digital Goods"), 
                "product_type": JSONValue.string("digital")
            ]),
            recommendedActions: Nullable<[AccountRecommendedAction]>.value([
                AccountRecommendedAction(
                    action: AccountRecommendedActionAction.themeBusiness,
                    blockedCapabilities: [
                        "accept_bnpl_payments"
                    ],
                    cta: "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/settings/payments/",
                    ctaLabel: "Apply",
                    description: "Let customers pay over time with buy now, pay later.",
                    iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/piggy-bank.svg"),
                    impactScore: Nullable<Int>.value(86),
                    reasoning: Nullable<String>.value("Financing lifts conversion on the $249 ceramic coating, the priciest job on the menu."),
                    status: AccountRecommendedActionStatus.optional,
                    title: "Offer financing at checkout"
                )
            ]),
            require2Fa: true,
            requiredActions: Nullable<[AccountRequiredAction]>.value([
                AccountRequiredAction(
                    action: AccountRequiredActionAction.depositFunds,
                    blockedCapabilities: [
                        "standard_payout"
                    ],
                    cta: Nullable<String>.value("https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/"),
                    ctaLabel: "Verify now",
                    description: "Complete verification to withdraw your earnings.",
                    iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/shield.svg"),
                    status: AccountRequiredActionStatus.required,
                    title: "Complete your identity verification"
                )
            ]),
            route: "biz_xxxxxxxxxxxxxx",
            sendCustomerEmails: false,
            showJoinedWhops: false,
            showReviewsDtc: false,
            showUserDirectory: false,
            socialLinks: [
                AccountSocialLink(
                    id: "social_1",
                    title: Nullable<String>.value("@shinetimedetail"),
                    url: "https://instagram.com/shinetimedetail",
                    website: AccountSocialLinkWebsite.x
                )
            ],
            stablecoinRails: false,
            status: Nullable<String>.value("active"),
            statusReason: Nullable<String>.value("Payments are paused while we review recent chargebacks on this account."),
            storePageConfig: AccountStorePageConfig(
                accentColor: Nullable<AccountStorePageConfigAccentColor>.value(AccountStorePageConfigAccentColor.ruby),
                layout: Nullable<AccountStorePageConfigLayout>.value(AccountStorePageConfigLayout.featured),
                profileVariant: Nullable<AccountStorePageConfigProfileVariant>.value(AccountStorePageConfigProfileVariant.personal),
                whopAffiliateLink: true
            ),
            targetAudience: Nullable<String>.value("Owners of new and enthusiast vehicles in Austin, TX"),
            taxCollectionEnabledStates: [
                "TX"
            ],
            taxIdentifiers: [
                AccountTaxIdentifier(
                    id: "txid_xxxxxxxxxxxxxx",
                    taxIdType: AccountTaxIdentifierTaxIdType.adNrt,
                    taxIdValue: "DE123456789"
                )
            ],
            taxRemittedBy: Nullable<AccountTaxRemittedBy>.value(AccountTaxRemittedBy.whop),
            taxType: Nullable<AccountTaxType>.value(AccountTaxType.inclusive),
            threeDsLevel: Nullable<AccountThreeDsLevel>.value(AccountThreeDsLevel.mandateChallenge),
            title: "Shine Time Auto Detailing",
            totalEarnedUsd: Nullable<Double>.value(0),
            totalUsd: Nullable<String>.value("50.00"),
            useLogoAsOpengraphImageFallback: true,
            verification: [
                "business": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                ), 
                "individual": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            volumeUsd: Nullable<Double>.value(1.1),
            wallet: Nullable<AccountWallet>.value(AccountWallet(
                address: "0xabc123",
                id: "cwal_xxxxxxxxxxxxxx",
                network: AccountWalletNetwork.solana
            ))
        )
        let response = try await client.accounts.me(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "balances": [
                    {
                      "balance": "50.0",
                      "breakdown": {
                        "available": "1500.0",
                        "in_transit": "0",
                        "pending": "0",
                        "pending_settlements": [
                          {
                            "amount": "12.5",
                            "date": "2026-01-01"
                          }
                        ],
                        "reserve": "0"
                      },
                      "icon_url": "https://assets.whop.com/tokens/usd.png",
                      "name": "US Dollar",
                      "price_usd": 1,
                      "symbol": "USD",
                      "value_usd": "50.00"
                    }
                  ],
                  "banner_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "business_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "4180 Burnet Rd",
                    "line2": "Suite 2",
                    "postal_code": "78756",
                    "state": "TX"
                  },
                  "business_name": "Shine Time Auto Detailing, LLC",
                  "business_type": "education_program",
                  "can_transfer_pending_balance_to_children": false,
                  "capabilities": {
                    "accept_bank_payments": "active",
                    "accept_bnpl_payments": "active",
                    "accept_card_payments": "active",
                    "bank_deposit": "active",
                    "card_deposit": "active",
                    "card_issuing": "active",
                    "crypto_deposit": "active",
                    "crypto_payout": "active",
                    "instant_payout": "active",
                    "run_ads": "active",
                    "standard_payout": "active",
                    "transfer": "active"
                  },
                  "cards": {
                    "kind": "individual",
                    "status": "approved"
                  },
                  "collect_vat_id": true,
                  "company_formation": {
                    "documents": [
                      {
                        "id": "file_xxxxxxxxxxxxxx",
                        "name": "Articles of Organization",
                        "type": "articles_of_organization",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      }
                    ],
                    "ein_registered": false,
                    "legal_name": "Shine Time Auto Detailing, LLC",
                    "signatures": {
                      "form8821": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      },
                      "ss4": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      }
                    },
                    "state_registered": true,
                    "status": "draft"
                  },
                  "country": "us",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "description": "Mobile ceramic coating, paint correction, and interior detailing across the Austin metro.",
                  "email": "marcus@shinetime.example",
                  "home_preferences": [
                    "hide_member_count"
                  ],
                  "id": "biz_xxxxxxxxxxxxxx",
                  "industry_group": "academic_and_test_prep",
                  "industry_type": "other",
                  "invoice_prefix": "SHINE",
                  "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "metadata": {
                    "external_id": "shop_4417",
                    "region": "austin"
                  },
                  "onboarding_type": "platform",
                  "opengraph_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "opengraph_image_variant": "white",
                  "other_business_description": "Mobile auto detailing",
                  "other_industry_description": "Automotive services",
                  "owner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "parent_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-holdings",
                    "title": "Shine Time Holdings"
                  },
                  "payment_controls": {
                    "dispute_alert_auto_refund": {
                      "locked": false,
                      "threshold_usd": 500
                    },
                    "dispute_alert_fee_usd": 29,
                    "enforce_3ds": false,
                    "financing_disabled": false,
                    "high_risk_processing_fee_percentage": 0,
                    "pending_auto_topup_fee_percentage": 2,
                    "pending_balance_delay_days": 0,
                    "reserve": {
                      "hold_period_days": 14,
                      "percentage": 15
                    },
                    "resolution_center_auto_refund": {
                      "card_threshold_usd": 50,
                      "financing_threshold_usd": 25,
                      "locked": false,
                      "paypal_threshold_usd": 40
                    },
                    "restricted_payment_methods": [
                      "card_visa"
                    ]
                  },
                  "product_tax_code": {
                    "id": "ptc_xxxxxxxxxxxxxx",
                    "name": "General - Digital Goods",
                    "product_type": "digital"
                  },
                  "recommended_actions": [
                    {
                      "action": "theme_business",
                      "blocked_capabilities": [
                        "accept_bnpl_payments"
                      ],
                      "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/settings/payments/",
                      "cta_label": "Apply",
                      "description": "Let customers pay over time with buy now, pay later.",
                      "icon_url": "https://whop.com/illustrations/orange/piggy-bank.svg",
                      "impact_score": 86,
                      "reasoning": "Financing lifts conversion on the $249 ceramic coating, the priciest job on the menu.",
                      "status": "optional",
                      "title": "Offer financing at checkout"
                    }
                  ],
                  "require_2fa": true,
                  "required_actions": [
                    {
                      "action": "deposit_funds",
                      "blocked_capabilities": [
                        "standard_payout"
                      ],
                      "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/",
                      "cta_label": "Verify now",
                      "description": "Complete verification to withdraw your earnings.",
                      "icon_url": "https://whop.com/illustrations/orange/shield.svg",
                      "status": "required",
                      "title": "Complete your identity verification"
                    }
                  ],
                  "route": "biz_xxxxxxxxxxxxxx",
                  "send_customer_emails": false,
                  "show_joined_whops": false,
                  "show_reviews_dtc": false,
                  "show_user_directory": false,
                  "social_links": [
                    {
                      "id": "social_1",
                      "title": "@shinetimedetail",
                      "url": "https://instagram.com/shinetimedetail",
                      "website": "x"
                    }
                  ],
                  "stablecoin_rails": false,
                  "status": "active",
                  "status_reason": "Payments are paused while we review recent chargebacks on this account.",
                  "store_page_config": {
                    "accent_color": "ruby",
                    "layout": "featured",
                    "profile_variant": "personal",
                    "whop_affiliate_link": true
                  },
                  "target_audience": "Owners of new and enthusiast vehicles in Austin, TX",
                  "tax_collection_enabled_states": [
                    "TX"
                  ],
                  "tax_identifiers": [
                    {
                      "id": "txid_xxxxxxxxxxxxxx",
                      "tax_id_type": "ad_nrt",
                      "tax_id_value": "DE123456789"
                    }
                  ],
                  "tax_remitted_by": "whop",
                  "tax_type": "inclusive",
                  "three_ds_level": "mandate_challenge",
                  "title": "Shine Time Auto Detailing",
                  "total_earned_usd": 0,
                  "total_usd": "50.00",
                  "use_logo_as_opengraph_image_fallback": true,
                  "verification": {
                    "business": {
                      "key": "value"
                    },
                    "individual": {
                      "key": "value"
                    }
                  },
                  "volume_usd": 1.1,
                  "wallet": {
                    "address": "0xabc123",
                    "id": "cwal_xxxxxxxxxxxxxx",
                    "network": "solana"
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
        let expectedResponse = Account(
            balances: [
                AccountBalanceToken(
                    balance: "50.0",
                    breakdown: AccountBalanceBreakdown(
                        available: "1500.0",
                        inTransit: "0",
                        pending: "0",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "12.5",
                                date: "2026-01-01"
                            )
                        ],
                        reserve: "0"
                    ),
                    iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usd.png"),
                    name: "US Dollar",
                    priceUsd: Nullable<Double>.value(1),
                    symbol: "USD",
                    valueUsd: Nullable<String>.value("50.00")
                )
            ],
            bannerImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            businessAddress: Nullable<[String: JSONValue]>.value([
                "city": JSONValue.string("Austin"), 
                "country": JSONValue.string("US"), 
                "line1": JSONValue.string("4180 Burnet Rd"), 
                "line2": JSONValue.string("Suite 2"), 
                "postal_code": JSONValue.string("78756"), 
                "state": JSONValue.string("TX")
            ]),
            businessName: Nullable<String>.value("Shine Time Auto Detailing, LLC"),
            businessType: Nullable<AccountBusinessType>.value(AccountBusinessType.educationProgram),
            canTransferPendingBalanceToChildren: false,
            capabilities: Nullable<AccountCapabilities>.value(AccountCapabilities(
                acceptBankPayments: AccountCapabilitiesAcceptBankPayments.active,
                acceptBnplPayments: AccountCapabilitiesAcceptBnplPayments.active,
                acceptCardPayments: AccountCapabilitiesAcceptCardPayments.active,
                bankDeposit: AccountCapabilitiesBankDeposit.active,
                cardDeposit: AccountCapabilitiesCardDeposit.active,
                cardIssuing: AccountCapabilitiesCardIssuing.active,
                cryptoDeposit: AccountCapabilitiesCryptoDeposit.active,
                cryptoPayout: AccountCapabilitiesCryptoPayout.active,
                instantPayout: AccountCapabilitiesInstantPayout.active,
                runAds: AccountCapabilitiesRunAds.active,
                standardPayout: AccountCapabilitiesStandardPayout.active,
                transfer: AccountCapabilitiesTransfer.active
            )),
            cards: Nullable<AccountCards>.value(AccountCards(
                kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                status: AccountCardsStatus.approved
            )),
            collectVatId: true,
            companyFormation: AccountCompanyFormation(
                documents: Optional([
                    AccountCompanyFormationDocument(
                        id: "file_xxxxxxxxxxxxxx",
                        name: "Articles of Organization",
                        type: "articles_of_organization",
                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    )
                ]),
                einRegistered: Optional(false),
                legalName: Optional(Nullable<String>.value("Shine Time Auto Detailing, LLC")),
                signatures: Optional(AccountCompanyFormationSignatures(
                    form8821: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    )),
                    ss4: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    ))
                )),
                stateRegistered: Optional(true),
                status: Optional(AccountCompanyFormationStatus.draft)
            ),
            country: Nullable<String>.value("us"),
            createdAt: "2026-01-01T12:00:00.000Z",
            description: Nullable<String>.value("Mobile ceramic coating, paint correction, and interior detailing across the Austin metro."),
            email: Nullable<String>.value("marcus@shinetime.example"),
            homePreferences: [
                AccountHomePreferencesItem.hideMemberCount
            ],
            id: "biz_xxxxxxxxxxxxxx",
            industryGroup: Nullable<AccountIndustryGroup>.value(AccountIndustryGroup.academicAndTestPrep),
            industryType: Nullable<String>.value("other"),
            invoicePrefix: Nullable<String>.value("SHINE"),
            logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            metadata: [
                "external_id": JSONValue.string("shop_4417"), 
                "region": JSONValue.string("austin")
            ],
            onboardingType: Nullable<AccountOnboardingType>.value(AccountOnboardingType.platform),
            opengraphImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            opengraphImageVariant: Nullable<AccountOpengraphImageVariant>.value(AccountOpengraphImageVariant.white),
            otherBusinessDescription: Nullable<String>.value("Mobile auto detailing"),
            otherIndustryDescription: Nullable<String>.value("Automotive services"),
            owner: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            parentAccount: Nullable<AccountParent>.value(AccountParent(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-holdings",
                title: "Shine Time Holdings"
            )),
            paymentControls: Nullable<AccountPaymentControls>.value(AccountPaymentControls(
                disputeAlertAutoRefund: AccountDisputeAlertAutoRefundControl(
                    locked: false,
                    thresholdUsd: Nullable<Double>.value(500)
                ),
                disputeAlertFeeUsd: Nullable<Double>.value(29),
                enforce3Ds: false,
                financingDisabled: false,
                highRiskProcessingFeePercentage: 0,
                pendingAutoTopupFeePercentage: 2,
                pendingBalanceDelayDays: 0,
                reserve: AccountReserveControl(
                    holdPeriodDays: 14,
                    percentage: Nullable<Double>.value(15)
                ),
                resolutionCenterAutoRefund: AccountResolutionCenterAutoRefundControl(
                    cardThresholdUsd: Nullable<Double>.value(50),
                    financingThresholdUsd: Nullable<Double>.value(25),
                    locked: false,
                    paypalThresholdUsd: Nullable<Double>.value(40)
                ),
                restrictedPaymentMethods: [
                    AccountPaymentControlsRestrictedPaymentMethodsItem.cardVisa
                ]
            )),
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("ptc_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("General - Digital Goods"), 
                "product_type": JSONValue.string("digital")
            ]),
            recommendedActions: Nullable<[AccountRecommendedAction]>.value([
                AccountRecommendedAction(
                    action: AccountRecommendedActionAction.themeBusiness,
                    blockedCapabilities: [
                        "accept_bnpl_payments"
                    ],
                    cta: "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/settings/payments/",
                    ctaLabel: "Apply",
                    description: "Let customers pay over time with buy now, pay later.",
                    iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/piggy-bank.svg"),
                    impactScore: Nullable<Int>.value(86),
                    reasoning: Nullable<String>.value("Financing lifts conversion on the $249 ceramic coating, the priciest job on the menu."),
                    status: AccountRecommendedActionStatus.optional,
                    title: "Offer financing at checkout"
                )
            ]),
            require2Fa: true,
            requiredActions: Nullable<[AccountRequiredAction]>.value([
                AccountRequiredAction(
                    action: AccountRequiredActionAction.depositFunds,
                    blockedCapabilities: [
                        "standard_payout"
                    ],
                    cta: Nullable<String>.value("https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/"),
                    ctaLabel: "Verify now",
                    description: "Complete verification to withdraw your earnings.",
                    iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/shield.svg"),
                    status: AccountRequiredActionStatus.required,
                    title: "Complete your identity verification"
                )
            ]),
            route: "biz_xxxxxxxxxxxxxx",
            sendCustomerEmails: false,
            showJoinedWhops: false,
            showReviewsDtc: false,
            showUserDirectory: false,
            socialLinks: [
                AccountSocialLink(
                    id: "social_1",
                    title: Nullable<String>.value("@shinetimedetail"),
                    url: "https://instagram.com/shinetimedetail",
                    website: AccountSocialLinkWebsite.x
                )
            ],
            stablecoinRails: false,
            status: Nullable<String>.value("active"),
            statusReason: Nullable<String>.value("Payments are paused while we review recent chargebacks on this account."),
            storePageConfig: AccountStorePageConfig(
                accentColor: Nullable<AccountStorePageConfigAccentColor>.value(AccountStorePageConfigAccentColor.ruby),
                layout: Nullable<AccountStorePageConfigLayout>.value(AccountStorePageConfigLayout.featured),
                profileVariant: Nullable<AccountStorePageConfigProfileVariant>.value(AccountStorePageConfigProfileVariant.personal),
                whopAffiliateLink: true
            ),
            targetAudience: Nullable<String>.value("Owners of new and enthusiast vehicles in Austin, TX"),
            taxCollectionEnabledStates: [
                "TX"
            ],
            taxIdentifiers: [
                AccountTaxIdentifier(
                    id: "txid_xxxxxxxxxxxxxx",
                    taxIdType: AccountTaxIdentifierTaxIdType.adNrt,
                    taxIdValue: "DE123456789"
                )
            ],
            taxRemittedBy: Nullable<AccountTaxRemittedBy>.value(AccountTaxRemittedBy.whop),
            taxType: Nullable<AccountTaxType>.value(AccountTaxType.inclusive),
            threeDsLevel: Nullable<AccountThreeDsLevel>.value(AccountThreeDsLevel.mandateChallenge),
            title: "Shine Time Auto Detailing",
            totalEarnedUsd: Nullable<Double>.value(0),
            totalUsd: Nullable<String>.value("50.00"),
            useLogoAsOpengraphImageFallback: true,
            verification: [
                "business": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                ), 
                "individual": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            volumeUsd: Nullable<Double>.value(1.1),
            wallet: Nullable<AccountWallet>.value(AccountWallet(
                address: "0xabc123",
                id: "cwal_xxxxxxxxxxxxxx",
                network: AccountWalletNetwork.solana
            ))
        )
        let response = try await client.accounts.retrieve(
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
                  "balances": [
                    {
                      "balance": "50.0",
                      "breakdown": {
                        "available": "1500.0",
                        "in_transit": "0",
                        "pending": "0",
                        "pending_settlements": [
                          {
                            "amount": "12.5",
                            "date": "2026-01-01"
                          }
                        ],
                        "reserve": "0"
                      },
                      "icon_url": "https://assets.whop.com/tokens/usd.png",
                      "name": "US Dollar",
                      "price_usd": 1,
                      "symbol": "USD",
                      "value_usd": "50.00"
                    }
                  ],
                  "banner_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "business_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "4180 Burnet Rd",
                    "line2": "Suite 2",
                    "postal_code": "78756",
                    "state": "TX"
                  },
                  "business_name": "Shine Time Auto Detailing, LLC",
                  "business_type": "education_program",
                  "can_transfer_pending_balance_to_children": false,
                  "capabilities": {
                    "accept_bank_payments": "active",
                    "accept_bnpl_payments": "active",
                    "accept_card_payments": "active",
                    "bank_deposit": "active",
                    "card_deposit": "active",
                    "card_issuing": "active",
                    "crypto_deposit": "active",
                    "crypto_payout": "active",
                    "instant_payout": "active",
                    "run_ads": "active",
                    "standard_payout": "active",
                    "transfer": "active"
                  },
                  "cards": {
                    "kind": "individual",
                    "status": "approved"
                  },
                  "collect_vat_id": true,
                  "company_formation": {
                    "documents": [
                      {
                        "id": "file_xxxxxxxxxxxxxx",
                        "name": "Articles of Organization",
                        "type": "articles_of_organization",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      }
                    ],
                    "ein_registered": false,
                    "legal_name": "Shine Time Auto Detailing, LLC",
                    "signatures": {
                      "form8821": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      },
                      "ss4": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      }
                    },
                    "state_registered": true,
                    "status": "draft"
                  },
                  "country": "us",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "description": "Mobile ceramic coating, paint correction, and interior detailing across the Austin metro.",
                  "email": "marcus@shinetime.example",
                  "home_preferences": [
                    "hide_member_count"
                  ],
                  "id": "biz_xxxxxxxxxxxxxx",
                  "industry_group": "academic_and_test_prep",
                  "industry_type": "other",
                  "invoice_prefix": "SHINE",
                  "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "metadata": {
                    "external_id": "shop_4417",
                    "region": "austin"
                  },
                  "onboarding_type": "platform",
                  "opengraph_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "opengraph_image_variant": "white",
                  "other_business_description": "Mobile auto detailing",
                  "other_industry_description": "Automotive services",
                  "owner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "parent_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-holdings",
                    "title": "Shine Time Holdings"
                  },
                  "payment_controls": {
                    "dispute_alert_auto_refund": {
                      "locked": false,
                      "threshold_usd": 500
                    },
                    "dispute_alert_fee_usd": 29,
                    "enforce_3ds": false,
                    "financing_disabled": false,
                    "high_risk_processing_fee_percentage": 0,
                    "pending_auto_topup_fee_percentage": 2,
                    "pending_balance_delay_days": 0,
                    "reserve": {
                      "hold_period_days": 14,
                      "percentage": 15
                    },
                    "resolution_center_auto_refund": {
                      "card_threshold_usd": 50,
                      "financing_threshold_usd": 25,
                      "locked": false,
                      "paypal_threshold_usd": 40
                    },
                    "restricted_payment_methods": [
                      "card_visa"
                    ]
                  },
                  "product_tax_code": {
                    "id": "ptc_xxxxxxxxxxxxxx",
                    "name": "General - Digital Goods",
                    "product_type": "digital"
                  },
                  "recommended_actions": [
                    {
                      "action": "theme_business",
                      "blocked_capabilities": [
                        "accept_bnpl_payments"
                      ],
                      "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/settings/payments/",
                      "cta_label": "Apply",
                      "description": "Let customers pay over time with buy now, pay later.",
                      "icon_url": "https://whop.com/illustrations/orange/piggy-bank.svg",
                      "impact_score": 86,
                      "reasoning": "Financing lifts conversion on the $249 ceramic coating, the priciest job on the menu.",
                      "status": "optional",
                      "title": "Offer financing at checkout"
                    }
                  ],
                  "require_2fa": true,
                  "required_actions": [
                    {
                      "action": "deposit_funds",
                      "blocked_capabilities": [
                        "standard_payout"
                      ],
                      "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/",
                      "cta_label": "Verify now",
                      "description": "Complete verification to withdraw your earnings.",
                      "icon_url": "https://whop.com/illustrations/orange/shield.svg",
                      "status": "required",
                      "title": "Complete your identity verification"
                    }
                  ],
                  "route": "biz_xxxxxxxxxxxxxx",
                  "send_customer_emails": false,
                  "show_joined_whops": false,
                  "show_reviews_dtc": false,
                  "show_user_directory": false,
                  "social_links": [
                    {
                      "id": "social_1",
                      "title": "@shinetimedetail",
                      "url": "https://instagram.com/shinetimedetail",
                      "website": "x"
                    }
                  ],
                  "stablecoin_rails": false,
                  "status": "active",
                  "status_reason": "Payments are paused while we review recent chargebacks on this account.",
                  "store_page_config": {
                    "accent_color": "ruby",
                    "layout": "featured",
                    "profile_variant": "personal",
                    "whop_affiliate_link": true
                  },
                  "target_audience": "Owners of new and enthusiast vehicles in Austin, TX",
                  "tax_collection_enabled_states": [
                    "TX"
                  ],
                  "tax_identifiers": [
                    {
                      "id": "txid_xxxxxxxxxxxxxx",
                      "tax_id_type": "ad_nrt",
                      "tax_id_value": "DE123456789"
                    }
                  ],
                  "tax_remitted_by": "whop",
                  "tax_type": "inclusive",
                  "three_ds_level": "mandate_challenge",
                  "title": "Shine Time Auto Detailing",
                  "total_earned_usd": 0,
                  "total_usd": "50.00",
                  "use_logo_as_opengraph_image_fallback": true,
                  "verification": {
                    "business": {
                      "key": "value"
                    },
                    "individual": {
                      "key": "value"
                    }
                  },
                  "volume_usd": 1.1,
                  "wallet": {
                    "address": "0xabc123",
                    "id": "cwal_xxxxxxxxxxxxxx",
                    "network": "solana"
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
        let expectedResponse = Account(
            balances: [
                AccountBalanceToken(
                    balance: "50.0",
                    breakdown: AccountBalanceBreakdown(
                        available: "1500.0",
                        inTransit: "0",
                        pending: "0",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "12.5",
                                date: "2026-01-01"
                            )
                        ],
                        reserve: "0"
                    ),
                    iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usd.png"),
                    name: "US Dollar",
                    priceUsd: Nullable<Double>.value(1),
                    symbol: "USD",
                    valueUsd: Nullable<String>.value("50.00")
                )
            ],
            bannerImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            businessAddress: Nullable<[String: JSONValue]>.value([
                "city": JSONValue.string("Austin"), 
                "country": JSONValue.string("US"), 
                "line1": JSONValue.string("4180 Burnet Rd"), 
                "line2": JSONValue.string("Suite 2"), 
                "postal_code": JSONValue.string("78756"), 
                "state": JSONValue.string("TX")
            ]),
            businessName: Nullable<String>.value("Shine Time Auto Detailing, LLC"),
            businessType: Nullable<AccountBusinessType>.value(AccountBusinessType.educationProgram),
            canTransferPendingBalanceToChildren: false,
            capabilities: Nullable<AccountCapabilities>.value(AccountCapabilities(
                acceptBankPayments: AccountCapabilitiesAcceptBankPayments.active,
                acceptBnplPayments: AccountCapabilitiesAcceptBnplPayments.active,
                acceptCardPayments: AccountCapabilitiesAcceptCardPayments.active,
                bankDeposit: AccountCapabilitiesBankDeposit.active,
                cardDeposit: AccountCapabilitiesCardDeposit.active,
                cardIssuing: AccountCapabilitiesCardIssuing.active,
                cryptoDeposit: AccountCapabilitiesCryptoDeposit.active,
                cryptoPayout: AccountCapabilitiesCryptoPayout.active,
                instantPayout: AccountCapabilitiesInstantPayout.active,
                runAds: AccountCapabilitiesRunAds.active,
                standardPayout: AccountCapabilitiesStandardPayout.active,
                transfer: AccountCapabilitiesTransfer.active
            )),
            cards: Nullable<AccountCards>.value(AccountCards(
                kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                status: AccountCardsStatus.approved
            )),
            collectVatId: true,
            companyFormation: AccountCompanyFormation(
                documents: Optional([
                    AccountCompanyFormationDocument(
                        id: "file_xxxxxxxxxxxxxx",
                        name: "Articles of Organization",
                        type: "articles_of_organization",
                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    )
                ]),
                einRegistered: Optional(false),
                legalName: Optional(Nullable<String>.value("Shine Time Auto Detailing, LLC")),
                signatures: Optional(AccountCompanyFormationSignatures(
                    form8821: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    )),
                    ss4: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    ))
                )),
                stateRegistered: Optional(true),
                status: Optional(AccountCompanyFormationStatus.draft)
            ),
            country: Nullable<String>.value("us"),
            createdAt: "2026-01-01T12:00:00.000Z",
            description: Nullable<String>.value("Mobile ceramic coating, paint correction, and interior detailing across the Austin metro."),
            email: Nullable<String>.value("marcus@shinetime.example"),
            homePreferences: [
                AccountHomePreferencesItem.hideMemberCount
            ],
            id: "biz_xxxxxxxxxxxxxx",
            industryGroup: Nullable<AccountIndustryGroup>.value(AccountIndustryGroup.academicAndTestPrep),
            industryType: Nullable<String>.value("other"),
            invoicePrefix: Nullable<String>.value("SHINE"),
            logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            metadata: [
                "external_id": JSONValue.string("shop_4417"), 
                "region": JSONValue.string("austin")
            ],
            onboardingType: Nullable<AccountOnboardingType>.value(AccountOnboardingType.platform),
            opengraphImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            opengraphImageVariant: Nullable<AccountOpengraphImageVariant>.value(AccountOpengraphImageVariant.white),
            otherBusinessDescription: Nullable<String>.value("Mobile auto detailing"),
            otherIndustryDescription: Nullable<String>.value("Automotive services"),
            owner: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            parentAccount: Nullable<AccountParent>.value(AccountParent(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-holdings",
                title: "Shine Time Holdings"
            )),
            paymentControls: Nullable<AccountPaymentControls>.value(AccountPaymentControls(
                disputeAlertAutoRefund: AccountDisputeAlertAutoRefundControl(
                    locked: false,
                    thresholdUsd: Nullable<Double>.value(500)
                ),
                disputeAlertFeeUsd: Nullable<Double>.value(29),
                enforce3Ds: false,
                financingDisabled: false,
                highRiskProcessingFeePercentage: 0,
                pendingAutoTopupFeePercentage: 2,
                pendingBalanceDelayDays: 0,
                reserve: AccountReserveControl(
                    holdPeriodDays: 14,
                    percentage: Nullable<Double>.value(15)
                ),
                resolutionCenterAutoRefund: AccountResolutionCenterAutoRefundControl(
                    cardThresholdUsd: Nullable<Double>.value(50),
                    financingThresholdUsd: Nullable<Double>.value(25),
                    locked: false,
                    paypalThresholdUsd: Nullable<Double>.value(40)
                ),
                restrictedPaymentMethods: [
                    AccountPaymentControlsRestrictedPaymentMethodsItem.cardVisa
                ]
            )),
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("ptc_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("General - Digital Goods"), 
                "product_type": JSONValue.string("digital")
            ]),
            recommendedActions: Nullable<[AccountRecommendedAction]>.value([
                AccountRecommendedAction(
                    action: AccountRecommendedActionAction.themeBusiness,
                    blockedCapabilities: [
                        "accept_bnpl_payments"
                    ],
                    cta: "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/settings/payments/",
                    ctaLabel: "Apply",
                    description: "Let customers pay over time with buy now, pay later.",
                    iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/piggy-bank.svg"),
                    impactScore: Nullable<Int>.value(86),
                    reasoning: Nullable<String>.value("Financing lifts conversion on the $249 ceramic coating, the priciest job on the menu."),
                    status: AccountRecommendedActionStatus.optional,
                    title: "Offer financing at checkout"
                )
            ]),
            require2Fa: true,
            requiredActions: Nullable<[AccountRequiredAction]>.value([
                AccountRequiredAction(
                    action: AccountRequiredActionAction.depositFunds,
                    blockedCapabilities: [
                        "standard_payout"
                    ],
                    cta: Nullable<String>.value("https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/"),
                    ctaLabel: "Verify now",
                    description: "Complete verification to withdraw your earnings.",
                    iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/shield.svg"),
                    status: AccountRequiredActionStatus.required,
                    title: "Complete your identity verification"
                )
            ]),
            route: "biz_xxxxxxxxxxxxxx",
            sendCustomerEmails: false,
            showJoinedWhops: false,
            showReviewsDtc: false,
            showUserDirectory: false,
            socialLinks: [
                AccountSocialLink(
                    id: "social_1",
                    title: Nullable<String>.value("@shinetimedetail"),
                    url: "https://instagram.com/shinetimedetail",
                    website: AccountSocialLinkWebsite.x
                )
            ],
            stablecoinRails: false,
            status: Nullable<String>.value("active"),
            statusReason: Nullable<String>.value("Payments are paused while we review recent chargebacks on this account."),
            storePageConfig: AccountStorePageConfig(
                accentColor: Nullable<AccountStorePageConfigAccentColor>.value(AccountStorePageConfigAccentColor.ruby),
                layout: Nullable<AccountStorePageConfigLayout>.value(AccountStorePageConfigLayout.featured),
                profileVariant: Nullable<AccountStorePageConfigProfileVariant>.value(AccountStorePageConfigProfileVariant.personal),
                whopAffiliateLink: true
            ),
            targetAudience: Nullable<String>.value("Owners of new and enthusiast vehicles in Austin, TX"),
            taxCollectionEnabledStates: [
                "TX"
            ],
            taxIdentifiers: [
                AccountTaxIdentifier(
                    id: "txid_xxxxxxxxxxxxxx",
                    taxIdType: AccountTaxIdentifierTaxIdType.adNrt,
                    taxIdValue: "DE123456789"
                )
            ],
            taxRemittedBy: Nullable<AccountTaxRemittedBy>.value(AccountTaxRemittedBy.whop),
            taxType: Nullable<AccountTaxType>.value(AccountTaxType.inclusive),
            threeDsLevel: Nullable<AccountThreeDsLevel>.value(AccountThreeDsLevel.mandateChallenge),
            title: "Shine Time Auto Detailing",
            totalEarnedUsd: Nullable<Double>.value(0),
            totalUsd: Nullable<String>.value("50.00"),
            useLogoAsOpengraphImageFallback: true,
            verification: [
                "business": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                ), 
                "individual": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            volumeUsd: Nullable<Double>.value(1.1),
            wallet: Nullable<AccountWallet>.value(AccountWallet(
                address: "0xabc123",
                id: "cwal_xxxxxxxxxxxxxx",
                network: AccountWalletNetwork.solana
            ))
        )
        let response = try await client.accounts.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func formCompany1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "checkout_session_id": "ch_xxxxxxxxxxxxxx",
                  "checkout_url": "https://whop.com/checkout/ch_xxxxxxxxxxxxxx/",
                  "currency": "usd",
                  "total": 40000
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = FormCompanyAccountsResponse(
            checkoutSessionId: "ch_xxxxxxxxxxxxxx",
            checkoutUrl: "https://whop.com/checkout/ch_xxxxxxxxxxxxxx/",
            currency: "usd",
            total: 40000
        )
        let response = try await client.accounts.formCompany(
            id: "id",
            request: .init(
                businessAddress: FormCompanyAccountsRequestBusinessAddress(
                    city: "Austin",
                    country: "US",
                    line1: "4180 Burnet Rd",
                    line2: "Suite 2",
                    postalCode: "78756",
                    state: "TX"
                ),
                businessName: "Shine Time Auto Detailing",
                businessPhone: "+15125550142",
                businessType: "brick_and_mortar",
                businessWebsite: "https://shinetime.example",
                entitySuffix: .llc,
                entityType: .llc,
                expediteEin: true,
                formationState: .tx,
                founders: [
                    FormCompanyAccountsRequestFoundersItem(
                        address: FormCompanyAccountsRequestFoundersItemAddress(
                            city: "Austin",
                            country: "US",
                            line1: "907 Ridgemont Dr",
                            line2: "Apt 4",
                            postalCode: "78704",
                            state: "TX"
                        ),
                        dateOfBirth: "1988-03-14",
                        email: "marcus@shinetime.example",
                        firstName: "Marcus",
                        isPrimary: true,
                        lastName: "Webb",
                        ownershipPercentage: 100,
                        phone: "+15125550142",
                        roles: [
                            .president
                        ],
                        ssn: "123-45-6789"
                    )
                ],
                industryGroup: "automotive",
                industryType: "car_wash",
                shareStructure: FormCompanyAccountsRequestShareStructure(
                    numberOfShares: 123,
                    value: 123
                ),
                useRegisteredAgent: true
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func transferOwnership1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "success": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = TransferOwnershipAccountsResponse(
            success: true
        )
        let response = try await client.accounts.transferOwnership(
            id: "id",
            request: .init(identifier: "marcus@shinetime.example"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}