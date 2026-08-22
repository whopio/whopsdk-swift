import Foundation
import Testing
import WhopSDK

@Suite("CardTransactionsClient Wire Tests") struct CardTransactionsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "card_id": "icrd_xxxxxxxxxxxxxx",
                      "cardholder_id": "user_xxxxxxxxxxxxxx",
                      "cashback_usd_amount": 0.25,
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "currency": "EUR",
                      "declined_reason": "account_credit_limit_exceeded",
                      "id": "citx_xxxxxxxxxxxxxx",
                      "international": true,
                      "local_amount": 22.5,
                      "merchant_category": "Car Care Supplies",
                      "merchant_category_code": "5533",
                      "merchant_icon_url": "https://shinetime.example/icons/lone-star-detail-supply.png",
                      "merchant_name": "Lone Star Detail Supply",
                      "posted_at": "2026-01-01T12:00:00.000Z",
                      "status": "pending",
                      "transaction_type": "spend",
                      "usd_amount": 24.99
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
        let expectedResponse = ListCardTransactionsResponse(
            data: [
                CardTransaction(
                    cardId: "icrd_xxxxxxxxxxxxxx",
                    cardholderId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                    cashbackUsdAmount: Nullable<Double>.value(0.25),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currency: Nullable<String>.value("EUR"),
                    declinedReason: Nullable<String>.value("account_credit_limit_exceeded"),
                    id: "citx_xxxxxxxxxxxxxx",
                    international: true,
                    localAmount: Nullable<Double>.value(22.5),
                    merchantCategory: Nullable<String>.value("Car Care Supplies"),
                    merchantCategoryCode: Nullable<String>.value("5533"),
                    merchantIconUrl: Nullable<String>.value("https://shinetime.example/icons/lone-star-detail-supply.png"),
                    merchantName: Nullable<String>.value("Lone Star Detail Supply"),
                    postedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    status: CardTransactionStatus.pending,
                    transactionType: CardTransactionTransactionType.spend,
                    usdAmount: Nullable<Double>.value(24.99)
                )
            ],
            pageInfo: ListCardTransactionsResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.cardTransactions.list(
            transactionIds: [
                "citx_xxxxxxxxxxxxxx"
            ],
            cardId: [
                "icrd_xxxxxxxxxxxxxx"
            ],
            cardholderId: [
                "user_xxxxxxxxxxxxxx"
            ],
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
                  "card_id": "icrd_xxxxxxxxxxxxxx",
                  "cardholder_id": "user_xxxxxxxxxxxxxx",
                  "cashback_usd_amount": 0.25,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "EUR",
                  "declined_reason": "account_credit_limit_exceeded",
                  "id": "citx_xxxxxxxxxxxxxx",
                  "international": true,
                  "local_amount": 22.5,
                  "merchant_category": "Car Care Supplies",
                  "merchant_category_code": "5533",
                  "merchant_icon_url": "https://shinetime.example/icons/lone-star-detail-supply.png",
                  "merchant_name": "Lone Star Detail Supply",
                  "posted_at": "2026-01-01T12:00:00.000Z",
                  "status": "pending",
                  "transaction_type": "spend",
                  "usd_amount": 24.99
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CardTransaction(
            cardId: "icrd_xxxxxxxxxxxxxx",
            cardholderId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
            cashbackUsdAmount: Nullable<Double>.value(0.25),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: Nullable<String>.value("EUR"),
            declinedReason: Nullable<String>.value("account_credit_limit_exceeded"),
            id: "citx_xxxxxxxxxxxxxx",
            international: true,
            localAmount: Nullable<Double>.value(22.5),
            merchantCategory: Nullable<String>.value("Car Care Supplies"),
            merchantCategoryCode: Nullable<String>.value("5533"),
            merchantIconUrl: Nullable<String>.value("https://shinetime.example/icons/lone-star-detail-supply.png"),
            merchantName: Nullable<String>.value("Lone Star Detail Supply"),
            postedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: CardTransactionStatus.pending,
            transactionType: CardTransactionTransactionType.spend,
            usdAmount: Nullable<Double>.value(24.99)
        )
        let response = try await client.cardTransactions.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}