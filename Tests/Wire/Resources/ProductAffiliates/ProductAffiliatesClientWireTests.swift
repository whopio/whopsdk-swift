import Foundation
import Testing
import WhopSDK

@Suite("ProductAffiliatesClient Wire Tests") struct ProductAffiliatesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "id": "apaf_xxxxxxxxxxxxxx",
                      "product": {
                        "id": "prod_xxxxxxxxxxxxxx",
                        "title": "Ceramic Coating Package"
                      },
                      "referred_users_count": 3,
                      "status": "active",
                      "total_reward_amount_usd": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "user": {
                        "email": "marcus@shinetime.example",
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Jack Sharkey the 2nd",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "random-username-2-xxxxxxxx"
                      }
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "WyJjdXJzb3IiLDFd"
                  },
                  "total_count": 2
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListProductAffiliatesResponse(
            data: [
                ProductAffiliate(
                    createdAt: "2026-01-01T12:00:00.000Z",
                    id: "apaf_xxxxxxxxxxxxxx",
                    product: PromoCodeProduct(
                        id: "prod_xxxxxxxxxxxxxx",
                        title: "Ceramic Coating Package"
                    ),
                    referredUsersCount: 3,
                    status: ProductAffiliateStatus.active,
                    totalRewardAmountUsd: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    user: ProductAffiliateUser(
                        email: Nullable<String>.value("marcus@shinetime.example"),
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Jack Sharkey the 2nd"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "random-username-2-xxxxxxxx"
                    )
                )
            ],
            pageInfo: ListProductAffiliatesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            ),
            totalCount: Nullable<Int>.value(2)
        )
        let response = try await client.productAffiliates.list(
            accountId: "account_id",
            productIds: [
                "prod_xxxxxxxxxxxxxx"
            ],
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
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
                      "created_at": "created_at",
                      "id": "id",
                      "product": {
                        "id": "id",
                        "title": "title"
                      },
                      "referred_users_count": 1,
                      "status": "active",
                      "total_reward_amount_usd": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "user": {
                        "email": "email",
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      }
                    },
                    {
                      "created_at": "created_at",
                      "id": "id",
                      "product": {
                        "id": "id",
                        "title": "title"
                      },
                      "referred_users_count": 1,
                      "status": "active",
                      "total_reward_amount_usd": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "user": {
                        "email": "email",
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      }
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": true,
                    "has_previous_page": true,
                    "start_cursor": "start_cursor"
                  },
                  "total_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListProductAffiliatesResponse(
            data: [
                ProductAffiliate(
                    createdAt: "created_at",
                    id: "id",
                    product: PromoCodeProduct(
                        id: "id",
                        title: "title"
                    ),
                    referredUsersCount: 1,
                    status: ProductAffiliateStatus.active,
                    totalRewardAmountUsd: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    user: ProductAffiliateUser(
                        email: Nullable<String>.value("email"),
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )
                ),
                ProductAffiliate(
                    createdAt: "created_at",
                    id: "id",
                    product: PromoCodeProduct(
                        id: "id",
                        title: "title"
                    ),
                    referredUsersCount: 1,
                    status: ProductAffiliateStatus.active,
                    totalRewardAmountUsd: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    user: ProductAffiliateUser(
                        email: Nullable<String>.value("email"),
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )
                )
            ],
            pageInfo: ListProductAffiliatesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            ),
            totalCount: Nullable<Int>.value(1)
        )
        let response = try await client.productAffiliates.list(
            accountId: "account_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}