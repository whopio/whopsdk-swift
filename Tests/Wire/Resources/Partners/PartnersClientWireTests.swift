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
            ))
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
                      "total_earnings_usd": "10.00",
                      "total_volume_usd": "100.00",
                      "user": {
                        "city": "Austin",
                        "country": "US",
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Tanya Cole",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "tanyacole"
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
        let expectedResponse = ReferredUsersPartnersResponse(
            data: [
                ReferredUsersPartnersResponseDataItem(
                    totalEarningsUsd: "10.00",
                    totalVolumeUsd: "100.00",
                    user: ReferredUsersPartnersResponseDataItemUser(
                        city: Optional(Nullable<String>.value("Austin")),
                        country: Optional(Nullable<String>.value("US")),
                        id: "user_xxxxxxxxxxxxxx",
                        name: Optional(Nullable<String>.value("Tanya Cole")),
                        profilePicture: Optional(ReferredUsersPartnersResponseDataItemUserProfilePicture(
                            url: Optional(Nullable<String>.value("https://ui-avatars.com/api/"))
                        )),
                        username: "tanyacole"
                    )
                )
            ],
            pageInfo: ReferredUsersPartnersResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.partners.referredUsers(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }
}