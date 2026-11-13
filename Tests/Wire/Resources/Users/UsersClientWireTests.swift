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
}