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
                        "cash_usd": "0.00",
                        "crypto": [
                          {
                            "balance": "1500.0",
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
                            "icon_url": "https://assets.whop.com/tokens/usdt.png",
                            "name": "Tether USD",
                            "price_usd": 1,
                            "symbol": "USDT",
                            "value_usd": 1500
                          }
                        ],
                        "crypto_usd": "0.00",
                        "pending_usd": "0.00",
                        "total_usd": "0.00",
                        "treasury_pending_usd": "0.00"
                      },
                      "balance_history": {
                        "data": [
                          {
                            "t": 1767268800,
                            "v": 2400
                          }
                        ],
                        "last": 0,
                        "max": 0,
                        "min": 0
                      },
                      "banner": {
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      },
                      "bio": "Ceramic coating specialist. Detailing cars in Austin since 2016.",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "earnings_usd": {
                        "first_earned_at": "2026-01-01T12:00:00.000Z",
                        "owned_accounts": {
                          "last_24_hours": "0.00",
                          "last_30_days": "260.00",
                          "last_7_days": "60.00",
                          "lifetime": "4120.25"
                        },
                        "personal": {
                          "last_24_hours": "0.00",
                          "last_30_days": "260.00",
                          "last_7_days": "60.00",
                          "lifetime": "4120.25"
                        },
                        "total": {
                          "last_24_hours": "0.00",
                          "last_30_days": "260.00",
                          "last_7_days": "60.00",
                          "lifetime": "4120.25"
                        }
                      },
                      "email": "marcus@shinetime.example",
                      "id": "user_xxxxxxxxxxxxxx",
                      "name": "Marcus Webb",
                      "profile_picture": {
                        "url": "https://ui-avatars.com/api/"
                      },
                      "social_accounts": [
                        {
                          "error": "You don't have permission to share this account. Ask an admin of its Meta Business Portfolio to grant you full control, then share it again.",
                          "external_id": "1234567891",
                          "id": "sacc_xxxxxxxxxxxxxx",
                          "name": "Shine Time Auto Detailing",
                          "parent_social_account": {
                            "external_id": "555111",
                            "id": "sacc_xxxxxxxxxxxxxx",
                            "name": "Shine Time Auto Detailing",
                            "platform": "x",
                            "profile_picture_url": "https://shinetime.example/logo.png",
                            "username": "shinetimedetailing",
                            "verified": true
                          },
                          "platform": "x",
                          "profile_picture_url": "https://shinetime.example/logo.png",
                          "scopes": [
                            "advertise"
                          ],
                          "url": "https://instagram.com/shinetimedetail",
                          "username": "shinetimedetail",
                          "verified": true
                        }
                      ],
                      "staff": {
                        "admin": true,
                        "investigation_access": true,
                        "manager": false,
                        "support": false
                      },
                      "username": "marcuswebb",
                      "verification": {},
                      "whop_partner_enabled_at": "2026-01-01T12:00:00.000Z"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "MQ",
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
                        cashUsd: "0.00",
                        crypto: [
                            UserBalanceToken(
                                balance: "1500.0",
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
                                iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                                name: Nullable<String>.value("Tether USD"),
                                priceUsd: Nullable<Double>.value(1),
                                symbol: "USDT",
                                valueUsd: 1500
                            )
                        ],
                        cryptoUsd: "0.00",
                        pendingUsd: "0.00",
                        totalUsd: "0.00",
                        treasuryPendingUsd: "0.00"
                    )),
                    balanceHistory: Nullable<UserBalanceHistory>.value(UserBalanceHistory(
                        data: [
                            UserBalanceHistoryPoint(
                                t: 1767268800,
                                v: 2400
                            )
                        ],
                        last: 0,
                        max: 0,
                        min: 0
                    )),
                    banner: Nullable<UserBanner>.value(UserBanner(
                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    )),
                    bio: Nullable<String>.value("Ceramic coating specialist. Detailing cars in Austin since 2016."),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    earningsUsd: Nullable<UserEarnings>.value(UserEarnings(
                        firstEarnedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                        ownedAccounts: UserEarningsAmount(
                            last24Hours: "0.00",
                            last30Days: "260.00",
                            last7Days: "60.00",
                            lifetime: "4120.25"
                        ),
                        personal: UserEarningsAmount(
                            last24Hours: "0.00",
                            last30Days: "260.00",
                            last7Days: "60.00",
                            lifetime: "4120.25"
                        ),
                        total: UserEarningsAmount(
                            last24Hours: "0.00",
                            last30Days: "260.00",
                            last7Days: "60.00",
                            lifetime: "4120.25"
                        )
                    )),
                    email: Nullable<String>.value("marcus@shinetime.example"),
                    id: "user_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Marcus Webb"),
                    profilePicture: UserProfilePicture(
                        url: "https://ui-avatars.com/api/"
                    ),
                    socialAccounts: [
                        SocialAccount(
                            error: Nullable<String>.value("You don't have permission to share this account. Ask an admin of its Meta Business Portfolio to grant you full control, then share it again."),
                            externalId: Nullable<String>.value("1234567891"),
                            id: "sacc_xxxxxxxxxxxxxx",
                            name: Nullable<String>.value("Shine Time Auto Detailing"),
                            parentSocialAccount: Nullable<SocialAccountParent>.value(SocialAccountParent(
                                externalId: Nullable<String>.value("555111"),
                                id: "sacc_xxxxxxxxxxxxxx",
                                name: Nullable<String>.value("Shine Time Auto Detailing"),
                                platform: SocialAccountParentPlatform.x,
                                profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                                username: Nullable<String>.value("shinetimedetailing"),
                                verified: true
                            )),
                            platform: SocialAccountPlatform.x,
                            profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                            scopes: [
                                "advertise"
                            ],
                            url: Nullable<String>.value("https://instagram.com/shinetimedetail"),
                            username: Nullable<String>.value("shinetimedetail"),
                            verified: true
                        )
                    ],
                    staff: Nullable<UserStaffAccess>.value(UserStaffAccess(
                        admin: true,
                        investigationAccess: true,
                        manager: false,
                        support: false
                    )),
                    username: "marcuswebb",
                    verification: [:],
                    whopPartnerEnabledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
                )
            ],
            pageInfo: ListUsersResponsePageInfo(
                endCursor: Nullable<String>.value("MQ"),
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
                    "cash_usd": "0.00",
                    "crypto": [
                      {
                        "balance": "1500.0",
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
                        "icon_url": "https://assets.whop.com/tokens/usdt.png",
                        "name": "Tether USD",
                        "price_usd": 1,
                        "symbol": "USDT",
                        "value_usd": 1500
                      }
                    ],
                    "crypto_usd": "0.00",
                    "pending_usd": "0.00",
                    "total_usd": "0.00",
                    "treasury_pending_usd": "0.00"
                  },
                  "balance_history": {
                    "data": [
                      {
                        "t": 1767268800,
                        "v": 2400
                      }
                    ],
                    "last": 0,
                    "max": 0,
                    "min": 0
                  },
                  "banner": {
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "bio": "Ceramic coating specialist. Detailing cars in Austin since 2016.",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "earnings_usd": {
                    "first_earned_at": "2026-01-01T12:00:00.000Z",
                    "owned_accounts": {
                      "last_24_hours": "0.00",
                      "last_30_days": "260.00",
                      "last_7_days": "60.00",
                      "lifetime": "4120.25"
                    },
                    "personal": {
                      "last_24_hours": "0.00",
                      "last_30_days": "260.00",
                      "last_7_days": "60.00",
                      "lifetime": "4120.25"
                    },
                    "total": {
                      "last_24_hours": "0.00",
                      "last_30_days": "260.00",
                      "last_7_days": "60.00",
                      "lifetime": "4120.25"
                    }
                  },
                  "email": "marcus@shinetime.example",
                  "id": "user_xxxxxxxxxxxxxx",
                  "name": "Marcus Webb",
                  "profile_picture": {
                    "url": "https://ui-avatars.com/api/"
                  },
                  "social_accounts": [
                    {
                      "error": "You don't have permission to share this account. Ask an admin of its Meta Business Portfolio to grant you full control, then share it again.",
                      "external_id": "1234567891",
                      "id": "sacc_xxxxxxxxxxxxxx",
                      "name": "Shine Time Auto Detailing",
                      "parent_social_account": {
                        "external_id": "555111",
                        "id": "sacc_xxxxxxxxxxxxxx",
                        "name": "Shine Time Auto Detailing",
                        "platform": "x",
                        "profile_picture_url": "https://shinetime.example/logo.png",
                        "username": "shinetimedetailing",
                        "verified": true
                      },
                      "platform": "x",
                      "profile_picture_url": "https://shinetime.example/logo.png",
                      "scopes": [
                        "advertise"
                      ],
                      "url": "https://instagram.com/shinetimedetail",
                      "username": "shinetimedetail",
                      "verified": true
                    }
                  ],
                  "staff": {
                    "admin": true,
                    "investigation_access": true,
                    "manager": false,
                    "support": false
                  },
                  "username": "marcuswebb",
                  "verification": {
                    "business": {
                      "key": "value"
                    },
                    "individual": {
                      "key": "value"
                    }
                  },
                  "whop_partner_enabled_at": "2026-01-01T12:00:00.000Z"
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
                cashUsd: "0.00",
                crypto: [
                    UserBalanceToken(
                        balance: "1500.0",
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
                        iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                        name: Nullable<String>.value("Tether USD"),
                        priceUsd: Nullable<Double>.value(1),
                        symbol: "USDT",
                        valueUsd: 1500
                    )
                ],
                cryptoUsd: "0.00",
                pendingUsd: "0.00",
                totalUsd: "0.00",
                treasuryPendingUsd: "0.00"
            )),
            balanceHistory: Nullable<UserBalanceHistory>.value(UserBalanceHistory(
                data: [
                    UserBalanceHistoryPoint(
                        t: 1767268800,
                        v: 2400
                    )
                ],
                last: 0,
                max: 0,
                min: 0
            )),
            banner: Nullable<UserBanner>.value(UserBanner(
                url: "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            )),
            bio: Nullable<String>.value("Ceramic coating specialist. Detailing cars in Austin since 2016."),
            createdAt: "2026-01-01T12:00:00.000Z",
            earningsUsd: Nullable<UserEarnings>.value(UserEarnings(
                firstEarnedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                ownedAccounts: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "260.00",
                    last7Days: "60.00",
                    lifetime: "4120.25"
                ),
                personal: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "260.00",
                    last7Days: "60.00",
                    lifetime: "4120.25"
                ),
                total: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "260.00",
                    last7Days: "60.00",
                    lifetime: "4120.25"
                )
            )),
            email: Nullable<String>.value("marcus@shinetime.example"),
            id: "user_xxxxxxxxxxxxxx",
            name: Nullable<String>.value("Marcus Webb"),
            profilePicture: UserProfilePicture(
                url: "https://ui-avatars.com/api/"
            ),
            socialAccounts: [
                SocialAccount(
                    error: Nullable<String>.value("You don't have permission to share this account. Ask an admin of its Meta Business Portfolio to grant you full control, then share it again."),
                    externalId: Nullable<String>.value("1234567891"),
                    id: "sacc_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Shine Time Auto Detailing"),
                    parentSocialAccount: Nullable<SocialAccountParent>.value(SocialAccountParent(
                        externalId: Nullable<String>.value("555111"),
                        id: "sacc_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Shine Time Auto Detailing"),
                        platform: SocialAccountParentPlatform.x,
                        profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                        username: Nullable<String>.value("shinetimedetailing"),
                        verified: true
                    )),
                    platform: SocialAccountPlatform.x,
                    profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                    scopes: [
                        "advertise"
                    ],
                    url: Nullable<String>.value("https://instagram.com/shinetimedetail"),
                    username: Nullable<String>.value("shinetimedetail"),
                    verified: true
                )
            ],
            staff: Nullable<UserStaffAccess>.value(UserStaffAccess(
                admin: true,
                investigationAccess: true,
                manager: false,
                support: false
            )),
            username: "marcuswebb",
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
            whopPartnerEnabledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
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
                    "cash_usd": "0.00",
                    "crypto": [
                      {
                        "balance": "1500.0",
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
                        "icon_url": "https://assets.whop.com/tokens/usdt.png",
                        "name": "Tether USD",
                        "price_usd": 1,
                        "symbol": "USDT",
                        "value_usd": 1500
                      }
                    ],
                    "crypto_usd": "0.00",
                    "pending_usd": "0.00",
                    "total_usd": "0.00",
                    "treasury_pending_usd": "0.00"
                  },
                  "balance_history": {
                    "data": [
                      {
                        "t": 1767268800,
                        "v": 2400
                      }
                    ],
                    "last": 0,
                    "max": 0,
                    "min": 0
                  },
                  "banner": {
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "bio": "Ceramic coating specialist. Detailing cars in Austin since 2016.",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "earnings_usd": {
                    "first_earned_at": "2026-01-01T12:00:00.000Z",
                    "owned_accounts": {
                      "last_24_hours": "0.00",
                      "last_30_days": "260.00",
                      "last_7_days": "60.00",
                      "lifetime": "4120.25"
                    },
                    "personal": {
                      "last_24_hours": "0.00",
                      "last_30_days": "260.00",
                      "last_7_days": "60.00",
                      "lifetime": "4120.25"
                    },
                    "total": {
                      "last_24_hours": "0.00",
                      "last_30_days": "260.00",
                      "last_7_days": "60.00",
                      "lifetime": "4120.25"
                    }
                  },
                  "email": "marcus@shinetime.example",
                  "id": "user_xxxxxxxxxxxxxx",
                  "name": "Marcus Webb",
                  "profile_picture": {
                    "url": "https://ui-avatars.com/api/"
                  },
                  "social_accounts": [
                    {
                      "error": "You don't have permission to share this account. Ask an admin of its Meta Business Portfolio to grant you full control, then share it again.",
                      "external_id": "1234567891",
                      "id": "sacc_xxxxxxxxxxxxxx",
                      "name": "Shine Time Auto Detailing",
                      "parent_social_account": {
                        "external_id": "555111",
                        "id": "sacc_xxxxxxxxxxxxxx",
                        "name": "Shine Time Auto Detailing",
                        "platform": "x",
                        "profile_picture_url": "https://shinetime.example/logo.png",
                        "username": "shinetimedetailing",
                        "verified": true
                      },
                      "platform": "x",
                      "profile_picture_url": "https://shinetime.example/logo.png",
                      "scopes": [
                        "advertise"
                      ],
                      "url": "https://instagram.com/shinetimedetail",
                      "username": "shinetimedetail",
                      "verified": true
                    }
                  ],
                  "staff": {
                    "admin": true,
                    "investigation_access": true,
                    "manager": false,
                    "support": false
                  },
                  "username": "marcuswebb",
                  "verification": {
                    "business": {
                      "key": "value"
                    },
                    "individual": {
                      "key": "value"
                    }
                  },
                  "whop_partner_enabled_at": "2026-01-01T12:00:00.000Z"
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
                cashUsd: "0.00",
                crypto: [
                    UserBalanceToken(
                        balance: "1500.0",
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
                        iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                        name: Nullable<String>.value("Tether USD"),
                        priceUsd: Nullable<Double>.value(1),
                        symbol: "USDT",
                        valueUsd: 1500
                    )
                ],
                cryptoUsd: "0.00",
                pendingUsd: "0.00",
                totalUsd: "0.00",
                treasuryPendingUsd: "0.00"
            )),
            balanceHistory: Nullable<UserBalanceHistory>.value(UserBalanceHistory(
                data: [
                    UserBalanceHistoryPoint(
                        t: 1767268800,
                        v: 2400
                    )
                ],
                last: 0,
                max: 0,
                min: 0
            )),
            banner: Nullable<UserBanner>.value(UserBanner(
                url: "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            )),
            bio: Nullable<String>.value("Ceramic coating specialist. Detailing cars in Austin since 2016."),
            createdAt: "2026-01-01T12:00:00.000Z",
            earningsUsd: Nullable<UserEarnings>.value(UserEarnings(
                firstEarnedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                ownedAccounts: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "260.00",
                    last7Days: "60.00",
                    lifetime: "4120.25"
                ),
                personal: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "260.00",
                    last7Days: "60.00",
                    lifetime: "4120.25"
                ),
                total: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "260.00",
                    last7Days: "60.00",
                    lifetime: "4120.25"
                )
            )),
            email: Nullable<String>.value("marcus@shinetime.example"),
            id: "user_xxxxxxxxxxxxxx",
            name: Nullable<String>.value("Marcus Webb"),
            profilePicture: UserProfilePicture(
                url: "https://ui-avatars.com/api/"
            ),
            socialAccounts: [
                SocialAccount(
                    error: Nullable<String>.value("You don't have permission to share this account. Ask an admin of its Meta Business Portfolio to grant you full control, then share it again."),
                    externalId: Nullable<String>.value("1234567891"),
                    id: "sacc_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Shine Time Auto Detailing"),
                    parentSocialAccount: Nullable<SocialAccountParent>.value(SocialAccountParent(
                        externalId: Nullable<String>.value("555111"),
                        id: "sacc_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Shine Time Auto Detailing"),
                        platform: SocialAccountParentPlatform.x,
                        profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                        username: Nullable<String>.value("shinetimedetailing"),
                        verified: true
                    )),
                    platform: SocialAccountPlatform.x,
                    profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                    scopes: [
                        "advertise"
                    ],
                    url: Nullable<String>.value("https://instagram.com/shinetimedetail"),
                    username: Nullable<String>.value("shinetimedetail"),
                    verified: true
                )
            ],
            staff: Nullable<UserStaffAccess>.value(UserStaffAccess(
                admin: true,
                investigationAccess: true,
                manager: false,
                support: false
            )),
            username: "marcuswebb",
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
            whopPartnerEnabledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
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
                    "cash_usd": "0.00",
                    "crypto": [
                      {
                        "balance": "1500.0",
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
                        "icon_url": "https://assets.whop.com/tokens/usdt.png",
                        "name": "Tether USD",
                        "price_usd": 1,
                        "symbol": "USDT",
                        "value_usd": 1500
                      }
                    ],
                    "crypto_usd": "0.00",
                    "pending_usd": "0.00",
                    "total_usd": "0.00",
                    "treasury_pending_usd": "0.00"
                  },
                  "balance_history": {
                    "data": [
                      {
                        "t": 1767268800,
                        "v": 2400
                      }
                    ],
                    "last": 0,
                    "max": 0,
                    "min": 0
                  },
                  "banner": {
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "bio": "Ceramic coating specialist. Detailing cars in Austin since 2016.",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "earnings_usd": {
                    "first_earned_at": "2026-01-01T12:00:00.000Z",
                    "owned_accounts": {
                      "last_24_hours": "0.00",
                      "last_30_days": "260.00",
                      "last_7_days": "60.00",
                      "lifetime": "4120.25"
                    },
                    "personal": {
                      "last_24_hours": "0.00",
                      "last_30_days": "260.00",
                      "last_7_days": "60.00",
                      "lifetime": "4120.25"
                    },
                    "total": {
                      "last_24_hours": "0.00",
                      "last_30_days": "260.00",
                      "last_7_days": "60.00",
                      "lifetime": "4120.25"
                    }
                  },
                  "email": "marcus@shinetime.example",
                  "id": "user_xxxxxxxxxxxxxx",
                  "name": "Marcus Webb",
                  "profile_picture": {
                    "url": "https://ui-avatars.com/api/"
                  },
                  "social_accounts": [
                    {
                      "error": "You don't have permission to share this account. Ask an admin of its Meta Business Portfolio to grant you full control, then share it again.",
                      "external_id": "1234567891",
                      "id": "sacc_xxxxxxxxxxxxxx",
                      "name": "Shine Time Auto Detailing",
                      "parent_social_account": {
                        "external_id": "555111",
                        "id": "sacc_xxxxxxxxxxxxxx",
                        "name": "Shine Time Auto Detailing",
                        "platform": "x",
                        "profile_picture_url": "https://shinetime.example/logo.png",
                        "username": "shinetimedetailing",
                        "verified": true
                      },
                      "platform": "x",
                      "profile_picture_url": "https://shinetime.example/logo.png",
                      "scopes": [
                        "advertise"
                      ],
                      "url": "https://instagram.com/shinetimedetail",
                      "username": "shinetimedetail",
                      "verified": true
                    }
                  ],
                  "staff": {
                    "admin": true,
                    "investigation_access": true,
                    "manager": false,
                    "support": false
                  },
                  "username": "marcuswebb",
                  "verification": {
                    "business": {
                      "key": "value"
                    },
                    "individual": {
                      "key": "value"
                    }
                  },
                  "whop_partner_enabled_at": "2026-01-01T12:00:00.000Z"
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
                cashUsd: "0.00",
                crypto: [
                    UserBalanceToken(
                        balance: "1500.0",
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
                        iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                        name: Nullable<String>.value("Tether USD"),
                        priceUsd: Nullable<Double>.value(1),
                        symbol: "USDT",
                        valueUsd: 1500
                    )
                ],
                cryptoUsd: "0.00",
                pendingUsd: "0.00",
                totalUsd: "0.00",
                treasuryPendingUsd: "0.00"
            )),
            balanceHistory: Nullable<UserBalanceHistory>.value(UserBalanceHistory(
                data: [
                    UserBalanceHistoryPoint(
                        t: 1767268800,
                        v: 2400
                    )
                ],
                last: 0,
                max: 0,
                min: 0
            )),
            banner: Nullable<UserBanner>.value(UserBanner(
                url: "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            )),
            bio: Nullable<String>.value("Ceramic coating specialist. Detailing cars in Austin since 2016."),
            createdAt: "2026-01-01T12:00:00.000Z",
            earningsUsd: Nullable<UserEarnings>.value(UserEarnings(
                firstEarnedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                ownedAccounts: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "260.00",
                    last7Days: "60.00",
                    lifetime: "4120.25"
                ),
                personal: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "260.00",
                    last7Days: "60.00",
                    lifetime: "4120.25"
                ),
                total: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "260.00",
                    last7Days: "60.00",
                    lifetime: "4120.25"
                )
            )),
            email: Nullable<String>.value("marcus@shinetime.example"),
            id: "user_xxxxxxxxxxxxxx",
            name: Nullable<String>.value("Marcus Webb"),
            profilePicture: UserProfilePicture(
                url: "https://ui-avatars.com/api/"
            ),
            socialAccounts: [
                SocialAccount(
                    error: Nullable<String>.value("You don't have permission to share this account. Ask an admin of its Meta Business Portfolio to grant you full control, then share it again."),
                    externalId: Nullable<String>.value("1234567891"),
                    id: "sacc_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Shine Time Auto Detailing"),
                    parentSocialAccount: Nullable<SocialAccountParent>.value(SocialAccountParent(
                        externalId: Nullable<String>.value("555111"),
                        id: "sacc_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Shine Time Auto Detailing"),
                        platform: SocialAccountParentPlatform.x,
                        profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                        username: Nullable<String>.value("shinetimedetailing"),
                        verified: true
                    )),
                    platform: SocialAccountPlatform.x,
                    profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                    scopes: [
                        "advertise"
                    ],
                    url: Nullable<String>.value("https://instagram.com/shinetimedetail"),
                    username: Nullable<String>.value("shinetimedetail"),
                    verified: true
                )
            ],
            staff: Nullable<UserStaffAccess>.value(UserStaffAccess(
                admin: true,
                investigationAccess: true,
                manager: false,
                support: false
            )),
            username: "marcuswebb",
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
            whopPartnerEnabledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
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
                    "cash_usd": "0.00",
                    "crypto": [
                      {
                        "balance": "1500.0",
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
                        "icon_url": "https://assets.whop.com/tokens/usdt.png",
                        "name": "Tether USD",
                        "price_usd": 1,
                        "symbol": "USDT",
                        "value_usd": 1500
                      }
                    ],
                    "crypto_usd": "0.00",
                    "pending_usd": "0.00",
                    "total_usd": "0.00",
                    "treasury_pending_usd": "0.00"
                  },
                  "balance_history": {
                    "data": [
                      {
                        "t": 1767268800,
                        "v": 2400
                      }
                    ],
                    "last": 0,
                    "max": 0,
                    "min": 0
                  },
                  "banner": {
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "bio": "Ceramic coating specialist. Detailing cars in Austin since 2016.",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "earnings_usd": {
                    "first_earned_at": "2026-01-01T12:00:00.000Z",
                    "owned_accounts": {
                      "last_24_hours": "0.00",
                      "last_30_days": "260.00",
                      "last_7_days": "60.00",
                      "lifetime": "4120.25"
                    },
                    "personal": {
                      "last_24_hours": "0.00",
                      "last_30_days": "260.00",
                      "last_7_days": "60.00",
                      "lifetime": "4120.25"
                    },
                    "total": {
                      "last_24_hours": "0.00",
                      "last_30_days": "260.00",
                      "last_7_days": "60.00",
                      "lifetime": "4120.25"
                    }
                  },
                  "email": "marcus@shinetime.example",
                  "id": "user_xxxxxxxxxxxxxx",
                  "name": "Marcus Webb",
                  "profile_picture": {
                    "url": "https://ui-avatars.com/api/"
                  },
                  "social_accounts": [
                    {
                      "error": "You don't have permission to share this account. Ask an admin of its Meta Business Portfolio to grant you full control, then share it again.",
                      "external_id": "1234567891",
                      "id": "sacc_xxxxxxxxxxxxxx",
                      "name": "Shine Time Auto Detailing",
                      "parent_social_account": {
                        "external_id": "555111",
                        "id": "sacc_xxxxxxxxxxxxxx",
                        "name": "Shine Time Auto Detailing",
                        "platform": "x",
                        "profile_picture_url": "https://shinetime.example/logo.png",
                        "username": "shinetimedetailing",
                        "verified": true
                      },
                      "platform": "x",
                      "profile_picture_url": "https://shinetime.example/logo.png",
                      "scopes": [
                        "advertise"
                      ],
                      "url": "https://instagram.com/shinetimedetail",
                      "username": "shinetimedetail",
                      "verified": true
                    }
                  ],
                  "staff": {
                    "admin": true,
                    "investigation_access": true,
                    "manager": false,
                    "support": false
                  },
                  "username": "marcuswebb",
                  "verification": {
                    "business": {
                      "key": "value"
                    },
                    "individual": {
                      "key": "value"
                    }
                  },
                  "whop_partner_enabled_at": "2026-01-01T12:00:00.000Z"
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
                cashUsd: "0.00",
                crypto: [
                    UserBalanceToken(
                        balance: "1500.0",
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
                        iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                        name: Nullable<String>.value("Tether USD"),
                        priceUsd: Nullable<Double>.value(1),
                        symbol: "USDT",
                        valueUsd: 1500
                    )
                ],
                cryptoUsd: "0.00",
                pendingUsd: "0.00",
                totalUsd: "0.00",
                treasuryPendingUsd: "0.00"
            )),
            balanceHistory: Nullable<UserBalanceHistory>.value(UserBalanceHistory(
                data: [
                    UserBalanceHistoryPoint(
                        t: 1767268800,
                        v: 2400
                    )
                ],
                last: 0,
                max: 0,
                min: 0
            )),
            banner: Nullable<UserBanner>.value(UserBanner(
                url: "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            )),
            bio: Nullable<String>.value("Ceramic coating specialist. Detailing cars in Austin since 2016."),
            createdAt: "2026-01-01T12:00:00.000Z",
            earningsUsd: Nullable<UserEarnings>.value(UserEarnings(
                firstEarnedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                ownedAccounts: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "260.00",
                    last7Days: "60.00",
                    lifetime: "4120.25"
                ),
                personal: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "260.00",
                    last7Days: "60.00",
                    lifetime: "4120.25"
                ),
                total: UserEarningsAmount(
                    last24Hours: "0.00",
                    last30Days: "260.00",
                    last7Days: "60.00",
                    lifetime: "4120.25"
                )
            )),
            email: Nullable<String>.value("marcus@shinetime.example"),
            id: "user_xxxxxxxxxxxxxx",
            name: Nullable<String>.value("Marcus Webb"),
            profilePicture: UserProfilePicture(
                url: "https://ui-avatars.com/api/"
            ),
            socialAccounts: [
                SocialAccount(
                    error: Nullable<String>.value("You don't have permission to share this account. Ask an admin of its Meta Business Portfolio to grant you full control, then share it again."),
                    externalId: Nullable<String>.value("1234567891"),
                    id: "sacc_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Shine Time Auto Detailing"),
                    parentSocialAccount: Nullable<SocialAccountParent>.value(SocialAccountParent(
                        externalId: Nullable<String>.value("555111"),
                        id: "sacc_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Shine Time Auto Detailing"),
                        platform: SocialAccountParentPlatform.x,
                        profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                        username: Nullable<String>.value("shinetimedetailing"),
                        verified: true
                    )),
                    platform: SocialAccountPlatform.x,
                    profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                    scopes: [
                        "advertise"
                    ],
                    url: Nullable<String>.value("https://instagram.com/shinetimedetail"),
                    username: Nullable<String>.value("shinetimedetail"),
                    verified: true
                )
            ],
            staff: Nullable<UserStaffAccess>.value(UserStaffAccess(
                admin: true,
                investigationAccess: true,
                manager: false,
                support: false
            )),
            username: "marcuswebb",
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
            whopPartnerEnabledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
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
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "account_name": "Shine Time Auto Detailing",
                      "action": "create_business",
                      "blocked_capabilities": [
                        "accept_bnpl_payments"
                      ],
                      "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/settings/payments/",
                      "cta_label": "Apply",
                      "description": "Let detailing customers split a $249 ceramic coating over four payments.",
                      "icon_url": "https://whop.com/illustrations/orange/piggy-bank.svg",
                      "impact_score": 82,
                      "reasoning": "Ceramic coating is the priciest job on the menu, so financing lifts conversion most.",
                      "status": "optional",
                      "title": "Offer financing at checkout"
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
                    accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    accountName: Nullable<String>.value("Shine Time Auto Detailing"),
                    action: UserRecommendedActionAction.createBusiness,
                    blockedCapabilities: [
                        "accept_bnpl_payments"
                    ],
                    cta: "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/settings/payments/",
                    ctaLabel: "Apply",
                    description: "Let detailing customers split a $249 ceramic coating over four payments.",
                    iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/piggy-bank.svg"),
                    impactScore: Nullable<Int>.value(82),
                    reasoning: Nullable<String>.value("Ceramic coating is the priciest job on the menu, so financing lifts conversion most."),
                    status: UserRecommendedActionStatus.optional,
                    title: "Offer financing at checkout"
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