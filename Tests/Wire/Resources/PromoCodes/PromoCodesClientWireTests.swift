import Foundation
import Testing
import WhopSDK

@Suite("PromoCodesClient Wire Tests") struct PromoCodesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "affiliate": {
                        "id": "aff_xxxxxxxxxxxxxx",
                        "user": {
                          "id": "user_xxxxxxxxxxxxxx",
                          "name": "Jack Sharkey the 3rd",
                          "profile_pic": "https://ui-avatars.com/api/",
                          "username": "newpromoaffiliate"
                        }
                      },
                      "amount_off": 0.1,
                      "churned_users_only": false,
                      "code": "welcome",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "currency": "usd",
                      "duration": "forever",
                      "existing_memberships_only": false,
                      "expires_at": "2026-01-01T12:00:00.000Z",
                      "id": "promo_xxxxxxxxxxxxxx",
                      "metadata": {
                        "key": "value"
                      },
                      "new_users_only": true,
                      "one_per_customer": true,
                      "product": {
                        "id": "prod_xxxxxxxxxxxxxx",
                        "title": "Ceramic Coating Package"
                      },
                      "promo_duration_months": 1,
                      "promo_type": "percentage",
                      "status": "active",
                      "stock": 25,
                      "unlimited_stock": false,
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "uses": 1
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
        let expectedResponse = ListPromoCodesResponse(
            data: [
                PromoCodeListItem(
                    affiliate: Nullable<PromoCodeAffiliate>.value(PromoCodeAffiliate(
                        id: "aff_xxxxxxxxxxxxxx",
                        user: PromoCodeAffiliateUser(
                            id: "user_xxxxxxxxxxxxxx",
                            name: Nullable<String>.value("Jack Sharkey the 3rd"),
                            profilePic: "https://ui-avatars.com/api/",
                            username: Nullable<String>.value("newpromoaffiliate")
                        )
                    )),
                    amountOff: 0.1,
                    churnedUsersOnly: false,
                    code: Nullable<String>.value("welcome"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currency: PromoCodeListItemCurrency.usd,
                    duration: PromoCodeListItemDuration.forever,
                    existingMembershipsOnly: false,
                    expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    id: "promo_xxxxxxxxxxxxxx",
                    metadata: [
                        "key": JSONValue.string("value")
                    ],
                    newUsersOnly: true,
                    onePerCustomer: true,
                    product: Nullable<PromoCodeProduct>.value(PromoCodeProduct(
                        id: "prod_xxxxxxxxxxxxxx",
                        title: "Ceramic Coating Package"
                    )),
                    promoDurationMonths: Nullable<Int>.value(1),
                    promoType: PromoCodeListItemPromoType.percentage,
                    status: PromoCodeListItemStatus.active,
                    stock: 25,
                    unlimitedStock: false,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    uses: 1
                )
            ],
            pageInfo: ListPromoCodesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                totalCount: Nullable<Int>.value(1),
                totalCountCapped: true
            )
        )
        let response = try await client.promoCodes.list(
            accountId: "account_id",
            productIds: [
                "prod_xxxxxxxxxxxxxx"
            ],
            variantIds: [
                "plan_xxxxxxxxxxxxxx"
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
                      "affiliate": {
                        "id": "id",
                        "user": {
                          "id": "id",
                          "name": "name",
                          "profile_pic": "profile_pic",
                          "username": "username"
                        }
                      },
                      "amount_off": 1.1,
                      "churned_users_only": true,
                      "code": "code",
                      "created_at": "created_at",
                      "currency": "usd",
                      "duration": "forever",
                      "existing_memberships_only": true,
                      "expires_at": "expires_at",
                      "id": "id",
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "new_users_only": true,
                      "one_per_customer": true,
                      "product": {
                        "id": "id",
                        "title": "title"
                      },
                      "promo_duration_months": 1,
                      "promo_type": "percentage",
                      "status": "active",
                      "stock": 1,
                      "unlimited_stock": true,
                      "updated_at": "updated_at",
                      "uses": 1
                    },
                    {
                      "affiliate": {
                        "id": "id",
                        "user": {
                          "id": "id",
                          "name": "name",
                          "profile_pic": "profile_pic",
                          "username": "username"
                        }
                      },
                      "amount_off": 1.1,
                      "churned_users_only": true,
                      "code": "code",
                      "created_at": "created_at",
                      "currency": "usd",
                      "duration": "forever",
                      "existing_memberships_only": true,
                      "expires_at": "expires_at",
                      "id": "id",
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "new_users_only": true,
                      "one_per_customer": true,
                      "product": {
                        "id": "id",
                        "title": "title"
                      },
                      "promo_duration_months": 1,
                      "promo_type": "percentage",
                      "status": "active",
                      "stock": 1,
                      "unlimited_stock": true,
                      "updated_at": "updated_at",
                      "uses": 1
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": true,
                    "has_previous_page": true,
                    "start_cursor": "start_cursor",
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
        let expectedResponse = ListPromoCodesResponse(
            data: [
                PromoCodeListItem(
                    affiliate: Nullable<PromoCodeAffiliate>.value(PromoCodeAffiliate(
                        id: "id",
                        user: PromoCodeAffiliateUser(
                            id: "id",
                            name: Nullable<String>.value("name"),
                            profilePic: "profile_pic",
                            username: Nullable<String>.value("username")
                        )
                    )),
                    amountOff: 1.1,
                    churnedUsersOnly: true,
                    code: Nullable<String>.value("code"),
                    createdAt: "created_at",
                    currency: PromoCodeListItemCurrency.usd,
                    duration: PromoCodeListItemDuration.forever,
                    existingMembershipsOnly: true,
                    expiresAt: Nullable<String>.value("expires_at"),
                    id: "id",
                    metadata: [
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    newUsersOnly: true,
                    onePerCustomer: true,
                    product: Nullable<PromoCodeProduct>.value(PromoCodeProduct(
                        id: "id",
                        title: "title"
                    )),
                    promoDurationMonths: Nullable<Int>.value(1),
                    promoType: PromoCodeListItemPromoType.percentage,
                    status: PromoCodeListItemStatus.active,
                    stock: 1,
                    unlimitedStock: true,
                    updatedAt: "updated_at",
                    uses: 1
                ),
                PromoCodeListItem(
                    affiliate: Nullable<PromoCodeAffiliate>.value(PromoCodeAffiliate(
                        id: "id",
                        user: PromoCodeAffiliateUser(
                            id: "id",
                            name: Nullable<String>.value("name"),
                            profilePic: "profile_pic",
                            username: Nullable<String>.value("username")
                        )
                    )),
                    amountOff: 1.1,
                    churnedUsersOnly: true,
                    code: Nullable<String>.value("code"),
                    createdAt: "created_at",
                    currency: PromoCodeListItemCurrency.usd,
                    duration: PromoCodeListItemDuration.forever,
                    existingMembershipsOnly: true,
                    expiresAt: Nullable<String>.value("expires_at"),
                    id: "id",
                    metadata: [
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    newUsersOnly: true,
                    onePerCustomer: true,
                    product: Nullable<PromoCodeProduct>.value(PromoCodeProduct(
                        id: "id",
                        title: "title"
                    )),
                    promoDurationMonths: Nullable<Int>.value(1),
                    promoType: PromoCodeListItemPromoType.percentage,
                    status: PromoCodeListItemStatus.active,
                    stock: 1,
                    unlimitedStock: true,
                    updatedAt: "updated_at",
                    uses: 1
                )
            ],
            pageInfo: ListPromoCodesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor"),
                totalCount: Nullable<Int>.value(1),
                totalCountCapped: true
            )
        )
        let response = try await client.promoCodes.list(
            accountId: "account_id",
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "affiliate": {
                    "id": "aff_xxxxxxxxxxxxxx",
                    "user": {
                      "id": "user_xxxxxxxxxxxxxx",
                      "name": "Jack Sharkey the 3rd",
                      "profile_pic": "https://ui-avatars.com/api/",
                      "username": "newpromoaffiliate"
                    }
                  },
                  "amount_off": 0.25,
                  "churned_users_only": false,
                  "code": "affiliate25",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "duration": "forever",
                  "existing_memberships_only": false,
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "id": "promo_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "new_users_only": true,
                  "one_per_customer": true,
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "promo_duration_months": 3,
                  "promo_type": "percentage",
                  "status": "active",
                  "stock": 200,
                  "unlimited_stock": false,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "uses": 0
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PromoCode(
            account: AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            ),
            affiliate: Nullable<PromoCodeAffiliate>.value(PromoCodeAffiliate(
                id: "aff_xxxxxxxxxxxxxx",
                user: PromoCodeAffiliateUser(
                    id: "user_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Jack Sharkey the 3rd"),
                    profilePic: "https://ui-avatars.com/api/",
                    username: Nullable<String>.value("newpromoaffiliate")
                )
            )),
            amountOff: 0.25,
            churnedUsersOnly: false,
            code: Nullable<String>.value("affiliate25"),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: PromoCodeCurrency.usd,
            duration: PromoCodeDuration.forever,
            existingMembershipsOnly: false,
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "promo_xxxxxxxxxxxxxx",
            metadata: [
                "key": JSONValue.string("value")
            ],
            newUsersOnly: true,
            onePerCustomer: true,
            product: Nullable<PromoCodeProduct>.value(PromoCodeProduct(
                id: "prod_xxxxxxxxxxxxxx",
                title: "Ceramic Coating Package"
            )),
            promoDurationMonths: Nullable<Int>.value(3),
            promoType: PromoCodePromoType.percentage,
            status: PromoCodeStatus.active,
            stock: 200,
            unlimitedStock: false,
            updatedAt: "2026-01-01T12:00:00.000Z",
            uses: 0
        )
        let response = try await client.promoCodes.create(
            request: .init(
                accountId: "biz_xxxxxxxxxxxxxx",
                amountOff: 25,
                baseCurrency: .usd,
                code: "AFFILIATE25",
                newUsersOnly: true,
                promoDurationMonths: 3,
                promoType: .percentage
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "affiliate": {
                    "id": "id",
                    "user": {
                      "id": "id",
                      "name": "name",
                      "profile_pic": "profile_pic",
                      "username": "username"
                    }
                  },
                  "amount_off": 1.1,
                  "churned_users_only": true,
                  "code": "code",
                  "created_at": "created_at",
                  "currency": "usd",
                  "duration": "forever",
                  "existing_memberships_only": true,
                  "expires_at": "expires_at",
                  "id": "id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "new_users_only": true,
                  "one_per_customer": true,
                  "product": {
                    "id": "id",
                    "title": "title"
                  },
                  "promo_duration_months": 1,
                  "promo_type": "percentage",
                  "status": "active",
                  "stock": 1,
                  "unlimited_stock": true,
                  "updated_at": "updated_at",
                  "uses": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PromoCode(
            account: AccountSummary(
                id: "id",
                title: "title"
            ),
            affiliate: Nullable<PromoCodeAffiliate>.value(PromoCodeAffiliate(
                id: "id",
                user: PromoCodeAffiliateUser(
                    id: "id",
                    name: Nullable<String>.value("name"),
                    profilePic: "profile_pic",
                    username: Nullable<String>.value("username")
                )
            )),
            amountOff: 1.1,
            churnedUsersOnly: true,
            code: Nullable<String>.value("code"),
            createdAt: "created_at",
            currency: PromoCodeCurrency.usd,
            duration: PromoCodeDuration.forever,
            existingMembershipsOnly: true,
            expiresAt: Nullable<String>.value("expires_at"),
            id: "id",
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            newUsersOnly: true,
            onePerCustomer: true,
            product: Nullable<PromoCodeProduct>.value(PromoCodeProduct(
                id: "id",
                title: "title"
            )),
            promoDurationMonths: Nullable<Int>.value(1),
            promoType: PromoCodePromoType.percentage,
            status: PromoCodeStatus.active,
            stock: 1,
            unlimitedStock: true,
            updatedAt: "updated_at",
            uses: 1
        )
        let response = try await client.promoCodes.create(
            request: .init(
                accountId: "account_id",
                amountOff: 1.1,
                baseCurrency: .usd,
                code: "code",
                newUsersOnly: true,
                promoDurationMonths: 1,
                promoType: .percentage
            ),
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "affiliate": {
                    "id": "aff_xxxxxxxxxxxxxx",
                    "user": {
                      "id": "user_xxxxxxxxxxxxxx",
                      "name": "Jack Sharkey the 3rd",
                      "profile_pic": "https://ui-avatars.com/api/",
                      "username": "newpromoaffiliate"
                    }
                  },
                  "amount_off": 0.25,
                  "churned_users_only": false,
                  "code": "affiliate25",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "duration": "forever",
                  "existing_memberships_only": false,
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "id": "promo_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "new_users_only": true,
                  "one_per_customer": true,
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "promo_duration_months": 3,
                  "promo_type": "percentage",
                  "status": "active",
                  "stock": 200,
                  "unlimited_stock": false,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "uses": 0
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PromoCode(
            account: AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            ),
            affiliate: Nullable<PromoCodeAffiliate>.value(PromoCodeAffiliate(
                id: "aff_xxxxxxxxxxxxxx",
                user: PromoCodeAffiliateUser(
                    id: "user_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Jack Sharkey the 3rd"),
                    profilePic: "https://ui-avatars.com/api/",
                    username: Nullable<String>.value("newpromoaffiliate")
                )
            )),
            amountOff: 0.25,
            churnedUsersOnly: false,
            code: Nullable<String>.value("affiliate25"),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: PromoCodeCurrency.usd,
            duration: PromoCodeDuration.forever,
            existingMembershipsOnly: false,
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "promo_xxxxxxxxxxxxxx",
            metadata: [
                "key": JSONValue.string("value")
            ],
            newUsersOnly: true,
            onePerCustomer: true,
            product: Nullable<PromoCodeProduct>.value(PromoCodeProduct(
                id: "prod_xxxxxxxxxxxxxx",
                title: "Ceramic Coating Package"
            )),
            promoDurationMonths: Nullable<Int>.value(3),
            promoType: PromoCodePromoType.percentage,
            status: PromoCodeStatus.active,
            stock: 200,
            unlimitedStock: false,
            updatedAt: "2026-01-01T12:00:00.000Z",
            uses: 0
        )
        let response = try await client.promoCodes.retrieve(
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
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "affiliate": {
                    "id": "id",
                    "user": {
                      "id": "id",
                      "name": "name",
                      "profile_pic": "profile_pic",
                      "username": "username"
                    }
                  },
                  "amount_off": 1.1,
                  "churned_users_only": true,
                  "code": "code",
                  "created_at": "created_at",
                  "currency": "usd",
                  "duration": "forever",
                  "existing_memberships_only": true,
                  "expires_at": "expires_at",
                  "id": "id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "new_users_only": true,
                  "one_per_customer": true,
                  "product": {
                    "id": "id",
                    "title": "title"
                  },
                  "promo_duration_months": 1,
                  "promo_type": "percentage",
                  "status": "active",
                  "stock": 1,
                  "unlimited_stock": true,
                  "updated_at": "updated_at",
                  "uses": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PromoCode(
            account: AccountSummary(
                id: "id",
                title: "title"
            ),
            affiliate: Nullable<PromoCodeAffiliate>.value(PromoCodeAffiliate(
                id: "id",
                user: PromoCodeAffiliateUser(
                    id: "id",
                    name: Nullable<String>.value("name"),
                    profilePic: "profile_pic",
                    username: Nullable<String>.value("username")
                )
            )),
            amountOff: 1.1,
            churnedUsersOnly: true,
            code: Nullable<String>.value("code"),
            createdAt: "created_at",
            currency: PromoCodeCurrency.usd,
            duration: PromoCodeDuration.forever,
            existingMembershipsOnly: true,
            expiresAt: Nullable<String>.value("expires_at"),
            id: "id",
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            newUsersOnly: true,
            onePerCustomer: true,
            product: Nullable<PromoCodeProduct>.value(PromoCodeProduct(
                id: "id",
                title: "title"
            )),
            promoDurationMonths: Nullable<Int>.value(1),
            promoType: PromoCodePromoType.percentage,
            status: PromoCodeStatus.active,
            stock: 1,
            unlimitedStock: true,
            updatedAt: "updated_at",
            uses: 1
        )
        let response = try await client.promoCodes.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "deleted": true,
                  "id": "promo_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeletePromoCodesResponse(
            deleted: true,
            id: "promo_xxxxxxxxxxxxxx"
        )
        let response = try await client.promoCodes.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "deleted": true,
                  "id": "id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeletePromoCodesResponse(
            deleted: true,
            id: "id"
        )
        let response = try await client.promoCodes.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func activate1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "affiliate": {
                    "id": "aff_xxxxxxxxxxxxxx",
                    "user": {
                      "id": "user_xxxxxxxxxxxxxx",
                      "name": "Jack Sharkey the 3rd",
                      "profile_pic": "https://ui-avatars.com/api/",
                      "username": "newpromoaffiliate"
                    }
                  },
                  "amount_off": 0.25,
                  "churned_users_only": false,
                  "code": "affiliate25",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "duration": "forever",
                  "existing_memberships_only": false,
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "id": "promo_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "new_users_only": true,
                  "one_per_customer": true,
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "promo_duration_months": 3,
                  "promo_type": "percentage",
                  "status": "active",
                  "stock": 200,
                  "unlimited_stock": false,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "uses": 0
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PromoCode(
            account: AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            ),
            affiliate: Nullable<PromoCodeAffiliate>.value(PromoCodeAffiliate(
                id: "aff_xxxxxxxxxxxxxx",
                user: PromoCodeAffiliateUser(
                    id: "user_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Jack Sharkey the 3rd"),
                    profilePic: "https://ui-avatars.com/api/",
                    username: Nullable<String>.value("newpromoaffiliate")
                )
            )),
            amountOff: 0.25,
            churnedUsersOnly: false,
            code: Nullable<String>.value("affiliate25"),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: PromoCodeCurrency.usd,
            duration: PromoCodeDuration.forever,
            existingMembershipsOnly: false,
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "promo_xxxxxxxxxxxxxx",
            metadata: [
                "key": JSONValue.string("value")
            ],
            newUsersOnly: true,
            onePerCustomer: true,
            product: Nullable<PromoCodeProduct>.value(PromoCodeProduct(
                id: "prod_xxxxxxxxxxxxxx",
                title: "Ceramic Coating Package"
            )),
            promoDurationMonths: Nullable<Int>.value(3),
            promoType: PromoCodePromoType.percentage,
            status: PromoCodeStatus.active,
            stock: 200,
            unlimitedStock: false,
            updatedAt: "2026-01-01T12:00:00.000Z",
            uses: 0
        )
        let response = try await client.promoCodes.activate(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func activate2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "affiliate": {
                    "id": "id",
                    "user": {
                      "id": "id",
                      "name": "name",
                      "profile_pic": "profile_pic",
                      "username": "username"
                    }
                  },
                  "amount_off": 1.1,
                  "churned_users_only": true,
                  "code": "code",
                  "created_at": "created_at",
                  "currency": "usd",
                  "duration": "forever",
                  "existing_memberships_only": true,
                  "expires_at": "expires_at",
                  "id": "id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "new_users_only": true,
                  "one_per_customer": true,
                  "product": {
                    "id": "id",
                    "title": "title"
                  },
                  "promo_duration_months": 1,
                  "promo_type": "percentage",
                  "status": "active",
                  "stock": 1,
                  "unlimited_stock": true,
                  "updated_at": "updated_at",
                  "uses": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PromoCode(
            account: AccountSummary(
                id: "id",
                title: "title"
            ),
            affiliate: Nullable<PromoCodeAffiliate>.value(PromoCodeAffiliate(
                id: "id",
                user: PromoCodeAffiliateUser(
                    id: "id",
                    name: Nullable<String>.value("name"),
                    profilePic: "profile_pic",
                    username: Nullable<String>.value("username")
                )
            )),
            amountOff: 1.1,
            churnedUsersOnly: true,
            code: Nullable<String>.value("code"),
            createdAt: "created_at",
            currency: PromoCodeCurrency.usd,
            duration: PromoCodeDuration.forever,
            existingMembershipsOnly: true,
            expiresAt: Nullable<String>.value("expires_at"),
            id: "id",
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            newUsersOnly: true,
            onePerCustomer: true,
            product: Nullable<PromoCodeProduct>.value(PromoCodeProduct(
                id: "id",
                title: "title"
            )),
            promoDurationMonths: Nullable<Int>.value(1),
            promoType: PromoCodePromoType.percentage,
            status: PromoCodeStatus.active,
            stock: 1,
            unlimitedStock: true,
            updatedAt: "updated_at",
            uses: 1
        )
        let response = try await client.promoCodes.activate(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func deactivate1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "affiliate": {
                    "id": "aff_xxxxxxxxxxxxxx",
                    "user": {
                      "id": "user_xxxxxxxxxxxxxx",
                      "name": "Jack Sharkey the 3rd",
                      "profile_pic": "https://ui-avatars.com/api/",
                      "username": "newpromoaffiliate"
                    }
                  },
                  "amount_off": 0.25,
                  "churned_users_only": false,
                  "code": "affiliate25",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "duration": "forever",
                  "existing_memberships_only": false,
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "id": "promo_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "new_users_only": true,
                  "one_per_customer": true,
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "promo_duration_months": 3,
                  "promo_type": "percentage",
                  "status": "active",
                  "stock": 200,
                  "unlimited_stock": false,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "uses": 0
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PromoCode(
            account: AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            ),
            affiliate: Nullable<PromoCodeAffiliate>.value(PromoCodeAffiliate(
                id: "aff_xxxxxxxxxxxxxx",
                user: PromoCodeAffiliateUser(
                    id: "user_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Jack Sharkey the 3rd"),
                    profilePic: "https://ui-avatars.com/api/",
                    username: Nullable<String>.value("newpromoaffiliate")
                )
            )),
            amountOff: 0.25,
            churnedUsersOnly: false,
            code: Nullable<String>.value("affiliate25"),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: PromoCodeCurrency.usd,
            duration: PromoCodeDuration.forever,
            existingMembershipsOnly: false,
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "promo_xxxxxxxxxxxxxx",
            metadata: [
                "key": JSONValue.string("value")
            ],
            newUsersOnly: true,
            onePerCustomer: true,
            product: Nullable<PromoCodeProduct>.value(PromoCodeProduct(
                id: "prod_xxxxxxxxxxxxxx",
                title: "Ceramic Coating Package"
            )),
            promoDurationMonths: Nullable<Int>.value(3),
            promoType: PromoCodePromoType.percentage,
            status: PromoCodeStatus.active,
            stock: 200,
            unlimitedStock: false,
            updatedAt: "2026-01-01T12:00:00.000Z",
            uses: 0
        )
        let response = try await client.promoCodes.deactivate(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func deactivate2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "affiliate": {
                    "id": "id",
                    "user": {
                      "id": "id",
                      "name": "name",
                      "profile_pic": "profile_pic",
                      "username": "username"
                    }
                  },
                  "amount_off": 1.1,
                  "churned_users_only": true,
                  "code": "code",
                  "created_at": "created_at",
                  "currency": "usd",
                  "duration": "forever",
                  "existing_memberships_only": true,
                  "expires_at": "expires_at",
                  "id": "id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "new_users_only": true,
                  "one_per_customer": true,
                  "product": {
                    "id": "id",
                    "title": "title"
                  },
                  "promo_duration_months": 1,
                  "promo_type": "percentage",
                  "status": "active",
                  "stock": 1,
                  "unlimited_stock": true,
                  "updated_at": "updated_at",
                  "uses": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PromoCode(
            account: AccountSummary(
                id: "id",
                title: "title"
            ),
            affiliate: Nullable<PromoCodeAffiliate>.value(PromoCodeAffiliate(
                id: "id",
                user: PromoCodeAffiliateUser(
                    id: "id",
                    name: Nullable<String>.value("name"),
                    profilePic: "profile_pic",
                    username: Nullable<String>.value("username")
                )
            )),
            amountOff: 1.1,
            churnedUsersOnly: true,
            code: Nullable<String>.value("code"),
            createdAt: "created_at",
            currency: PromoCodeCurrency.usd,
            duration: PromoCodeDuration.forever,
            existingMembershipsOnly: true,
            expiresAt: Nullable<String>.value("expires_at"),
            id: "id",
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            newUsersOnly: true,
            onePerCustomer: true,
            product: Nullable<PromoCodeProduct>.value(PromoCodeProduct(
                id: "id",
                title: "title"
            )),
            promoDurationMonths: Nullable<Int>.value(1),
            promoType: PromoCodePromoType.percentage,
            status: PromoCodeStatus.active,
            stock: 1,
            unlimitedStock: true,
            updatedAt: "updated_at",
            uses: 1
        )
        let response = try await client.promoCodes.deactivate(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}