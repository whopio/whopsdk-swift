import Foundation
import Testing
import WhopSDK

@Suite("ReservesClient Wire Tests") struct ReservesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "amount": "125.5",
                      "by_type": [
                        {
                          "amount": "100.0",
                          "hold_period_days": 90,
                          "percentage": 25,
                          "type": "regular"
                        }
                      ],
                      "currency": "usd",
                      "unlocks_by_date": [
                        {
                          "amount": "100.0",
                          "date": "2026-01-01"
                        }
                      ]
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
        let expectedResponse = ListReservesResponse(
            data: [
                AccountReserve(
                    amount: "125.5",
                    byType: [
                        AccountReserveType(
                            amount: "100.0",
                            holdPeriodDays: Nullable<Int>.value(90),
                            percentage: Nullable<Double>.value(25),
                            type: AccountReserveTypeType.regular
                        )
                    ],
                    currency: "usd",
                    unlocksByDate: [
                        AccountReserveUnlock(
                            amount: "100.0",
                            date: "2026-01-01"
                        )
                    ]
                )
            ]
        )
        let response = try await client.accounts.reserves.list(
            accountId: "account_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}