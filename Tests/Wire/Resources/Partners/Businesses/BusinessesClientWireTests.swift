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
                      "created_at": "2026-01-01T12:00:00Z",
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
                        "transfer": 0.25
                      },
                      "referral_expires_at": "2026-01-01T12:00:00Z",
                      "referral_started_at": "2026-01-01T12:00:00Z",
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
                        "settled": "40.00"
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
        let expectedResponse = ListBusinessesResponse(
            data: [
                ListBusinessesResponseDataItem(
                    account: Nullable<ListBusinessesResponseDataItemAccount>.value(ListBusinessesResponseDataItemAccount(
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        route: "biz_xxxxxxxxxxxxxx",
                        title: "Gleam Mobile Detailing"
                    )),
                    createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
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
                        transfer: Nullable<Float>.value(0.25)
                    ),
                    referralExpiresAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
                    referralStartedAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
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
                        settled: "40.00"
                    )
                )
            ],
            pageInfo: ListBusinessesResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
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
                  "created_at": "2026-01-01T12:00:00Z",
                  "earnings_usd": {
                    "completed": "0.00",
                    "pending": "0.00",
                    "total": "0.00"
                  },
                  "first_tier_partner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Tanya Cole",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "tanyacole"
                  },
                  "id": "coma_xxxxxxxxxxxxxx",
                  "my_partner_tier": "first",
                  "object": "partner_business",
                  "owner": {
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
                    "sales": 0.1,
                    "transfer": 0.25
                  },
                  "referral_expires_at": "2026-01-01T12:00:00Z",
                  "referral_started_at": "2026-01-01T12:00:00Z",
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
            createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
            earningsUsd: RetrieveBusinessesResponseEarningsUsd(
                completed: "0.00",
                pending: "0.00",
                total: "0.00"
            ),
            firstTierPartner: Nullable<RetrieveBusinessesResponseFirstTierPartner>.value(RetrieveBusinessesResponseFirstTierPartner(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Tanya Cole"),
                profilePicture: RetrieveBusinessesResponseFirstTierPartnerProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "tanyacole"
            )),
            id: "coma_xxxxxxxxxxxxxx",
            myPartnerTier: RetrieveBusinessesResponseMyPartnerTier.first,
            object: RetrieveBusinessesResponseObject.partnerBusiness,
            owner: Nullable<RetrieveBusinessesResponseOwner>.value(RetrieveBusinessesResponseOwner(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Nina Alvarez"),
                profilePicture: RetrieveBusinessesResponseOwnerProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "ninaalvarez"
            )),
            payoutPercentages: RetrieveBusinessesResponsePayoutPercentages(
                adSpend: Nullable<Float>.value(0.015),
                cardInterchange: Nullable<Float>.value(0.2),
                sales: 0.1,
                transfer: Nullable<Float>.value(0.25)
            ),
            referralExpiresAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
            referralStartedAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
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
                settled: "0.00"
            )
        )
        let response = try await client.partners.businesses.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}