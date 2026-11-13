import Foundation
import Testing
import WhopSDK

@Suite("CashbackRulesClient Wire Tests") struct CashbackRulesClientWireTests {
    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "description": "Cloud cashback",
                  "discarded_at": "discarded_at",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "funding_account_id": "biz_xxxxxxxxxxxxxx",
                  "id": "cicbr_xxxxxxxxxxxxxx",
                  "merchant_category_code": "7372",
                  "merchant_name": "ACME CLOUD",
                  "rate_bps": 500,
                  "scoped_account_id": "biz_xxxxxxxxxxxxxx",
                  "starts_at": "2026-01-01T12:00:00.000Z",
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CashbackRule(
            createdAt: "2026-01-01T12:00:00.000Z",
            description: Nullable<String>.value("Cloud cashback"),
            discardedAt: Nullable<String>.value("discarded_at"),
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            fundingAccountId: "biz_xxxxxxxxxxxxxx",
            id: "cicbr_xxxxxxxxxxxxxx",
            merchantCategoryCode: Nullable<String>.value("7372"),
            merchantName: Nullable<String>.value("ACME CLOUD"),
            rateBps: 500,
            scopedAccountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            startsAt: "2026-01-01T12:00:00.000Z",
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.cashbackRules.create(
            request: .init(
                rateBps: 500,
                startsAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "description": "Cloud cashback",
                      "discarded_at": "discarded_at",
                      "expires_at": "2026-01-01T12:00:00.000Z",
                      "funding_account_id": "biz_xxxxxxxxxxxxxx",
                      "id": "cicbr_xxxxxxxxxxxxxx",
                      "merchant_category_code": "7372",
                      "merchant_name": "ACME CLOUD",
                      "rate_bps": 500,
                      "scoped_account_id": "biz_xxxxxxxxxxxxxx",
                      "starts_at": "2026-01-01T12:00:00.000Z",
                      "updated_at": "2026-01-01T12:00:00.000Z"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
                    "has_previous_page": false,
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
        let expectedResponse = ListCashbackRulesResponse(
            data: [
                CashbackRule(
                    createdAt: "2026-01-01T12:00:00.000Z",
                    description: Nullable<String>.value("Cloud cashback"),
                    discardedAt: Nullable<String>.value("discarded_at"),
                    expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    fundingAccountId: "biz_xxxxxxxxxxxxxx",
                    id: "cicbr_xxxxxxxxxxxxxx",
                    merchantCategoryCode: Nullable<String>.value("7372"),
                    merchantName: Nullable<String>.value("ACME CLOUD"),
                    rateBps: 500,
                    scopedAccountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    startsAt: "2026-01-01T12:00:00.000Z",
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListCashbackRulesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.cashbackRules.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func payout1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "cashback_rule_id": "cashback_rule_id",
                  "status": "processing",
                  "transaction_id": "citx_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CashbackPayout(
            accountId: Optional(Nullable<String>.value("account_id")),
            cashbackRuleId: Optional(Nullable<String>.value("cashback_rule_id")),
            status: CashbackPayoutStatus.processing,
            transactionId: Optional(Nullable<String>.value("citx_xxxxxxxxxxxxxx"))
        )
        let response = try await client.cashbackRules.payout(
            request: .init(),
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
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "description": "Cloud cashback",
                  "discarded_at": "discarded_at",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "funding_account_id": "biz_xxxxxxxxxxxxxx",
                  "id": "cicbr_xxxxxxxxxxxxxx",
                  "merchant_category_code": "7372",
                  "merchant_name": "ACME CLOUD",
                  "rate_bps": 500,
                  "scoped_account_id": "biz_xxxxxxxxxxxxxx",
                  "starts_at": "2026-01-01T12:00:00.000Z",
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CashbackRule(
            createdAt: "2026-01-01T12:00:00.000Z",
            description: Nullable<String>.value("Cloud cashback"),
            discardedAt: Nullable<String>.value("discarded_at"),
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            fundingAccountId: "biz_xxxxxxxxxxxxxx",
            id: "cicbr_xxxxxxxxxxxxxx",
            merchantCategoryCode: Nullable<String>.value("7372"),
            merchantName: Nullable<String>.value("ACME CLOUD"),
            rateBps: 500,
            scopedAccountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            startsAt: "2026-01-01T12:00:00.000Z",
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.cashbackRules.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}