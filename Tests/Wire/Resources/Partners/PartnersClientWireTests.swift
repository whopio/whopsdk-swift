import Foundation
import Testing
import WhopSDK

@Suite("PartnersClient Wire Tests") struct PartnersClientWireTests {
    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "referral_link": "https://whop.com/network/",
                  "whop_partner_enabled_at": "2026-01-01T12:00:00Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreatePartnersResponse(
            referralLink: "https://whop.com/network/",
            whopPartnerEnabledAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)
        )
        let response = try await client.partners.create(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "referral_link": "referral_link",
                  "whop_partner_enabled_at": "2024-01-15T09:30:00Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreatePartnersResponse(
            referralLink: "referral_link",
            whopPartnerEnabledAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
        )
        let response = try await client.partners.create(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func feeOptions1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "object": "partner_fee_options",
                  "streams": [
                    {
                      "adjustable": true,
                      "commission_percentage": 30,
                      "fee": {
                        "minimum_percentage": 2.4,
                        "percentage": 2.7,
                        "reference_region": "usa",
                        "regions": [
                          {
                            "minimum_percentage": 2.4,
                            "percentage": 2.7,
                            "region": "usa"
                          }
                        ]
                      },
                      "income_stream": "sales",
                      "unadjustable_reason": "no_merchant_fee"
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
        let expectedResponse = FeeOptionsPartnersResponse(
            object: FeeOptionsPartnersResponseObject.partnerFeeOptions,
            streams: [
                FeeOptionsPartnersResponseStreamsItem(
                    adjustable: true,
                    commissionPercentage: Nullable<Double>.value(30),
                    fee: Nullable<FeeOptionsPartnersResponseStreamsItemFee>.value(FeeOptionsPartnersResponseStreamsItemFee(
                        minimumPercentage: 2.4,
                        percentage: 2.7,
                        referenceRegion: Nullable<String>.value("usa"),
                        regions: [
                            FeeOptionsPartnersResponseStreamsItemFeeRegionsItem(
                                minimumPercentage: 2.4,
                                percentage: 2.7,
                                region: "usa"
                            )
                        ]
                    )),
                    incomeStream: FeeOptionsPartnersResponseStreamsItemIncomeStream.sales,
                    unadjustableReason: Nullable<FeeOptionsPartnersResponseStreamsItemUnadjustableReason>.value(FeeOptionsPartnersResponseStreamsItemUnadjustableReason.noMerchantFee)
                )
            ]
        )
        let response = try await client.partners.feeOptions(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func feeOptions2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "object": "partner_fee_options",
                  "streams": [
                    {
                      "adjustable": true,
                      "commission_percentage": 1.1,
                      "fee": {
                        "minimum_percentage": 1.1,
                        "percentage": 1.1,
                        "reference_region": "reference_region",
                        "regions": [
                          {
                            "minimum_percentage": 1.1,
                            "percentage": 1.1,
                            "region": "region"
                          },
                          {
                            "minimum_percentage": 1.1,
                            "percentage": 1.1,
                            "region": "region"
                          }
                        ]
                      },
                      "income_stream": "sales",
                      "unadjustable_reason": "no_merchant_fee"
                    },
                    {
                      "adjustable": true,
                      "commission_percentage": 1.1,
                      "fee": {
                        "minimum_percentage": 1.1,
                        "percentage": 1.1,
                        "reference_region": "reference_region",
                        "regions": [
                          {
                            "minimum_percentage": 1.1,
                            "percentage": 1.1,
                            "region": "region"
                          },
                          {
                            "minimum_percentage": 1.1,
                            "percentage": 1.1,
                            "region": "region"
                          }
                        ]
                      },
                      "income_stream": "sales",
                      "unadjustable_reason": "no_merchant_fee"
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
        let expectedResponse = FeeOptionsPartnersResponse(
            object: FeeOptionsPartnersResponseObject.partnerFeeOptions,
            streams: [
                FeeOptionsPartnersResponseStreamsItem(
                    adjustable: true,
                    commissionPercentage: Nullable<Double>.value(1.1),
                    fee: Nullable<FeeOptionsPartnersResponseStreamsItemFee>.value(FeeOptionsPartnersResponseStreamsItemFee(
                        minimumPercentage: 1.1,
                        percentage: 1.1,
                        referenceRegion: Nullable<String>.value("reference_region"),
                        regions: [
                            FeeOptionsPartnersResponseStreamsItemFeeRegionsItem(
                                minimumPercentage: 1.1,
                                percentage: 1.1,
                                region: "region"
                            ),
                            FeeOptionsPartnersResponseStreamsItemFeeRegionsItem(
                                minimumPercentage: 1.1,
                                percentage: 1.1,
                                region: "region"
                            )
                        ]
                    )),
                    incomeStream: FeeOptionsPartnersResponseStreamsItemIncomeStream.sales,
                    unadjustableReason: Nullable<FeeOptionsPartnersResponseStreamsItemUnadjustableReason>.value(FeeOptionsPartnersResponseStreamsItemUnadjustableReason.noMerchantFee)
                ),
                FeeOptionsPartnersResponseStreamsItem(
                    adjustable: true,
                    commissionPercentage: Nullable<Double>.value(1.1),
                    fee: Nullable<FeeOptionsPartnersResponseStreamsItemFee>.value(FeeOptionsPartnersResponseStreamsItemFee(
                        minimumPercentage: 1.1,
                        percentage: 1.1,
                        referenceRegion: Nullable<String>.value("reference_region"),
                        regions: [
                            FeeOptionsPartnersResponseStreamsItemFeeRegionsItem(
                                minimumPercentage: 1.1,
                                percentage: 1.1,
                                region: "region"
                            ),
                            FeeOptionsPartnersResponseStreamsItemFeeRegionsItem(
                                minimumPercentage: 1.1,
                                percentage: 1.1,
                                region: "region"
                            )
                        ]
                    )),
                    incomeStream: FeeOptionsPartnersResponseStreamsItemIncomeStream.sales,
                    unadjustableReason: Nullable<FeeOptionsPartnersResponseStreamsItemUnadjustableReason>.value(FeeOptionsPartnersResponseStreamsItemUnadjustableReason.noMerchantFee)
                )
            ]
        )
        let response = try await client.partners.feeOptions(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func leaderboard1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "leaders": [
                    {
                      "first_referral_started_at": "2026-01-01T12:00:00Z",
                      "rank": 1,
                      "total_earnings_usd": "100.00",
                      "total_volume_usd": "0.00",
                      "user": {
                        "city": "Austin",
                        "country": "US",
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Marcus Webb",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "marcuswebb"
                      }
                    }
                  ],
                  "me": {
                    "first_referral_started_at": "2026-01-01T12:00:00Z",
                    "rank": 2,
                    "total_earnings_usd": "4.00",
                    "total_volume_usd": "40.00",
                    "user": {
                      "city": "Austin",
                      "country": "US",
                      "id": "user_xxxxxxxxxxxxxx",
                      "name": "Marcus Webb",
                      "profile_picture": {
                        "url": "https://ui-avatars.com/api/"
                      },
                      "username": "marcuswebb"
                    }
                  },
                  "nearby": [
                    {
                      "first_referral_started_at": "2026-01-01T12:00:00Z",
                      "rank": 1,
                      "total_earnings_usd": "100.00",
                      "total_volume_usd": "0.00",
                      "user": {
                        "city": "Austin",
                        "country": "US",
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Marcus Webb",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "marcuswebb"
                      }
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
        let expectedResponse = LeaderboardPartnersResponse(
            leaders: [
                LeaderboardPartnersResponseLeadersItem(
                    firstReferralStartedAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                    rank: 1,
                    totalEarningsUsd: "100.00",
                    totalVolumeUsd: "0.00",
                    user: Nullable<LeaderboardPartnersResponseLeadersItemUser>.value(LeaderboardPartnersResponseLeadersItemUser(
                        city: Nullable<String>.value("Austin"),
                        country: Nullable<String>.value("US"),
                        id: Optional("user_xxxxxxxxxxxxxx"),
                        name: Optional(Nullable<String>.value("Marcus Webb")),
                        profilePicture: Optional(LeaderboardPartnersResponseLeadersItemUserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        )),
                        username: Optional("marcuswebb")
                    ))
                )
            ],
            me: Nullable<LeaderboardPartnersResponseMe>.value(LeaderboardPartnersResponseMe(
                firstReferralStartedAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                rank: 2,
                totalEarningsUsd: "4.00",
                totalVolumeUsd: "40.00",
                user: Nullable<LeaderboardPartnersResponseMeUser>.value(LeaderboardPartnersResponseMeUser(
                    city: Nullable<String>.value("Austin"),
                    country: Nullable<String>.value("US"),
                    id: Optional("user_xxxxxxxxxxxxxx"),
                    name: Optional(Nullable<String>.value("Marcus Webb")),
                    profilePicture: Optional(LeaderboardPartnersResponseMeUserProfilePicture(
                        url: "https://ui-avatars.com/api/"
                    )),
                    username: Optional("marcuswebb")
                ))
            )),
            nearby: [
                LeaderboardPartnersResponseNearbyItem(
                    firstReferralStartedAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                    rank: 1,
                    totalEarningsUsd: "100.00",
                    totalVolumeUsd: "0.00",
                    user: Nullable<LeaderboardPartnersResponseNearbyItemUser>.value(LeaderboardPartnersResponseNearbyItemUser(
                        city: Nullable<String>.value("Austin"),
                        country: Nullable<String>.value("US"),
                        id: Optional("user_xxxxxxxxxxxxxx"),
                        name: Optional(Nullable<String>.value("Marcus Webb")),
                        profilePicture: Optional(LeaderboardPartnersResponseNearbyItemUserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        )),
                        username: Optional("marcuswebb")
                    ))
                )
            ]
        )
        let response = try await client.partners.leaderboard(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func leaderboard2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "leaders": [
                    {
                      "first_referral_started_at": "2024-01-15T09:30:00Z",
                      "rank": 1,
                      "total_earnings_usd": "total_earnings_usd",
                      "total_volume_usd": "total_volume_usd",
                      "user": {
                        "city": "city",
                        "country": "country",
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      }
                    },
                    {
                      "first_referral_started_at": "2024-01-15T09:30:00Z",
                      "rank": 1,
                      "total_earnings_usd": "total_earnings_usd",
                      "total_volume_usd": "total_volume_usd",
                      "user": {
                        "city": "city",
                        "country": "country",
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      }
                    }
                  ],
                  "me": {
                    "first_referral_started_at": "2024-01-15T09:30:00Z",
                    "rank": 1,
                    "total_earnings_usd": "total_earnings_usd",
                    "total_volume_usd": "total_volume_usd",
                    "user": {
                      "city": "city",
                      "country": "country",
                      "id": "id",
                      "name": "name",
                      "profile_picture": {
                        "url": "url"
                      },
                      "username": "username"
                    }
                  },
                  "nearby": [
                    {
                      "first_referral_started_at": "2024-01-15T09:30:00Z",
                      "rank": 1,
                      "total_earnings_usd": "total_earnings_usd",
                      "total_volume_usd": "total_volume_usd",
                      "user": {
                        "city": "city",
                        "country": "country",
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      }
                    },
                    {
                      "first_referral_started_at": "2024-01-15T09:30:00Z",
                      "rank": 1,
                      "total_earnings_usd": "total_earnings_usd",
                      "total_volume_usd": "total_volume_usd",
                      "user": {
                        "city": "city",
                        "country": "country",
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      }
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
        let expectedResponse = LeaderboardPartnersResponse(
            leaders: [
                LeaderboardPartnersResponseLeadersItem(
                    firstReferralStartedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    rank: 1,
                    totalEarningsUsd: "total_earnings_usd",
                    totalVolumeUsd: "total_volume_usd",
                    user: Nullable<LeaderboardPartnersResponseLeadersItemUser>.value(LeaderboardPartnersResponseLeadersItemUser(
                        city: Nullable<String>.value("city"),
                        country: Nullable<String>.value("country"),
                        id: Optional("id"),
                        name: Optional(Nullable<String>.value("name")),
                        profilePicture: Optional(LeaderboardPartnersResponseLeadersItemUserProfilePicture(
                            url: "url"
                        )),
                        username: Optional("username")
                    ))
                ),
                LeaderboardPartnersResponseLeadersItem(
                    firstReferralStartedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    rank: 1,
                    totalEarningsUsd: "total_earnings_usd",
                    totalVolumeUsd: "total_volume_usd",
                    user: Nullable<LeaderboardPartnersResponseLeadersItemUser>.value(LeaderboardPartnersResponseLeadersItemUser(
                        city: Nullable<String>.value("city"),
                        country: Nullable<String>.value("country"),
                        id: Optional("id"),
                        name: Optional(Nullable<String>.value("name")),
                        profilePicture: Optional(LeaderboardPartnersResponseLeadersItemUserProfilePicture(
                            url: "url"
                        )),
                        username: Optional("username")
                    ))
                )
            ],
            me: Nullable<LeaderboardPartnersResponseMe>.value(LeaderboardPartnersResponseMe(
                firstReferralStartedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                rank: 1,
                totalEarningsUsd: "total_earnings_usd",
                totalVolumeUsd: "total_volume_usd",
                user: Nullable<LeaderboardPartnersResponseMeUser>.value(LeaderboardPartnersResponseMeUser(
                    city: Nullable<String>.value("city"),
                    country: Nullable<String>.value("country"),
                    id: Optional("id"),
                    name: Optional(Nullable<String>.value("name")),
                    profilePicture: Optional(LeaderboardPartnersResponseMeUserProfilePicture(
                        url: "url"
                    )),
                    username: Optional("username")
                ))
            )),
            nearby: [
                LeaderboardPartnersResponseNearbyItem(
                    firstReferralStartedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    rank: 1,
                    totalEarningsUsd: "total_earnings_usd",
                    totalVolumeUsd: "total_volume_usd",
                    user: Nullable<LeaderboardPartnersResponseNearbyItemUser>.value(LeaderboardPartnersResponseNearbyItemUser(
                        city: Nullable<String>.value("city"),
                        country: Nullable<String>.value("country"),
                        id: Optional("id"),
                        name: Optional(Nullable<String>.value("name")),
                        profilePicture: Optional(LeaderboardPartnersResponseNearbyItemUserProfilePicture(
                            url: "url"
                        )),
                        username: Optional("username")
                    ))
                ),
                LeaderboardPartnersResponseNearbyItem(
                    firstReferralStartedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    rank: 1,
                    totalEarningsUsd: "total_earnings_usd",
                    totalVolumeUsd: "total_volume_usd",
                    user: Nullable<LeaderboardPartnersResponseNearbyItemUser>.value(LeaderboardPartnersResponseNearbyItemUser(
                        city: Nullable<String>.value("city"),
                        country: Nullable<String>.value("country"),
                        id: Optional("id"),
                        name: Optional(Nullable<String>.value("name")),
                        profilePicture: Optional(LeaderboardPartnersResponseNearbyItemUserProfilePicture(
                            url: "url"
                        )),
                        username: Optional("username")
                    ))
                )
            ]
        )
        let response = try await client.partners.leaderboard(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func referredUsers1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "business_count": 1,
                      "earnings": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "joined_at": "2026-01-01T12:00:00Z",
                      "total_earnings_usd": "10.00",
                      "total_volume_usd": "100.00",
                      "user": {
                        "city": "Austin",
                        "country": "US",
                        "email": "marcus@shinetime.example",
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Tanya Cole",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "tanyacole"
                      },
                      "volume_30d": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
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
        let expectedResponse = ReferredUsersPartnersResponse(
            data: [
                ReferredUsersPartnersResponseDataItem(
                    businessCount: 1,
                    earnings: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    joinedAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                    totalEarningsUsd: "10.00",
                    totalVolumeUsd: "100.00",
                    user: ReferredUsersPartnersResponseDataItemUser(
                        city: Optional(Nullable<String>.value("Austin")),
                        country: Optional(Nullable<String>.value("US")),
                        email: Nullable<String>.value("marcus@shinetime.example"),
                        id: "user_xxxxxxxxxxxxxx",
                        name: Optional(Nullable<String>.value("Tanya Cole")),
                        profilePicture: Optional(ReferredUsersPartnersResponseDataItemUserProfilePicture(
                            url: Optional(Nullable<String>.value("https://ui-avatars.com/api/"))
                        )),
                        username: "tanyacole"
                    ),
                    volume30D: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )
                )
            ],
            pageInfo: ReferredUsersPartnersResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.partners.referredUsers(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func referredUsers2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "business_count": 1,
                      "earnings": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "joined_at": "2024-01-15T09:30:00Z",
                      "total_earnings_usd": "total_earnings_usd",
                      "total_volume_usd": "total_volume_usd",
                      "user": {
                        "city": "city",
                        "country": "country",
                        "email": "email",
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "volume_30d": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      }
                    },
                    {
                      "business_count": 1,
                      "earnings": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "joined_at": "2024-01-15T09:30:00Z",
                      "total_earnings_usd": "total_earnings_usd",
                      "total_volume_usd": "total_volume_usd",
                      "user": {
                        "city": "city",
                        "country": "country",
                        "email": "email",
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "volume_30d": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      }
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
        let expectedResponse = ReferredUsersPartnersResponse(
            data: [
                ReferredUsersPartnersResponseDataItem(
                    businessCount: 1,
                    earnings: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    joinedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    totalEarningsUsd: "total_earnings_usd",
                    totalVolumeUsd: "total_volume_usd",
                    user: ReferredUsersPartnersResponseDataItemUser(
                        city: Optional(Nullable<String>.value("city")),
                        country: Optional(Nullable<String>.value("country")),
                        email: Nullable<String>.value("email"),
                        id: "id",
                        name: Optional(Nullable<String>.value("name")),
                        profilePicture: Optional(ReferredUsersPartnersResponseDataItemUserProfilePicture(
                            url: Optional(Nullable<String>.value("url"))
                        )),
                        username: "username"
                    ),
                    volume30D: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )
                ),
                ReferredUsersPartnersResponseDataItem(
                    businessCount: 1,
                    earnings: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    joinedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    totalEarningsUsd: "total_earnings_usd",
                    totalVolumeUsd: "total_volume_usd",
                    user: ReferredUsersPartnersResponseDataItemUser(
                        city: Optional(Nullable<String>.value("city")),
                        country: Optional(Nullable<String>.value("country")),
                        email: Nullable<String>.value("email"),
                        id: "id",
                        name: Optional(Nullable<String>.value("name")),
                        profilePicture: Optional(ReferredUsersPartnersResponseDataItemUserProfilePicture(
                            url: Optional(Nullable<String>.value("url"))
                        )),
                        username: "username"
                    ),
                    volume30D: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )
                )
            ],
            pageInfo: ReferredUsersPartnersResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.partners.referredUsers(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "certification_complete": false,
                  "joined_at": "2026-01-01T12:00:00.000Z",
                  "payout_rates": [
                    {
                      "duration": {
                        "unit": "day",
                        "value": 600
                      },
                      "rates": [
                        {
                          "income_source": "sales",
                          "percentage": 10
                        }
                      ],
                      "tier": "first"
                    }
                  ],
                  "referred_businesses_count": 1,
                  "referring_partner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "verification_waitlist_joined": false,
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
        let expectedResponse = Partner(
            accountId: Nullable<String>.value("account_id"),
            certificationComplete: false,
            joinedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            payoutRates: [
                PartnerPayoutTier(
                    duration: PartnerPayoutDuration(
                        unit: PartnerPayoutDurationUnit.day,
                        value: 600
                    ),
                    rates: [
                        PartnerPayoutRate(
                            incomeSource: PartnerPayoutRateIncomeSource.sales,
                            percentage: 10
                        )
                    ],
                    tier: PartnerPayoutTierTier.first
                )
            ],
            referredBusinessesCount: 1,
            referringPartner: Nullable<UserSummary>.value(UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            )),
            user: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            verificationWaitlistJoined: false,
            whopPartnerVerifiedAt: Nullable<String>.value("whop_partner_verified_at")
        )
        let response = try await client.partners.retrieve(
            id: "me",
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
                  "certification_complete": true,
                  "joined_at": "joined_at",
                  "payout_rates": [
                    {
                      "duration": {
                        "unit": "day",
                        "value": 1
                      },
                      "rates": [
                        {
                          "income_source": "sales",
                          "percentage": 1.1
                        },
                        {
                          "income_source": "sales",
                          "percentage": 1.1
                        }
                      ],
                      "tier": "first"
                    },
                    {
                      "duration": {
                        "unit": "day",
                        "value": 1
                      },
                      "rates": [
                        {
                          "income_source": "sales",
                          "percentage": 1.1
                        },
                        {
                          "income_source": "sales",
                          "percentage": 1.1
                        }
                      ],
                      "tier": "first"
                    }
                  ],
                  "referred_businesses_count": 1,
                  "referring_partner": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "verification_waitlist_joined": true,
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
        let expectedResponse = Partner(
            accountId: Nullable<String>.value("account_id"),
            certificationComplete: true,
            joinedAt: Nullable<String>.value("joined_at"),
            payoutRates: [
                PartnerPayoutTier(
                    duration: PartnerPayoutDuration(
                        unit: PartnerPayoutDurationUnit.day,
                        value: 1
                    ),
                    rates: [
                        PartnerPayoutRate(
                            incomeSource: PartnerPayoutRateIncomeSource.sales,
                            percentage: 1.1
                        ),
                        PartnerPayoutRate(
                            incomeSource: PartnerPayoutRateIncomeSource.sales,
                            percentage: 1.1
                        )
                    ],
                    tier: PartnerPayoutTierTier.first
                ),
                PartnerPayoutTier(
                    duration: PartnerPayoutDuration(
                        unit: PartnerPayoutDurationUnit.day,
                        value: 1
                    ),
                    rates: [
                        PartnerPayoutRate(
                            incomeSource: PartnerPayoutRateIncomeSource.sales,
                            percentage: 1.1
                        ),
                        PartnerPayoutRate(
                            incomeSource: PartnerPayoutRateIncomeSource.sales,
                            percentage: 1.1
                        )
                    ],
                    tier: PartnerPayoutTierTier.first
                )
            ],
            referredBusinessesCount: 1,
            referringPartner: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )),
            user: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            verificationWaitlistJoined: true,
            whopPartnerVerifiedAt: Nullable<String>.value("whop_partner_verified_at")
        )
        let response = try await client.partners.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}