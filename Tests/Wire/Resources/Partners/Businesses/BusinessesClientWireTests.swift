import Foundation
import Testing
import WhopSDK

@Suite("BusinessesClient Wire Tests") struct BusinessesClientWireTests {
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
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "route": "biz_xxxxxxxxxxxxxx",
                        "title": "Gleam Mobile Detailing"
                      },
                      "blueprint_partner": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Nina Alvarez",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "ninaalvarez"
                      },
                      "commission_advance": {
                        "activity_30_day": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "activity_60_day": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "amount": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "annual_processing": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "clawed_back_at": null,
                        "deadline_at": "2026-01-01T12:00:00.000Z",
                        "estimated_amount": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "funded_at": null,
                        "offer_token": null,
                        "processing_target": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "projected_60_day_activity": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "projected_commissions": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "projected_processing_commissions": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "qualified_at": "2026-01-01T12:00:00.000Z",
                        "recovery_threshold": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "status": "projected",
                        "terms_version": "2026-01-01"
                      },
                      "commission_advance_projections_allowed": false,
                      "created_at": "2026-01-01T12:00:00Z",
                      "deal_closed_reason": "deal_closed_reason",
                      "earnings_usd": {
                        "completed": "3.00",
                        "pending": "1.00",
                        "total": "4.00"
                      },
                      "first_tier_partner": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Nina Alvarez",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "ninaalvarez"
                      },
                      "id": "coma_xxxxxxxxxxxxxx",
                      "my_partner_tier": "first",
                      "object": "partner_business",
                      "owner": {
                        "email": "marcus@shinetime.example",
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Nina Alvarez",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "ninaalvarez"
                      },
                      "payout_percentages": {
                        "ad_spend": 0.015,
                        "card_interchange": 0.2,
                        "sales": 0.3,
                        "transfer": 0.25,
                        "withdrawal": 0.3
                      },
                      "referral_expires_at": "2026-01-01T12:00:00Z",
                      "referral_started_at": "2026-01-01T12:00:00Z",
                      "referring_business": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "route": "biz_xxxxxxxxxxxxxx",
                        "title": "Gleam Mobile Detailing"
                      },
                      "second_tier_partner": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Nina Alvarez",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "ninaalvarez"
                      },
                      "status": "active",
                      "volume_usd": {
                        "attributed": "40.00",
                        "awaiting_settlement": "0.00",
                        "last_30d": "0.00",
                        "settled": "40.00"
                      }
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
        let expectedResponse = ListBusinessesResponse(
            data: [
                ListBusinessesResponseDataItem(
                    account: Nullable<ListBusinessesResponseDataItemAccount>.value(ListBusinessesResponseDataItemAccount(
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        route: "biz_xxxxxxxxxxxxxx",
                        title: "Gleam Mobile Detailing"
                    )),
                    blueprintPartner: Nullable<ListBusinessesResponseDataItemBlueprintPartner>.value(ListBusinessesResponseDataItemBlueprintPartner(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Nina Alvarez"),
                        profilePicture: ListBusinessesResponseDataItemBlueprintPartnerProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "ninaalvarez"
                    )),
                    commissionAdvance: Optional(Nullable<PartnerAdvance>.value(PartnerAdvance(
                        activity30Day: Nullable<Money>.value(Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        activity60Day: Nullable<Money>.value(Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        amount: Nullable<Money>.value(Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        annualProcessing: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        clawedBackAt: .null,
                        deadlineAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                        estimatedAmount: Nullable<Money>.value(Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        fundedAt: .null,
                        offerToken: .null,
                        processingTarget: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        projected60DayActivity: Nullable<Money>.value(Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        projectedCommissions: Nullable<Money>.value(Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        projectedProcessingCommissions: Nullable<Money>.value(Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        qualifiedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                        recoveryThreshold: Nullable<Money>.value(Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        status: PartnerAdvanceStatus.projected,
                        termsVersion: Nullable<String>.value("2026-01-01")
                    ))),
                    commissionAdvanceProjectionsAllowed: Optional(false),
                    createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                    dealClosedReason: Nullable<String>.value("deal_closed_reason"),
                    earningsUsd: ListBusinessesResponseDataItemEarningsUsd(
                        completed: "3.00",
                        pending: "1.00",
                        total: "4.00"
                    ),
                    firstTierPartner: Nullable<ListBusinessesResponseDataItemFirstTierPartner>.value(ListBusinessesResponseDataItemFirstTierPartner(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Nina Alvarez"),
                        profilePicture: ListBusinessesResponseDataItemFirstTierPartnerProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "ninaalvarez"
                    )),
                    id: "coma_xxxxxxxxxxxxxx",
                    myPartnerTier: ListBusinessesResponseDataItemMyPartnerTier.first,
                    object: ListBusinessesResponseDataItemObject.partnerBusiness,
                    owner: Nullable<ListBusinessesResponseDataItemOwner>.value(ListBusinessesResponseDataItemOwner(
                        email: Nullable<String>.value("marcus@shinetime.example"),
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Nina Alvarez"),
                        profilePicture: ListBusinessesResponseDataItemOwnerProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "ninaalvarez"
                    )),
                    payoutPercentages: ListBusinessesResponseDataItemPayoutPercentages(
                        adSpend: Nullable<Float>.value(0.015),
                        cardInterchange: Nullable<Float>.value(0.2),
                        sales: 0.3,
                        transfer: Nullable<Float>.value(0.25),
                        withdrawal: Nullable<Float>.value(0.3)
                    ),
                    referralExpiresAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
                    referralStartedAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
                    referringBusiness: Optional(Nullable<ListBusinessesResponseDataItemReferringBusiness>.value(ListBusinessesResponseDataItemReferringBusiness(
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        route: "biz_xxxxxxxxxxxxxx",
                        title: "Gleam Mobile Detailing"
                    ))),
                    secondTierPartner: Nullable<ListBusinessesResponseDataItemSecondTierPartner>.value(ListBusinessesResponseDataItemSecondTierPartner(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Nina Alvarez"),
                        profilePicture: ListBusinessesResponseDataItemSecondTierPartnerProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "ninaalvarez"
                    )),
                    status: ListBusinessesResponseDataItemStatus.active,
                    volumeUsd: ListBusinessesResponseDataItemVolumeUsd(
                        attributed: "40.00",
                        awaitingSettlement: "0.00",
                        last30D: "0.00",
                        settled: "40.00"
                    )
                )
            ],
            pageInfo: ListBusinessesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                totalCount: Nullable<Int>.value(1),
                totalCountCapped: true
            )
        )
        let response = try await client.partners.businesses.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
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
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "recommended_actions": [
                      {
                        "action": "theme_business",
                        "blocked_capabilities": [
                          "blocked_capabilities"
                        ],
                        "cta": "cta",
                        "cta_label": "cta_label",
                        "description": "description",
                        "icon_url": null,
                        "impact_score": null,
                        "reasoning": null,
                        "status": "optional",
                        "title": "title"
                      }
                    ],
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
                    "title": "Gleam Mobile Detailing"
                  },
                  "blueprint_partner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Marcus Webb",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "marcuswebb"
                  },
                  "can_edit_fees": false,
                  "commission_advance": {
                    "activity_30_day": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "activity_60_day": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "annual_processing": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "clawed_back_at": "clawed_back_at",
                    "deadline_at": "2026-01-01T12:00:00.000Z",
                    "estimated_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "funded_at": "funded_at",
                    "offer_token": "offer_token",
                    "processing_target": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "projected_60_day_activity": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "projected_commissions": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "projected_processing_commissions": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "qualified_at": "2026-01-01T12:00:00.000Z",
                    "recovery_threshold": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "status": "projected",
                    "terms_version": "2026-01-01"
                  },
                  "commission_advance_cap": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "commission_advance_projections_allowed": false,
                  "commission_advance_rate": "commission_advance_rate",
                  "created_at": "2026-01-01T12:00:00Z",
                  "deal_closed_reason": "deal_closed_reason",
                  "earnings_usd": {
                    "completed": "0.00",
                    "pending": "0.00",
                    "total": "0.00"
                  },
                  "estimated_commission_rate": "estimated_commission_rate",
                  "first_tier_partner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Marcus Webb",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "marcuswebb"
                  },
                  "id": "coma_xxxxxxxxxxxxxx",
                  "my_partner_tier": "first",
                  "my_payout_percentages": {
                    "ad_spend": 0,
                    "card_interchange": 0,
                    "sales": 0.3,
                    "transfer": 0,
                    "withdrawal": 0
                  },
                  "object": "partner_business",
                  "owner": {
                    "email": "marcus@shinetime.example",
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Tanya Cole",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "tanyacole"
                  },
                  "payout_percentages": {
                    "ad_spend": 0,
                    "card_interchange": 0,
                    "sales": 0.3,
                    "transfer": 0,
                    "withdrawal": 0
                  },
                  "pending_owner_invites": [
                    {
                      "email": "email",
                      "id": "id"
                    }
                  ],
                  "referral_expires_at": "2026-01-01T12:00:00Z",
                  "referral_started_at": "2026-01-01T12:00:00Z",
                  "referring_business": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "second_tier_partner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Marcus Webb",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "marcuswebb"
                  },
                  "status": "active",
                  "volume_usd": {
                    "attributed": "0.00",
                    "awaiting_settlement": "0.00",
                    "last_30d": "0.00",
                    "settled": "0.00"
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
        let expectedResponse = RetrieveBusinessesResponse(
            account: Nullable<RetrieveBusinessesResponseAccount>.value(RetrieveBusinessesResponseAccount(
                capabilities: AccountCapabilities(
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
                ),
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                recommendedActions: Nullable<[AccountRecommendedAction]>.value([
                    AccountRecommendedAction(
                        action: AccountRecommendedActionAction.themeBusiness,
                        blockedCapabilities: [
                            "blocked_capabilities"
                        ],
                        cta: "cta",
                        ctaLabel: "cta_label",
                        description: "description",
                        iconUrl: .null,
                        impactScore: .null,
                        reasoning: .null,
                        status: AccountRecommendedActionStatus.optional,
                        title: "title"
                    )
                ]),
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
                title: "Gleam Mobile Detailing"
            )),
            blueprintPartner: Nullable<RetrieveBusinessesResponseBlueprintPartner>.value(RetrieveBusinessesResponseBlueprintPartner(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Marcus Webb"),
                profilePicture: RetrieveBusinessesResponseBlueprintPartnerProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "marcuswebb"
            )),
            canEditFees: false,
            commissionAdvance: Optional(Nullable<PartnerAdvance>.value(PartnerAdvance(
                activity30Day: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                activity60Day: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                amount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                annualProcessing: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                clawedBackAt: Nullable<String>.value("clawed_back_at"),
                deadlineAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                estimatedAmount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                fundedAt: Nullable<String>.value("funded_at"),
                offerToken: Nullable<String>.value("offer_token"),
                processingTarget: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                projected60DayActivity: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                projectedCommissions: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                projectedProcessingCommissions: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                qualifiedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                recoveryThreshold: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                status: PartnerAdvanceStatus.projected,
                termsVersion: Nullable<String>.value("2026-01-01")
            ))),
            commissionAdvanceCap: Optional(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            commissionAdvanceProjectionsAllowed: Optional(false),
            commissionAdvanceRate: Optional(Nullable<String>.value("commission_advance_rate")),
            createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
            dealClosedReason: Nullable<String>.value("deal_closed_reason"),
            earningsUsd: RetrieveBusinessesResponseEarningsUsd(
                completed: "0.00",
                pending: "0.00",
                total: "0.00"
            ),
            estimatedCommissionRate: Nullable<String>.value("estimated_commission_rate"),
            firstTierPartner: Nullable<RetrieveBusinessesResponseFirstTierPartner>.value(RetrieveBusinessesResponseFirstTierPartner(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Marcus Webb"),
                profilePicture: RetrieveBusinessesResponseFirstTierPartnerProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "marcuswebb"
            )),
            id: "coma_xxxxxxxxxxxxxx",
            myPartnerTier: RetrieveBusinessesResponseMyPartnerTier.first,
            myPayoutPercentages: Nullable<RetrieveBusinessesResponseMyPayoutPercentages>.value(RetrieveBusinessesResponseMyPayoutPercentages(
                adSpend: Nullable<Float>.value(0),
                cardInterchange: Nullable<Float>.value(0),
                sales: Nullable<Float>.value(0.3),
                transfer: Nullable<Float>.value(0),
                withdrawal: Nullable<Float>.value(0)
            )),
            object: RetrieveBusinessesResponseObject.partnerBusiness,
            owner: Nullable<RetrieveBusinessesResponseOwner>.value(RetrieveBusinessesResponseOwner(
                email: Nullable<String>.value("marcus@shinetime.example"),
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Tanya Cole"),
                profilePicture: RetrieveBusinessesResponseOwnerProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "tanyacole"
            )),
            payoutPercentages: RetrieveBusinessesResponsePayoutPercentages(
                adSpend: Nullable<Float>.value(0),
                cardInterchange: Nullable<Float>.value(0),
                sales: 0.3,
                transfer: Nullable<Float>.value(0),
                withdrawal: Nullable<Float>.value(0)
            ),
            pendingOwnerInvites: Optional([
                RetrieveBusinessesResponsePendingOwnerInvitesItem(
                    email: "email",
                    id: "id"
                )
            ]),
            referralExpiresAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
            referralStartedAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
            referringBusiness: Optional(Nullable<RetrieveBusinessesResponseReferringBusiness>.value(RetrieveBusinessesResponseReferringBusiness(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            ))),
            secondTierPartner: Nullable<RetrieveBusinessesResponseSecondTierPartner>.value(RetrieveBusinessesResponseSecondTierPartner(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Marcus Webb"),
                profilePicture: RetrieveBusinessesResponseSecondTierPartnerProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "marcuswebb"
            )),
            status: RetrieveBusinessesResponseStatus.active,
            volumeUsd: RetrieveBusinessesResponseVolumeUsd(
                attributed: "0.00",
                awaitingSettlement: "0.00",
                last30D: "0.00",
                settled: "0.00"
            )
        )
        let response = try await client.partners.businesses.retrieve(
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
                  "commission_advance": {
                    "activity_30_day": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "activity_60_day": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "annual_processing": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "clawed_back_at": "clawed_back_at",
                    "deadline_at": "2026-01-01T12:00:00.000Z",
                    "estimated_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "funded_at": "funded_at",
                    "offer_token": "offer_token",
                    "processing_target": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "projected_60_day_activity": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "projected_commissions": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "projected_processing_commissions": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "qualified_at": "2026-01-01T12:00:00.000Z",
                    "recovery_threshold": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "status": "projected",
                    "terms_version": "2026-01-01"
                  },
                  "id": "coma_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = UpdateBusinessesResponse(
            commissionAdvance: PartnerAdvance(
                activity30Day: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                activity60Day: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                amount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                annualProcessing: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                clawedBackAt: Nullable<String>.value("clawed_back_at"),
                deadlineAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                estimatedAmount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                fundedAt: Nullable<String>.value("funded_at"),
                offerToken: Nullable<String>.value("offer_token"),
                processingTarget: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                projected60DayActivity: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                projectedCommissions: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                projectedProcessingCommissions: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                qualifiedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                recoveryThreshold: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                status: PartnerAdvanceStatus.projected,
                termsVersion: Nullable<String>.value("2026-01-01")
            ),
            id: "coma_xxxxxxxxxxxxxx"
        )
        let response = try await client.partners.businesses.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func acceptCommissionAdvance1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "commission_advance": {
                    "activity_30_day": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "activity_60_day": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "annual_processing": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "clawed_back_at": "clawed_back_at",
                    "deadline_at": "2026-01-01T12:00:00.000Z",
                    "estimated_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "funded_at": "funded_at",
                    "offer_token": "offer_token",
                    "processing_target": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "projected_60_day_activity": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "projected_commissions": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "projected_processing_commissions": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "qualified_at": "2026-01-01T12:00:00.000Z",
                    "recovery_threshold": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "status": "projected",
                    "terms_version": "2026-01-01"
                  },
                  "id": "coma_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AcceptCommissionAdvanceBusinessesResponse(
            commissionAdvance: PartnerAdvance(
                activity30Day: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                activity60Day: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                amount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                annualProcessing: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                clawedBackAt: Nullable<String>.value("clawed_back_at"),
                deadlineAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                estimatedAmount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                fundedAt: Nullable<String>.value("funded_at"),
                offerToken: Nullable<String>.value("offer_token"),
                processingTarget: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                projected60DayActivity: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                projectedCommissions: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                projectedProcessingCommissions: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                qualifiedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                recoveryThreshold: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                status: PartnerAdvanceStatus.projected,
                termsVersion: Nullable<String>.value("2026-01-01")
            ),
            id: "coma_xxxxxxxxxxxxxx"
        )
        let response = try await client.partners.businesses.acceptCommissionAdvance(
            id: "id",
            request: .init(
                acknowledgments: [
                    .commissionReplacement,
                    .clawback,
                    .term
                ],
                expectedAmountUsd: "1079.99",
                offerToken: "eyJfcmFpbHMiOnsiZGF0YSI6MSwicHVyIjoiYmxvYl9pZCJ9fQ==--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                termsVersion: "2026-01-01"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func resendInvite1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
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
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "recommended_actions": [
                      {
                        "action": "theme_business",
                        "blocked_capabilities": [
                          "blocked_capabilities"
                        ],
                        "cta": "cta",
                        "cta_label": "cta_label",
                        "description": "description",
                        "icon_url": null,
                        "impact_score": null,
                        "reasoning": null,
                        "status": "optional",
                        "title": "title"
                      }
                    ],
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
                    "title": "Gleam Mobile Detailing"
                  },
                  "blueprint_partner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Nina Alvarez",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "ninaalvarez"
                  },
                  "commission_advance": {
                    "activity_30_day": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "activity_60_day": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "annual_processing": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "clawed_back_at": "clawed_back_at",
                    "deadline_at": "2026-01-01T12:00:00.000Z",
                    "estimated_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "funded_at": "funded_at",
                    "offer_token": "offer_token",
                    "processing_target": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "projected_60_day_activity": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "projected_commissions": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "projected_processing_commissions": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "qualified_at": "2026-01-01T12:00:00.000Z",
                    "recovery_threshold": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "status": "projected",
                    "terms_version": "2026-01-01"
                  },
                  "commission_advance_projections_allowed": false,
                  "created_at": "2026-01-01T12:00:00Z",
                  "deal_closed_reason": "deal_closed_reason",
                  "earnings_usd": {
                    "completed": "3.00",
                    "pending": "1.00",
                    "total": "4.00"
                  },
                  "first_tier_partner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Nina Alvarez",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "ninaalvarez"
                  },
                  "id": "coma_xxxxxxxxxxxxxx",
                  "my_partner_tier": "first",
                  "my_payout_percentages": {
                    "ad_spend": 0,
                    "card_interchange": 0,
                    "sales": 0.3,
                    "transfer": 0,
                    "withdrawal": 0.3
                  },
                  "object": "partner_business",
                  "owner": {
                    "email": "marcus@shinetime.example",
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Nina Alvarez",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "ninaalvarez"
                  },
                  "payout_percentages": {
                    "ad_spend": 0.015,
                    "card_interchange": 0.2,
                    "sales": 0.3,
                    "transfer": 0.25,
                    "withdrawal": 0.3
                  },
                  "pending_owner_invites": [
                    {
                      "email": "marcus@shinetime.example",
                      "id": "ausri_xxxxxxxxxxxxxx"
                    }
                  ],
                  "referral_expires_at": "2026-01-01T12:00:00Z",
                  "referral_started_at": "2026-01-01T12:00:00Z",
                  "referring_business": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Gleam Mobile Detailing"
                  },
                  "second_tier_partner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Nina Alvarez",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "ninaalvarez"
                  },
                  "status": "active",
                  "volume_usd": {
                    "attributed": "40.00",
                    "awaiting_settlement": "0.00",
                    "last_30d": "0.00",
                    "settled": "40.00"
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
        let expectedResponse = ResendInviteBusinessesResponse(
            account: Nullable<ResendInviteBusinessesResponseAccount>.value(ResendInviteBusinessesResponseAccount(
                capabilities: AccountCapabilities(
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
                ),
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                recommendedActions: Nullable<[AccountRecommendedAction]>.value([
                    AccountRecommendedAction(
                        action: AccountRecommendedActionAction.themeBusiness,
                        blockedCapabilities: [
                            "blocked_capabilities"
                        ],
                        cta: "cta",
                        ctaLabel: "cta_label",
                        description: "description",
                        iconUrl: .null,
                        impactScore: .null,
                        reasoning: .null,
                        status: AccountRecommendedActionStatus.optional,
                        title: "title"
                    )
                ]),
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
                title: "Gleam Mobile Detailing"
            )),
            blueprintPartner: Nullable<ResendInviteBusinessesResponseBlueprintPartner>.value(ResendInviteBusinessesResponseBlueprintPartner(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Nina Alvarez"),
                profilePicture: ResendInviteBusinessesResponseBlueprintPartnerProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "ninaalvarez"
            )),
            commissionAdvance: Optional(Nullable<PartnerAdvance>.value(PartnerAdvance(
                activity30Day: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                activity60Day: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                amount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                annualProcessing: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                clawedBackAt: Nullable<String>.value("clawed_back_at"),
                deadlineAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                estimatedAmount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                fundedAt: Nullable<String>.value("funded_at"),
                offerToken: Nullable<String>.value("offer_token"),
                processingTarget: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                projected60DayActivity: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                projectedCommissions: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                projectedProcessingCommissions: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                qualifiedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                recoveryThreshold: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                status: PartnerAdvanceStatus.projected,
                termsVersion: Nullable<String>.value("2026-01-01")
            ))),
            commissionAdvanceProjectionsAllowed: Optional(false),
            createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
            dealClosedReason: Nullable<String>.value("deal_closed_reason"),
            earningsUsd: ResendInviteBusinessesResponseEarningsUsd(
                completed: "3.00",
                pending: "1.00",
                total: "4.00"
            ),
            firstTierPartner: Nullable<ResendInviteBusinessesResponseFirstTierPartner>.value(ResendInviteBusinessesResponseFirstTierPartner(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Nina Alvarez"),
                profilePicture: ResendInviteBusinessesResponseFirstTierPartnerProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "ninaalvarez"
            )),
            id: "coma_xxxxxxxxxxxxxx",
            myPartnerTier: ResendInviteBusinessesResponseMyPartnerTier.first,
            myPayoutPercentages: Nullable<ResendInviteBusinessesResponseMyPayoutPercentages>.value(ResendInviteBusinessesResponseMyPayoutPercentages(
                adSpend: Nullable<Float>.value(0),
                cardInterchange: Nullable<Float>.value(0),
                sales: Nullable<Float>.value(0.3),
                transfer: Nullable<Float>.value(0),
                withdrawal: Nullable<Float>.value(0.3)
            )),
            object: ResendInviteBusinessesResponseObject.partnerBusiness,
            owner: Nullable<ResendInviteBusinessesResponseOwner>.value(ResendInviteBusinessesResponseOwner(
                email: Nullable<String>.value("marcus@shinetime.example"),
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Nina Alvarez"),
                profilePicture: ResendInviteBusinessesResponseOwnerProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "ninaalvarez"
            )),
            payoutPercentages: ResendInviteBusinessesResponsePayoutPercentages(
                adSpend: Nullable<Float>.value(0.015),
                cardInterchange: Nullable<Float>.value(0.2),
                sales: 0.3,
                transfer: Nullable<Float>.value(0.25),
                withdrawal: Nullable<Float>.value(0.3)
            ),
            pendingOwnerInvites: Optional([
                ResendInviteBusinessesResponsePendingOwnerInvitesItem(
                    email: "marcus@shinetime.example",
                    id: "ausri_xxxxxxxxxxxxxx"
                )
            ]),
            referralExpiresAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
            referralStartedAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
            referringBusiness: Optional(Nullable<ResendInviteBusinessesResponseReferringBusiness>.value(ResendInviteBusinessesResponseReferringBusiness(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "biz_xxxxxxxxxxxxxx",
                title: "Gleam Mobile Detailing"
            ))),
            secondTierPartner: Nullable<ResendInviteBusinessesResponseSecondTierPartner>.value(ResendInviteBusinessesResponseSecondTierPartner(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Nina Alvarez"),
                profilePicture: ResendInviteBusinessesResponseSecondTierPartnerProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "ninaalvarez"
            )),
            status: ResendInviteBusinessesResponseStatus.active,
            volumeUsd: ResendInviteBusinessesResponseVolumeUsd(
                attributed: "40.00",
                awaitingSettlement: "0.00",
                last30D: "0.00",
                settled: "40.00"
            )
        )
        let response = try await client.partners.businesses.resendInvite(
            id: "id",
            request: .init(inviteId: "ausri_xxxxxxxxxxxxxx"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}