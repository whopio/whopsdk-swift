import Foundation
import Testing
import WhopSDK

@Suite("FeeMarkupsClient Wire Tests") struct FeeMarkupsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2023-12-01T05:00:00Z",
                      "fee_type": "crypto_withdrawal_markup",
                      "fixed_fee_usd": 6.9,
                      "id": "id",
                      "notes": "Approved by finance team on 2024-01-15",
                      "percentage_fee": 6.9,
                      "updated_at": "2023-12-01T05:00:00Z"
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
        let expectedResponse = ListFeeMarkupsResponse(
            data: [
                FeeMarkupListItem(
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    feeType: FeeMarkupTypes.cryptoWithdrawalMarkup,
                    fixedFeeUsd: Nullable<Double>.value(6.9),
                    id: "id",
                    notes: Nullable<String>.value("Approved by finance team on 2024-01-15"),
                    percentageFee: Nullable<Double>.value(6.9),
                    updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.feeMarkups.list(
            first: 42,
            last: 42,
            accountId: "biz_xxxxxxxxxxxxxx",
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
                      "created_at": "2024-01-15T09:30:00Z",
                      "fee_type": "crypto_withdrawal_markup",
                      "fixed_fee_usd": 1.1,
                      "id": "id",
                      "notes": "notes",
                      "percentage_fee": 1.1,
                      "updated_at": "2024-01-15T09:30:00Z"
                    },
                    {
                      "created_at": "2024-01-15T09:30:00Z",
                      "fee_type": "crypto_withdrawal_markup",
                      "fixed_fee_usd": 1.1,
                      "id": "id",
                      "notes": "notes",
                      "percentage_fee": 1.1,
                      "updated_at": "2024-01-15T09:30:00Z"
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
        let expectedResponse = ListFeeMarkupsResponse(
            data: [
                FeeMarkupListItem(
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    feeType: FeeMarkupTypes.cryptoWithdrawalMarkup,
                    fixedFeeUsd: Nullable<Double>.value(1.1),
                    id: "id",
                    notes: Nullable<String>.value("notes"),
                    percentageFee: Nullable<Double>.value(1.1),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                ),
                FeeMarkupListItem(
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    feeType: FeeMarkupTypes.cryptoWithdrawalMarkup,
                    fixedFeeUsd: Nullable<Double>.value(1.1),
                    id: "id",
                    notes: Nullable<String>.value("notes"),
                    percentageFee: Nullable<Double>.value(1.1),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.feeMarkups.list(
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
                  "created_at": "2023-12-01T05:00:00Z",
                  "fee_type": "crypto_withdrawal_markup",
                  "fixed_fee_usd": 6.9,
                  "id": "id",
                  "notes": "Approved by finance team on 2024-01-15",
                  "percentage_fee": 6.9,
                  "updated_at": "2023-12-01T05:00:00Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = FeeMarkup(
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            feeType: FeeMarkupTypes.cryptoWithdrawalMarkup,
            fixedFeeUsd: Nullable<Double>.value(6.9),
            id: "id",
            notes: Nullable<String>.value("Approved by finance team on 2024-01-15"),
            percentageFee: Nullable<Double>.value(6.9),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
        )
        let response = try await client.feeMarkups.create(
            request: .init(
                accountId: "biz_xxxxxxxxxxxxxx",
                feeType: .cryptoWithdrawalMarkup
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
                  "created_at": "2024-01-15T09:30:00Z",
                  "fee_type": "crypto_withdrawal_markup",
                  "fixed_fee_usd": 1.1,
                  "id": "id",
                  "notes": "notes",
                  "percentage_fee": 1.1,
                  "updated_at": "2024-01-15T09:30:00Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = FeeMarkup(
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            feeType: FeeMarkupTypes.cryptoWithdrawalMarkup,
            fixedFeeUsd: Nullable<Double>.value(1.1),
            id: "id",
            notes: Nullable<String>.value("notes"),
            percentageFee: Nullable<Double>.value(1.1),
            updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
        )
        let response = try await client.feeMarkups.create(
            request: .init(
                accountId: "account_id",
                feeType: .cryptoWithdrawalMarkup
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                true
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = true
        let response = try await client.feeMarkups.delete(
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
                true
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = true
        let response = try await client.feeMarkups.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}