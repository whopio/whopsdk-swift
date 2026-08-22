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
        let expectedResponse = ListPromoCodesResponse(
            data: [
                PromoCodeListItem(
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
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.promoCodes.list(
            accountId: "account_id",
            productIds: [
                "prod_xxxxxxxxxxxxxx"
            ],
            planIds: [
                "plan_xxxxxxxxxxxxxx"
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
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
                title: "Shine Time Auto Detailing"
            ),
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

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
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
                title: "Shine Time Auto Detailing"
            ),
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

    @Test func activate1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
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
                title: "Shine Time Auto Detailing"
            ),
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

    @Test func deactivate1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
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
                title: "Shine Time Auto Detailing"
            ),
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
}