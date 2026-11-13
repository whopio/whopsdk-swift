import Foundation
import Testing
import WhopSDK

@Suite("MembersClient Wire Tests") struct MembersClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "access_level": "no_access",
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "display_name": "Dana Whitfield",
                      "earnings_usd": {
                        "last_24_hours": "0.00",
                        "last_30_days": "0.00",
                        "last_7_days": "0.00",
                        "lifetime": "0.00"
                      },
                      "email": "marcus@shinetime.example",
                      "id": "mber_xxxxxxxxxxxxxx",
                      "joined_at": "2026-01-01T12:00:00.000Z",
                      "last_accessed_at": "2026-01-01T12:00:00.000Z",
                      "last_activity": {
                        "author": {
                          "id": "user_xxxxxxxxxxxxxx",
                          "name": "Dana Whitfield",
                          "profile_picture": {
                            "url": "https://ui-avatars.com/api/"
                          },
                          "username": "danawhitfield"
                        },
                        "channel_id": "channel_id",
                        "created_at": "created_at",
                        "id": "id",
                        "object": "message",
                        "plain_content": null
                      },
                      "last_activity_at": "2026-01-01T12:00:00.000Z",
                      "metadata": {
                        "key": "value"
                      },
                      "most_recent_action": "canceling",
                      "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                      "name": "Northwind Legal LLP",
                      "phone_number": "+xxxxxxxxxxx",
                      "status": "joined",
                      "token_balance": 70.25,
                      "unsubscribe_status": "unsubscribed",
                      "usd_total_spent": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "user": {
                        "city": "Austin",
                        "country": "US",
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "state": "TX",
                        "username": "danawhitfield"
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
        let expectedResponse = ListMembersResponse(
            data: [
                Member(
                    accessLevel: MemberAccessLevel.noAccess,
                    accountId: "biz_xxxxxxxxxxxxxx",
                    createdAt: "2026-01-01T12:00:00.000Z",
                    displayName: "Dana Whitfield",
                    earningsUsd: Nullable<UserEarningsAmount>.value(UserEarningsAmount(
                        last24Hours: "0.00",
                        last30Days: "0.00",
                        last7Days: "0.00",
                        lifetime: "0.00"
                    )),
                    email: Nullable<String>.value("marcus@shinetime.example"),
                    id: "mber_xxxxxxxxxxxxxx",
                    joinedAt: "2026-01-01T12:00:00.000Z",
                    lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    lastActivity: Nullable<MemberLastActivity>.value(MemberLastActivityMessage(
                        author: Nullable<UserSummary>.value(UserSummary(
                            id: "user_xxxxxxxxxxxxxx",
                            name: Nullable<String>.value("Dana Whitfield"),
                            profilePicture: UserProfilePicture(
                                url: "https://ui-avatars.com/api/"
                            ),
                            username: "danawhitfield"
                        )),
                        channelId: "channel_id",
                        createdAt: "created_at",
                        id: "id",
                        object: MemberLastActivityMessageObject.message,
                        plainContent: .null
                    )),
                    lastActivityAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    mostRecentAction: Nullable<MemberMostRecentAction>.value(MemberMostRecentAction.canceling),
                    mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    name: Nullable<String>.value("Northwind Legal LLP"),
                    phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
                    status: MemberStatus.joined,
                    tokenBalance: 70.25,
                    unsubscribeStatus: Nullable<MemberUnsubscribeStatus>.value(MemberUnsubscribeStatus.unsubscribed),
                    usdTotalSpent: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    user: Nullable<MemberUser>.value(MemberUser(
                        city: Nullable<String>.value("Austin"),
                        country: Nullable<String>.value("US"),
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        state: Nullable<String>.value("TX"),
                        username: "danawhitfield"
                    ))
                )
            ],
            pageInfo: ListMembersResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                totalCount: Nullable<Int>.value(1),
                totalCountCapped: true
            )
        )
        let response = try await client.members.list(
            userIds: [
                "user_xxxxxxxxxxxxxx"
            ],
            productIds: [
                "prod_xxxxxxxxxxxxx"
            ],
            variantIds: [
                "plan_xxxxxxxxxxxxx"
            ],
            promoCodeIds: [
                "promo_xxxxxxxxxxxx"
            ],
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "access_level": "no_access",
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "display_name": "Dana Whitfield",
                  "earnings_usd": {
                    "last_24_hours": "0.00",
                    "last_30_days": "0.00",
                    "last_7_days": "0.00",
                    "lifetime": "0.00"
                  },
                  "email": "marcus@shinetime.example",
                  "id": "mber_xxxxxxxxxxxxxx",
                  "joined_at": "2026-01-01T12:00:00.000Z",
                  "last_accessed_at": "2026-01-01T12:00:00.000Z",
                  "last_activity": {
                    "author": {
                      "id": "user_xxxxxxxxxxxxxx",
                      "name": "Dana Whitfield",
                      "profile_picture": {
                        "url": "https://ui-avatars.com/api/"
                      },
                      "username": "danawhitfield"
                    },
                    "channel_id": "channel_id",
                    "created_at": "created_at",
                    "id": "id",
                    "object": "message",
                    "plain_content": "plain_content"
                  },
                  "last_activity_at": "2026-01-01T12:00:00.000Z",
                  "metadata": {
                    "key": "value"
                  },
                  "most_recent_action": "canceling",
                  "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                  "name": "Northwind Legal LLP",
                  "phone_number": "+xxxxxxxxxxx",
                  "status": "joined",
                  "token_balance": 70.25,
                  "unsubscribe_status": "unsubscribed",
                  "usd_total_spent": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "user": {
                    "city": "Austin",
                    "country": "US",
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "state": "TX",
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
        let expectedResponse = Member(
            accessLevel: MemberAccessLevel.noAccess,
            accountId: "biz_xxxxxxxxxxxxxx",
            createdAt: "2026-01-01T12:00:00.000Z",
            displayName: "Dana Whitfield",
            earningsUsd: Nullable<UserEarningsAmount>.value(UserEarningsAmount(
                last24Hours: "0.00",
                last30Days: "0.00",
                last7Days: "0.00",
                lifetime: "0.00"
            )),
            email: Nullable<String>.value("marcus@shinetime.example"),
            id: "mber_xxxxxxxxxxxxxx",
            joinedAt: "2026-01-01T12:00:00.000Z",
            lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            lastActivity: Nullable<MemberLastActivity>.value(MemberLastActivityMessage(
                author: Nullable<UserSummary>.value(UserSummary(
                    id: "user_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Dana Whitfield"),
                    profilePicture: UserProfilePicture(
                        url: "https://ui-avatars.com/api/"
                    ),
                    username: "danawhitfield"
                )),
                channelId: "channel_id",
                createdAt: "created_at",
                id: "id",
                object: MemberLastActivityMessageObject.message,
                plainContent: Nullable<String>.value("plain_content")
            )),
            lastActivityAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            metadata: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            mostRecentAction: Nullable<MemberMostRecentAction>.value(MemberMostRecentAction.canceling),
            mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            name: Nullable<String>.value("Northwind Legal LLP"),
            phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
            status: MemberStatus.joined,
            tokenBalance: 70.25,
            unsubscribeStatus: Nullable<MemberUnsubscribeStatus>.value(MemberUnsubscribeStatus.unsubscribed),
            usdTotalSpent: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            user: Nullable<MemberUser>.value(MemberUser(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                state: Nullable<String>.value("TX"),
                username: "danawhitfield"
            ))
        )
        let response = try await client.members.create(
            request: .init(email: "jane@example.com"),
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
                  "access_level": "no_access",
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "display_name": "Dana Whitfield",
                  "earnings_usd": {
                    "last_24_hours": "0.00",
                    "last_30_days": "0.00",
                    "last_7_days": "0.00",
                    "lifetime": "0.00"
                  },
                  "email": "marcus@shinetime.example",
                  "id": "mber_xxxxxxxxxxxxxx",
                  "joined_at": "2026-01-01T12:00:00.000Z",
                  "last_accessed_at": "2026-01-01T12:00:00.000Z",
                  "last_activity": {
                    "author": {
                      "id": "user_xxxxxxxxxxxxxx",
                      "name": "Dana Whitfield",
                      "profile_picture": {
                        "url": "https://ui-avatars.com/api/"
                      },
                      "username": "danawhitfield"
                    },
                    "channel_id": "channel_id",
                    "created_at": "created_at",
                    "id": "id",
                    "object": "message",
                    "plain_content": "plain_content"
                  },
                  "last_activity_at": "2026-01-01T12:00:00.000Z",
                  "metadata": {
                    "key": "value"
                  },
                  "most_recent_action": "canceling",
                  "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                  "name": "Northwind Legal LLP",
                  "phone_number": "+xxxxxxxxxxx",
                  "status": "joined",
                  "token_balance": 70.25,
                  "unsubscribe_status": "unsubscribed",
                  "usd_total_spent": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "user": {
                    "city": "Austin",
                    "country": "US",
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "state": "TX",
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
        let expectedResponse = Member(
            accessLevel: MemberAccessLevel.noAccess,
            accountId: "biz_xxxxxxxxxxxxxx",
            createdAt: "2026-01-01T12:00:00.000Z",
            displayName: "Dana Whitfield",
            earningsUsd: Nullable<UserEarningsAmount>.value(UserEarningsAmount(
                last24Hours: "0.00",
                last30Days: "0.00",
                last7Days: "0.00",
                lifetime: "0.00"
            )),
            email: Nullable<String>.value("marcus@shinetime.example"),
            id: "mber_xxxxxxxxxxxxxx",
            joinedAt: "2026-01-01T12:00:00.000Z",
            lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            lastActivity: Nullable<MemberLastActivity>.value(MemberLastActivityMessage(
                author: Nullable<UserSummary>.value(UserSummary(
                    id: "user_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Dana Whitfield"),
                    profilePicture: UserProfilePicture(
                        url: "https://ui-avatars.com/api/"
                    ),
                    username: "danawhitfield"
                )),
                channelId: "channel_id",
                createdAt: "created_at",
                id: "id",
                object: MemberLastActivityMessageObject.message,
                plainContent: Nullable<String>.value("plain_content")
            )),
            lastActivityAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            metadata: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            mostRecentAction: Nullable<MemberMostRecentAction>.value(MemberMostRecentAction.canceling),
            mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            name: Nullable<String>.value("Northwind Legal LLP"),
            phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
            status: MemberStatus.joined,
            tokenBalance: 70.25,
            unsubscribeStatus: Nullable<MemberUnsubscribeStatus>.value(MemberUnsubscribeStatus.unsubscribed),
            usdTotalSpent: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            user: Nullable<MemberUser>.value(MemberUser(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                state: Nullable<String>.value("TX"),
                username: "danawhitfield"
            ))
        )
        let response = try await client.members.retrieve(
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
                  "access_level": "no_access",
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "display_name": "Dana Whitfield",
                  "earnings_usd": {
                    "last_24_hours": "0.00",
                    "last_30_days": "0.00",
                    "last_7_days": "0.00",
                    "lifetime": "0.00"
                  },
                  "email": "marcus@shinetime.example",
                  "id": "mber_xxxxxxxxxxxxxx",
                  "joined_at": "2026-01-01T12:00:00.000Z",
                  "last_accessed_at": "2026-01-01T12:00:00.000Z",
                  "last_activity": {
                    "author": {
                      "id": "user_xxxxxxxxxxxxxx",
                      "name": "Dana Whitfield",
                      "profile_picture": {
                        "url": "https://ui-avatars.com/api/"
                      },
                      "username": "danawhitfield"
                    },
                    "channel_id": "channel_id",
                    "created_at": "created_at",
                    "id": "id",
                    "object": "message",
                    "plain_content": "plain_content"
                  },
                  "last_activity_at": "2026-01-01T12:00:00.000Z",
                  "metadata": {
                    "key": "value"
                  },
                  "most_recent_action": "canceling",
                  "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                  "name": "Northwind Legal LLP",
                  "phone_number": "+xxxxxxxxxxx",
                  "status": "joined",
                  "token_balance": 70.25,
                  "unsubscribe_status": "unsubscribed",
                  "usd_total_spent": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "user": {
                    "city": "Austin",
                    "country": "US",
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "state": "TX",
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
        let expectedResponse = Member(
            accessLevel: MemberAccessLevel.noAccess,
            accountId: "biz_xxxxxxxxxxxxxx",
            createdAt: "2026-01-01T12:00:00.000Z",
            displayName: "Dana Whitfield",
            earningsUsd: Nullable<UserEarningsAmount>.value(UserEarningsAmount(
                last24Hours: "0.00",
                last30Days: "0.00",
                last7Days: "0.00",
                lifetime: "0.00"
            )),
            email: Nullable<String>.value("marcus@shinetime.example"),
            id: "mber_xxxxxxxxxxxxxx",
            joinedAt: "2026-01-01T12:00:00.000Z",
            lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            lastActivity: Nullable<MemberLastActivity>.value(MemberLastActivityMessage(
                author: Nullable<UserSummary>.value(UserSummary(
                    id: "user_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Dana Whitfield"),
                    profilePicture: UserProfilePicture(
                        url: "https://ui-avatars.com/api/"
                    ),
                    username: "danawhitfield"
                )),
                channelId: "channel_id",
                createdAt: "created_at",
                id: "id",
                object: MemberLastActivityMessageObject.message,
                plainContent: Nullable<String>.value("plain_content")
            )),
            lastActivityAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            metadata: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            mostRecentAction: Nullable<MemberMostRecentAction>.value(MemberMostRecentAction.canceling),
            mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            name: Nullable<String>.value("Northwind Legal LLP"),
            phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
            status: MemberStatus.joined,
            tokenBalance: 70.25,
            unsubscribeStatus: Nullable<MemberUnsubscribeStatus>.value(MemberUnsubscribeStatus.unsubscribed),
            usdTotalSpent: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            user: Nullable<MemberUser>.value(MemberUser(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                state: Nullable<String>.value("TX"),
                username: "danawhitfield"
            ))
        )
        let response = try await client.members.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}