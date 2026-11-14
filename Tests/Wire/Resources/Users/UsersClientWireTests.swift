import Foundation
import Testing
import WhopSDK

@Suite("UsersClient Wire Tests") struct UsersClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "balance": {
                        "businesses": [
                          {
                            "balance_usd": "18940.25",
                            "id": "biz_xxxxxxxxxxxxxx",
                            "logo_url": "https://assets.whop.com/logos/shine-time-auto-detailing.png",
                            "name": "Shine Time Auto Detailing"
                          }
                        ],
                        "businesses_total_usd": "18940.25",
                        "cash": [
                          {
                            "balance": 4385.75,
                            "balance_usd": 4385.75,
                            "currency": "usd",
                            "in_transit_balance_usd": 0,
                            "pending_balance_usd": 310,
                            "price_usd": null,
                            "reserve_balance_usd": 125,
                            "total_withdrawable_balance": 4385.75
                          }
                        ],
                        "cash_usd": "4820.75",
                        "crypto": [
                          {
                            "balance": "1500.0",
                            "breakdown": {
                              "available": "1500.0",
                              "finishing_settlement": "0",
                              "in_transit": "0",
                              "pending": "0",
                              "pending_settlements": [
                                {
                                  "amount": "0.0",
                                  "date": "2026-01-01"
                                }
                              ],
                              "reserve": "0"
                            },
                            "icon_url": "https://assets.whop.com/tokens/usdt.png",
                            "name": "Tether USD",
                            "price_usd": 1,
                            "symbol": "USDT",
                            "value_usd": 1500
                          }
                        ],
                        "crypto_usd": "1500.00",
                        "pending_usd": "310.00",
                        "total_usd": "6320.75",
                        "treasury_pending_usd": "0.00"
                      },
                      "balance_history": {
                        "data": [
                          {
                            "t": 1767268800,
                            "v": 2400
                          }
                        ],
                        "last": 6320.75,
                        "max": 6320.75,
                        "min": 2400
                      },
                      "balances": [
                        {
                          "balance": "1500.0",
                          "breakdown": {
                            "available": "1500.0",
                            "finishing_settlement": "0",
                            "in_transit": "0",
                            "pending": "0",
                            "pending_settlements": [
                              {
                                "amount": "0.0",
                                "date": "2026-01-01"
                              }
                            ],
                            "reserve": "0"
                          },
                          "icon_url": "https://assets.whop.com/tokens/usdt.png",
                          "name": "Tether USD",
                          "price_usd": 1,
                          "symbol": "USDT",
                          "value_usd": "1500.00"
                        }
                      ],
                      "banner": {
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      },
                      "bio": "Ceramic coating specialist. Detailing cars in Austin since 2016.",
                      "cards": {
                        "kind": null,
                        "status": "approved"
                      },
                      "city": "Austin",
                      "country": "US",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "date_of_birth": "date_of_birth",
                      "earnings_usd": {
                        "first_earned_at": "2026-01-01T12:00:00.000Z",
                        "owned_accounts": {
                          "last_24_hours": "0.00",
                          "last_30_days": "0.00",
                          "last_7_days": "0.00",
                          "lifetime": "0.00"
                        },
                        "partners": {
                          "last_24_hours": "0.00",
                          "last_30_days": "0.00",
                          "last_7_days": "0.00",
                          "lifetime": "0.00"
                        },
                        "personal": {
                          "last_24_hours": "0.00",
                          "last_30_days": "0.00",
                          "last_7_days": "0.00",
                          "lifetime": "0.00"
                        },
                        "total": {
                          "last_24_hours": "0.00",
                          "last_30_days": "0.00",
                          "last_7_days": "0.00",
                          "lifetime": "0.00"
                        }
                      },
                      "email": "marcus@shinetime.example",
                      "id": "user_xxxxxxxxxxxxxx",
                      "level": {
                        "applied_level": 1,
                        "levels": [
                          {
                            "level": 0,
                            "minimum_spend": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "processing_rate_percentage": 2.7,
                            "regional_rates": [
                              {
                                "processing_rate_percentage": 1.7,
                                "region": "us_and_canada"
                              }
                            ]
                          }
                        ],
                        "monthly_ads_spend": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "monthly_card_spend": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "monthly_qualifying_spend": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "monthly_trading_volume": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "points": 41000,
                        "points_by_source": {
                          "ads": 0,
                          "cards": 40000,
                          "partners": 0,
                          "trading": 1000
                        },
                        "points_to_next": 59000,
                        "resets_at": "2026-01-01T12:00:00.000Z"
                      },
                      "name": "Marcus Webb",
                      "profile_picture": {
                        "url": "https://ui-avatars.com/api/"
                      },
                      "social_links": [
                        {
                          "url": "https://www.instagram.com/tanyacole.details",
                          "username": "tanyacole.details",
                          "verified": true,
                          "website": "x"
                        }
                      ],
                      "state": "Texas",
                      "total_usd": "6320.75",
                      "trading": {
                        "account_id": null,
                        "hyperliquid": {
                          "address": "address",
                          "depositable": null,
                          "margin_summary": {
                            "account_value": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "total_margin_used": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "total_position_notional": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "withdrawable": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            }
                          },
                          "positions": [
                            {
                              "entry_price": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "hyperliquid": {
                                "cumulative_funding": {
                                  "all_time": {
                                    "amount": "-1234.56",
                                    "currency": "usd",
                                    "decimals": 2,
                                    "display_decimals": 2
                                  },
                                  "since_change": {
                                    "amount": "-1234.56",
                                    "currency": "usd",
                                    "decimals": 2,
                                    "display_decimals": 2
                                  },
                                  "since_open": {
                                    "amount": "-1234.56",
                                    "currency": "usd",
                                    "decimals": 2,
                                    "display_decimals": 2
                                  }
                                },
                                "leverage": {
                                  "type": "cross",
                                  "value": 1
                                },
                                "liquidation_price": {
                                  "amount": "-1234.56",
                                  "currency": "usd",
                                  "decimals": 2,
                                  "display_decimals": 2
                                },
                                "margin_used": {
                                  "amount": "-1234.56",
                                  "currency": "usd",
                                  "decimals": 2,
                                  "display_decimals": 2
                                },
                                "return_on_equity": "return_on_equity"
                              },
                              "id": "id",
                              "market": "market",
                              "object": "trading_position",
                              "position_value": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "side": "long",
                              "size": "size",
                              "unrealized_pnl": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              }
                            }
                          ],
                          "websocket_subscriptions": [
                            {
                              "channel": "clearinghouse_state",
                              "message": "message"
                            }
                          ],
                          "websocket_url": "websocket_url"
                        },
                        "id": "id",
                        "object": "trading_account",
                        "provider": "hyperliquid",
                        "spot": {
                          "holdings": [
                            {
                              "average_entry_price": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "cost_basis": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "market": "market",
                              "realized_pnl": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "unrealized_pnl": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "unrealized_pnl_percentage": null
                            }
                          ]
                        },
                        "user_id": null
                      },
                      "username": "marcuswebb",
                      "verification": {
                        "business": null,
                        "individual": null
                      },
                      "whop_partner_enabled_at": "2026-01-01T12:00:00.000Z",
                      "whop_partner_onboarded_accounts_count": 1,
                      "whop_partner_verified_at": "2026-01-01T12:00:00.000Z"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "MQ"
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
        let expectedResponse = ListUsersResponse(
            data: [
                User(
                    balance: Nullable<UserBalance>.value(UserBalance(
                        businesses: [
                            UserBalanceBusiness(
                                balanceUsd: "18940.25",
                                id: "biz_xxxxxxxxxxxxxx",
                                logoUrl: Nullable<String>.value("https://assets.whop.com/logos/shine-time-auto-detailing.png"),
                                name: Nullable<String>.value("Shine Time Auto Detailing")
                            )
                        ],
                        businessesTotalUsd: "18940.25",
                        cash: [
                            UserBalanceCash(
                                balance: 4385.75,
                                balanceUsd: 4385.75,
                                currency: "usd",
                                inTransitBalanceUsd: 0,
                                pendingBalanceUsd: 310,
                                priceUsd: .null,
                                reserveBalanceUsd: 125,
                                totalWithdrawableBalance: 4385.75
                            )
                        ],
                        cashUsd: "4820.75",
                        crypto: [
                            UserBalanceToken(
                                balance: "1500.0",
                                breakdown: AccountBalanceBreakdown(
                                    available: "1500.0",
                                    finishingSettlement: "0",
                                    inTransit: "0",
                                    pending: "0",
                                    pendingSettlements: [
                                        AccountBalanceSettlement(
                                            amount: "0.0",
                                            date: "2026-01-01"
                                        )
                                    ],
                                    reserve: "0"
                                ),
                                iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                                name: Nullable<String>.value("Tether USD"),
                                priceUsd: Nullable<Double>.value(1),
                                symbol: "USDT",
                                valueUsd: 1500
                            )
                        ],
                        cryptoUsd: "1500.00",
                        pendingUsd: "310.00",
                        totalUsd: "6320.75",
                        treasuryPendingUsd: "0.00"
                    )),
                    balanceHistory: Nullable<UserBalanceHistory>.value(UserBalanceHistory(
                        data: [
                            UserBalanceHistoryPoint(
                                t: 1767268800,
                                v: 2400
                            )
                        ],
                        last: 6320.75,
                        max: 6320.75,
                        min: 2400
                    )),
                    balances: [
                        AccountBalanceToken(
                            balance: "1500.0",
                            breakdown: AccountBalanceBreakdown(
                                available: "1500.0",
                                finishingSettlement: "0",
                                inTransit: "0",
                                pending: "0",
                                pendingSettlements: [
                                    AccountBalanceSettlement(
                                        amount: "0.0",
                                        date: "2026-01-01"
                                    )
                                ],
                                reserve: "0"
                            ),
                            iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                            name: "Tether USD",
                            priceUsd: Nullable<Double>.value(1),
                            symbol: "USDT",
                            valueUsd: Nullable<String>.value("1500.00")
                        )
                    ],
                    banner: Nullable<UserBanner>.value(UserBanner(
                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    )),
                    bio: Nullable<String>.value("Ceramic coating specialist. Detailing cars in Austin since 2016."),
                    cards: Nullable<AccountCards>.value(AccountCards(
                        kind: .null,
                        status: AccountCardsStatus.approved
                    )),
                    city: Nullable<String>.value("Austin"),
                    country: Nullable<String>.value("US"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    dateOfBirth: Nullable<String>.value("date_of_birth"),
                    earningsUsd: Nullable<UserEarnings>.value(UserEarnings(
                        firstEarnedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                        ownedAccounts: UserEarningsAmount(
                            last24Hours: "0.00",
                            last30Days: "0.00",
                            last7Days: "0.00",
                            lifetime: "0.00"
                        ),
                        partners: UserEarningsAmount(
                            last24Hours: "0.00",
                            last30Days: "0.00",
                            last7Days: "0.00",
                            lifetime: "0.00"
                        ),
                        personal: UserEarningsAmount(
                            last24Hours: "0.00",
                            last30Days: "0.00",
                            last7Days: "0.00",
                            lifetime: "0.00"
                        ),
                        total: UserEarningsAmount(
                            last24Hours: "0.00",
                            last30Days: "0.00",
                            last7Days: "0.00",
                            lifetime: "0.00"
                        )
                    )),
                    email: Nullable<String>.value("marcus@shinetime.example"),
                    id: "user_xxxxxxxxxxxxxx",
                    level: Nullable<OwnerLevel>.value(OwnerLevel(
                        appliedLevel: 1,
                        levels: [
                            AccountProcessingOfferLevel(
                                level: 0,
                                minimumSpend: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ),
                                processingRatePercentage: 2.7,
                                regionalRates: [
                                    AccountProcessingOfferRegionalRate(
                                        processingRatePercentage: 1.7,
                                        region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                                    )
                                ]
                            )
                        ],
                        monthlyAdsSpend: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        monthlyCardSpend: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        monthlyQualifyingSpend: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        monthlyTradingVolume: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        points: 41000,
                        pointsBySource: OwnerLevelPoints(
                            ads: 0,
                            cards: 40000,
                            partners: 0,
                            trading: 1000
                        ),
                        pointsToNext: Nullable<Int>.value(59000),
                        resetsAt: "2026-01-01T12:00:00.000Z"
                    )),
                    name: Nullable<String>.value("Marcus Webb"),
                    profilePicture: UserProfilePicture(
                        url: "https://ui-avatars.com/api/"
                    ),
                    socialLinks: [
                        UserSocialLink(
                            url: "https://www.instagram.com/tanyacole.details",
                            username: Nullable<String>.value("tanyacole.details"),
                            verified: true,
                            website: UserSocialLinkWebsite.x
                        )
                    ],
                    state: Nullable<String>.value("Texas"),
                    totalUsd: Nullable<String>.value("6320.75"),
                    trading: Nullable<TradingAccount>.value(TradingAccount(
                        accountId: .null,
                        hyperliquid: Nullable<TradingHyperliquidAccount>.value(TradingHyperliquidAccount(
                            address: "address",
                            depositable: .null,
                            marginSummary: Nullable<TradingMarginSummary>.value(TradingMarginSummary(
                                accountValue: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ),
                                totalMarginUsed: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ),
                                totalPositionNotional: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ),
                                withdrawable: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )
                            )),
                            positions: Nullable<[TradingPosition]>.value([
                                TradingPosition(
                                    entryPrice: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    hyperliquid: Nullable<TradingHyperliquidPosition>.value(TradingHyperliquidPosition(
                                        cumulativeFunding: TradingCumulativeFunding(
                                            allTime: Nullable<Money>.value(Money(
                                                amount: "-1234.56",
                                                currency: "usd",
                                                decimals: 2,
                                                displayDecimals: 2
                                            )),
                                            sinceChange: Nullable<Money>.value(Money(
                                                amount: "-1234.56",
                                                currency: "usd",
                                                decimals: 2,
                                                displayDecimals: 2
                                            )),
                                            sinceOpen: Nullable<Money>.value(Money(
                                                amount: "-1234.56",
                                                currency: "usd",
                                                decimals: 2,
                                                displayDecimals: 2
                                            ))
                                        ),
                                        leverage: TradingPositionLeverage(
                                            type: TradingPositionLeverageType.cross,
                                            value: 1
                                        ),
                                        liquidationPrice: Nullable<Money>.value(Money(
                                            amount: "-1234.56",
                                            currency: "usd",
                                            decimals: 2,
                                            displayDecimals: 2
                                        )),
                                        marginUsed: Money(
                                            amount: "-1234.56",
                                            currency: "usd",
                                            decimals: 2,
                                            displayDecimals: 2
                                        ),
                                        returnOnEquity: "return_on_equity"
                                    )),
                                    id: "id",
                                    market: "market",
                                    object: TradingPositionObject.tradingPosition,
                                    positionValue: Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    ),
                                    side: TradingPositionSide.long,
                                    size: "size",
                                    unrealizedPnl: Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )
                                )
                            ]),
                            websocketSubscriptions: [
                                TradingWebsocketSubscription(
                                    channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                                    message: "message"
                                )
                            ],
                            websocketUrl: "websocket_url"
                        )),
                        id: "id",
                        object: TradingAccountObject.tradingAccount,
                        provider: TradingAccountProvider.hyperliquid,
                        spot: Nullable<TradingSpotAccount>.value(TradingSpotAccount(
                            holdings: [
                                TradingSpotHolding(
                                    averageEntryPrice: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    costBasis: Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    ),
                                    market: "market",
                                    realizedPnl: Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    ),
                                    unrealizedPnl: Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    ),
                                    unrealizedPnlPercentage: .null
                                )
                            ]
                        )),
                        userId: .null
                    )),
                    username: "marcuswebb",
                    verification: [
                        "business": JSONValue.value, 
                        "individual": JSONValue.value
                    ],
                    whopPartnerEnabledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    whopPartnerOnboardedAccountsCount: Nullable<Int>.value(1),
                    whopPartnerVerifiedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
                )
            ],
            pageInfo: ListUsersResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("MQ")
            )
        )
        let response = try await client.users.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "balance": {
                        "businesses": [
                          {
                            "balance_usd": "balance_usd",
                            "id": "id",
                            "logo_url": "logo_url",
                            "name": "name"
                          },
                          {
                            "balance_usd": "balance_usd",
                            "id": "id",
                            "logo_url": "logo_url",
                            "name": "name"
                          }
                        ],
                        "businesses_total_usd": "businesses_total_usd",
                        "cash": [
                          {
                            "balance": 1.1,
                            "balance_usd": 1.1,
                            "currency": "currency",
                            "in_transit_balance_usd": 1.1,
                            "pending_balance_usd": 1.1,
                            "price_usd": 1.1,
                            "reserve_balance_usd": 1.1,
                            "total_withdrawable_balance": 1.1
                          },
                          {
                            "balance": 1.1,
                            "balance_usd": 1.1,
                            "currency": "currency",
                            "in_transit_balance_usd": 1.1,
                            "pending_balance_usd": 1.1,
                            "price_usd": 1.1,
                            "reserve_balance_usd": 1.1,
                            "total_withdrawable_balance": 1.1
                          }
                        ],
                        "cash_usd": "cash_usd",
                        "crypto": [
                          {
                            "balance": "balance",
                            "breakdown": {
                              "available": "available",
                              "finishing_settlement": "finishing_settlement",
                              "in_transit": "in_transit",
                              "pending": "pending",
                              "pending_settlements": [
                                {
                                  "amount": "amount",
                                  "date": "date"
                                },
                                {
                                  "amount": "amount",
                                  "date": "date"
                                }
                              ],
                              "reserve": "reserve"
                            },
                            "icon_url": "icon_url",
                            "name": "name",
                            "price_usd": 1.1,
                            "symbol": "symbol",
                            "value_usd": 1.1
                          },
                          {
                            "balance": "balance",
                            "breakdown": {
                              "available": "available",
                              "finishing_settlement": "finishing_settlement",
                              "in_transit": "in_transit",
                              "pending": "pending",
                              "pending_settlements": [
                                {
                                  "amount": "amount",
                                  "date": "date"
                                },
                                {
                                  "amount": "amount",
                                  "date": "date"
                                }
                              ],
                              "reserve": "reserve"
                            },
                            "icon_url": "icon_url",
                            "name": "name",
                            "price_usd": 1.1,
                            "symbol": "symbol",
                            "value_usd": 1.1
                          }
                        ],
                        "crypto_usd": "crypto_usd",
                        "pending_usd": "pending_usd",
                        "total_usd": "total_usd",
                        "treasury_pending_usd": "treasury_pending_usd"
                      },
                      "balance_history": {
                        "data": [
                          {
                            "t": 1,
                            "v": 1.1
                          },
                          {
                            "t": 1,
                            "v": 1.1
                          }
                        ],
                        "last": 1.1,
                        "max": 1.1,
                        "min": 1.1
                      },
                      "balances": [
                        {
                          "balance": "balance",
                          "breakdown": {
                            "available": "available",
                            "finishing_settlement": "finishing_settlement",
                            "in_transit": "in_transit",
                            "pending": "pending",
                            "pending_settlements": [
                              {
                                "amount": "amount",
                                "date": "date"
                              },
                              {
                                "amount": "amount",
                                "date": "date"
                              }
                            ],
                            "reserve": "reserve"
                          },
                          "icon_url": "icon_url",
                          "name": "name",
                          "price_usd": 1.1,
                          "symbol": "symbol",
                          "value_usd": "value_usd"
                        },
                        {
                          "balance": "balance",
                          "breakdown": {
                            "available": "available",
                            "finishing_settlement": "finishing_settlement",
                            "in_transit": "in_transit",
                            "pending": "pending",
                            "pending_settlements": [
                              {
                                "amount": "amount",
                                "date": "date"
                              },
                              {
                                "amount": "amount",
                                "date": "date"
                              }
                            ],
                            "reserve": "reserve"
                          },
                          "icon_url": "icon_url",
                          "name": "name",
                          "price_usd": 1.1,
                          "symbol": "symbol",
                          "value_usd": "value_usd"
                        }
                      ],
                      "banner": {
                        "url": "url"
                      },
                      "bio": "bio",
                      "cards": {
                        "kind": "individual",
                        "status": "approved"
                      },
                      "city": "city",
                      "country": "country",
                      "created_at": "created_at",
                      "date_of_birth": "date_of_birth",
                      "earnings_usd": {
                        "first_earned_at": "first_earned_at",
                        "owned_accounts": {
                          "last_24_hours": "last_24_hours",
                          "last_30_days": "last_30_days",
                          "last_7_days": "last_7_days",
                          "lifetime": "lifetime"
                        },
                        "partners": {
                          "last_24_hours": "last_24_hours",
                          "last_30_days": "last_30_days",
                          "last_7_days": "last_7_days",
                          "lifetime": "lifetime"
                        },
                        "personal": {
                          "last_24_hours": "last_24_hours",
                          "last_30_days": "last_30_days",
                          "last_7_days": "last_7_days",
                          "lifetime": "lifetime"
                        },
                        "total": {
                          "last_24_hours": "last_24_hours",
                          "last_30_days": "last_30_days",
                          "last_7_days": "last_7_days",
                          "lifetime": "lifetime"
                        }
                      },
                      "email": "email",
                      "id": "id",
                      "level": {
                        "applied_level": 1,
                        "levels": [
                          {
                            "level": 1,
                            "minimum_spend": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "processing_rate_percentage": 1.1,
                            "regional_rates": [
                              {
                                "processing_rate_percentage": 1.1,
                                "region": "us_and_canada"
                              },
                              {
                                "processing_rate_percentage": 1.1,
                                "region": "us_and_canada"
                              }
                            ]
                          },
                          {
                            "level": 1,
                            "minimum_spend": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "processing_rate_percentage": 1.1,
                            "regional_rates": [
                              {
                                "processing_rate_percentage": 1.1,
                                "region": "us_and_canada"
                              },
                              {
                                "processing_rate_percentage": 1.1,
                                "region": "us_and_canada"
                              }
                            ]
                          }
                        ],
                        "monthly_ads_spend": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "monthly_card_spend": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "monthly_qualifying_spend": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "monthly_trading_volume": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "points": 1,
                        "points_by_source": {
                          "ads": 1,
                          "cards": 1,
                          "partners": 1,
                          "trading": 1
                        },
                        "points_to_next": 1,
                        "resets_at": "resets_at"
                      },
                      "name": "name",
                      "profile_picture": {
                        "url": "url"
                      },
                      "social_links": [
                        {
                          "url": "url",
                          "username": "username",
                          "verified": true,
                          "website": "x"
                        },
                        {
                          "url": "url",
                          "username": "username",
                          "verified": true,
                          "website": "x"
                        }
                      ],
                      "state": "state",
                      "total_usd": "total_usd",
                      "trading": {
                        "account_id": "account_id",
                        "hyperliquid": {
                          "address": "address",
                          "depositable": "depositable",
                          "margin_summary": {
                            "account_value": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "total_margin_used": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "total_position_notional": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "withdrawable": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            }
                          },
                          "positions": [],
                          "websocket_subscriptions": [
                            {
                              "channel": "clearinghouse_state",
                              "message": "message"
                            },
                            {
                              "channel": "clearinghouse_state",
                              "message": "message"
                            }
                          ],
                          "websocket_url": "websocket_url"
                        },
                        "id": "id",
                        "object": "trading_account",
                        "provider": "hyperliquid",
                        "spot": {
                          "holdings": [
                            {
                              "average_entry_price": null,
                              "cost_basis": {
                                "amount": "amount",
                                "currency": "currency",
                                "decimals": 1,
                                "display_decimals": 1
                              },
                              "market": "market",
                              "realized_pnl": {
                                "amount": "amount",
                                "currency": "currency",
                                "decimals": 1,
                                "display_decimals": 1
                              },
                              "unrealized_pnl": {
                                "amount": "amount",
                                "currency": "currency",
                                "decimals": 1,
                                "display_decimals": 1
                              },
                              "unrealized_pnl_percentage": 1.1
                            },
                            {
                              "average_entry_price": null,
                              "cost_basis": {
                                "amount": "amount",
                                "currency": "currency",
                                "decimals": 1,
                                "display_decimals": 1
                              },
                              "market": "market",
                              "realized_pnl": {
                                "amount": "amount",
                                "currency": "currency",
                                "decimals": 1,
                                "display_decimals": 1
                              },
                              "unrealized_pnl": {
                                "amount": "amount",
                                "currency": "currency",
                                "decimals": 1,
                                "display_decimals": 1
                              },
                              "unrealized_pnl_percentage": 1.1
                            }
                          ]
                        },
                        "user_id": "user_id"
                      },
                      "username": "username",
                      "verification": {
                        "verification": {
                          "key": "value"
                        }
                      },
                      "whop_partner_enabled_at": "whop_partner_enabled_at",
                      "whop_partner_onboarded_accounts_count": 1,
                      "whop_partner_verified_at": "whop_partner_verified_at"
                    },
                    {
                      "balance": {
                        "businesses": [
                          {
                            "balance_usd": "balance_usd",
                            "id": "id",
                            "logo_url": "logo_url",
                            "name": "name"
                          },
                          {
                            "balance_usd": "balance_usd",
                            "id": "id",
                            "logo_url": "logo_url",
                            "name": "name"
                          }
                        ],
                        "businesses_total_usd": "businesses_total_usd",
                        "cash": [
                          {
                            "balance": 1.1,
                            "balance_usd": 1.1,
                            "currency": "currency",
                            "in_transit_balance_usd": 1.1,
                            "pending_balance_usd": 1.1,
                            "price_usd": 1.1,
                            "reserve_balance_usd": 1.1,
                            "total_withdrawable_balance": 1.1
                          },
                          {
                            "balance": 1.1,
                            "balance_usd": 1.1,
                            "currency": "currency",
                            "in_transit_balance_usd": 1.1,
                            "pending_balance_usd": 1.1,
                            "price_usd": 1.1,
                            "reserve_balance_usd": 1.1,
                            "total_withdrawable_balance": 1.1
                          }
                        ],
                        "cash_usd": "cash_usd",
                        "crypto": [
                          {
                            "balance": "balance",
                            "breakdown": {
                              "available": "available",
                              "finishing_settlement": "finishing_settlement",
                              "in_transit": "in_transit",
                              "pending": "pending",
                              "pending_settlements": [
                                {
                                  "amount": "amount",
                                  "date": "date"
                                },
                                {
                                  "amount": "amount",
                                  "date": "date"
                                }
                              ],
                              "reserve": "reserve"
                            },
                            "icon_url": "icon_url",
                            "name": "name",
                            "price_usd": 1.1,
                            "symbol": "symbol",
                            "value_usd": 1.1
                          },
                          {
                            "balance": "balance",
                            "breakdown": {
                              "available": "available",
                              "finishing_settlement": "finishing_settlement",
                              "in_transit": "in_transit",
                              "pending": "pending",
                              "pending_settlements": [
                                {
                                  "amount": "amount",
                                  "date": "date"
                                },
                                {
                                  "amount": "amount",
                                  "date": "date"
                                }
                              ],
                              "reserve": "reserve"
                            },
                            "icon_url": "icon_url",
                            "name": "name",
                            "price_usd": 1.1,
                            "symbol": "symbol",
                            "value_usd": 1.1
                          }
                        ],
                        "crypto_usd": "crypto_usd",
                        "pending_usd": "pending_usd",
                        "total_usd": "total_usd",
                        "treasury_pending_usd": "treasury_pending_usd"
                      },
                      "balance_history": {
                        "data": [
                          {
                            "t": 1,
                            "v": 1.1
                          },
                          {
                            "t": 1,
                            "v": 1.1
                          }
                        ],
                        "last": 1.1,
                        "max": 1.1,
                        "min": 1.1
                      },
                      "balances": [
                        {
                          "balance": "balance",
                          "breakdown": {
                            "available": "available",
                            "finishing_settlement": "finishing_settlement",
                            "in_transit": "in_transit",
                            "pending": "pending",
                            "pending_settlements": [
                              {
                                "amount": "amount",
                                "date": "date"
                              },
                              {
                                "amount": "amount",
                                "date": "date"
                              }
                            ],
                            "reserve": "reserve"
                          },
                          "icon_url": "icon_url",
                          "name": "name",
                          "price_usd": 1.1,
                          "symbol": "symbol",
                          "value_usd": "value_usd"
                        },
                        {
                          "balance": "balance",
                          "breakdown": {
                            "available": "available",
                            "finishing_settlement": "finishing_settlement",
                            "in_transit": "in_transit",
                            "pending": "pending",
                            "pending_settlements": [
                              {
                                "amount": "amount",
                                "date": "date"
                              },
                              {
                                "amount": "amount",
                                "date": "date"
                              }
                            ],
                            "reserve": "reserve"
                          },
                          "icon_url": "icon_url",
                          "name": "name",
                          "price_usd": 1.1,
                          "symbol": "symbol",
                          "value_usd": "value_usd"
                        }
                      ],
                      "banner": {
                        "url": "url"
                      },
                      "bio": "bio",
                      "cards": {
                        "kind": "individual",
                        "status": "approved"
                      },
                      "city": "city",
                      "country": "country",
                      "created_at": "created_at",
                      "date_of_birth": "date_of_birth",
                      "earnings_usd": {
                        "first_earned_at": "first_earned_at",
                        "owned_accounts": {
                          "last_24_hours": "last_24_hours",
                          "last_30_days": "last_30_days",
                          "last_7_days": "last_7_days",
                          "lifetime": "lifetime"
                        },
                        "partners": {
                          "last_24_hours": "last_24_hours",
                          "last_30_days": "last_30_days",
                          "last_7_days": "last_7_days",
                          "lifetime": "lifetime"
                        },
                        "personal": {
                          "last_24_hours": "last_24_hours",
                          "last_30_days": "last_30_days",
                          "last_7_days": "last_7_days",
                          "lifetime": "lifetime"
                        },
                        "total": {
                          "last_24_hours": "last_24_hours",
                          "last_30_days": "last_30_days",
                          "last_7_days": "last_7_days",
                          "lifetime": "lifetime"
                        }
                      },
                      "email": "email",
                      "id": "id",
                      "level": {
                        "applied_level": 1,
                        "levels": [
                          {
                            "level": 1,
                            "minimum_spend": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "processing_rate_percentage": 1.1,
                            "regional_rates": [
                              {
                                "processing_rate_percentage": 1.1,
                                "region": "us_and_canada"
                              },
                              {
                                "processing_rate_percentage": 1.1,
                                "region": "us_and_canada"
                              }
                            ]
                          },
                          {
                            "level": 1,
                            "minimum_spend": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "processing_rate_percentage": 1.1,
                            "regional_rates": [
                              {
                                "processing_rate_percentage": 1.1,
                                "region": "us_and_canada"
                              },
                              {
                                "processing_rate_percentage": 1.1,
                                "region": "us_and_canada"
                              }
                            ]
                          }
                        ],
                        "monthly_ads_spend": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "monthly_card_spend": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "monthly_qualifying_spend": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "monthly_trading_volume": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "points": 1,
                        "points_by_source": {
                          "ads": 1,
                          "cards": 1,
                          "partners": 1,
                          "trading": 1
                        },
                        "points_to_next": 1,
                        "resets_at": "resets_at"
                      },
                      "name": "name",
                      "profile_picture": {
                        "url": "url"
                      },
                      "social_links": [
                        {
                          "url": "url",
                          "username": "username",
                          "verified": true,
                          "website": "x"
                        },
                        {
                          "url": "url",
                          "username": "username",
                          "verified": true,
                          "website": "x"
                        }
                      ],
                      "state": "state",
                      "total_usd": "total_usd",
                      "trading": {
                        "account_id": "account_id",
                        "hyperliquid": {
                          "address": "address",
                          "depositable": "depositable",
                          "margin_summary": {
                            "account_value": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "total_margin_used": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "total_position_notional": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "withdrawable": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            }
                          },
                          "positions": [],
                          "websocket_subscriptions": [
                            {
                              "channel": "clearinghouse_state",
                              "message": "message"
                            },
                            {
                              "channel": "clearinghouse_state",
                              "message": "message"
                            }
                          ],
                          "websocket_url": "websocket_url"
                        },
                        "id": "id",
                        "object": "trading_account",
                        "provider": "hyperliquid",
                        "spot": {
                          "holdings": [
                            {
                              "average_entry_price": null,
                              "cost_basis": {
                                "amount": "amount",
                                "currency": "currency",
                                "decimals": 1,
                                "display_decimals": 1
                              },
                              "market": "market",
                              "realized_pnl": {
                                "amount": "amount",
                                "currency": "currency",
                                "decimals": 1,
                                "display_decimals": 1
                              },
                              "unrealized_pnl": {
                                "amount": "amount",
                                "currency": "currency",
                                "decimals": 1,
                                "display_decimals": 1
                              },
                              "unrealized_pnl_percentage": 1.1
                            },
                            {
                              "average_entry_price": null,
                              "cost_basis": {
                                "amount": "amount",
                                "currency": "currency",
                                "decimals": 1,
                                "display_decimals": 1
                              },
                              "market": "market",
                              "realized_pnl": {
                                "amount": "amount",
                                "currency": "currency",
                                "decimals": 1,
                                "display_decimals": 1
                              },
                              "unrealized_pnl": {
                                "amount": "amount",
                                "currency": "currency",
                                "decimals": 1,
                                "display_decimals": 1
                              },
                              "unrealized_pnl_percentage": 1.1
                            }
                          ]
                        },
                        "user_id": "user_id"
                      },
                      "username": "username",
                      "verification": {
                        "verification": {
                          "key": "value"
                        }
                      },
                      "whop_partner_enabled_at": "whop_partner_enabled_at",
                      "whop_partner_onboarded_accounts_count": 1,
                      "whop_partner_verified_at": "whop_partner_verified_at"
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
        let expectedResponse = ListUsersResponse(
            data: [
                User(
                    balance: Nullable<UserBalance>.value(UserBalance(
                        businesses: [
                            UserBalanceBusiness(
                                balanceUsd: "balance_usd",
                                id: "id",
                                logoUrl: Nullable<String>.value("logo_url"),
                                name: Nullable<String>.value("name")
                            ),
                            UserBalanceBusiness(
                                balanceUsd: "balance_usd",
                                id: "id",
                                logoUrl: Nullable<String>.value("logo_url"),
                                name: Nullable<String>.value("name")
                            )
                        ],
                        businessesTotalUsd: "businesses_total_usd",
                        cash: [
                            UserBalanceCash(
                                balance: 1.1,
                                balanceUsd: 1.1,
                                currency: "currency",
                                inTransitBalanceUsd: 1.1,
                                pendingBalanceUsd: 1.1,
                                priceUsd: Nullable<Double>.value(1.1),
                                reserveBalanceUsd: 1.1,
                                totalWithdrawableBalance: 1.1
                            ),
                            UserBalanceCash(
                                balance: 1.1,
                                balanceUsd: 1.1,
                                currency: "currency",
                                inTransitBalanceUsd: 1.1,
                                pendingBalanceUsd: 1.1,
                                priceUsd: Nullable<Double>.value(1.1),
                                reserveBalanceUsd: 1.1,
                                totalWithdrawableBalance: 1.1
                            )
                        ],
                        cashUsd: "cash_usd",
                        crypto: [
                            UserBalanceToken(
                                balance: "balance",
                                breakdown: AccountBalanceBreakdown(
                                    available: "available",
                                    finishingSettlement: "finishing_settlement",
                                    inTransit: "in_transit",
                                    pending: "pending",
                                    pendingSettlements: [
                                        AccountBalanceSettlement(
                                            amount: "amount",
                                            date: "date"
                                        ),
                                        AccountBalanceSettlement(
                                            amount: "amount",
                                            date: "date"
                                        )
                                    ],
                                    reserve: "reserve"
                                ),
                                iconUrl: Nullable<String>.value("icon_url"),
                                name: Nullable<String>.value("name"),
                                priceUsd: Nullable<Double>.value(1.1),
                                symbol: "symbol",
                                valueUsd: 1.1
                            ),
                            UserBalanceToken(
                                balance: "balance",
                                breakdown: AccountBalanceBreakdown(
                                    available: "available",
                                    finishingSettlement: "finishing_settlement",
                                    inTransit: "in_transit",
                                    pending: "pending",
                                    pendingSettlements: [
                                        AccountBalanceSettlement(
                                            amount: "amount",
                                            date: "date"
                                        ),
                                        AccountBalanceSettlement(
                                            amount: "amount",
                                            date: "date"
                                        )
                                    ],
                                    reserve: "reserve"
                                ),
                                iconUrl: Nullable<String>.value("icon_url"),
                                name: Nullable<String>.value("name"),
                                priceUsd: Nullable<Double>.value(1.1),
                                symbol: "symbol",
                                valueUsd: 1.1
                            )
                        ],
                        cryptoUsd: "crypto_usd",
                        pendingUsd: "pending_usd",
                        totalUsd: "total_usd",
                        treasuryPendingUsd: "treasury_pending_usd"
                    )),
                    balanceHistory: Nullable<UserBalanceHistory>.value(UserBalanceHistory(
                        data: [
                            UserBalanceHistoryPoint(
                                t: 1,
                                v: 1.1
                            ),
                            UserBalanceHistoryPoint(
                                t: 1,
                                v: 1.1
                            )
                        ],
                        last: 1.1,
                        max: 1.1,
                        min: 1.1
                    )),
                    balances: [
                        AccountBalanceToken(
                            balance: "balance",
                            breakdown: AccountBalanceBreakdown(
                                available: "available",
                                finishingSettlement: "finishing_settlement",
                                inTransit: "in_transit",
                                pending: "pending",
                                pendingSettlements: [
                                    AccountBalanceSettlement(
                                        amount: "amount",
                                        date: "date"
                                    ),
                                    AccountBalanceSettlement(
                                        amount: "amount",
                                        date: "date"
                                    )
                                ],
                                reserve: "reserve"
                            ),
                            iconUrl: Nullable<String>.value("icon_url"),
                            name: "name",
                            priceUsd: Nullable<Double>.value(1.1),
                            symbol: "symbol",
                            valueUsd: Nullable<String>.value("value_usd")
                        ),
                        AccountBalanceToken(
                            balance: "balance",
                            breakdown: AccountBalanceBreakdown(
                                available: "available",
                                finishingSettlement: "finishing_settlement",
                                inTransit: "in_transit",
                                pending: "pending",
                                pendingSettlements: [
                                    AccountBalanceSettlement(
                                        amount: "amount",
                                        date: "date"
                                    ),
                                    AccountBalanceSettlement(
                                        amount: "amount",
                                        date: "date"
                                    )
                                ],
                                reserve: "reserve"
                            ),
                            iconUrl: Nullable<String>.value("icon_url"),
                            name: "name",
                            priceUsd: Nullable<Double>.value(1.1),
                            symbol: "symbol",
                            valueUsd: Nullable<String>.value("value_usd")
                        )
                    ],
                    banner: Nullable<UserBanner>.value(UserBanner(
                        url: "url"
                    )),
                    bio: Nullable<String>.value("bio"),
                    cards: Nullable<AccountCards>.value(AccountCards(
                        kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                        status: AccountCardsStatus.approved
                    )),
                    city: Nullable<String>.value("city"),
                    country: Nullable<String>.value("country"),
                    createdAt: "created_at",
                    dateOfBirth: Nullable<String>.value("date_of_birth"),
                    earningsUsd: Nullable<UserEarnings>.value(UserEarnings(
                        firstEarnedAt: Nullable<String>.value("first_earned_at"),
                        ownedAccounts: UserEarningsAmount(
                            last24Hours: "last_24_hours",
                            last30Days: "last_30_days",
                            last7Days: "last_7_days",
                            lifetime: "lifetime"
                        ),
                        partners: UserEarningsAmount(
                            last24Hours: "last_24_hours",
                            last30Days: "last_30_days",
                            last7Days: "last_7_days",
                            lifetime: "lifetime"
                        ),
                        personal: UserEarningsAmount(
                            last24Hours: "last_24_hours",
                            last30Days: "last_30_days",
                            last7Days: "last_7_days",
                            lifetime: "lifetime"
                        ),
                        total: UserEarningsAmount(
                            last24Hours: "last_24_hours",
                            last30Days: "last_30_days",
                            last7Days: "last_7_days",
                            lifetime: "lifetime"
                        )
                    )),
                    email: Nullable<String>.value("email"),
                    id: "id",
                    level: Nullable<OwnerLevel>.value(OwnerLevel(
                        appliedLevel: 1,
                        levels: [
                            AccountProcessingOfferLevel(
                                level: 1,
                                minimumSpend: Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ),
                                processingRatePercentage: 1.1,
                                regionalRates: [
                                    AccountProcessingOfferRegionalRate(
                                        processingRatePercentage: 1.1,
                                        region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                                    ),
                                    AccountProcessingOfferRegionalRate(
                                        processingRatePercentage: 1.1,
                                        region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                                    )
                                ]
                            ),
                            AccountProcessingOfferLevel(
                                level: 1,
                                minimumSpend: Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ),
                                processingRatePercentage: 1.1,
                                regionalRates: [
                                    AccountProcessingOfferRegionalRate(
                                        processingRatePercentage: 1.1,
                                        region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                                    ),
                                    AccountProcessingOfferRegionalRate(
                                        processingRatePercentage: 1.1,
                                        region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                                    )
                                ]
                            )
                        ],
                        monthlyAdsSpend: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        monthlyCardSpend: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        monthlyQualifyingSpend: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        monthlyTradingVolume: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        points: 1,
                        pointsBySource: OwnerLevelPoints(
                            ads: 1,
                            cards: 1,
                            partners: 1,
                            trading: 1
                        ),
                        pointsToNext: Nullable<Int>.value(1),
                        resetsAt: "resets_at"
                    )),
                    name: Nullable<String>.value("name"),
                    profilePicture: UserProfilePicture(
                        url: "url"
                    ),
                    socialLinks: [
                        UserSocialLink(
                            url: "url",
                            username: Nullable<String>.value("username"),
                            verified: true,
                            website: UserSocialLinkWebsite.x
                        ),
                        UserSocialLink(
                            url: "url",
                            username: Nullable<String>.value("username"),
                            verified: true,
                            website: UserSocialLinkWebsite.x
                        )
                    ],
                    state: Nullable<String>.value("state"),
                    totalUsd: Nullable<String>.value("total_usd"),
                    trading: Nullable<TradingAccount>.value(TradingAccount(
                        accountId: Nullable<String>.value("account_id"),
                        hyperliquid: Nullable<TradingHyperliquidAccount>.value(TradingHyperliquidAccount(
                            address: "address",
                            depositable: Nullable<String>.value("depositable"),
                            marginSummary: Nullable<TradingMarginSummary>.value(TradingMarginSummary(
                                accountValue: Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ),
                                totalMarginUsed: Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ),
                                totalPositionNotional: Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ),
                                withdrawable: Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                )
                            )),
                            positions: Nullable<[TradingPosition]>.value([]),
                            websocketSubscriptions: [
                                TradingWebsocketSubscription(
                                    channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                                    message: "message"
                                ),
                                TradingWebsocketSubscription(
                                    channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                                    message: "message"
                                )
                            ],
                            websocketUrl: "websocket_url"
                        )),
                        id: "id",
                        object: TradingAccountObject.tradingAccount,
                        provider: TradingAccountProvider.hyperliquid,
                        spot: Nullable<TradingSpotAccount>.value(TradingSpotAccount(
                            holdings: [
                                TradingSpotHolding(
                                    averageEntryPrice: .null,
                                    costBasis: Money(
                                        amount: "amount",
                                        currency: "currency",
                                        decimals: 1,
                                        displayDecimals: 1
                                    ),
                                    market: "market",
                                    realizedPnl: Money(
                                        amount: "amount",
                                        currency: "currency",
                                        decimals: 1,
                                        displayDecimals: 1
                                    ),
                                    unrealizedPnl: Money(
                                        amount: "amount",
                                        currency: "currency",
                                        decimals: 1,
                                        displayDecimals: 1
                                    ),
                                    unrealizedPnlPercentage: Nullable<Double>.value(1.1)
                                ),
                                TradingSpotHolding(
                                    averageEntryPrice: .null,
                                    costBasis: Money(
                                        amount: "amount",
                                        currency: "currency",
                                        decimals: 1,
                                        displayDecimals: 1
                                    ),
                                    market: "market",
                                    realizedPnl: Money(
                                        amount: "amount",
                                        currency: "currency",
                                        decimals: 1,
                                        displayDecimals: 1
                                    ),
                                    unrealizedPnl: Money(
                                        amount: "amount",
                                        currency: "currency",
                                        decimals: 1,
                                        displayDecimals: 1
                                    ),
                                    unrealizedPnlPercentage: Nullable<Double>.value(1.1)
                                )
                            ]
                        )),
                        userId: Nullable<String>.value("user_id")
                    )),
                    username: "username",
                    verification: [
                        "verification": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    whopPartnerEnabledAt: Nullable<String>.value("whop_partner_enabled_at"),
                    whopPartnerOnboardedAccountsCount: Nullable<Int>.value(1),
                    whopPartnerVerifiedAt: Nullable<String>.value("whop_partner_verified_at")
                ),
                User(
                    balance: Nullable<UserBalance>.value(UserBalance(
                        businesses: [
                            UserBalanceBusiness(
                                balanceUsd: "balance_usd",
                                id: "id",
                                logoUrl: Nullable<String>.value("logo_url"),
                                name: Nullable<String>.value("name")
                            ),
                            UserBalanceBusiness(
                                balanceUsd: "balance_usd",
                                id: "id",
                                logoUrl: Nullable<String>.value("logo_url"),
                                name: Nullable<String>.value("name")
                            )
                        ],
                        businessesTotalUsd: "businesses_total_usd",
                        cash: [
                            UserBalanceCash(
                                balance: 1.1,
                                balanceUsd: 1.1,
                                currency: "currency",
                                inTransitBalanceUsd: 1.1,
                                pendingBalanceUsd: 1.1,
                                priceUsd: Nullable<Double>.value(1.1),
                                reserveBalanceUsd: 1.1,
                                totalWithdrawableBalance: 1.1
                            ),
                            UserBalanceCash(
                                balance: 1.1,
                                balanceUsd: 1.1,
                                currency: "currency",
                                inTransitBalanceUsd: 1.1,
                                pendingBalanceUsd: 1.1,
                                priceUsd: Nullable<Double>.value(1.1),
                                reserveBalanceUsd: 1.1,
                                totalWithdrawableBalance: 1.1
                            )
                        ],
                        cashUsd: "cash_usd",
                        crypto: [
                            UserBalanceToken(
                                balance: "balance",
                                breakdown: AccountBalanceBreakdown(
                                    available: "available",
                                    finishingSettlement: "finishing_settlement",
                                    inTransit: "in_transit",
                                    pending: "pending",
                                    pendingSettlements: [
                                        AccountBalanceSettlement(
                                            amount: "amount",
                                            date: "date"
                                        ),
                                        AccountBalanceSettlement(
                                            amount: "amount",
                                            date: "date"
                                        )
                                    ],
                                    reserve: "reserve"
                                ),
                                iconUrl: Nullable<String>.value("icon_url"),
                                name: Nullable<String>.value("name"),
                                priceUsd: Nullable<Double>.value(1.1),
                                symbol: "symbol",
                                valueUsd: 1.1
                            ),
                            UserBalanceToken(
                                balance: "balance",
                                breakdown: AccountBalanceBreakdown(
                                    available: "available",
                                    finishingSettlement: "finishing_settlement",
                                    inTransit: "in_transit",
                                    pending: "pending",
                                    pendingSettlements: [
                                        AccountBalanceSettlement(
                                            amount: "amount",
                                            date: "date"
                                        ),
                                        AccountBalanceSettlement(
                                            amount: "amount",
                                            date: "date"
                                        )
                                    ],
                                    reserve: "reserve"
                                ),
                                iconUrl: Nullable<String>.value("icon_url"),
                                name: Nullable<String>.value("name"),
                                priceUsd: Nullable<Double>.value(1.1),
                                symbol: "symbol",
                                valueUsd: 1.1
                            )
                        ],
                        cryptoUsd: "crypto_usd",
                        pendingUsd: "pending_usd",
                        totalUsd: "total_usd",
                        treasuryPendingUsd: "treasury_pending_usd"
                    )),
                    balanceHistory: Nullable<UserBalanceHistory>.value(UserBalanceHistory(
                        data: [
                            UserBalanceHistoryPoint(
                                t: 1,
                                v: 1.1
                            ),
                            UserBalanceHistoryPoint(
                                t: 1,
                                v: 1.1
                            )
                        ],
                        last: 1.1,
                        max: 1.1,
                        min: 1.1
                    )),
                    balances: [
                        AccountBalanceToken(
                            balance: "balance",
                            breakdown: AccountBalanceBreakdown(
                                available: "available",
                                finishingSettlement: "finishing_settlement",
                                inTransit: "in_transit",
                                pending: "pending",
                                pendingSettlements: [
                                    AccountBalanceSettlement(
                                        amount: "amount",
                                        date: "date"
                                    ),
                                    AccountBalanceSettlement(
                                        amount: "amount",
                                        date: "date"
                                    )
                                ],
                                reserve: "reserve"
                            ),
                            iconUrl: Nullable<String>.value("icon_url"),
                            name: "name",
                            priceUsd: Nullable<Double>.value(1.1),
                            symbol: "symbol",
                            valueUsd: Nullable<String>.value("value_usd")
                        ),
                        AccountBalanceToken(
                            balance: "balance",
                            breakdown: AccountBalanceBreakdown(
                                available: "available",
                                finishingSettlement: "finishing_settlement",
                                inTransit: "in_transit",
                                pending: "pending",
                                pendingSettlements: [
                                    AccountBalanceSettlement(
                                        amount: "amount",
                                        date: "date"
                                    ),
                                    AccountBalanceSettlement(
                                        amount: "amount",
                                        date: "date"
                                    )
                                ],
                                reserve: "reserve"
                            ),
                            iconUrl: Nullable<String>.value("icon_url"),
                            name: "name",
                            priceUsd: Nullable<Double>.value(1.1),
                            symbol: "symbol",
                            valueUsd: Nullable<String>.value("value_usd")
                        )
                    ],
                    banner: Nullable<UserBanner>.value(UserBanner(
                        url: "url"
                    )),
                    bio: Nullable<String>.value("bio"),
                    cards: Nullable<AccountCards>.value(AccountCards(
                        kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                        status: AccountCardsStatus.approved
                    )),
                    city: Nullable<String>.value("city"),
                    country: Nullable<String>.value("country"),
                    createdAt: "created_at",
                    dateOfBirth: Nullable<String>.value("date_of_birth"),
                    earningsUsd: Nullable<UserEarnings>.value(UserEarnings(
                        firstEarnedAt: Nullable<String>.value("first_earned_at"),
                        ownedAccounts: UserEarningsAmount(
                            last24Hours: "last_24_hours",
                            last30Days: "last_30_days",
                            last7Days: "last_7_days",
                            lifetime: "lifetime"
                        ),
                        partners: UserEarningsAmount(
                            last24Hours: "last_24_hours",
                            last30Days: "last_30_days",
                            last7Days: "last_7_days",
                            lifetime: "lifetime"
                        ),
                        personal: UserEarningsAmount(
                            last24Hours: "last_24_hours",
                            last30Days: "last_30_days",
                            last7Days: "last_7_days",
                            lifetime: "lifetime"
                        ),
                        total: UserEarningsAmount(
                            last24Hours: "last_24_hours",
                            last30Days: "last_30_days",
                            last7Days: "last_7_days",
                            lifetime: "lifetime"
                        )
                    )),
                    email: Nullable<String>.value("email"),
                    id: "id",
                    level: Nullable<OwnerLevel>.value(OwnerLevel(
                        appliedLevel: 1,
                        levels: [
                            AccountProcessingOfferLevel(
                                level: 1,
                                minimumSpend: Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ),
                                processingRatePercentage: 1.1,
                                regionalRates: [
                                    AccountProcessingOfferRegionalRate(
                                        processingRatePercentage: 1.1,
                                        region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                                    ),
                                    AccountProcessingOfferRegionalRate(
                                        processingRatePercentage: 1.1,
                                        region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                                    )
                                ]
                            ),
                            AccountProcessingOfferLevel(
                                level: 1,
                                minimumSpend: Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ),
                                processingRatePercentage: 1.1,
                                regionalRates: [
                                    AccountProcessingOfferRegionalRate(
                                        processingRatePercentage: 1.1,
                                        region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                                    ),
                                    AccountProcessingOfferRegionalRate(
                                        processingRatePercentage: 1.1,
                                        region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                                    )
                                ]
                            )
                        ],
                        monthlyAdsSpend: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        monthlyCardSpend: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        monthlyQualifyingSpend: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        monthlyTradingVolume: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        points: 1,
                        pointsBySource: OwnerLevelPoints(
                            ads: 1,
                            cards: 1,
                            partners: 1,
                            trading: 1
                        ),
                        pointsToNext: Nullable<Int>.value(1),
                        resetsAt: "resets_at"
                    )),
                    name: Nullable<String>.value("name"),
                    profilePicture: UserProfilePicture(
                        url: "url"
                    ),
                    socialLinks: [
                        UserSocialLink(
                            url: "url",
                            username: Nullable<String>.value("username"),
                            verified: true,
                            website: UserSocialLinkWebsite.x
                        ),
                        UserSocialLink(
                            url: "url",
                            username: Nullable<String>.value("username"),
                            verified: true,
                            website: UserSocialLinkWebsite.x
                        )
                    ],
                    state: Nullable<String>.value("state"),
                    totalUsd: Nullable<String>.value("total_usd"),
                    trading: Nullable<TradingAccount>.value(TradingAccount(
                        accountId: Nullable<String>.value("account_id"),
                        hyperliquid: Nullable<TradingHyperliquidAccount>.value(TradingHyperliquidAccount(
                            address: "address",
                            depositable: Nullable<String>.value("depositable"),
                            marginSummary: Nullable<TradingMarginSummary>.value(TradingMarginSummary(
                                accountValue: Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ),
                                totalMarginUsed: Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ),
                                totalPositionNotional: Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ),
                                withdrawable: Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                )
                            )),
                            positions: Nullable<[TradingPosition]>.value([]),
                            websocketSubscriptions: [
                                TradingWebsocketSubscription(
                                    channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                                    message: "message"
                                ),
                                TradingWebsocketSubscription(
                                    channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                                    message: "message"
                                )
                            ],
                            websocketUrl: "websocket_url"
                        )),
                        id: "id",
                        object: TradingAccountObject.tradingAccount,
                        provider: TradingAccountProvider.hyperliquid,
                        spot: Nullable<TradingSpotAccount>.value(TradingSpotAccount(
                            holdings: [
                                TradingSpotHolding(
                                    averageEntryPrice: .null,
                                    costBasis: Money(
                                        amount: "amount",
                                        currency: "currency",
                                        decimals: 1,
                                        displayDecimals: 1
                                    ),
                                    market: "market",
                                    realizedPnl: Money(
                                        amount: "amount",
                                        currency: "currency",
                                        decimals: 1,
                                        displayDecimals: 1
                                    ),
                                    unrealizedPnl: Money(
                                        amount: "amount",
                                        currency: "currency",
                                        decimals: 1,
                                        displayDecimals: 1
                                    ),
                                    unrealizedPnlPercentage: Nullable<Double>.value(1.1)
                                ),
                                TradingSpotHolding(
                                    averageEntryPrice: .null,
                                    costBasis: Money(
                                        amount: "amount",
                                        currency: "currency",
                                        decimals: 1,
                                        displayDecimals: 1
                                    ),
                                    market: "market",
                                    realizedPnl: Money(
                                        amount: "amount",
                                        currency: "currency",
                                        decimals: 1,
                                        displayDecimals: 1
                                    ),
                                    unrealizedPnl: Money(
                                        amount: "amount",
                                        currency: "currency",
                                        decimals: 1,
                                        displayDecimals: 1
                                    ),
                                    unrealizedPnlPercentage: Nullable<Double>.value(1.1)
                                )
                            ]
                        )),
                        userId: Nullable<String>.value("user_id")
                    )),
                    username: "username",
                    verification: [
                        "verification": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    whopPartnerEnabledAt: Nullable<String>.value("whop_partner_enabled_at"),
                    whopPartnerOnboardedAccountsCount: Nullable<Int>.value(1),
                    whopPartnerVerifiedAt: Nullable<String>.value("whop_partner_verified_at")
                )
            ],
            pageInfo: ListUsersResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.users.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func me1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "balance": {
                    "businesses": [
                      {
                        "balance_usd": "18940.25",
                        "id": "biz_xxxxxxxxxxxxxx",
                        "logo_url": "https://assets.whop.com/logos/shine-time-auto-detailing.png",
                        "name": "Shine Time Auto Detailing"
                      }
                    ],
                    "businesses_total_usd": "18940.25",
                    "cash": [
                      {
                        "balance": 4385.75,
                        "balance_usd": 4385.75,
                        "currency": "usd",
                        "in_transit_balance_usd": 0,
                        "pending_balance_usd": 310,
                        "price_usd": null,
                        "reserve_balance_usd": 125,
                        "total_withdrawable_balance": 4385.75
                      }
                    ],
                    "cash_usd": "4820.75",
                    "crypto": [
                      {
                        "balance": "1500.0",
                        "breakdown": {
                          "available": "1500.0",
                          "finishing_settlement": "0",
                          "in_transit": "0",
                          "pending": "0",
                          "pending_settlements": [
                            {
                              "amount": "0.0",
                              "date": "2026-01-01"
                            }
                          ],
                          "reserve": "0"
                        },
                        "icon_url": "https://assets.whop.com/tokens/usdt.png",
                        "name": "Tether USD",
                        "price_usd": 1,
                        "symbol": "USDT",
                        "value_usd": 1500
                      }
                    ],
                    "crypto_usd": "1500.00",
                    "pending_usd": "310.00",
                    "total_usd": "6320.75",
                    "treasury_pending_usd": "0.00"
                  },
                  "balance_history": {
                    "data": [
                      {
                        "t": 1767268800,
                        "v": 2400
                      }
                    ],
                    "last": 6320.75,
                    "max": 6320.75,
                    "min": 2400
                  },
                  "balances": [
                    {
                      "balance": "1500.0",
                      "breakdown": {
                        "available": "1500.0",
                        "finishing_settlement": "0",
                        "in_transit": "0",
                        "pending": "0",
                        "pending_settlements": [
                          {
                            "amount": "0.0",
                            "date": "2026-01-01"
                          }
                        ],
                        "reserve": "0"
                      },
                      "icon_url": "https://assets.whop.com/tokens/usdt.png",
                      "name": "Tether USD",
                      "price_usd": 1,
                      "symbol": "USDT",
                      "value_usd": "1500.00"
                    }
                  ],
                  "banner": {
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "bio": "Ceramic coating specialist. Detailing cars in Austin since 2016.",
                  "cards": {
                    "kind": "individual",
                    "status": "approved"
                  },
                  "city": "Austin",
                  "country": "US",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "date_of_birth": "date_of_birth",
                  "earnings_usd": {
                    "first_earned_at": "2026-01-01T12:00:00.000Z",
                    "owned_accounts": {
                      "last_24_hours": "0.00",
                      "last_30_days": "0.00",
                      "last_7_days": "0.00",
                      "lifetime": "0.00"
                    },
                    "partners": {
                      "last_24_hours": "0.00",
                      "last_30_days": "0.00",
                      "last_7_days": "0.00",
                      "lifetime": "0.00"
                    },
                    "personal": {
                      "last_24_hours": "0.00",
                      "last_30_days": "0.00",
                      "last_7_days": "0.00",
                      "lifetime": "0.00"
                    },
                    "total": {
                      "last_24_hours": "0.00",
                      "last_30_days": "0.00",
                      "last_7_days": "0.00",
                      "lifetime": "0.00"
                    }
                  },
                  "email": "marcus@shinetime.example",
                  "id": "user_xxxxxxxxxxxxxx",
                  "level": {
                    "applied_level": 1,
                    "levels": [
                      {
                        "level": 0,
                        "minimum_spend": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "processing_rate_percentage": 2.7,
                        "regional_rates": [
                          {
                            "processing_rate_percentage": 1.7,
                            "region": "us_and_canada"
                          }
                        ]
                      }
                    ],
                    "monthly_ads_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_card_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_qualifying_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_trading_volume": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "points": 41000,
                    "points_by_source": {
                      "ads": 0,
                      "cards": 40000,
                      "partners": 0,
                      "trading": 1000
                    },
                    "points_to_next": 59000,
                    "resets_at": "2026-01-01T12:00:00.000Z"
                  },
                  "name": "Marcus Webb",
                  "profile_picture": {
                    "url": "https://ui-avatars.com/api/"
                  },
                  "social_links": [
                    {
                      "url": "https://www.instagram.com/tanyacole.details",
                      "username": "tanyacole.details",
                      "verified": true,
                      "website": "x"
                    }
                  ],
                  "state": "Texas",
                  "total_usd": "6320.75",
                  "trading": {
                    "account_id": "account_id",
                    "hyperliquid": {
                      "address": "address",
                      "depositable": "depositable",
                      "margin_summary": {
                        "account_value": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_margin_used": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_position_notional": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "withdrawable": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        }
                      },
                      "positions": [
                        {
                          "entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "hyperliquid": {
                            "cumulative_funding": {
                              "all_time": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_change": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_open": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              }
                            },
                            "leverage": {
                              "type": "cross",
                              "value": 1
                            },
                            "liquidation_price": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "margin_used": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "return_on_equity": "return_on_equity"
                          },
                          "id": "id",
                          "market": "market",
                          "object": "trading_position",
                          "position_value": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "side": "long",
                          "size": "size",
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          }
                        }
                      ],
                      "websocket_subscriptions": [
                        {
                          "channel": "clearinghouse_state",
                          "message": "message"
                        }
                      ],
                      "websocket_url": "websocket_url"
                    },
                    "id": "id",
                    "object": "trading_account",
                    "provider": "hyperliquid",
                    "spot": {
                      "holdings": [
                        {
                          "average_entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "cost_basis": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "market": "market",
                          "realized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl_percentage": null
                        }
                      ]
                    },
                    "user_id": "user_id"
                  },
                  "username": "marcuswebb",
                  "verification": {
                    "business": null,
                    "individual": null
                  },
                  "whop_partner_enabled_at": "2026-01-01T12:00:00.000Z",
                  "whop_partner_onboarded_accounts_count": 1,
                  "whop_partner_verified_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = User(
            balance: Nullable<UserBalance>.value(UserBalance(
                businesses: [
                    UserBalanceBusiness(
                        balanceUsd: "18940.25",
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://assets.whop.com/logos/shine-time-auto-detailing.png"),
                        name: Nullable<String>.value("Shine Time Auto Detailing")
                    )
                ],
                businessesTotalUsd: "18940.25",
                cash: [
                    UserBalanceCash(
                        balance: 4385.75,
                        balanceUsd: 4385.75,
                        currency: "usd",
                        inTransitBalanceUsd: 0,
                        pendingBalanceUsd: 310,
                        priceUsd: .null,
                        reserveBalanceUsd: 125,
                        totalWithdrawableBalance: 4385.75
                    )
                ],
                cashUsd: "4820.75",
                crypto: [
                    UserBalanceToken(
                        balance: "1500.0",
                        breakdown: AccountBalanceBreakdown(
                            available: "1500.0",
                            finishingSettlement: "0",
                            inTransit: "0",
                            pending: "0",
                            pendingSettlements: [
                                AccountBalanceSettlement(
                                    amount: "0.0",
                                    date: "2026-01-01"
                                )
                            ],
                            reserve: "0"
                        ),
                        iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                        name: Nullable<String>.value("Tether USD"),
                        priceUsd: Nullable<Double>.value(1),
                        symbol: "USDT",
                        valueUsd: 1500
                    )
                ],
                cryptoUsd: "1500.00",
                pendingUsd: "310.00",
                totalUsd: "6320.75",
                treasuryPendingUsd: "0.00"
            )),
            balanceHistory: Nullable<UserBalanceHistory>.value(UserBalanceHistory(
                data: [
                    UserBalanceHistoryPoint(
                        t: 1767268800,
                        v: 2400
                    )
                ],
                last: 6320.75,
                max: 6320.75,
                min: 2400
            )),
            balances: [
                AccountBalanceToken(
                    balance: "1500.0",
                    breakdown: AccountBalanceBreakdown(
                        available: "1500.0",
                        finishingSettlement: "0",
                        inTransit: "0",
                        pending: "0",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "0.0",
                                date: "2026-01-01"
                            )
                        ],
                        reserve: "0"
                    ),
                    iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                    name: "Tether USD",
                    priceUsd: Nullable<Double>.value(1),
                    symbol: "USDT",
                    valueUsd: Nullable<String>.value("1500.00")
                )
            ],
            banner: Nullable<UserBanner>.value(UserBanner(
                url: "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            )),
            bio: Nullable<String>.value("Ceramic coating specialist. Detailing cars in Austin since 2016."),
            cards: Nullable<AccountCards>.value(AccountCards(
                kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                status: AccountCardsStatus.approved
            )),
            city: Nullable<String>.value("Austin"),
            country: Nullable<String>.value("US"),
            createdAt: "2026-01-01T12:00:00.000Z",
            dateOfBirth: Nullable<String>.value("date_of_birth"),
            earningsUsd: Nullable<UserEarnings>.value(UserEarnings(
                firstEarnedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                ownedAccounts: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "0.00",
                    last7Days: "0.00",
                    lifetime: "0.00"
                ),
                partners: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "0.00",
                    last7Days: "0.00",
                    lifetime: "0.00"
                ),
                personal: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "0.00",
                    last7Days: "0.00",
                    lifetime: "0.00"
                ),
                total: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "0.00",
                    last7Days: "0.00",
                    lifetime: "0.00"
                )
            )),
            email: Nullable<String>.value("marcus@shinetime.example"),
            id: "user_xxxxxxxxxxxxxx",
            level: Nullable<OwnerLevel>.value(OwnerLevel(
                appliedLevel: 1,
                levels: [
                    AccountProcessingOfferLevel(
                        level: 0,
                        minimumSpend: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        processingRatePercentage: 2.7,
                        regionalRates: [
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.7,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            )
                        ]
                    )
                ],
                monthlyAdsSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyCardSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyQualifyingSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyTradingVolume: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                points: 41000,
                pointsBySource: OwnerLevelPoints(
                    ads: 0,
                    cards: 40000,
                    partners: 0,
                    trading: 1000
                ),
                pointsToNext: Nullable<Int>.value(59000),
                resetsAt: "2026-01-01T12:00:00.000Z"
            )),
            name: Nullable<String>.value("Marcus Webb"),
            profilePicture: UserProfilePicture(
                url: "https://ui-avatars.com/api/"
            ),
            socialLinks: [
                UserSocialLink(
                    url: "https://www.instagram.com/tanyacole.details",
                    username: Nullable<String>.value("tanyacole.details"),
                    verified: true,
                    website: UserSocialLinkWebsite.x
                )
            ],
            state: Nullable<String>.value("Texas"),
            totalUsd: Nullable<String>.value("6320.75"),
            trading: Nullable<TradingAccount>.value(TradingAccount(
                accountId: Nullable<String>.value("account_id"),
                hyperliquid: Nullable<TradingHyperliquidAccount>.value(TradingHyperliquidAccount(
                    address: "address",
                    depositable: Nullable<String>.value("depositable"),
                    marginSummary: Nullable<TradingMarginSummary>.value(TradingMarginSummary(
                        accountValue: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalMarginUsed: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalPositionNotional: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        withdrawable: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )
                    )),
                    positions: Nullable<[TradingPosition]>.value([
                        TradingPosition(
                            entryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            hyperliquid: Nullable<TradingHyperliquidPosition>.value(TradingHyperliquidPosition(
                                cumulativeFunding: TradingCumulativeFunding(
                                    allTime: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceChange: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceOpen: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    ))
                                ),
                                leverage: TradingPositionLeverage(
                                    type: TradingPositionLeverageType.cross,
                                    value: 1
                                ),
                                liquidationPrice: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                marginUsed: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ),
                                returnOnEquity: "return_on_equity"
                            )),
                            id: "id",
                            market: "market",
                            object: TradingPositionObject.tradingPosition,
                            positionValue: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            side: TradingPositionSide.long,
                            size: "size",
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )
                        )
                    ]),
                    websocketSubscriptions: [
                        TradingWebsocketSubscription(
                            channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                            message: "message"
                        )
                    ],
                    websocketUrl: "websocket_url"
                )),
                id: "id",
                object: TradingAccountObject.tradingAccount,
                provider: TradingAccountProvider.hyperliquid,
                spot: Nullable<TradingSpotAccount>.value(TradingSpotAccount(
                    holdings: [
                        TradingSpotHolding(
                            averageEntryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            costBasis: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            market: "market",
                            realizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnlPercentage: .null
                        )
                    ]
                )),
                userId: Nullable<String>.value("user_id")
            )),
            username: "marcuswebb",
            verification: [
                "business": JSONValue.value, 
                "individual": JSONValue.value
            ],
            whopPartnerEnabledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            whopPartnerOnboardedAccountsCount: Nullable<Int>.value(1),
            whopPartnerVerifiedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
        )
        let response = try await client.users.me(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func me2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "balance": {
                    "businesses": [
                      {
                        "balance_usd": "balance_usd",
                        "id": "id",
                        "logo_url": "logo_url",
                        "name": "name"
                      },
                      {
                        "balance_usd": "balance_usd",
                        "id": "id",
                        "logo_url": "logo_url",
                        "name": "name"
                      }
                    ],
                    "businesses_total_usd": "businesses_total_usd",
                    "cash": [
                      {
                        "balance": 1.1,
                        "balance_usd": 1.1,
                        "currency": "currency",
                        "in_transit_balance_usd": 1.1,
                        "pending_balance_usd": 1.1,
                        "price_usd": 1.1,
                        "reserve_balance_usd": 1.1,
                        "total_withdrawable_balance": 1.1
                      },
                      {
                        "balance": 1.1,
                        "balance_usd": 1.1,
                        "currency": "currency",
                        "in_transit_balance_usd": 1.1,
                        "pending_balance_usd": 1.1,
                        "price_usd": 1.1,
                        "reserve_balance_usd": 1.1,
                        "total_withdrawable_balance": 1.1
                      }
                    ],
                    "cash_usd": "cash_usd",
                    "crypto": [
                      {
                        "balance": "balance",
                        "breakdown": {
                          "available": "available",
                          "finishing_settlement": "finishing_settlement",
                          "in_transit": "in_transit",
                          "pending": "pending",
                          "pending_settlements": [
                            {
                              "amount": "amount",
                              "date": "date"
                            },
                            {
                              "amount": "amount",
                              "date": "date"
                            }
                          ],
                          "reserve": "reserve"
                        },
                        "icon_url": "icon_url",
                        "name": "name",
                        "price_usd": 1.1,
                        "symbol": "symbol",
                        "value_usd": 1.1
                      },
                      {
                        "balance": "balance",
                        "breakdown": {
                          "available": "available",
                          "finishing_settlement": "finishing_settlement",
                          "in_transit": "in_transit",
                          "pending": "pending",
                          "pending_settlements": [
                            {
                              "amount": "amount",
                              "date": "date"
                            },
                            {
                              "amount": "amount",
                              "date": "date"
                            }
                          ],
                          "reserve": "reserve"
                        },
                        "icon_url": "icon_url",
                        "name": "name",
                        "price_usd": 1.1,
                        "symbol": "symbol",
                        "value_usd": 1.1
                      }
                    ],
                    "crypto_usd": "crypto_usd",
                    "pending_usd": "pending_usd",
                    "total_usd": "total_usd",
                    "treasury_pending_usd": "treasury_pending_usd"
                  },
                  "balance_history": {
                    "data": [
                      {
                        "t": 1,
                        "v": 1.1
                      },
                      {
                        "t": 1,
                        "v": 1.1
                      }
                    ],
                    "last": 1.1,
                    "max": 1.1,
                    "min": 1.1
                  },
                  "balances": [
                    {
                      "balance": "balance",
                      "breakdown": {
                        "available": "available",
                        "finishing_settlement": "finishing_settlement",
                        "in_transit": "in_transit",
                        "pending": "pending",
                        "pending_settlements": [
                          {
                            "amount": "amount",
                            "date": "date"
                          },
                          {
                            "amount": "amount",
                            "date": "date"
                          }
                        ],
                        "reserve": "reserve"
                      },
                      "icon_url": "icon_url",
                      "name": "name",
                      "price_usd": 1.1,
                      "symbol": "symbol",
                      "value_usd": "value_usd"
                    },
                    {
                      "balance": "balance",
                      "breakdown": {
                        "available": "available",
                        "finishing_settlement": "finishing_settlement",
                        "in_transit": "in_transit",
                        "pending": "pending",
                        "pending_settlements": [
                          {
                            "amount": "amount",
                            "date": "date"
                          },
                          {
                            "amount": "amount",
                            "date": "date"
                          }
                        ],
                        "reserve": "reserve"
                      },
                      "icon_url": "icon_url",
                      "name": "name",
                      "price_usd": 1.1,
                      "symbol": "symbol",
                      "value_usd": "value_usd"
                    }
                  ],
                  "banner": {
                    "url": "url"
                  },
                  "bio": "bio",
                  "cards": {
                    "kind": "individual",
                    "status": "approved"
                  },
                  "city": "city",
                  "country": "country",
                  "created_at": "created_at",
                  "date_of_birth": "date_of_birth",
                  "earnings_usd": {
                    "first_earned_at": "first_earned_at",
                    "owned_accounts": {
                      "last_24_hours": "last_24_hours",
                      "last_30_days": "last_30_days",
                      "last_7_days": "last_7_days",
                      "lifetime": "lifetime"
                    },
                    "partners": {
                      "last_24_hours": "last_24_hours",
                      "last_30_days": "last_30_days",
                      "last_7_days": "last_7_days",
                      "lifetime": "lifetime"
                    },
                    "personal": {
                      "last_24_hours": "last_24_hours",
                      "last_30_days": "last_30_days",
                      "last_7_days": "last_7_days",
                      "lifetime": "lifetime"
                    },
                    "total": {
                      "last_24_hours": "last_24_hours",
                      "last_30_days": "last_30_days",
                      "last_7_days": "last_7_days",
                      "lifetime": "lifetime"
                    }
                  },
                  "email": "email",
                  "id": "id",
                  "level": {
                    "applied_level": 1,
                    "levels": [
                      {
                        "level": 1,
                        "minimum_spend": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "processing_rate_percentage": 1.1,
                        "regional_rates": [
                          {
                            "processing_rate_percentage": 1.1,
                            "region": "us_and_canada"
                          },
                          {
                            "processing_rate_percentage": 1.1,
                            "region": "us_and_canada"
                          }
                        ]
                      },
                      {
                        "level": 1,
                        "minimum_spend": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "processing_rate_percentage": 1.1,
                        "regional_rates": [
                          {
                            "processing_rate_percentage": 1.1,
                            "region": "us_and_canada"
                          },
                          {
                            "processing_rate_percentage": 1.1,
                            "region": "us_and_canada"
                          }
                        ]
                      }
                    ],
                    "monthly_ads_spend": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "monthly_card_spend": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "monthly_qualifying_spend": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "monthly_trading_volume": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "points": 1,
                    "points_by_source": {
                      "ads": 1,
                      "cards": 1,
                      "partners": 1,
                      "trading": 1
                    },
                    "points_to_next": 1,
                    "resets_at": "resets_at"
                  },
                  "name": "name",
                  "profile_picture": {
                    "url": "url"
                  },
                  "social_links": [
                    {
                      "url": "url",
                      "username": "username",
                      "verified": true,
                      "website": "x"
                    },
                    {
                      "url": "url",
                      "username": "username",
                      "verified": true,
                      "website": "x"
                    }
                  ],
                  "state": "state",
                  "total_usd": "total_usd",
                  "trading": {
                    "account_id": "account_id",
                    "hyperliquid": {
                      "address": "address",
                      "depositable": "depositable",
                      "margin_summary": {
                        "account_value": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "total_margin_used": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "total_position_notional": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "withdrawable": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        }
                      },
                      "positions": [
                        {
                          "entry_price": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "hyperliquid": null,
                          "id": "id",
                          "market": "market",
                          "object": "trading_position",
                          "position_value": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "side": "long",
                          "size": "size",
                          "unrealized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          }
                        },
                        {
                          "entry_price": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "hyperliquid": null,
                          "id": "id",
                          "market": "market",
                          "object": "trading_position",
                          "position_value": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "side": "long",
                          "size": "size",
                          "unrealized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          }
                        }
                      ],
                      "websocket_subscriptions": [
                        {
                          "channel": "clearinghouse_state",
                          "message": "message"
                        },
                        {
                          "channel": "clearinghouse_state",
                          "message": "message"
                        }
                      ],
                      "websocket_url": "websocket_url"
                    },
                    "id": "id",
                    "object": "trading_account",
                    "provider": "hyperliquid",
                    "spot": {
                      "holdings": [
                        {
                          "average_entry_price": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "cost_basis": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "market": "market",
                          "realized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "unrealized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "unrealized_pnl_percentage": 1.1
                        },
                        {
                          "average_entry_price": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "cost_basis": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "market": "market",
                          "realized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "unrealized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "unrealized_pnl_percentage": 1.1
                        }
                      ]
                    },
                    "user_id": "user_id"
                  },
                  "username": "username",
                  "verification": {
                    "verification": {
                      "key": "value"
                    }
                  },
                  "whop_partner_enabled_at": "whop_partner_enabled_at",
                  "whop_partner_onboarded_accounts_count": 1,
                  "whop_partner_verified_at": "whop_partner_verified_at"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = User(
            balance: Nullable<UserBalance>.value(UserBalance(
                businesses: [
                    UserBalanceBusiness(
                        balanceUsd: "balance_usd",
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        name: Nullable<String>.value("name")
                    ),
                    UserBalanceBusiness(
                        balanceUsd: "balance_usd",
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        name: Nullable<String>.value("name")
                    )
                ],
                businessesTotalUsd: "businesses_total_usd",
                cash: [
                    UserBalanceCash(
                        balance: 1.1,
                        balanceUsd: 1.1,
                        currency: "currency",
                        inTransitBalanceUsd: 1.1,
                        pendingBalanceUsd: 1.1,
                        priceUsd: Nullable<Double>.value(1.1),
                        reserveBalanceUsd: 1.1,
                        totalWithdrawableBalance: 1.1
                    ),
                    UserBalanceCash(
                        balance: 1.1,
                        balanceUsd: 1.1,
                        currency: "currency",
                        inTransitBalanceUsd: 1.1,
                        pendingBalanceUsd: 1.1,
                        priceUsd: Nullable<Double>.value(1.1),
                        reserveBalanceUsd: 1.1,
                        totalWithdrawableBalance: 1.1
                    )
                ],
                cashUsd: "cash_usd",
                crypto: [
                    UserBalanceToken(
                        balance: "balance",
                        breakdown: AccountBalanceBreakdown(
                            available: "available",
                            finishingSettlement: "finishing_settlement",
                            inTransit: "in_transit",
                            pending: "pending",
                            pendingSettlements: [
                                AccountBalanceSettlement(
                                    amount: "amount",
                                    date: "date"
                                ),
                                AccountBalanceSettlement(
                                    amount: "amount",
                                    date: "date"
                                )
                            ],
                            reserve: "reserve"
                        ),
                        iconUrl: Nullable<String>.value("icon_url"),
                        name: Nullable<String>.value("name"),
                        priceUsd: Nullable<Double>.value(1.1),
                        symbol: "symbol",
                        valueUsd: 1.1
                    ),
                    UserBalanceToken(
                        balance: "balance",
                        breakdown: AccountBalanceBreakdown(
                            available: "available",
                            finishingSettlement: "finishing_settlement",
                            inTransit: "in_transit",
                            pending: "pending",
                            pendingSettlements: [
                                AccountBalanceSettlement(
                                    amount: "amount",
                                    date: "date"
                                ),
                                AccountBalanceSettlement(
                                    amount: "amount",
                                    date: "date"
                                )
                            ],
                            reserve: "reserve"
                        ),
                        iconUrl: Nullable<String>.value("icon_url"),
                        name: Nullable<String>.value("name"),
                        priceUsd: Nullable<Double>.value(1.1),
                        symbol: "symbol",
                        valueUsd: 1.1
                    )
                ],
                cryptoUsd: "crypto_usd",
                pendingUsd: "pending_usd",
                totalUsd: "total_usd",
                treasuryPendingUsd: "treasury_pending_usd"
            )),
            balanceHistory: Nullable<UserBalanceHistory>.value(UserBalanceHistory(
                data: [
                    UserBalanceHistoryPoint(
                        t: 1,
                        v: 1.1
                    ),
                    UserBalanceHistoryPoint(
                        t: 1,
                        v: 1.1
                    )
                ],
                last: 1.1,
                max: 1.1,
                min: 1.1
            )),
            balances: [
                AccountBalanceToken(
                    balance: "balance",
                    breakdown: AccountBalanceBreakdown(
                        available: "available",
                        finishingSettlement: "finishing_settlement",
                        inTransit: "in_transit",
                        pending: "pending",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "amount",
                                date: "date"
                            ),
                            AccountBalanceSettlement(
                                amount: "amount",
                                date: "date"
                            )
                        ],
                        reserve: "reserve"
                    ),
                    iconUrl: Nullable<String>.value("icon_url"),
                    name: "name",
                    priceUsd: Nullable<Double>.value(1.1),
                    symbol: "symbol",
                    valueUsd: Nullable<String>.value("value_usd")
                ),
                AccountBalanceToken(
                    balance: "balance",
                    breakdown: AccountBalanceBreakdown(
                        available: "available",
                        finishingSettlement: "finishing_settlement",
                        inTransit: "in_transit",
                        pending: "pending",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "amount",
                                date: "date"
                            ),
                            AccountBalanceSettlement(
                                amount: "amount",
                                date: "date"
                            )
                        ],
                        reserve: "reserve"
                    ),
                    iconUrl: Nullable<String>.value("icon_url"),
                    name: "name",
                    priceUsd: Nullable<Double>.value(1.1),
                    symbol: "symbol",
                    valueUsd: Nullable<String>.value("value_usd")
                )
            ],
            banner: Nullable<UserBanner>.value(UserBanner(
                url: "url"
            )),
            bio: Nullable<String>.value("bio"),
            cards: Nullable<AccountCards>.value(AccountCards(
                kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                status: AccountCardsStatus.approved
            )),
            city: Nullable<String>.value("city"),
            country: Nullable<String>.value("country"),
            createdAt: "created_at",
            dateOfBirth: Nullable<String>.value("date_of_birth"),
            earningsUsd: Nullable<UserEarnings>.value(UserEarnings(
                firstEarnedAt: Nullable<String>.value("first_earned_at"),
                ownedAccounts: UserEarningsAmount(
                    last24Hours: "last_24_hours",
                    last30Days: "last_30_days",
                    last7Days: "last_7_days",
                    lifetime: "lifetime"
                ),
                partners: UserEarningsAmount(
                    last24Hours: "last_24_hours",
                    last30Days: "last_30_days",
                    last7Days: "last_7_days",
                    lifetime: "lifetime"
                ),
                personal: UserEarningsAmount(
                    last24Hours: "last_24_hours",
                    last30Days: "last_30_days",
                    last7Days: "last_7_days",
                    lifetime: "lifetime"
                ),
                total: UserEarningsAmount(
                    last24Hours: "last_24_hours",
                    last30Days: "last_30_days",
                    last7Days: "last_7_days",
                    lifetime: "lifetime"
                )
            )),
            email: Nullable<String>.value("email"),
            id: "id",
            level: Nullable<OwnerLevel>.value(OwnerLevel(
                appliedLevel: 1,
                levels: [
                    AccountProcessingOfferLevel(
                        level: 1,
                        minimumSpend: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        processingRatePercentage: 1.1,
                        regionalRates: [
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.1,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            ),
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.1,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            )
                        ]
                    ),
                    AccountProcessingOfferLevel(
                        level: 1,
                        minimumSpend: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        processingRatePercentage: 1.1,
                        regionalRates: [
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.1,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            ),
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.1,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            )
                        ]
                    )
                ],
                monthlyAdsSpend: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                monthlyCardSpend: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                monthlyQualifyingSpend: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                monthlyTradingVolume: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                points: 1,
                pointsBySource: OwnerLevelPoints(
                    ads: 1,
                    cards: 1,
                    partners: 1,
                    trading: 1
                ),
                pointsToNext: Nullable<Int>.value(1),
                resetsAt: "resets_at"
            )),
            name: Nullable<String>.value("name"),
            profilePicture: UserProfilePicture(
                url: "url"
            ),
            socialLinks: [
                UserSocialLink(
                    url: "url",
                    username: Nullable<String>.value("username"),
                    verified: true,
                    website: UserSocialLinkWebsite.x
                ),
                UserSocialLink(
                    url: "url",
                    username: Nullable<String>.value("username"),
                    verified: true,
                    website: UserSocialLinkWebsite.x
                )
            ],
            state: Nullable<String>.value("state"),
            totalUsd: Nullable<String>.value("total_usd"),
            trading: Nullable<TradingAccount>.value(TradingAccount(
                accountId: Nullable<String>.value("account_id"),
                hyperliquid: Nullable<TradingHyperliquidAccount>.value(TradingHyperliquidAccount(
                    address: "address",
                    depositable: Nullable<String>.value("depositable"),
                    marginSummary: Nullable<TradingMarginSummary>.value(TradingMarginSummary(
                        accountValue: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        totalMarginUsed: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        totalPositionNotional: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        withdrawable: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )
                    )),
                    positions: Nullable<[TradingPosition]>.value([
                        TradingPosition(
                            entryPrice: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            hyperliquid: .null,
                            id: "id",
                            market: "market",
                            object: TradingPositionObject.tradingPosition,
                            positionValue: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            side: TradingPositionSide.long,
                            size: "size",
                            unrealizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )
                        ),
                        TradingPosition(
                            entryPrice: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            hyperliquid: .null,
                            id: "id",
                            market: "market",
                            object: TradingPositionObject.tradingPosition,
                            positionValue: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            side: TradingPositionSide.long,
                            size: "size",
                            unrealizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )
                        )
                    ]),
                    websocketSubscriptions: [
                        TradingWebsocketSubscription(
                            channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                            message: "message"
                        ),
                        TradingWebsocketSubscription(
                            channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                            message: "message"
                        )
                    ],
                    websocketUrl: "websocket_url"
                )),
                id: "id",
                object: TradingAccountObject.tradingAccount,
                provider: TradingAccountProvider.hyperliquid,
                spot: Nullable<TradingSpotAccount>.value(TradingSpotAccount(
                    holdings: [
                        TradingSpotHolding(
                            averageEntryPrice: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            costBasis: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            market: "market",
                            realizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            unrealizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            unrealizedPnlPercentage: Nullable<Double>.value(1.1)
                        ),
                        TradingSpotHolding(
                            averageEntryPrice: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            costBasis: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            market: "market",
                            realizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            unrealizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            unrealizedPnlPercentage: Nullable<Double>.value(1.1)
                        )
                    ]
                )),
                userId: Nullable<String>.value("user_id")
            )),
            username: "username",
            verification: [
                "verification": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            whopPartnerEnabledAt: Nullable<String>.value("whop_partner_enabled_at"),
            whopPartnerOnboardedAccountsCount: Nullable<Int>.value(1),
            whopPartnerVerifiedAt: Nullable<String>.value("whop_partner_verified_at")
        )
        let response = try await client.users.me(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func updateMe1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "balance": {
                    "businesses": [
                      {
                        "balance_usd": "18940.25",
                        "id": "biz_xxxxxxxxxxxxxx",
                        "logo_url": "https://assets.whop.com/logos/shine-time-auto-detailing.png",
                        "name": "Shine Time Auto Detailing"
                      }
                    ],
                    "businesses_total_usd": "18940.25",
                    "cash": [
                      {
                        "balance": 4385.75,
                        "balance_usd": 4385.75,
                        "currency": "usd",
                        "in_transit_balance_usd": 0,
                        "pending_balance_usd": 310,
                        "price_usd": null,
                        "reserve_balance_usd": 125,
                        "total_withdrawable_balance": 4385.75
                      }
                    ],
                    "cash_usd": "4820.75",
                    "crypto": [
                      {
                        "balance": "1500.0",
                        "breakdown": {
                          "available": "1500.0",
                          "finishing_settlement": "0",
                          "in_transit": "0",
                          "pending": "0",
                          "pending_settlements": [
                            {
                              "amount": "0.0",
                              "date": "2026-01-01"
                            }
                          ],
                          "reserve": "0"
                        },
                        "icon_url": "https://assets.whop.com/tokens/usdt.png",
                        "name": "Tether USD",
                        "price_usd": 1,
                        "symbol": "USDT",
                        "value_usd": 1500
                      }
                    ],
                    "crypto_usd": "1500.00",
                    "pending_usd": "310.00",
                    "total_usd": "6320.75",
                    "treasury_pending_usd": "0.00"
                  },
                  "balance_history": {
                    "data": [
                      {
                        "t": 1767268800,
                        "v": 2400
                      }
                    ],
                    "last": 6320.75,
                    "max": 6320.75,
                    "min": 2400
                  },
                  "balances": [
                    {
                      "balance": "1500.0",
                      "breakdown": {
                        "available": "1500.0",
                        "finishing_settlement": "0",
                        "in_transit": "0",
                        "pending": "0",
                        "pending_settlements": [
                          {
                            "amount": "0.0",
                            "date": "2026-01-01"
                          }
                        ],
                        "reserve": "0"
                      },
                      "icon_url": "https://assets.whop.com/tokens/usdt.png",
                      "name": "Tether USD",
                      "price_usd": 1,
                      "symbol": "USDT",
                      "value_usd": "1500.00"
                    }
                  ],
                  "banner": {
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "bio": "Ceramic coating specialist. Detailing cars in Austin since 2016.",
                  "cards": {
                    "kind": "individual",
                    "status": "approved"
                  },
                  "city": "Austin",
                  "country": "US",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "date_of_birth": "date_of_birth",
                  "earnings_usd": {
                    "first_earned_at": "2026-01-01T12:00:00.000Z",
                    "owned_accounts": {
                      "last_24_hours": "0.00",
                      "last_30_days": "0.00",
                      "last_7_days": "0.00",
                      "lifetime": "0.00"
                    },
                    "partners": {
                      "last_24_hours": "0.00",
                      "last_30_days": "0.00",
                      "last_7_days": "0.00",
                      "lifetime": "0.00"
                    },
                    "personal": {
                      "last_24_hours": "0.00",
                      "last_30_days": "0.00",
                      "last_7_days": "0.00",
                      "lifetime": "0.00"
                    },
                    "total": {
                      "last_24_hours": "0.00",
                      "last_30_days": "0.00",
                      "last_7_days": "0.00",
                      "lifetime": "0.00"
                    }
                  },
                  "email": "marcus@shinetime.example",
                  "id": "user_xxxxxxxxxxxxxx",
                  "level": {
                    "applied_level": 1,
                    "levels": [
                      {
                        "level": 0,
                        "minimum_spend": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "processing_rate_percentage": 2.7,
                        "regional_rates": [
                          {
                            "processing_rate_percentage": 1.7,
                            "region": "us_and_canada"
                          }
                        ]
                      }
                    ],
                    "monthly_ads_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_card_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_qualifying_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_trading_volume": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "points": 41000,
                    "points_by_source": {
                      "ads": 0,
                      "cards": 40000,
                      "partners": 0,
                      "trading": 1000
                    },
                    "points_to_next": 59000,
                    "resets_at": "2026-01-01T12:00:00.000Z"
                  },
                  "name": "Marcus Webb",
                  "profile_picture": {
                    "url": "https://ui-avatars.com/api/"
                  },
                  "social_links": [
                    {
                      "url": "https://www.instagram.com/tanyacole.details",
                      "username": "tanyacole.details",
                      "verified": true,
                      "website": "x"
                    }
                  ],
                  "state": "Texas",
                  "total_usd": "6320.75",
                  "trading": {
                    "account_id": "account_id",
                    "hyperliquid": {
                      "address": "address",
                      "depositable": "depositable",
                      "margin_summary": {
                        "account_value": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_margin_used": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_position_notional": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "withdrawable": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        }
                      },
                      "positions": [
                        {
                          "entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "hyperliquid": {
                            "cumulative_funding": {
                              "all_time": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_change": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_open": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              }
                            },
                            "leverage": {
                              "type": "cross",
                              "value": 1
                            },
                            "liquidation_price": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "margin_used": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "return_on_equity": "return_on_equity"
                          },
                          "id": "id",
                          "market": "market",
                          "object": "trading_position",
                          "position_value": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "side": "long",
                          "size": "size",
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          }
                        }
                      ],
                      "websocket_subscriptions": [
                        {
                          "channel": "clearinghouse_state",
                          "message": "message"
                        }
                      ],
                      "websocket_url": "websocket_url"
                    },
                    "id": "id",
                    "object": "trading_account",
                    "provider": "hyperliquid",
                    "spot": {
                      "holdings": [
                        {
                          "average_entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "cost_basis": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "market": "market",
                          "realized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl_percentage": null
                        }
                      ]
                    },
                    "user_id": "user_id"
                  },
                  "username": "marcuswebb",
                  "verification": {
                    "business": null,
                    "individual": null
                  },
                  "whop_partner_enabled_at": "2026-01-01T12:00:00.000Z",
                  "whop_partner_onboarded_accounts_count": 1,
                  "whop_partner_verified_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = User(
            balance: Nullable<UserBalance>.value(UserBalance(
                businesses: [
                    UserBalanceBusiness(
                        balanceUsd: "18940.25",
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://assets.whop.com/logos/shine-time-auto-detailing.png"),
                        name: Nullable<String>.value("Shine Time Auto Detailing")
                    )
                ],
                businessesTotalUsd: "18940.25",
                cash: [
                    UserBalanceCash(
                        balance: 4385.75,
                        balanceUsd: 4385.75,
                        currency: "usd",
                        inTransitBalanceUsd: 0,
                        pendingBalanceUsd: 310,
                        priceUsd: .null,
                        reserveBalanceUsd: 125,
                        totalWithdrawableBalance: 4385.75
                    )
                ],
                cashUsd: "4820.75",
                crypto: [
                    UserBalanceToken(
                        balance: "1500.0",
                        breakdown: AccountBalanceBreakdown(
                            available: "1500.0",
                            finishingSettlement: "0",
                            inTransit: "0",
                            pending: "0",
                            pendingSettlements: [
                                AccountBalanceSettlement(
                                    amount: "0.0",
                                    date: "2026-01-01"
                                )
                            ],
                            reserve: "0"
                        ),
                        iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                        name: Nullable<String>.value("Tether USD"),
                        priceUsd: Nullable<Double>.value(1),
                        symbol: "USDT",
                        valueUsd: 1500
                    )
                ],
                cryptoUsd: "1500.00",
                pendingUsd: "310.00",
                totalUsd: "6320.75",
                treasuryPendingUsd: "0.00"
            )),
            balanceHistory: Nullable<UserBalanceHistory>.value(UserBalanceHistory(
                data: [
                    UserBalanceHistoryPoint(
                        t: 1767268800,
                        v: 2400
                    )
                ],
                last: 6320.75,
                max: 6320.75,
                min: 2400
            )),
            balances: [
                AccountBalanceToken(
                    balance: "1500.0",
                    breakdown: AccountBalanceBreakdown(
                        available: "1500.0",
                        finishingSettlement: "0",
                        inTransit: "0",
                        pending: "0",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "0.0",
                                date: "2026-01-01"
                            )
                        ],
                        reserve: "0"
                    ),
                    iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                    name: "Tether USD",
                    priceUsd: Nullable<Double>.value(1),
                    symbol: "USDT",
                    valueUsd: Nullable<String>.value("1500.00")
                )
            ],
            banner: Nullable<UserBanner>.value(UserBanner(
                url: "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            )),
            bio: Nullable<String>.value("Ceramic coating specialist. Detailing cars in Austin since 2016."),
            cards: Nullable<AccountCards>.value(AccountCards(
                kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                status: AccountCardsStatus.approved
            )),
            city: Nullable<String>.value("Austin"),
            country: Nullable<String>.value("US"),
            createdAt: "2026-01-01T12:00:00.000Z",
            dateOfBirth: Nullable<String>.value("date_of_birth"),
            earningsUsd: Nullable<UserEarnings>.value(UserEarnings(
                firstEarnedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                ownedAccounts: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "0.00",
                    last7Days: "0.00",
                    lifetime: "0.00"
                ),
                partners: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "0.00",
                    last7Days: "0.00",
                    lifetime: "0.00"
                ),
                personal: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "0.00",
                    last7Days: "0.00",
                    lifetime: "0.00"
                ),
                total: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "0.00",
                    last7Days: "0.00",
                    lifetime: "0.00"
                )
            )),
            email: Nullable<String>.value("marcus@shinetime.example"),
            id: "user_xxxxxxxxxxxxxx",
            level: Nullable<OwnerLevel>.value(OwnerLevel(
                appliedLevel: 1,
                levels: [
                    AccountProcessingOfferLevel(
                        level: 0,
                        minimumSpend: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        processingRatePercentage: 2.7,
                        regionalRates: [
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.7,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            )
                        ]
                    )
                ],
                monthlyAdsSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyCardSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyQualifyingSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyTradingVolume: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                points: 41000,
                pointsBySource: OwnerLevelPoints(
                    ads: 0,
                    cards: 40000,
                    partners: 0,
                    trading: 1000
                ),
                pointsToNext: Nullable<Int>.value(59000),
                resetsAt: "2026-01-01T12:00:00.000Z"
            )),
            name: Nullable<String>.value("Marcus Webb"),
            profilePicture: UserProfilePicture(
                url: "https://ui-avatars.com/api/"
            ),
            socialLinks: [
                UserSocialLink(
                    url: "https://www.instagram.com/tanyacole.details",
                    username: Nullable<String>.value("tanyacole.details"),
                    verified: true,
                    website: UserSocialLinkWebsite.x
                )
            ],
            state: Nullable<String>.value("Texas"),
            totalUsd: Nullable<String>.value("6320.75"),
            trading: Nullable<TradingAccount>.value(TradingAccount(
                accountId: Nullable<String>.value("account_id"),
                hyperliquid: Nullable<TradingHyperliquidAccount>.value(TradingHyperliquidAccount(
                    address: "address",
                    depositable: Nullable<String>.value("depositable"),
                    marginSummary: Nullable<TradingMarginSummary>.value(TradingMarginSummary(
                        accountValue: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalMarginUsed: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalPositionNotional: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        withdrawable: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )
                    )),
                    positions: Nullable<[TradingPosition]>.value([
                        TradingPosition(
                            entryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            hyperliquid: Nullable<TradingHyperliquidPosition>.value(TradingHyperliquidPosition(
                                cumulativeFunding: TradingCumulativeFunding(
                                    allTime: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceChange: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceOpen: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    ))
                                ),
                                leverage: TradingPositionLeverage(
                                    type: TradingPositionLeverageType.cross,
                                    value: 1
                                ),
                                liquidationPrice: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                marginUsed: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ),
                                returnOnEquity: "return_on_equity"
                            )),
                            id: "id",
                            market: "market",
                            object: TradingPositionObject.tradingPosition,
                            positionValue: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            side: TradingPositionSide.long,
                            size: "size",
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )
                        )
                    ]),
                    websocketSubscriptions: [
                        TradingWebsocketSubscription(
                            channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                            message: "message"
                        )
                    ],
                    websocketUrl: "websocket_url"
                )),
                id: "id",
                object: TradingAccountObject.tradingAccount,
                provider: TradingAccountProvider.hyperliquid,
                spot: Nullable<TradingSpotAccount>.value(TradingSpotAccount(
                    holdings: [
                        TradingSpotHolding(
                            averageEntryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            costBasis: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            market: "market",
                            realizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnlPercentage: .null
                        )
                    ]
                )),
                userId: Nullable<String>.value("user_id")
            )),
            username: "marcuswebb",
            verification: [
                "business": JSONValue.value, 
                "individual": JSONValue.value
            ],
            whopPartnerEnabledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            whopPartnerOnboardedAccountsCount: Nullable<Int>.value(1),
            whopPartnerVerifiedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
        )
        let response = try await client.users.updateMe(
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func updateMe2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "balance": {
                    "businesses": [
                      {
                        "balance_usd": "balance_usd",
                        "id": "id",
                        "logo_url": "logo_url",
                        "name": "name"
                      },
                      {
                        "balance_usd": "balance_usd",
                        "id": "id",
                        "logo_url": "logo_url",
                        "name": "name"
                      }
                    ],
                    "businesses_total_usd": "businesses_total_usd",
                    "cash": [
                      {
                        "balance": 1.1,
                        "balance_usd": 1.1,
                        "currency": "currency",
                        "in_transit_balance_usd": 1.1,
                        "pending_balance_usd": 1.1,
                        "price_usd": 1.1,
                        "reserve_balance_usd": 1.1,
                        "total_withdrawable_balance": 1.1
                      },
                      {
                        "balance": 1.1,
                        "balance_usd": 1.1,
                        "currency": "currency",
                        "in_transit_balance_usd": 1.1,
                        "pending_balance_usd": 1.1,
                        "price_usd": 1.1,
                        "reserve_balance_usd": 1.1,
                        "total_withdrawable_balance": 1.1
                      }
                    ],
                    "cash_usd": "cash_usd",
                    "crypto": [
                      {
                        "balance": "balance",
                        "breakdown": {
                          "available": "available",
                          "finishing_settlement": "finishing_settlement",
                          "in_transit": "in_transit",
                          "pending": "pending",
                          "pending_settlements": [
                            {
                              "amount": "amount",
                              "date": "date"
                            },
                            {
                              "amount": "amount",
                              "date": "date"
                            }
                          ],
                          "reserve": "reserve"
                        },
                        "icon_url": "icon_url",
                        "name": "name",
                        "price_usd": 1.1,
                        "symbol": "symbol",
                        "value_usd": 1.1
                      },
                      {
                        "balance": "balance",
                        "breakdown": {
                          "available": "available",
                          "finishing_settlement": "finishing_settlement",
                          "in_transit": "in_transit",
                          "pending": "pending",
                          "pending_settlements": [
                            {
                              "amount": "amount",
                              "date": "date"
                            },
                            {
                              "amount": "amount",
                              "date": "date"
                            }
                          ],
                          "reserve": "reserve"
                        },
                        "icon_url": "icon_url",
                        "name": "name",
                        "price_usd": 1.1,
                        "symbol": "symbol",
                        "value_usd": 1.1
                      }
                    ],
                    "crypto_usd": "crypto_usd",
                    "pending_usd": "pending_usd",
                    "total_usd": "total_usd",
                    "treasury_pending_usd": "treasury_pending_usd"
                  },
                  "balance_history": {
                    "data": [
                      {
                        "t": 1,
                        "v": 1.1
                      },
                      {
                        "t": 1,
                        "v": 1.1
                      }
                    ],
                    "last": 1.1,
                    "max": 1.1,
                    "min": 1.1
                  },
                  "balances": [
                    {
                      "balance": "balance",
                      "breakdown": {
                        "available": "available",
                        "finishing_settlement": "finishing_settlement",
                        "in_transit": "in_transit",
                        "pending": "pending",
                        "pending_settlements": [
                          {
                            "amount": "amount",
                            "date": "date"
                          },
                          {
                            "amount": "amount",
                            "date": "date"
                          }
                        ],
                        "reserve": "reserve"
                      },
                      "icon_url": "icon_url",
                      "name": "name",
                      "price_usd": 1.1,
                      "symbol": "symbol",
                      "value_usd": "value_usd"
                    },
                    {
                      "balance": "balance",
                      "breakdown": {
                        "available": "available",
                        "finishing_settlement": "finishing_settlement",
                        "in_transit": "in_transit",
                        "pending": "pending",
                        "pending_settlements": [
                          {
                            "amount": "amount",
                            "date": "date"
                          },
                          {
                            "amount": "amount",
                            "date": "date"
                          }
                        ],
                        "reserve": "reserve"
                      },
                      "icon_url": "icon_url",
                      "name": "name",
                      "price_usd": 1.1,
                      "symbol": "symbol",
                      "value_usd": "value_usd"
                    }
                  ],
                  "banner": {
                    "url": "url"
                  },
                  "bio": "bio",
                  "cards": {
                    "kind": "individual",
                    "status": "approved"
                  },
                  "city": "city",
                  "country": "country",
                  "created_at": "created_at",
                  "date_of_birth": "date_of_birth",
                  "earnings_usd": {
                    "first_earned_at": "first_earned_at",
                    "owned_accounts": {
                      "last_24_hours": "last_24_hours",
                      "last_30_days": "last_30_days",
                      "last_7_days": "last_7_days",
                      "lifetime": "lifetime"
                    },
                    "partners": {
                      "last_24_hours": "last_24_hours",
                      "last_30_days": "last_30_days",
                      "last_7_days": "last_7_days",
                      "lifetime": "lifetime"
                    },
                    "personal": {
                      "last_24_hours": "last_24_hours",
                      "last_30_days": "last_30_days",
                      "last_7_days": "last_7_days",
                      "lifetime": "lifetime"
                    },
                    "total": {
                      "last_24_hours": "last_24_hours",
                      "last_30_days": "last_30_days",
                      "last_7_days": "last_7_days",
                      "lifetime": "lifetime"
                    }
                  },
                  "email": "email",
                  "id": "id",
                  "level": {
                    "applied_level": 1,
                    "levels": [
                      {
                        "level": 1,
                        "minimum_spend": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "processing_rate_percentage": 1.1,
                        "regional_rates": [
                          {
                            "processing_rate_percentage": 1.1,
                            "region": "us_and_canada"
                          },
                          {
                            "processing_rate_percentage": 1.1,
                            "region": "us_and_canada"
                          }
                        ]
                      },
                      {
                        "level": 1,
                        "minimum_spend": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "processing_rate_percentage": 1.1,
                        "regional_rates": [
                          {
                            "processing_rate_percentage": 1.1,
                            "region": "us_and_canada"
                          },
                          {
                            "processing_rate_percentage": 1.1,
                            "region": "us_and_canada"
                          }
                        ]
                      }
                    ],
                    "monthly_ads_spend": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "monthly_card_spend": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "monthly_qualifying_spend": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "monthly_trading_volume": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "points": 1,
                    "points_by_source": {
                      "ads": 1,
                      "cards": 1,
                      "partners": 1,
                      "trading": 1
                    },
                    "points_to_next": 1,
                    "resets_at": "resets_at"
                  },
                  "name": "name",
                  "profile_picture": {
                    "url": "url"
                  },
                  "social_links": [
                    {
                      "url": "url",
                      "username": "username",
                      "verified": true,
                      "website": "x"
                    },
                    {
                      "url": "url",
                      "username": "username",
                      "verified": true,
                      "website": "x"
                    }
                  ],
                  "state": "state",
                  "total_usd": "total_usd",
                  "trading": {
                    "account_id": "account_id",
                    "hyperliquid": {
                      "address": "address",
                      "depositable": "depositable",
                      "margin_summary": {
                        "account_value": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "total_margin_used": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "total_position_notional": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "withdrawable": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        }
                      },
                      "positions": [
                        {
                          "entry_price": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "hyperliquid": null,
                          "id": "id",
                          "market": "market",
                          "object": "trading_position",
                          "position_value": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "side": "long",
                          "size": "size",
                          "unrealized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          }
                        },
                        {
                          "entry_price": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "hyperliquid": null,
                          "id": "id",
                          "market": "market",
                          "object": "trading_position",
                          "position_value": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "side": "long",
                          "size": "size",
                          "unrealized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          }
                        }
                      ],
                      "websocket_subscriptions": [
                        {
                          "channel": "clearinghouse_state",
                          "message": "message"
                        },
                        {
                          "channel": "clearinghouse_state",
                          "message": "message"
                        }
                      ],
                      "websocket_url": "websocket_url"
                    },
                    "id": "id",
                    "object": "trading_account",
                    "provider": "hyperliquid",
                    "spot": {
                      "holdings": [
                        {
                          "average_entry_price": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "cost_basis": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "market": "market",
                          "realized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "unrealized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "unrealized_pnl_percentage": 1.1
                        },
                        {
                          "average_entry_price": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "cost_basis": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "market": "market",
                          "realized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "unrealized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "unrealized_pnl_percentage": 1.1
                        }
                      ]
                    },
                    "user_id": "user_id"
                  },
                  "username": "username",
                  "verification": {
                    "verification": {
                      "key": "value"
                    }
                  },
                  "whop_partner_enabled_at": "whop_partner_enabled_at",
                  "whop_partner_onboarded_accounts_count": 1,
                  "whop_partner_verified_at": "whop_partner_verified_at"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = User(
            balance: Nullable<UserBalance>.value(UserBalance(
                businesses: [
                    UserBalanceBusiness(
                        balanceUsd: "balance_usd",
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        name: Nullable<String>.value("name")
                    ),
                    UserBalanceBusiness(
                        balanceUsd: "balance_usd",
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        name: Nullable<String>.value("name")
                    )
                ],
                businessesTotalUsd: "businesses_total_usd",
                cash: [
                    UserBalanceCash(
                        balance: 1.1,
                        balanceUsd: 1.1,
                        currency: "currency",
                        inTransitBalanceUsd: 1.1,
                        pendingBalanceUsd: 1.1,
                        priceUsd: Nullable<Double>.value(1.1),
                        reserveBalanceUsd: 1.1,
                        totalWithdrawableBalance: 1.1
                    ),
                    UserBalanceCash(
                        balance: 1.1,
                        balanceUsd: 1.1,
                        currency: "currency",
                        inTransitBalanceUsd: 1.1,
                        pendingBalanceUsd: 1.1,
                        priceUsd: Nullable<Double>.value(1.1),
                        reserveBalanceUsd: 1.1,
                        totalWithdrawableBalance: 1.1
                    )
                ],
                cashUsd: "cash_usd",
                crypto: [
                    UserBalanceToken(
                        balance: "balance",
                        breakdown: AccountBalanceBreakdown(
                            available: "available",
                            finishingSettlement: "finishing_settlement",
                            inTransit: "in_transit",
                            pending: "pending",
                            pendingSettlements: [
                                AccountBalanceSettlement(
                                    amount: "amount",
                                    date: "date"
                                ),
                                AccountBalanceSettlement(
                                    amount: "amount",
                                    date: "date"
                                )
                            ],
                            reserve: "reserve"
                        ),
                        iconUrl: Nullable<String>.value("icon_url"),
                        name: Nullable<String>.value("name"),
                        priceUsd: Nullable<Double>.value(1.1),
                        symbol: "symbol",
                        valueUsd: 1.1
                    ),
                    UserBalanceToken(
                        balance: "balance",
                        breakdown: AccountBalanceBreakdown(
                            available: "available",
                            finishingSettlement: "finishing_settlement",
                            inTransit: "in_transit",
                            pending: "pending",
                            pendingSettlements: [
                                AccountBalanceSettlement(
                                    amount: "amount",
                                    date: "date"
                                ),
                                AccountBalanceSettlement(
                                    amount: "amount",
                                    date: "date"
                                )
                            ],
                            reserve: "reserve"
                        ),
                        iconUrl: Nullable<String>.value("icon_url"),
                        name: Nullable<String>.value("name"),
                        priceUsd: Nullable<Double>.value(1.1),
                        symbol: "symbol",
                        valueUsd: 1.1
                    )
                ],
                cryptoUsd: "crypto_usd",
                pendingUsd: "pending_usd",
                totalUsd: "total_usd",
                treasuryPendingUsd: "treasury_pending_usd"
            )),
            balanceHistory: Nullable<UserBalanceHistory>.value(UserBalanceHistory(
                data: [
                    UserBalanceHistoryPoint(
                        t: 1,
                        v: 1.1
                    ),
                    UserBalanceHistoryPoint(
                        t: 1,
                        v: 1.1
                    )
                ],
                last: 1.1,
                max: 1.1,
                min: 1.1
            )),
            balances: [
                AccountBalanceToken(
                    balance: "balance",
                    breakdown: AccountBalanceBreakdown(
                        available: "available",
                        finishingSettlement: "finishing_settlement",
                        inTransit: "in_transit",
                        pending: "pending",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "amount",
                                date: "date"
                            ),
                            AccountBalanceSettlement(
                                amount: "amount",
                                date: "date"
                            )
                        ],
                        reserve: "reserve"
                    ),
                    iconUrl: Nullable<String>.value("icon_url"),
                    name: "name",
                    priceUsd: Nullable<Double>.value(1.1),
                    symbol: "symbol",
                    valueUsd: Nullable<String>.value("value_usd")
                ),
                AccountBalanceToken(
                    balance: "balance",
                    breakdown: AccountBalanceBreakdown(
                        available: "available",
                        finishingSettlement: "finishing_settlement",
                        inTransit: "in_transit",
                        pending: "pending",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "amount",
                                date: "date"
                            ),
                            AccountBalanceSettlement(
                                amount: "amount",
                                date: "date"
                            )
                        ],
                        reserve: "reserve"
                    ),
                    iconUrl: Nullable<String>.value("icon_url"),
                    name: "name",
                    priceUsd: Nullable<Double>.value(1.1),
                    symbol: "symbol",
                    valueUsd: Nullable<String>.value("value_usd")
                )
            ],
            banner: Nullable<UserBanner>.value(UserBanner(
                url: "url"
            )),
            bio: Nullable<String>.value("bio"),
            cards: Nullable<AccountCards>.value(AccountCards(
                kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                status: AccountCardsStatus.approved
            )),
            city: Nullable<String>.value("city"),
            country: Nullable<String>.value("country"),
            createdAt: "created_at",
            dateOfBirth: Nullable<String>.value("date_of_birth"),
            earningsUsd: Nullable<UserEarnings>.value(UserEarnings(
                firstEarnedAt: Nullable<String>.value("first_earned_at"),
                ownedAccounts: UserEarningsAmount(
                    last24Hours: "last_24_hours",
                    last30Days: "last_30_days",
                    last7Days: "last_7_days",
                    lifetime: "lifetime"
                ),
                partners: UserEarningsAmount(
                    last24Hours: "last_24_hours",
                    last30Days: "last_30_days",
                    last7Days: "last_7_days",
                    lifetime: "lifetime"
                ),
                personal: UserEarningsAmount(
                    last24Hours: "last_24_hours",
                    last30Days: "last_30_days",
                    last7Days: "last_7_days",
                    lifetime: "lifetime"
                ),
                total: UserEarningsAmount(
                    last24Hours: "last_24_hours",
                    last30Days: "last_30_days",
                    last7Days: "last_7_days",
                    lifetime: "lifetime"
                )
            )),
            email: Nullable<String>.value("email"),
            id: "id",
            level: Nullable<OwnerLevel>.value(OwnerLevel(
                appliedLevel: 1,
                levels: [
                    AccountProcessingOfferLevel(
                        level: 1,
                        minimumSpend: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        processingRatePercentage: 1.1,
                        regionalRates: [
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.1,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            ),
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.1,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            )
                        ]
                    ),
                    AccountProcessingOfferLevel(
                        level: 1,
                        minimumSpend: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        processingRatePercentage: 1.1,
                        regionalRates: [
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.1,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            ),
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.1,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            )
                        ]
                    )
                ],
                monthlyAdsSpend: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                monthlyCardSpend: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                monthlyQualifyingSpend: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                monthlyTradingVolume: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                points: 1,
                pointsBySource: OwnerLevelPoints(
                    ads: 1,
                    cards: 1,
                    partners: 1,
                    trading: 1
                ),
                pointsToNext: Nullable<Int>.value(1),
                resetsAt: "resets_at"
            )),
            name: Nullable<String>.value("name"),
            profilePicture: UserProfilePicture(
                url: "url"
            ),
            socialLinks: [
                UserSocialLink(
                    url: "url",
                    username: Nullable<String>.value("username"),
                    verified: true,
                    website: UserSocialLinkWebsite.x
                ),
                UserSocialLink(
                    url: "url",
                    username: Nullable<String>.value("username"),
                    verified: true,
                    website: UserSocialLinkWebsite.x
                )
            ],
            state: Nullable<String>.value("state"),
            totalUsd: Nullable<String>.value("total_usd"),
            trading: Nullable<TradingAccount>.value(TradingAccount(
                accountId: Nullable<String>.value("account_id"),
                hyperliquid: Nullable<TradingHyperliquidAccount>.value(TradingHyperliquidAccount(
                    address: "address",
                    depositable: Nullable<String>.value("depositable"),
                    marginSummary: Nullable<TradingMarginSummary>.value(TradingMarginSummary(
                        accountValue: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        totalMarginUsed: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        totalPositionNotional: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        withdrawable: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )
                    )),
                    positions: Nullable<[TradingPosition]>.value([
                        TradingPosition(
                            entryPrice: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            hyperliquid: .null,
                            id: "id",
                            market: "market",
                            object: TradingPositionObject.tradingPosition,
                            positionValue: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            side: TradingPositionSide.long,
                            size: "size",
                            unrealizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )
                        ),
                        TradingPosition(
                            entryPrice: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            hyperliquid: .null,
                            id: "id",
                            market: "market",
                            object: TradingPositionObject.tradingPosition,
                            positionValue: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            side: TradingPositionSide.long,
                            size: "size",
                            unrealizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )
                        )
                    ]),
                    websocketSubscriptions: [
                        TradingWebsocketSubscription(
                            channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                            message: "message"
                        ),
                        TradingWebsocketSubscription(
                            channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                            message: "message"
                        )
                    ],
                    websocketUrl: "websocket_url"
                )),
                id: "id",
                object: TradingAccountObject.tradingAccount,
                provider: TradingAccountProvider.hyperliquid,
                spot: Nullable<TradingSpotAccount>.value(TradingSpotAccount(
                    holdings: [
                        TradingSpotHolding(
                            averageEntryPrice: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            costBasis: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            market: "market",
                            realizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            unrealizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            unrealizedPnlPercentage: Nullable<Double>.value(1.1)
                        ),
                        TradingSpotHolding(
                            averageEntryPrice: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            costBasis: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            market: "market",
                            realizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            unrealizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            unrealizedPnlPercentage: Nullable<Double>.value(1.1)
                        )
                    ]
                )),
                userId: Nullable<String>.value("user_id")
            )),
            username: "username",
            verification: [
                "verification": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            whopPartnerEnabledAt: Nullable<String>.value("whop_partner_enabled_at"),
            whopPartnerOnboardedAccountsCount: Nullable<Int>.value(1),
            whopPartnerVerifiedAt: Nullable<String>.value("whop_partner_verified_at")
        )
        let response = try await client.users.updateMe(
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
                  "balance": {
                    "businesses": [
                      {
                        "balance_usd": "18940.25",
                        "id": "biz_xxxxxxxxxxxxxx",
                        "logo_url": "https://assets.whop.com/logos/shine-time-auto-detailing.png",
                        "name": "Shine Time Auto Detailing"
                      }
                    ],
                    "businesses_total_usd": "18940.25",
                    "cash": [
                      {
                        "balance": 4385.75,
                        "balance_usd": 4385.75,
                        "currency": "usd",
                        "in_transit_balance_usd": 0,
                        "pending_balance_usd": 310,
                        "price_usd": null,
                        "reserve_balance_usd": 125,
                        "total_withdrawable_balance": 4385.75
                      }
                    ],
                    "cash_usd": "4820.75",
                    "crypto": [
                      {
                        "balance": "1500.0",
                        "breakdown": {
                          "available": "1500.0",
                          "finishing_settlement": "0",
                          "in_transit": "0",
                          "pending": "0",
                          "pending_settlements": [
                            {
                              "amount": "0.0",
                              "date": "2026-01-01"
                            }
                          ],
                          "reserve": "0"
                        },
                        "icon_url": "https://assets.whop.com/tokens/usdt.png",
                        "name": "Tether USD",
                        "price_usd": 1,
                        "symbol": "USDT",
                        "value_usd": 1500
                      }
                    ],
                    "crypto_usd": "1500.00",
                    "pending_usd": "310.00",
                    "total_usd": "6320.75",
                    "treasury_pending_usd": "0.00"
                  },
                  "balance_history": {
                    "data": [
                      {
                        "t": 1767268800,
                        "v": 2400
                      }
                    ],
                    "last": 6320.75,
                    "max": 6320.75,
                    "min": 2400
                  },
                  "balances": [
                    {
                      "balance": "1500.0",
                      "breakdown": {
                        "available": "1500.0",
                        "finishing_settlement": "0",
                        "in_transit": "0",
                        "pending": "0",
                        "pending_settlements": [
                          {
                            "amount": "0.0",
                            "date": "2026-01-01"
                          }
                        ],
                        "reserve": "0"
                      },
                      "icon_url": "https://assets.whop.com/tokens/usdt.png",
                      "name": "Tether USD",
                      "price_usd": 1,
                      "symbol": "USDT",
                      "value_usd": "1500.00"
                    }
                  ],
                  "banner": {
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "bio": "Ceramic coating specialist. Detailing cars in Austin since 2016.",
                  "cards": {
                    "kind": "individual",
                    "status": "approved"
                  },
                  "city": "Austin",
                  "country": "US",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "date_of_birth": "date_of_birth",
                  "earnings_usd": {
                    "first_earned_at": "2026-01-01T12:00:00.000Z",
                    "owned_accounts": {
                      "last_24_hours": "0.00",
                      "last_30_days": "0.00",
                      "last_7_days": "0.00",
                      "lifetime": "0.00"
                    },
                    "partners": {
                      "last_24_hours": "0.00",
                      "last_30_days": "0.00",
                      "last_7_days": "0.00",
                      "lifetime": "0.00"
                    },
                    "personal": {
                      "last_24_hours": "0.00",
                      "last_30_days": "0.00",
                      "last_7_days": "0.00",
                      "lifetime": "0.00"
                    },
                    "total": {
                      "last_24_hours": "0.00",
                      "last_30_days": "0.00",
                      "last_7_days": "0.00",
                      "lifetime": "0.00"
                    }
                  },
                  "email": "marcus@shinetime.example",
                  "id": "user_xxxxxxxxxxxxxx",
                  "level": {
                    "applied_level": 1,
                    "levels": [
                      {
                        "level": 0,
                        "minimum_spend": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "processing_rate_percentage": 2.7,
                        "regional_rates": [
                          {
                            "processing_rate_percentage": 1.7,
                            "region": "us_and_canada"
                          }
                        ]
                      }
                    ],
                    "monthly_ads_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_card_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_qualifying_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_trading_volume": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "points": 41000,
                    "points_by_source": {
                      "ads": 0,
                      "cards": 40000,
                      "partners": 0,
                      "trading": 1000
                    },
                    "points_to_next": 59000,
                    "resets_at": "2026-01-01T12:00:00.000Z"
                  },
                  "name": "Marcus Webb",
                  "profile_picture": {
                    "url": "https://ui-avatars.com/api/"
                  },
                  "social_links": [
                    {
                      "url": "https://www.instagram.com/tanyacole.details",
                      "username": "tanyacole.details",
                      "verified": true,
                      "website": "x"
                    }
                  ],
                  "state": "Texas",
                  "total_usd": "6320.75",
                  "trading": {
                    "account_id": "account_id",
                    "hyperliquid": {
                      "address": "address",
                      "depositable": "depositable",
                      "margin_summary": {
                        "account_value": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_margin_used": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_position_notional": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "withdrawable": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        }
                      },
                      "positions": [
                        {
                          "entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "hyperliquid": {
                            "cumulative_funding": {
                              "all_time": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_change": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_open": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              }
                            },
                            "leverage": {
                              "type": "cross",
                              "value": 1
                            },
                            "liquidation_price": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "margin_used": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "return_on_equity": "return_on_equity"
                          },
                          "id": "id",
                          "market": "market",
                          "object": "trading_position",
                          "position_value": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "side": "long",
                          "size": "size",
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          }
                        }
                      ],
                      "websocket_subscriptions": [
                        {
                          "channel": "clearinghouse_state",
                          "message": "message"
                        }
                      ],
                      "websocket_url": "websocket_url"
                    },
                    "id": "id",
                    "object": "trading_account",
                    "provider": "hyperliquid",
                    "spot": {
                      "holdings": [
                        {
                          "average_entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "cost_basis": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "market": "market",
                          "realized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl_percentage": null
                        }
                      ]
                    },
                    "user_id": "user_id"
                  },
                  "username": "marcuswebb",
                  "verification": {
                    "business": null,
                    "individual": null
                  },
                  "whop_partner_enabled_at": "2026-01-01T12:00:00.000Z",
                  "whop_partner_onboarded_accounts_count": 1,
                  "whop_partner_verified_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = User(
            balance: Nullable<UserBalance>.value(UserBalance(
                businesses: [
                    UserBalanceBusiness(
                        balanceUsd: "18940.25",
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://assets.whop.com/logos/shine-time-auto-detailing.png"),
                        name: Nullable<String>.value("Shine Time Auto Detailing")
                    )
                ],
                businessesTotalUsd: "18940.25",
                cash: [
                    UserBalanceCash(
                        balance: 4385.75,
                        balanceUsd: 4385.75,
                        currency: "usd",
                        inTransitBalanceUsd: 0,
                        pendingBalanceUsd: 310,
                        priceUsd: .null,
                        reserveBalanceUsd: 125,
                        totalWithdrawableBalance: 4385.75
                    )
                ],
                cashUsd: "4820.75",
                crypto: [
                    UserBalanceToken(
                        balance: "1500.0",
                        breakdown: AccountBalanceBreakdown(
                            available: "1500.0",
                            finishingSettlement: "0",
                            inTransit: "0",
                            pending: "0",
                            pendingSettlements: [
                                AccountBalanceSettlement(
                                    amount: "0.0",
                                    date: "2026-01-01"
                                )
                            ],
                            reserve: "0"
                        ),
                        iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                        name: Nullable<String>.value("Tether USD"),
                        priceUsd: Nullable<Double>.value(1),
                        symbol: "USDT",
                        valueUsd: 1500
                    )
                ],
                cryptoUsd: "1500.00",
                pendingUsd: "310.00",
                totalUsd: "6320.75",
                treasuryPendingUsd: "0.00"
            )),
            balanceHistory: Nullable<UserBalanceHistory>.value(UserBalanceHistory(
                data: [
                    UserBalanceHistoryPoint(
                        t: 1767268800,
                        v: 2400
                    )
                ],
                last: 6320.75,
                max: 6320.75,
                min: 2400
            )),
            balances: [
                AccountBalanceToken(
                    balance: "1500.0",
                    breakdown: AccountBalanceBreakdown(
                        available: "1500.0",
                        finishingSettlement: "0",
                        inTransit: "0",
                        pending: "0",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "0.0",
                                date: "2026-01-01"
                            )
                        ],
                        reserve: "0"
                    ),
                    iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                    name: "Tether USD",
                    priceUsd: Nullable<Double>.value(1),
                    symbol: "USDT",
                    valueUsd: Nullable<String>.value("1500.00")
                )
            ],
            banner: Nullable<UserBanner>.value(UserBanner(
                url: "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            )),
            bio: Nullable<String>.value("Ceramic coating specialist. Detailing cars in Austin since 2016."),
            cards: Nullable<AccountCards>.value(AccountCards(
                kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                status: AccountCardsStatus.approved
            )),
            city: Nullable<String>.value("Austin"),
            country: Nullable<String>.value("US"),
            createdAt: "2026-01-01T12:00:00.000Z",
            dateOfBirth: Nullable<String>.value("date_of_birth"),
            earningsUsd: Nullable<UserEarnings>.value(UserEarnings(
                firstEarnedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                ownedAccounts: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "0.00",
                    last7Days: "0.00",
                    lifetime: "0.00"
                ),
                partners: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "0.00",
                    last7Days: "0.00",
                    lifetime: "0.00"
                ),
                personal: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "0.00",
                    last7Days: "0.00",
                    lifetime: "0.00"
                ),
                total: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "0.00",
                    last7Days: "0.00",
                    lifetime: "0.00"
                )
            )),
            email: Nullable<String>.value("marcus@shinetime.example"),
            id: "user_xxxxxxxxxxxxxx",
            level: Nullable<OwnerLevel>.value(OwnerLevel(
                appliedLevel: 1,
                levels: [
                    AccountProcessingOfferLevel(
                        level: 0,
                        minimumSpend: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        processingRatePercentage: 2.7,
                        regionalRates: [
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.7,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            )
                        ]
                    )
                ],
                monthlyAdsSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyCardSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyQualifyingSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyTradingVolume: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                points: 41000,
                pointsBySource: OwnerLevelPoints(
                    ads: 0,
                    cards: 40000,
                    partners: 0,
                    trading: 1000
                ),
                pointsToNext: Nullable<Int>.value(59000),
                resetsAt: "2026-01-01T12:00:00.000Z"
            )),
            name: Nullable<String>.value("Marcus Webb"),
            profilePicture: UserProfilePicture(
                url: "https://ui-avatars.com/api/"
            ),
            socialLinks: [
                UserSocialLink(
                    url: "https://www.instagram.com/tanyacole.details",
                    username: Nullable<String>.value("tanyacole.details"),
                    verified: true,
                    website: UserSocialLinkWebsite.x
                )
            ],
            state: Nullable<String>.value("Texas"),
            totalUsd: Nullable<String>.value("6320.75"),
            trading: Nullable<TradingAccount>.value(TradingAccount(
                accountId: Nullable<String>.value("account_id"),
                hyperliquid: Nullable<TradingHyperliquidAccount>.value(TradingHyperliquidAccount(
                    address: "address",
                    depositable: Nullable<String>.value("depositable"),
                    marginSummary: Nullable<TradingMarginSummary>.value(TradingMarginSummary(
                        accountValue: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalMarginUsed: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalPositionNotional: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        withdrawable: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )
                    )),
                    positions: Nullable<[TradingPosition]>.value([
                        TradingPosition(
                            entryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            hyperliquid: Nullable<TradingHyperliquidPosition>.value(TradingHyperliquidPosition(
                                cumulativeFunding: TradingCumulativeFunding(
                                    allTime: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceChange: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceOpen: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    ))
                                ),
                                leverage: TradingPositionLeverage(
                                    type: TradingPositionLeverageType.cross,
                                    value: 1
                                ),
                                liquidationPrice: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                marginUsed: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ),
                                returnOnEquity: "return_on_equity"
                            )),
                            id: "id",
                            market: "market",
                            object: TradingPositionObject.tradingPosition,
                            positionValue: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            side: TradingPositionSide.long,
                            size: "size",
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )
                        )
                    ]),
                    websocketSubscriptions: [
                        TradingWebsocketSubscription(
                            channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                            message: "message"
                        )
                    ],
                    websocketUrl: "websocket_url"
                )),
                id: "id",
                object: TradingAccountObject.tradingAccount,
                provider: TradingAccountProvider.hyperliquid,
                spot: Nullable<TradingSpotAccount>.value(TradingSpotAccount(
                    holdings: [
                        TradingSpotHolding(
                            averageEntryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            costBasis: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            market: "market",
                            realizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnlPercentage: .null
                        )
                    ]
                )),
                userId: Nullable<String>.value("user_id")
            )),
            username: "marcuswebb",
            verification: [
                "business": JSONValue.value, 
                "individual": JSONValue.value
            ],
            whopPartnerEnabledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            whopPartnerOnboardedAccountsCount: Nullable<Int>.value(1),
            whopPartnerVerifiedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
        )
        let response = try await client.users.retrieve(
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
                  "balance": {
                    "businesses": [
                      {
                        "balance_usd": "balance_usd",
                        "id": "id",
                        "logo_url": "logo_url",
                        "name": "name"
                      },
                      {
                        "balance_usd": "balance_usd",
                        "id": "id",
                        "logo_url": "logo_url",
                        "name": "name"
                      }
                    ],
                    "businesses_total_usd": "businesses_total_usd",
                    "cash": [
                      {
                        "balance": 1.1,
                        "balance_usd": 1.1,
                        "currency": "currency",
                        "in_transit_balance_usd": 1.1,
                        "pending_balance_usd": 1.1,
                        "price_usd": 1.1,
                        "reserve_balance_usd": 1.1,
                        "total_withdrawable_balance": 1.1
                      },
                      {
                        "balance": 1.1,
                        "balance_usd": 1.1,
                        "currency": "currency",
                        "in_transit_balance_usd": 1.1,
                        "pending_balance_usd": 1.1,
                        "price_usd": 1.1,
                        "reserve_balance_usd": 1.1,
                        "total_withdrawable_balance": 1.1
                      }
                    ],
                    "cash_usd": "cash_usd",
                    "crypto": [
                      {
                        "balance": "balance",
                        "breakdown": {
                          "available": "available",
                          "finishing_settlement": "finishing_settlement",
                          "in_transit": "in_transit",
                          "pending": "pending",
                          "pending_settlements": [
                            {
                              "amount": "amount",
                              "date": "date"
                            },
                            {
                              "amount": "amount",
                              "date": "date"
                            }
                          ],
                          "reserve": "reserve"
                        },
                        "icon_url": "icon_url",
                        "name": "name",
                        "price_usd": 1.1,
                        "symbol": "symbol",
                        "value_usd": 1.1
                      },
                      {
                        "balance": "balance",
                        "breakdown": {
                          "available": "available",
                          "finishing_settlement": "finishing_settlement",
                          "in_transit": "in_transit",
                          "pending": "pending",
                          "pending_settlements": [
                            {
                              "amount": "amount",
                              "date": "date"
                            },
                            {
                              "amount": "amount",
                              "date": "date"
                            }
                          ],
                          "reserve": "reserve"
                        },
                        "icon_url": "icon_url",
                        "name": "name",
                        "price_usd": 1.1,
                        "symbol": "symbol",
                        "value_usd": 1.1
                      }
                    ],
                    "crypto_usd": "crypto_usd",
                    "pending_usd": "pending_usd",
                    "total_usd": "total_usd",
                    "treasury_pending_usd": "treasury_pending_usd"
                  },
                  "balance_history": {
                    "data": [
                      {
                        "t": 1,
                        "v": 1.1
                      },
                      {
                        "t": 1,
                        "v": 1.1
                      }
                    ],
                    "last": 1.1,
                    "max": 1.1,
                    "min": 1.1
                  },
                  "balances": [
                    {
                      "balance": "balance",
                      "breakdown": {
                        "available": "available",
                        "finishing_settlement": "finishing_settlement",
                        "in_transit": "in_transit",
                        "pending": "pending",
                        "pending_settlements": [
                          {
                            "amount": "amount",
                            "date": "date"
                          },
                          {
                            "amount": "amount",
                            "date": "date"
                          }
                        ],
                        "reserve": "reserve"
                      },
                      "icon_url": "icon_url",
                      "name": "name",
                      "price_usd": 1.1,
                      "symbol": "symbol",
                      "value_usd": "value_usd"
                    },
                    {
                      "balance": "balance",
                      "breakdown": {
                        "available": "available",
                        "finishing_settlement": "finishing_settlement",
                        "in_transit": "in_transit",
                        "pending": "pending",
                        "pending_settlements": [
                          {
                            "amount": "amount",
                            "date": "date"
                          },
                          {
                            "amount": "amount",
                            "date": "date"
                          }
                        ],
                        "reserve": "reserve"
                      },
                      "icon_url": "icon_url",
                      "name": "name",
                      "price_usd": 1.1,
                      "symbol": "symbol",
                      "value_usd": "value_usd"
                    }
                  ],
                  "banner": {
                    "url": "url"
                  },
                  "bio": "bio",
                  "cards": {
                    "kind": "individual",
                    "status": "approved"
                  },
                  "city": "city",
                  "country": "country",
                  "created_at": "created_at",
                  "date_of_birth": "date_of_birth",
                  "earnings_usd": {
                    "first_earned_at": "first_earned_at",
                    "owned_accounts": {
                      "last_24_hours": "last_24_hours",
                      "last_30_days": "last_30_days",
                      "last_7_days": "last_7_days",
                      "lifetime": "lifetime"
                    },
                    "partners": {
                      "last_24_hours": "last_24_hours",
                      "last_30_days": "last_30_days",
                      "last_7_days": "last_7_days",
                      "lifetime": "lifetime"
                    },
                    "personal": {
                      "last_24_hours": "last_24_hours",
                      "last_30_days": "last_30_days",
                      "last_7_days": "last_7_days",
                      "lifetime": "lifetime"
                    },
                    "total": {
                      "last_24_hours": "last_24_hours",
                      "last_30_days": "last_30_days",
                      "last_7_days": "last_7_days",
                      "lifetime": "lifetime"
                    }
                  },
                  "email": "email",
                  "id": "id",
                  "level": {
                    "applied_level": 1,
                    "levels": [
                      {
                        "level": 1,
                        "minimum_spend": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "processing_rate_percentage": 1.1,
                        "regional_rates": [
                          {
                            "processing_rate_percentage": 1.1,
                            "region": "us_and_canada"
                          },
                          {
                            "processing_rate_percentage": 1.1,
                            "region": "us_and_canada"
                          }
                        ]
                      },
                      {
                        "level": 1,
                        "minimum_spend": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "processing_rate_percentage": 1.1,
                        "regional_rates": [
                          {
                            "processing_rate_percentage": 1.1,
                            "region": "us_and_canada"
                          },
                          {
                            "processing_rate_percentage": 1.1,
                            "region": "us_and_canada"
                          }
                        ]
                      }
                    ],
                    "monthly_ads_spend": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "monthly_card_spend": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "monthly_qualifying_spend": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "monthly_trading_volume": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "points": 1,
                    "points_by_source": {
                      "ads": 1,
                      "cards": 1,
                      "partners": 1,
                      "trading": 1
                    },
                    "points_to_next": 1,
                    "resets_at": "resets_at"
                  },
                  "name": "name",
                  "profile_picture": {
                    "url": "url"
                  },
                  "social_links": [
                    {
                      "url": "url",
                      "username": "username",
                      "verified": true,
                      "website": "x"
                    },
                    {
                      "url": "url",
                      "username": "username",
                      "verified": true,
                      "website": "x"
                    }
                  ],
                  "state": "state",
                  "total_usd": "total_usd",
                  "trading": {
                    "account_id": "account_id",
                    "hyperliquid": {
                      "address": "address",
                      "depositable": "depositable",
                      "margin_summary": {
                        "account_value": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "total_margin_used": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "total_position_notional": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "withdrawable": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        }
                      },
                      "positions": [
                        {
                          "entry_price": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "hyperliquid": null,
                          "id": "id",
                          "market": "market",
                          "object": "trading_position",
                          "position_value": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "side": "long",
                          "size": "size",
                          "unrealized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          }
                        },
                        {
                          "entry_price": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "hyperliquid": null,
                          "id": "id",
                          "market": "market",
                          "object": "trading_position",
                          "position_value": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "side": "long",
                          "size": "size",
                          "unrealized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          }
                        }
                      ],
                      "websocket_subscriptions": [
                        {
                          "channel": "clearinghouse_state",
                          "message": "message"
                        },
                        {
                          "channel": "clearinghouse_state",
                          "message": "message"
                        }
                      ],
                      "websocket_url": "websocket_url"
                    },
                    "id": "id",
                    "object": "trading_account",
                    "provider": "hyperliquid",
                    "spot": {
                      "holdings": [
                        {
                          "average_entry_price": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "cost_basis": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "market": "market",
                          "realized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "unrealized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "unrealized_pnl_percentage": 1.1
                        },
                        {
                          "average_entry_price": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "cost_basis": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "market": "market",
                          "realized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "unrealized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "unrealized_pnl_percentage": 1.1
                        }
                      ]
                    },
                    "user_id": "user_id"
                  },
                  "username": "username",
                  "verification": {
                    "verification": {
                      "key": "value"
                    }
                  },
                  "whop_partner_enabled_at": "whop_partner_enabled_at",
                  "whop_partner_onboarded_accounts_count": 1,
                  "whop_partner_verified_at": "whop_partner_verified_at"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = User(
            balance: Nullable<UserBalance>.value(UserBalance(
                businesses: [
                    UserBalanceBusiness(
                        balanceUsd: "balance_usd",
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        name: Nullable<String>.value("name")
                    ),
                    UserBalanceBusiness(
                        balanceUsd: "balance_usd",
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        name: Nullable<String>.value("name")
                    )
                ],
                businessesTotalUsd: "businesses_total_usd",
                cash: [
                    UserBalanceCash(
                        balance: 1.1,
                        balanceUsd: 1.1,
                        currency: "currency",
                        inTransitBalanceUsd: 1.1,
                        pendingBalanceUsd: 1.1,
                        priceUsd: Nullable<Double>.value(1.1),
                        reserveBalanceUsd: 1.1,
                        totalWithdrawableBalance: 1.1
                    ),
                    UserBalanceCash(
                        balance: 1.1,
                        balanceUsd: 1.1,
                        currency: "currency",
                        inTransitBalanceUsd: 1.1,
                        pendingBalanceUsd: 1.1,
                        priceUsd: Nullable<Double>.value(1.1),
                        reserveBalanceUsd: 1.1,
                        totalWithdrawableBalance: 1.1
                    )
                ],
                cashUsd: "cash_usd",
                crypto: [
                    UserBalanceToken(
                        balance: "balance",
                        breakdown: AccountBalanceBreakdown(
                            available: "available",
                            finishingSettlement: "finishing_settlement",
                            inTransit: "in_transit",
                            pending: "pending",
                            pendingSettlements: [
                                AccountBalanceSettlement(
                                    amount: "amount",
                                    date: "date"
                                ),
                                AccountBalanceSettlement(
                                    amount: "amount",
                                    date: "date"
                                )
                            ],
                            reserve: "reserve"
                        ),
                        iconUrl: Nullable<String>.value("icon_url"),
                        name: Nullable<String>.value("name"),
                        priceUsd: Nullable<Double>.value(1.1),
                        symbol: "symbol",
                        valueUsd: 1.1
                    ),
                    UserBalanceToken(
                        balance: "balance",
                        breakdown: AccountBalanceBreakdown(
                            available: "available",
                            finishingSettlement: "finishing_settlement",
                            inTransit: "in_transit",
                            pending: "pending",
                            pendingSettlements: [
                                AccountBalanceSettlement(
                                    amount: "amount",
                                    date: "date"
                                ),
                                AccountBalanceSettlement(
                                    amount: "amount",
                                    date: "date"
                                )
                            ],
                            reserve: "reserve"
                        ),
                        iconUrl: Nullable<String>.value("icon_url"),
                        name: Nullable<String>.value("name"),
                        priceUsd: Nullable<Double>.value(1.1),
                        symbol: "symbol",
                        valueUsd: 1.1
                    )
                ],
                cryptoUsd: "crypto_usd",
                pendingUsd: "pending_usd",
                totalUsd: "total_usd",
                treasuryPendingUsd: "treasury_pending_usd"
            )),
            balanceHistory: Nullable<UserBalanceHistory>.value(UserBalanceHistory(
                data: [
                    UserBalanceHistoryPoint(
                        t: 1,
                        v: 1.1
                    ),
                    UserBalanceHistoryPoint(
                        t: 1,
                        v: 1.1
                    )
                ],
                last: 1.1,
                max: 1.1,
                min: 1.1
            )),
            balances: [
                AccountBalanceToken(
                    balance: "balance",
                    breakdown: AccountBalanceBreakdown(
                        available: "available",
                        finishingSettlement: "finishing_settlement",
                        inTransit: "in_transit",
                        pending: "pending",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "amount",
                                date: "date"
                            ),
                            AccountBalanceSettlement(
                                amount: "amount",
                                date: "date"
                            )
                        ],
                        reserve: "reserve"
                    ),
                    iconUrl: Nullable<String>.value("icon_url"),
                    name: "name",
                    priceUsd: Nullable<Double>.value(1.1),
                    symbol: "symbol",
                    valueUsd: Nullable<String>.value("value_usd")
                ),
                AccountBalanceToken(
                    balance: "balance",
                    breakdown: AccountBalanceBreakdown(
                        available: "available",
                        finishingSettlement: "finishing_settlement",
                        inTransit: "in_transit",
                        pending: "pending",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "amount",
                                date: "date"
                            ),
                            AccountBalanceSettlement(
                                amount: "amount",
                                date: "date"
                            )
                        ],
                        reserve: "reserve"
                    ),
                    iconUrl: Nullable<String>.value("icon_url"),
                    name: "name",
                    priceUsd: Nullable<Double>.value(1.1),
                    symbol: "symbol",
                    valueUsd: Nullable<String>.value("value_usd")
                )
            ],
            banner: Nullable<UserBanner>.value(UserBanner(
                url: "url"
            )),
            bio: Nullable<String>.value("bio"),
            cards: Nullable<AccountCards>.value(AccountCards(
                kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                status: AccountCardsStatus.approved
            )),
            city: Nullable<String>.value("city"),
            country: Nullable<String>.value("country"),
            createdAt: "created_at",
            dateOfBirth: Nullable<String>.value("date_of_birth"),
            earningsUsd: Nullable<UserEarnings>.value(UserEarnings(
                firstEarnedAt: Nullable<String>.value("first_earned_at"),
                ownedAccounts: UserEarningsAmount(
                    last24Hours: "last_24_hours",
                    last30Days: "last_30_days",
                    last7Days: "last_7_days",
                    lifetime: "lifetime"
                ),
                partners: UserEarningsAmount(
                    last24Hours: "last_24_hours",
                    last30Days: "last_30_days",
                    last7Days: "last_7_days",
                    lifetime: "lifetime"
                ),
                personal: UserEarningsAmount(
                    last24Hours: "last_24_hours",
                    last30Days: "last_30_days",
                    last7Days: "last_7_days",
                    lifetime: "lifetime"
                ),
                total: UserEarningsAmount(
                    last24Hours: "last_24_hours",
                    last30Days: "last_30_days",
                    last7Days: "last_7_days",
                    lifetime: "lifetime"
                )
            )),
            email: Nullable<String>.value("email"),
            id: "id",
            level: Nullable<OwnerLevel>.value(OwnerLevel(
                appliedLevel: 1,
                levels: [
                    AccountProcessingOfferLevel(
                        level: 1,
                        minimumSpend: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        processingRatePercentage: 1.1,
                        regionalRates: [
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.1,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            ),
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.1,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            )
                        ]
                    ),
                    AccountProcessingOfferLevel(
                        level: 1,
                        minimumSpend: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        processingRatePercentage: 1.1,
                        regionalRates: [
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.1,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            ),
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.1,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            )
                        ]
                    )
                ],
                monthlyAdsSpend: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                monthlyCardSpend: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                monthlyQualifyingSpend: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                monthlyTradingVolume: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                points: 1,
                pointsBySource: OwnerLevelPoints(
                    ads: 1,
                    cards: 1,
                    partners: 1,
                    trading: 1
                ),
                pointsToNext: Nullable<Int>.value(1),
                resetsAt: "resets_at"
            )),
            name: Nullable<String>.value("name"),
            profilePicture: UserProfilePicture(
                url: "url"
            ),
            socialLinks: [
                UserSocialLink(
                    url: "url",
                    username: Nullable<String>.value("username"),
                    verified: true,
                    website: UserSocialLinkWebsite.x
                ),
                UserSocialLink(
                    url: "url",
                    username: Nullable<String>.value("username"),
                    verified: true,
                    website: UserSocialLinkWebsite.x
                )
            ],
            state: Nullable<String>.value("state"),
            totalUsd: Nullable<String>.value("total_usd"),
            trading: Nullable<TradingAccount>.value(TradingAccount(
                accountId: Nullable<String>.value("account_id"),
                hyperliquid: Nullable<TradingHyperliquidAccount>.value(TradingHyperliquidAccount(
                    address: "address",
                    depositable: Nullable<String>.value("depositable"),
                    marginSummary: Nullable<TradingMarginSummary>.value(TradingMarginSummary(
                        accountValue: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        totalMarginUsed: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        totalPositionNotional: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        withdrawable: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )
                    )),
                    positions: Nullable<[TradingPosition]>.value([
                        TradingPosition(
                            entryPrice: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            hyperliquid: .null,
                            id: "id",
                            market: "market",
                            object: TradingPositionObject.tradingPosition,
                            positionValue: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            side: TradingPositionSide.long,
                            size: "size",
                            unrealizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )
                        ),
                        TradingPosition(
                            entryPrice: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            hyperliquid: .null,
                            id: "id",
                            market: "market",
                            object: TradingPositionObject.tradingPosition,
                            positionValue: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            side: TradingPositionSide.long,
                            size: "size",
                            unrealizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )
                        )
                    ]),
                    websocketSubscriptions: [
                        TradingWebsocketSubscription(
                            channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                            message: "message"
                        ),
                        TradingWebsocketSubscription(
                            channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                            message: "message"
                        )
                    ],
                    websocketUrl: "websocket_url"
                )),
                id: "id",
                object: TradingAccountObject.tradingAccount,
                provider: TradingAccountProvider.hyperliquid,
                spot: Nullable<TradingSpotAccount>.value(TradingSpotAccount(
                    holdings: [
                        TradingSpotHolding(
                            averageEntryPrice: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            costBasis: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            market: "market",
                            realizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            unrealizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            unrealizedPnlPercentage: Nullable<Double>.value(1.1)
                        ),
                        TradingSpotHolding(
                            averageEntryPrice: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            costBasis: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            market: "market",
                            realizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            unrealizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            unrealizedPnlPercentage: Nullable<Double>.value(1.1)
                        )
                    ]
                )),
                userId: Nullable<String>.value("user_id")
            )),
            username: "username",
            verification: [
                "verification": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            whopPartnerEnabledAt: Nullable<String>.value("whop_partner_enabled_at"),
            whopPartnerOnboardedAccountsCount: Nullable<Int>.value(1),
            whopPartnerVerifiedAt: Nullable<String>.value("whop_partner_verified_at")
        )
        let response = try await client.users.retrieve(
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
                  "balance": {
                    "businesses": [
                      {
                        "balance_usd": "18940.25",
                        "id": "biz_xxxxxxxxxxxxxx",
                        "logo_url": "https://assets.whop.com/logos/shine-time-auto-detailing.png",
                        "name": "Shine Time Auto Detailing"
                      }
                    ],
                    "businesses_total_usd": "18940.25",
                    "cash": [
                      {
                        "balance": 4385.75,
                        "balance_usd": 4385.75,
                        "currency": "usd",
                        "in_transit_balance_usd": 0,
                        "pending_balance_usd": 310,
                        "price_usd": null,
                        "reserve_balance_usd": 125,
                        "total_withdrawable_balance": 4385.75
                      }
                    ],
                    "cash_usd": "4820.75",
                    "crypto": [
                      {
                        "balance": "1500.0",
                        "breakdown": {
                          "available": "1500.0",
                          "finishing_settlement": "0",
                          "in_transit": "0",
                          "pending": "0",
                          "pending_settlements": [
                            {
                              "amount": "0.0",
                              "date": "2026-01-01"
                            }
                          ],
                          "reserve": "0"
                        },
                        "icon_url": "https://assets.whop.com/tokens/usdt.png",
                        "name": "Tether USD",
                        "price_usd": 1,
                        "symbol": "USDT",
                        "value_usd": 1500
                      }
                    ],
                    "crypto_usd": "1500.00",
                    "pending_usd": "310.00",
                    "total_usd": "6320.75",
                    "treasury_pending_usd": "0.00"
                  },
                  "balance_history": {
                    "data": [
                      {
                        "t": 1767268800,
                        "v": 2400
                      }
                    ],
                    "last": 6320.75,
                    "max": 6320.75,
                    "min": 2400
                  },
                  "balances": [
                    {
                      "balance": "1500.0",
                      "breakdown": {
                        "available": "1500.0",
                        "finishing_settlement": "0",
                        "in_transit": "0",
                        "pending": "0",
                        "pending_settlements": [
                          {
                            "amount": "0.0",
                            "date": "2026-01-01"
                          }
                        ],
                        "reserve": "0"
                      },
                      "icon_url": "https://assets.whop.com/tokens/usdt.png",
                      "name": "Tether USD",
                      "price_usd": 1,
                      "symbol": "USDT",
                      "value_usd": "1500.00"
                    }
                  ],
                  "banner": {
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "bio": "Ceramic coating specialist. Detailing cars in Austin since 2016.",
                  "cards": {
                    "kind": "individual",
                    "status": "approved"
                  },
                  "city": "Austin",
                  "country": "US",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "date_of_birth": "date_of_birth",
                  "earnings_usd": {
                    "first_earned_at": "2026-01-01T12:00:00.000Z",
                    "owned_accounts": {
                      "last_24_hours": "0.00",
                      "last_30_days": "0.00",
                      "last_7_days": "0.00",
                      "lifetime": "0.00"
                    },
                    "partners": {
                      "last_24_hours": "0.00",
                      "last_30_days": "0.00",
                      "last_7_days": "0.00",
                      "lifetime": "0.00"
                    },
                    "personal": {
                      "last_24_hours": "0.00",
                      "last_30_days": "0.00",
                      "last_7_days": "0.00",
                      "lifetime": "0.00"
                    },
                    "total": {
                      "last_24_hours": "0.00",
                      "last_30_days": "0.00",
                      "last_7_days": "0.00",
                      "lifetime": "0.00"
                    }
                  },
                  "email": "marcus@shinetime.example",
                  "id": "user_xxxxxxxxxxxxxx",
                  "level": {
                    "applied_level": 1,
                    "levels": [
                      {
                        "level": 0,
                        "minimum_spend": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "processing_rate_percentage": 2.7,
                        "regional_rates": [
                          {
                            "processing_rate_percentage": 1.7,
                            "region": "us_and_canada"
                          }
                        ]
                      }
                    ],
                    "monthly_ads_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_card_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_qualifying_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_trading_volume": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "points": 41000,
                    "points_by_source": {
                      "ads": 0,
                      "cards": 40000,
                      "partners": 0,
                      "trading": 1000
                    },
                    "points_to_next": 59000,
                    "resets_at": "2026-01-01T12:00:00.000Z"
                  },
                  "name": "Marcus Webb",
                  "profile_picture": {
                    "url": "https://ui-avatars.com/api/"
                  },
                  "social_links": [
                    {
                      "url": "https://www.instagram.com/tanyacole.details",
                      "username": "tanyacole.details",
                      "verified": true,
                      "website": "x"
                    }
                  ],
                  "state": "Texas",
                  "total_usd": "6320.75",
                  "trading": {
                    "account_id": "account_id",
                    "hyperliquid": {
                      "address": "address",
                      "depositable": "depositable",
                      "margin_summary": {
                        "account_value": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_margin_used": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_position_notional": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "withdrawable": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        }
                      },
                      "positions": [
                        {
                          "entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "hyperliquid": {
                            "cumulative_funding": {
                              "all_time": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_change": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_open": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              }
                            },
                            "leverage": {
                              "type": "cross",
                              "value": 1
                            },
                            "liquidation_price": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "margin_used": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "return_on_equity": "return_on_equity"
                          },
                          "id": "id",
                          "market": "market",
                          "object": "trading_position",
                          "position_value": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "side": "long",
                          "size": "size",
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          }
                        }
                      ],
                      "websocket_subscriptions": [
                        {
                          "channel": "clearinghouse_state",
                          "message": "message"
                        }
                      ],
                      "websocket_url": "websocket_url"
                    },
                    "id": "id",
                    "object": "trading_account",
                    "provider": "hyperliquid",
                    "spot": {
                      "holdings": [
                        {
                          "average_entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "cost_basis": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "market": "market",
                          "realized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl_percentage": null
                        }
                      ]
                    },
                    "user_id": "user_id"
                  },
                  "username": "marcuswebb",
                  "verification": {
                    "business": null,
                    "individual": null
                  },
                  "whop_partner_enabled_at": "2026-01-01T12:00:00.000Z",
                  "whop_partner_onboarded_accounts_count": 1,
                  "whop_partner_verified_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = User(
            balance: Nullable<UserBalance>.value(UserBalance(
                businesses: [
                    UserBalanceBusiness(
                        balanceUsd: "18940.25",
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://assets.whop.com/logos/shine-time-auto-detailing.png"),
                        name: Nullable<String>.value("Shine Time Auto Detailing")
                    )
                ],
                businessesTotalUsd: "18940.25",
                cash: [
                    UserBalanceCash(
                        balance: 4385.75,
                        balanceUsd: 4385.75,
                        currency: "usd",
                        inTransitBalanceUsd: 0,
                        pendingBalanceUsd: 310,
                        priceUsd: .null,
                        reserveBalanceUsd: 125,
                        totalWithdrawableBalance: 4385.75
                    )
                ],
                cashUsd: "4820.75",
                crypto: [
                    UserBalanceToken(
                        balance: "1500.0",
                        breakdown: AccountBalanceBreakdown(
                            available: "1500.0",
                            finishingSettlement: "0",
                            inTransit: "0",
                            pending: "0",
                            pendingSettlements: [
                                AccountBalanceSettlement(
                                    amount: "0.0",
                                    date: "2026-01-01"
                                )
                            ],
                            reserve: "0"
                        ),
                        iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                        name: Nullable<String>.value("Tether USD"),
                        priceUsd: Nullable<Double>.value(1),
                        symbol: "USDT",
                        valueUsd: 1500
                    )
                ],
                cryptoUsd: "1500.00",
                pendingUsd: "310.00",
                totalUsd: "6320.75",
                treasuryPendingUsd: "0.00"
            )),
            balanceHistory: Nullable<UserBalanceHistory>.value(UserBalanceHistory(
                data: [
                    UserBalanceHistoryPoint(
                        t: 1767268800,
                        v: 2400
                    )
                ],
                last: 6320.75,
                max: 6320.75,
                min: 2400
            )),
            balances: [
                AccountBalanceToken(
                    balance: "1500.0",
                    breakdown: AccountBalanceBreakdown(
                        available: "1500.0",
                        finishingSettlement: "0",
                        inTransit: "0",
                        pending: "0",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "0.0",
                                date: "2026-01-01"
                            )
                        ],
                        reserve: "0"
                    ),
                    iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                    name: "Tether USD",
                    priceUsd: Nullable<Double>.value(1),
                    symbol: "USDT",
                    valueUsd: Nullable<String>.value("1500.00")
                )
            ],
            banner: Nullable<UserBanner>.value(UserBanner(
                url: "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            )),
            bio: Nullable<String>.value("Ceramic coating specialist. Detailing cars in Austin since 2016."),
            cards: Nullable<AccountCards>.value(AccountCards(
                kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                status: AccountCardsStatus.approved
            )),
            city: Nullable<String>.value("Austin"),
            country: Nullable<String>.value("US"),
            createdAt: "2026-01-01T12:00:00.000Z",
            dateOfBirth: Nullable<String>.value("date_of_birth"),
            earningsUsd: Nullable<UserEarnings>.value(UserEarnings(
                firstEarnedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                ownedAccounts: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "0.00",
                    last7Days: "0.00",
                    lifetime: "0.00"
                ),
                partners: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "0.00",
                    last7Days: "0.00",
                    lifetime: "0.00"
                ),
                personal: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "0.00",
                    last7Days: "0.00",
                    lifetime: "0.00"
                ),
                total: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "0.00",
                    last7Days: "0.00",
                    lifetime: "0.00"
                )
            )),
            email: Nullable<String>.value("marcus@shinetime.example"),
            id: "user_xxxxxxxxxxxxxx",
            level: Nullable<OwnerLevel>.value(OwnerLevel(
                appliedLevel: 1,
                levels: [
                    AccountProcessingOfferLevel(
                        level: 0,
                        minimumSpend: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        processingRatePercentage: 2.7,
                        regionalRates: [
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.7,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            )
                        ]
                    )
                ],
                monthlyAdsSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyCardSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyQualifyingSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyTradingVolume: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                points: 41000,
                pointsBySource: OwnerLevelPoints(
                    ads: 0,
                    cards: 40000,
                    partners: 0,
                    trading: 1000
                ),
                pointsToNext: Nullable<Int>.value(59000),
                resetsAt: "2026-01-01T12:00:00.000Z"
            )),
            name: Nullable<String>.value("Marcus Webb"),
            profilePicture: UserProfilePicture(
                url: "https://ui-avatars.com/api/"
            ),
            socialLinks: [
                UserSocialLink(
                    url: "https://www.instagram.com/tanyacole.details",
                    username: Nullable<String>.value("tanyacole.details"),
                    verified: true,
                    website: UserSocialLinkWebsite.x
                )
            ],
            state: Nullable<String>.value("Texas"),
            totalUsd: Nullable<String>.value("6320.75"),
            trading: Nullable<TradingAccount>.value(TradingAccount(
                accountId: Nullable<String>.value("account_id"),
                hyperliquid: Nullable<TradingHyperliquidAccount>.value(TradingHyperliquidAccount(
                    address: "address",
                    depositable: Nullable<String>.value("depositable"),
                    marginSummary: Nullable<TradingMarginSummary>.value(TradingMarginSummary(
                        accountValue: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalMarginUsed: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalPositionNotional: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        withdrawable: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )
                    )),
                    positions: Nullable<[TradingPosition]>.value([
                        TradingPosition(
                            entryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            hyperliquid: Nullable<TradingHyperliquidPosition>.value(TradingHyperliquidPosition(
                                cumulativeFunding: TradingCumulativeFunding(
                                    allTime: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceChange: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceOpen: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    ))
                                ),
                                leverage: TradingPositionLeverage(
                                    type: TradingPositionLeverageType.cross,
                                    value: 1
                                ),
                                liquidationPrice: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                marginUsed: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ),
                                returnOnEquity: "return_on_equity"
                            )),
                            id: "id",
                            market: "market",
                            object: TradingPositionObject.tradingPosition,
                            positionValue: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            side: TradingPositionSide.long,
                            size: "size",
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )
                        )
                    ]),
                    websocketSubscriptions: [
                        TradingWebsocketSubscription(
                            channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                            message: "message"
                        )
                    ],
                    websocketUrl: "websocket_url"
                )),
                id: "id",
                object: TradingAccountObject.tradingAccount,
                provider: TradingAccountProvider.hyperliquid,
                spot: Nullable<TradingSpotAccount>.value(TradingSpotAccount(
                    holdings: [
                        TradingSpotHolding(
                            averageEntryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            costBasis: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            market: "market",
                            realizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnlPercentage: .null
                        )
                    ]
                )),
                userId: Nullable<String>.value("user_id")
            )),
            username: "marcuswebb",
            verification: [
                "business": JSONValue.value, 
                "individual": JSONValue.value
            ],
            whopPartnerEnabledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            whopPartnerOnboardedAccountsCount: Nullable<Int>.value(1),
            whopPartnerVerifiedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
        )
        let response = try await client.users.update(
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
                  "balance": {
                    "businesses": [
                      {
                        "balance_usd": "balance_usd",
                        "id": "id",
                        "logo_url": "logo_url",
                        "name": "name"
                      },
                      {
                        "balance_usd": "balance_usd",
                        "id": "id",
                        "logo_url": "logo_url",
                        "name": "name"
                      }
                    ],
                    "businesses_total_usd": "businesses_total_usd",
                    "cash": [
                      {
                        "balance": 1.1,
                        "balance_usd": 1.1,
                        "currency": "currency",
                        "in_transit_balance_usd": 1.1,
                        "pending_balance_usd": 1.1,
                        "price_usd": 1.1,
                        "reserve_balance_usd": 1.1,
                        "total_withdrawable_balance": 1.1
                      },
                      {
                        "balance": 1.1,
                        "balance_usd": 1.1,
                        "currency": "currency",
                        "in_transit_balance_usd": 1.1,
                        "pending_balance_usd": 1.1,
                        "price_usd": 1.1,
                        "reserve_balance_usd": 1.1,
                        "total_withdrawable_balance": 1.1
                      }
                    ],
                    "cash_usd": "cash_usd",
                    "crypto": [
                      {
                        "balance": "balance",
                        "breakdown": {
                          "available": "available",
                          "finishing_settlement": "finishing_settlement",
                          "in_transit": "in_transit",
                          "pending": "pending",
                          "pending_settlements": [
                            {
                              "amount": "amount",
                              "date": "date"
                            },
                            {
                              "amount": "amount",
                              "date": "date"
                            }
                          ],
                          "reserve": "reserve"
                        },
                        "icon_url": "icon_url",
                        "name": "name",
                        "price_usd": 1.1,
                        "symbol": "symbol",
                        "value_usd": 1.1
                      },
                      {
                        "balance": "balance",
                        "breakdown": {
                          "available": "available",
                          "finishing_settlement": "finishing_settlement",
                          "in_transit": "in_transit",
                          "pending": "pending",
                          "pending_settlements": [
                            {
                              "amount": "amount",
                              "date": "date"
                            },
                            {
                              "amount": "amount",
                              "date": "date"
                            }
                          ],
                          "reserve": "reserve"
                        },
                        "icon_url": "icon_url",
                        "name": "name",
                        "price_usd": 1.1,
                        "symbol": "symbol",
                        "value_usd": 1.1
                      }
                    ],
                    "crypto_usd": "crypto_usd",
                    "pending_usd": "pending_usd",
                    "total_usd": "total_usd",
                    "treasury_pending_usd": "treasury_pending_usd"
                  },
                  "balance_history": {
                    "data": [
                      {
                        "t": 1,
                        "v": 1.1
                      },
                      {
                        "t": 1,
                        "v": 1.1
                      }
                    ],
                    "last": 1.1,
                    "max": 1.1,
                    "min": 1.1
                  },
                  "balances": [
                    {
                      "balance": "balance",
                      "breakdown": {
                        "available": "available",
                        "finishing_settlement": "finishing_settlement",
                        "in_transit": "in_transit",
                        "pending": "pending",
                        "pending_settlements": [
                          {
                            "amount": "amount",
                            "date": "date"
                          },
                          {
                            "amount": "amount",
                            "date": "date"
                          }
                        ],
                        "reserve": "reserve"
                      },
                      "icon_url": "icon_url",
                      "name": "name",
                      "price_usd": 1.1,
                      "symbol": "symbol",
                      "value_usd": "value_usd"
                    },
                    {
                      "balance": "balance",
                      "breakdown": {
                        "available": "available",
                        "finishing_settlement": "finishing_settlement",
                        "in_transit": "in_transit",
                        "pending": "pending",
                        "pending_settlements": [
                          {
                            "amount": "amount",
                            "date": "date"
                          },
                          {
                            "amount": "amount",
                            "date": "date"
                          }
                        ],
                        "reserve": "reserve"
                      },
                      "icon_url": "icon_url",
                      "name": "name",
                      "price_usd": 1.1,
                      "symbol": "symbol",
                      "value_usd": "value_usd"
                    }
                  ],
                  "banner": {
                    "url": "url"
                  },
                  "bio": "bio",
                  "cards": {
                    "kind": "individual",
                    "status": "approved"
                  },
                  "city": "city",
                  "country": "country",
                  "created_at": "created_at",
                  "date_of_birth": "date_of_birth",
                  "earnings_usd": {
                    "first_earned_at": "first_earned_at",
                    "owned_accounts": {
                      "last_24_hours": "last_24_hours",
                      "last_30_days": "last_30_days",
                      "last_7_days": "last_7_days",
                      "lifetime": "lifetime"
                    },
                    "partners": {
                      "last_24_hours": "last_24_hours",
                      "last_30_days": "last_30_days",
                      "last_7_days": "last_7_days",
                      "lifetime": "lifetime"
                    },
                    "personal": {
                      "last_24_hours": "last_24_hours",
                      "last_30_days": "last_30_days",
                      "last_7_days": "last_7_days",
                      "lifetime": "lifetime"
                    },
                    "total": {
                      "last_24_hours": "last_24_hours",
                      "last_30_days": "last_30_days",
                      "last_7_days": "last_7_days",
                      "lifetime": "lifetime"
                    }
                  },
                  "email": "email",
                  "id": "id",
                  "level": {
                    "applied_level": 1,
                    "levels": [
                      {
                        "level": 1,
                        "minimum_spend": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "processing_rate_percentage": 1.1,
                        "regional_rates": [
                          {
                            "processing_rate_percentage": 1.1,
                            "region": "us_and_canada"
                          },
                          {
                            "processing_rate_percentage": 1.1,
                            "region": "us_and_canada"
                          }
                        ]
                      },
                      {
                        "level": 1,
                        "minimum_spend": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "processing_rate_percentage": 1.1,
                        "regional_rates": [
                          {
                            "processing_rate_percentage": 1.1,
                            "region": "us_and_canada"
                          },
                          {
                            "processing_rate_percentage": 1.1,
                            "region": "us_and_canada"
                          }
                        ]
                      }
                    ],
                    "monthly_ads_spend": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "monthly_card_spend": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "monthly_qualifying_spend": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "monthly_trading_volume": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "points": 1,
                    "points_by_source": {
                      "ads": 1,
                      "cards": 1,
                      "partners": 1,
                      "trading": 1
                    },
                    "points_to_next": 1,
                    "resets_at": "resets_at"
                  },
                  "name": "name",
                  "profile_picture": {
                    "url": "url"
                  },
                  "social_links": [
                    {
                      "url": "url",
                      "username": "username",
                      "verified": true,
                      "website": "x"
                    },
                    {
                      "url": "url",
                      "username": "username",
                      "verified": true,
                      "website": "x"
                    }
                  ],
                  "state": "state",
                  "total_usd": "total_usd",
                  "trading": {
                    "account_id": "account_id",
                    "hyperliquid": {
                      "address": "address",
                      "depositable": "depositable",
                      "margin_summary": {
                        "account_value": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "total_margin_used": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "total_position_notional": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "withdrawable": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        }
                      },
                      "positions": [
                        {
                          "entry_price": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "hyperliquid": null,
                          "id": "id",
                          "market": "market",
                          "object": "trading_position",
                          "position_value": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "side": "long",
                          "size": "size",
                          "unrealized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          }
                        },
                        {
                          "entry_price": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "hyperliquid": null,
                          "id": "id",
                          "market": "market",
                          "object": "trading_position",
                          "position_value": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "side": "long",
                          "size": "size",
                          "unrealized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          }
                        }
                      ],
                      "websocket_subscriptions": [
                        {
                          "channel": "clearinghouse_state",
                          "message": "message"
                        },
                        {
                          "channel": "clearinghouse_state",
                          "message": "message"
                        }
                      ],
                      "websocket_url": "websocket_url"
                    },
                    "id": "id",
                    "object": "trading_account",
                    "provider": "hyperliquid",
                    "spot": {
                      "holdings": [
                        {
                          "average_entry_price": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "cost_basis": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "market": "market",
                          "realized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "unrealized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "unrealized_pnl_percentage": 1.1
                        },
                        {
                          "average_entry_price": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "cost_basis": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "market": "market",
                          "realized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "unrealized_pnl": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "unrealized_pnl_percentage": 1.1
                        }
                      ]
                    },
                    "user_id": "user_id"
                  },
                  "username": "username",
                  "verification": {
                    "verification": {
                      "key": "value"
                    }
                  },
                  "whop_partner_enabled_at": "whop_partner_enabled_at",
                  "whop_partner_onboarded_accounts_count": 1,
                  "whop_partner_verified_at": "whop_partner_verified_at"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = User(
            balance: Nullable<UserBalance>.value(UserBalance(
                businesses: [
                    UserBalanceBusiness(
                        balanceUsd: "balance_usd",
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        name: Nullable<String>.value("name")
                    ),
                    UserBalanceBusiness(
                        balanceUsd: "balance_usd",
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        name: Nullable<String>.value("name")
                    )
                ],
                businessesTotalUsd: "businesses_total_usd",
                cash: [
                    UserBalanceCash(
                        balance: 1.1,
                        balanceUsd: 1.1,
                        currency: "currency",
                        inTransitBalanceUsd: 1.1,
                        pendingBalanceUsd: 1.1,
                        priceUsd: Nullable<Double>.value(1.1),
                        reserveBalanceUsd: 1.1,
                        totalWithdrawableBalance: 1.1
                    ),
                    UserBalanceCash(
                        balance: 1.1,
                        balanceUsd: 1.1,
                        currency: "currency",
                        inTransitBalanceUsd: 1.1,
                        pendingBalanceUsd: 1.1,
                        priceUsd: Nullable<Double>.value(1.1),
                        reserveBalanceUsd: 1.1,
                        totalWithdrawableBalance: 1.1
                    )
                ],
                cashUsd: "cash_usd",
                crypto: [
                    UserBalanceToken(
                        balance: "balance",
                        breakdown: AccountBalanceBreakdown(
                            available: "available",
                            finishingSettlement: "finishing_settlement",
                            inTransit: "in_transit",
                            pending: "pending",
                            pendingSettlements: [
                                AccountBalanceSettlement(
                                    amount: "amount",
                                    date: "date"
                                ),
                                AccountBalanceSettlement(
                                    amount: "amount",
                                    date: "date"
                                )
                            ],
                            reserve: "reserve"
                        ),
                        iconUrl: Nullable<String>.value("icon_url"),
                        name: Nullable<String>.value("name"),
                        priceUsd: Nullable<Double>.value(1.1),
                        symbol: "symbol",
                        valueUsd: 1.1
                    ),
                    UserBalanceToken(
                        balance: "balance",
                        breakdown: AccountBalanceBreakdown(
                            available: "available",
                            finishingSettlement: "finishing_settlement",
                            inTransit: "in_transit",
                            pending: "pending",
                            pendingSettlements: [
                                AccountBalanceSettlement(
                                    amount: "amount",
                                    date: "date"
                                ),
                                AccountBalanceSettlement(
                                    amount: "amount",
                                    date: "date"
                                )
                            ],
                            reserve: "reserve"
                        ),
                        iconUrl: Nullable<String>.value("icon_url"),
                        name: Nullable<String>.value("name"),
                        priceUsd: Nullable<Double>.value(1.1),
                        symbol: "symbol",
                        valueUsd: 1.1
                    )
                ],
                cryptoUsd: "crypto_usd",
                pendingUsd: "pending_usd",
                totalUsd: "total_usd",
                treasuryPendingUsd: "treasury_pending_usd"
            )),
            balanceHistory: Nullable<UserBalanceHistory>.value(UserBalanceHistory(
                data: [
                    UserBalanceHistoryPoint(
                        t: 1,
                        v: 1.1
                    ),
                    UserBalanceHistoryPoint(
                        t: 1,
                        v: 1.1
                    )
                ],
                last: 1.1,
                max: 1.1,
                min: 1.1
            )),
            balances: [
                AccountBalanceToken(
                    balance: "balance",
                    breakdown: AccountBalanceBreakdown(
                        available: "available",
                        finishingSettlement: "finishing_settlement",
                        inTransit: "in_transit",
                        pending: "pending",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "amount",
                                date: "date"
                            ),
                            AccountBalanceSettlement(
                                amount: "amount",
                                date: "date"
                            )
                        ],
                        reserve: "reserve"
                    ),
                    iconUrl: Nullable<String>.value("icon_url"),
                    name: "name",
                    priceUsd: Nullable<Double>.value(1.1),
                    symbol: "symbol",
                    valueUsd: Nullable<String>.value("value_usd")
                ),
                AccountBalanceToken(
                    balance: "balance",
                    breakdown: AccountBalanceBreakdown(
                        available: "available",
                        finishingSettlement: "finishing_settlement",
                        inTransit: "in_transit",
                        pending: "pending",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "amount",
                                date: "date"
                            ),
                            AccountBalanceSettlement(
                                amount: "amount",
                                date: "date"
                            )
                        ],
                        reserve: "reserve"
                    ),
                    iconUrl: Nullable<String>.value("icon_url"),
                    name: "name",
                    priceUsd: Nullable<Double>.value(1.1),
                    symbol: "symbol",
                    valueUsd: Nullable<String>.value("value_usd")
                )
            ],
            banner: Nullable<UserBanner>.value(UserBanner(
                url: "url"
            )),
            bio: Nullable<String>.value("bio"),
            cards: Nullable<AccountCards>.value(AccountCards(
                kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                status: AccountCardsStatus.approved
            )),
            city: Nullable<String>.value("city"),
            country: Nullable<String>.value("country"),
            createdAt: "created_at",
            dateOfBirth: Nullable<String>.value("date_of_birth"),
            earningsUsd: Nullable<UserEarnings>.value(UserEarnings(
                firstEarnedAt: Nullable<String>.value("first_earned_at"),
                ownedAccounts: UserEarningsAmount(
                    last24Hours: "last_24_hours",
                    last30Days: "last_30_days",
                    last7Days: "last_7_days",
                    lifetime: "lifetime"
                ),
                partners: UserEarningsAmount(
                    last24Hours: "last_24_hours",
                    last30Days: "last_30_days",
                    last7Days: "last_7_days",
                    lifetime: "lifetime"
                ),
                personal: UserEarningsAmount(
                    last24Hours: "last_24_hours",
                    last30Days: "last_30_days",
                    last7Days: "last_7_days",
                    lifetime: "lifetime"
                ),
                total: UserEarningsAmount(
                    last24Hours: "last_24_hours",
                    last30Days: "last_30_days",
                    last7Days: "last_7_days",
                    lifetime: "lifetime"
                )
            )),
            email: Nullable<String>.value("email"),
            id: "id",
            level: Nullable<OwnerLevel>.value(OwnerLevel(
                appliedLevel: 1,
                levels: [
                    AccountProcessingOfferLevel(
                        level: 1,
                        minimumSpend: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        processingRatePercentage: 1.1,
                        regionalRates: [
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.1,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            ),
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.1,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            )
                        ]
                    ),
                    AccountProcessingOfferLevel(
                        level: 1,
                        minimumSpend: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        processingRatePercentage: 1.1,
                        regionalRates: [
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.1,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            ),
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.1,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            )
                        ]
                    )
                ],
                monthlyAdsSpend: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                monthlyCardSpend: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                monthlyQualifyingSpend: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                monthlyTradingVolume: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                points: 1,
                pointsBySource: OwnerLevelPoints(
                    ads: 1,
                    cards: 1,
                    partners: 1,
                    trading: 1
                ),
                pointsToNext: Nullable<Int>.value(1),
                resetsAt: "resets_at"
            )),
            name: Nullable<String>.value("name"),
            profilePicture: UserProfilePicture(
                url: "url"
            ),
            socialLinks: [
                UserSocialLink(
                    url: "url",
                    username: Nullable<String>.value("username"),
                    verified: true,
                    website: UserSocialLinkWebsite.x
                ),
                UserSocialLink(
                    url: "url",
                    username: Nullable<String>.value("username"),
                    verified: true,
                    website: UserSocialLinkWebsite.x
                )
            ],
            state: Nullable<String>.value("state"),
            totalUsd: Nullable<String>.value("total_usd"),
            trading: Nullable<TradingAccount>.value(TradingAccount(
                accountId: Nullable<String>.value("account_id"),
                hyperliquid: Nullable<TradingHyperliquidAccount>.value(TradingHyperliquidAccount(
                    address: "address",
                    depositable: Nullable<String>.value("depositable"),
                    marginSummary: Nullable<TradingMarginSummary>.value(TradingMarginSummary(
                        accountValue: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        totalMarginUsed: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        totalPositionNotional: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        withdrawable: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )
                    )),
                    positions: Nullable<[TradingPosition]>.value([
                        TradingPosition(
                            entryPrice: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            hyperliquid: .null,
                            id: "id",
                            market: "market",
                            object: TradingPositionObject.tradingPosition,
                            positionValue: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            side: TradingPositionSide.long,
                            size: "size",
                            unrealizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )
                        ),
                        TradingPosition(
                            entryPrice: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            hyperliquid: .null,
                            id: "id",
                            market: "market",
                            object: TradingPositionObject.tradingPosition,
                            positionValue: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            side: TradingPositionSide.long,
                            size: "size",
                            unrealizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )
                        )
                    ]),
                    websocketSubscriptions: [
                        TradingWebsocketSubscription(
                            channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                            message: "message"
                        ),
                        TradingWebsocketSubscription(
                            channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                            message: "message"
                        )
                    ],
                    websocketUrl: "websocket_url"
                )),
                id: "id",
                object: TradingAccountObject.tradingAccount,
                provider: TradingAccountProvider.hyperliquid,
                spot: Nullable<TradingSpotAccount>.value(TradingSpotAccount(
                    holdings: [
                        TradingSpotHolding(
                            averageEntryPrice: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            costBasis: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            market: "market",
                            realizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            unrealizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            unrealizedPnlPercentage: Nullable<Double>.value(1.1)
                        ),
                        TradingSpotHolding(
                            averageEntryPrice: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            costBasis: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            market: "market",
                            realizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            unrealizedPnl: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            unrealizedPnlPercentage: Nullable<Double>.value(1.1)
                        )
                    ]
                )),
                userId: Nullable<String>.value("user_id")
            )),
            username: "username",
            verification: [
                "verification": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            whopPartnerEnabledAt: Nullable<String>.value("whop_partner_enabled_at"),
            whopPartnerOnboardedAccountsCount: Nullable<Int>.value(1),
            whopPartnerVerifiedAt: Nullable<String>.value("whop_partner_verified_at")
        )
        let response = try await client.users.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func checkAccess1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "access_level": "no_access",
                  "has_access": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CheckAccessUsersResponse(
            accessLevel: CheckAccessUsersResponseAccessLevel.noAccess,
            hasAccess: true
        )
        let response = try await client.users.checkAccess(
            id: "id",
            resourceId: "resource_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func checkAccess2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "access_level": "no_access",
                  "has_access": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CheckAccessUsersResponse(
            accessLevel: CheckAccessUsersResponseAccessLevel.noAccess,
            hasAccess: true
        )
        let response = try await client.users.checkAccess(
            id: "id",
            resourceId: "resource_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func recommendActions1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "account_id",
                      "account_name": "account_name",
                      "action": "create_business",
                      "blocked_capabilities": [
                        "blocked_capabilities"
                      ],
                      "cta": "https://whop.com/dashboard/start/",
                      "cta_label": "Create a business",
                      "description": "Launch a store on Whop and start selling in minutes.",
                      "icon_url": "https://whop.com/illustrations/orange/store.svg",
                      "impact_score": 1,
                      "reasoning": "reasoning",
                      "status": "optional",
                      "title": "Start your own business"
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RecommendActionsUsersResponse(
            data: [
                UserRecommendedAction(
                    accountId: Nullable<String>.value("account_id"),
                    accountName: Nullable<String>.value("account_name"),
                    action: UserRecommendedActionAction.createBusiness,
                    blockedCapabilities: [
                        "blocked_capabilities"
                    ],
                    cta: "https://whop.com/dashboard/start/",
                    ctaLabel: "Create a business",
                    description: "Launch a store on Whop and start selling in minutes.",
                    iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/store.svg"),
                    impactScore: Nullable<Int>.value(1),
                    reasoning: Nullable<String>.value("reasoning"),
                    status: UserRecommendedActionStatus.optional,
                    title: "Start your own business"
                )
            ]
        )
        let response = try await client.users.recommendActions(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func recommendActions2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "account_id",
                      "account_name": "account_name",
                      "action": "create_business",
                      "blocked_capabilities": [
                        "blocked_capabilities",
                        "blocked_capabilities"
                      ],
                      "cta": "cta",
                      "cta_label": "cta_label",
                      "description": "description",
                      "icon_url": "icon_url",
                      "impact_score": 1,
                      "reasoning": "reasoning",
                      "status": "optional",
                      "title": "title"
                    },
                    {
                      "account_id": "account_id",
                      "account_name": "account_name",
                      "action": "create_business",
                      "blocked_capabilities": [
                        "blocked_capabilities",
                        "blocked_capabilities"
                      ],
                      "cta": "cta",
                      "cta_label": "cta_label",
                      "description": "description",
                      "icon_url": "icon_url",
                      "impact_score": 1,
                      "reasoning": "reasoning",
                      "status": "optional",
                      "title": "title"
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RecommendActionsUsersResponse(
            data: [
                UserRecommendedAction(
                    accountId: Nullable<String>.value("account_id"),
                    accountName: Nullable<String>.value("account_name"),
                    action: UserRecommendedActionAction.createBusiness,
                    blockedCapabilities: [
                        "blocked_capabilities",
                        "blocked_capabilities"
                    ],
                    cta: "cta",
                    ctaLabel: "cta_label",
                    description: "description",
                    iconUrl: Nullable<String>.value("icon_url"),
                    impactScore: Nullable<Int>.value(1),
                    reasoning: Nullable<String>.value("reasoning"),
                    status: UserRecommendedActionStatus.optional,
                    title: "title"
                ),
                UserRecommendedAction(
                    accountId: Nullable<String>.value("account_id"),
                    accountName: Nullable<String>.value("account_name"),
                    action: UserRecommendedActionAction.createBusiness,
                    blockedCapabilities: [
                        "blocked_capabilities",
                        "blocked_capabilities"
                    ],
                    cta: "cta",
                    ctaLabel: "cta_label",
                    description: "description",
                    iconUrl: Nullable<String>.value("icon_url"),
                    impactScore: Nullable<Int>.value(1),
                    reasoning: Nullable<String>.value("reasoning"),
                    status: UserRecommendedActionStatus.optional,
                    title: "title"
                )
            ]
        )
        let response = try await client.users.recommendActions(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}