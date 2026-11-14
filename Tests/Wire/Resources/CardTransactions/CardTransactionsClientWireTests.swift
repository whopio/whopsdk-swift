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
                      "levels_points": 1.1,
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
                    levelsPoints: Nullable<Double>.value(1.1),
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
                endCursor: Nullable<String>.value("end_cursor"),
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

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "card_id": "card_id",
                      "cardholder_id": "cardholder_id",
                      "cashback_usd_amount": 1.1,
                      "created_at": "created_at",
                      "currency": "currency",
                      "declined_reason": "declined_reason",
                      "id": "id",
                      "international": true,
                      "levels_points": 1.1,
                      "local_amount": 1.1,
                      "merchant_category": "merchant_category",
                      "merchant_category_code": "merchant_category_code",
                      "merchant_icon_url": "merchant_icon_url",
                      "merchant_name": "merchant_name",
                      "posted_at": "posted_at",
                      "status": "pending",
                      "transaction_type": "spend",
                      "usd_amount": 1.1
                    },
                    {
                      "card_id": "card_id",
                      "cardholder_id": "cardholder_id",
                      "cashback_usd_amount": 1.1,
                      "created_at": "created_at",
                      "currency": "currency",
                      "declined_reason": "declined_reason",
                      "id": "id",
                      "international": true,
                      "levels_points": 1.1,
                      "local_amount": 1.1,
                      "merchant_category": "merchant_category",
                      "merchant_category_code": "merchant_category_code",
                      "merchant_icon_url": "merchant_icon_url",
                      "merchant_name": "merchant_name",
                      "posted_at": "posted_at",
                      "status": "pending",
                      "transaction_type": "spend",
                      "usd_amount": 1.1
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
        let expectedResponse = ListCardTransactionsResponse(
            data: [
                CardTransaction(
                    cardId: "card_id",
                    cardholderId: Nullable<String>.value("cardholder_id"),
                    cashbackUsdAmount: Nullable<Double>.value(1.1),
                    createdAt: "created_at",
                    currency: Nullable<String>.value("currency"),
                    declinedReason: Nullable<String>.value("declined_reason"),
                    id: "id",
                    international: true,
                    levelsPoints: Nullable<Double>.value(1.1),
                    localAmount: Nullable<Double>.value(1.1),
                    merchantCategory: Nullable<String>.value("merchant_category"),
                    merchantCategoryCode: Nullable<String>.value("merchant_category_code"),
                    merchantIconUrl: Nullable<String>.value("merchant_icon_url"),
                    merchantName: Nullable<String>.value("merchant_name"),
                    postedAt: Nullable<String>.value("posted_at"),
                    status: CardTransactionStatus.pending,
                    transactionType: CardTransactionTransactionType.spend,
                    usdAmount: Nullable<Double>.value(1.1)
                ),
                CardTransaction(
                    cardId: "card_id",
                    cardholderId: Nullable<String>.value("cardholder_id"),
                    cashbackUsdAmount: Nullable<Double>.value(1.1),
                    createdAt: "created_at",
                    currency: Nullable<String>.value("currency"),
                    declinedReason: Nullable<String>.value("declined_reason"),
                    id: "id",
                    international: true,
                    levelsPoints: Nullable<Double>.value(1.1),
                    localAmount: Nullable<Double>.value(1.1),
                    merchantCategory: Nullable<String>.value("merchant_category"),
                    merchantCategoryCode: Nullable<String>.value("merchant_category_code"),
                    merchantIconUrl: Nullable<String>.value("merchant_icon_url"),
                    merchantName: Nullable<String>.value("merchant_name"),
                    postedAt: Nullable<String>.value("posted_at"),
                    status: CardTransactionStatus.pending,
                    transactionType: CardTransactionTransactionType.spend,
                    usdAmount: Nullable<Double>.value(1.1)
                )
            ],
            pageInfo: ListCardTransactionsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.cardTransactions.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                  "levels_points": 1.1,
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
            levelsPoints: Nullable<Double>.value(1.1),
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

    @Test func retrieve2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "card_id": "card_id",
                  "cardholder_id": "cardholder_id",
                  "cashback_usd_amount": 1.1,
                  "created_at": "created_at",
                  "currency": "currency",
                  "declined_reason": "declined_reason",
                  "id": "id",
                  "international": true,
                  "levels_points": 1.1,
                  "local_amount": 1.1,
                  "merchant_category": "merchant_category",
                  "merchant_category_code": "merchant_category_code",
                  "merchant_icon_url": "merchant_icon_url",
                  "merchant_name": "merchant_name",
                  "posted_at": "posted_at",
                  "status": "pending",
                  "transaction_type": "spend",
                  "usd_amount": 1.1
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
            cardId: "card_id",
            cardholderId: Nullable<String>.value("cardholder_id"),
            cashbackUsdAmount: Nullable<Double>.value(1.1),
            createdAt: "created_at",
            currency: Nullable<String>.value("currency"),
            declinedReason: Nullable<String>.value("declined_reason"),
            id: "id",
            international: true,
            levelsPoints: Nullable<Double>.value(1.1),
            localAmount: Nullable<Double>.value(1.1),
            merchantCategory: Nullable<String>.value("merchant_category"),
            merchantCategoryCode: Nullable<String>.value("merchant_category_code"),
            merchantIconUrl: Nullable<String>.value("merchant_icon_url"),
            merchantName: Nullable<String>.value("merchant_name"),
            postedAt: Nullable<String>.value("posted_at"),
            status: CardTransactionStatus.pending,
            transactionType: CardTransactionTransactionType.spend,
            usdAmount: Nullable<Double>.value(1.1)
        )
        let response = try await client.cardTransactions.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}