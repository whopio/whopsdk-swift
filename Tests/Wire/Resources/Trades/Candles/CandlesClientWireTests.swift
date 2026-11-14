import Foundation
import Testing
import WhopSDK

@Suite("CandlesClient Wire Tests") struct CandlesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "close": {
                        "amount": "161.00000000",
                        "currency": "usd",
                        "decimals": 8,
                        "display_decimals": 8
                      },
                      "high": {
                        "amount": "161.40000000",
                        "currency": "usd",
                        "decimals": 8,
                        "display_decimals": 8
                      },
                      "low": {
                        "amount": "159.60000000",
                        "currency": "usd",
                        "decimals": 8,
                        "display_decimals": 8
                      },
                      "open": {
                        "amount": "160.00000000",
                        "currency": "usd",
                        "decimals": 8,
                        "display_decimals": 8
                      },
                      "started_at": "2026-11-12T00:00:00.000Z",
                      "volume": {
                        "amount": "900.00",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      }
                    },
                    {
                      "close": {
                        "amount": "161.80000000",
                        "currency": "usd",
                        "decimals": 8,
                        "display_decimals": 8
                      },
                      "high": {
                        "amount": "162.50000000",
                        "currency": "usd",
                        "decimals": 8,
                        "display_decimals": 8
                      },
                      "low": {
                        "amount": "160.20000000",
                        "currency": "usd",
                        "decimals": 8,
                        "display_decimals": 8
                      },
                      "open": {
                        "amount": "161.00000000",
                        "currency": "usd",
                        "decimals": 8,
                        "display_decimals": 8
                      },
                      "started_at": "2026-11-12T01:00:00.000Z",
                      "volume": {
                        "amount": "1200.00",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      }
                    }
                  ],
                  "page_info": {
                    "end_cursor": "Mg",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "MQ"
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
        let expectedResponse = ListCandlesResponse(
            data: [
                Candle(
                    close: Money(
                        amount: "161.00000000",
                        currency: "usd",
                        decimals: 8,
                        displayDecimals: 8
                    ),
                    high: Money(
                        amount: "161.40000000",
                        currency: "usd",
                        decimals: 8,
                        displayDecimals: 8
                    ),
                    low: Money(
                        amount: "159.60000000",
                        currency: "usd",
                        decimals: 8,
                        displayDecimals: 8
                    ),
                    open: Money(
                        amount: "160.00000000",
                        currency: "usd",
                        decimals: 8,
                        displayDecimals: 8
                    ),
                    startedAt: "2026-11-12T00:00:00.000Z",
                    volume: Nullable<Money>.value(Money(
                        amount: "900.00",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ))
                ),
                Candle(
                    close: Money(
                        amount: "161.80000000",
                        currency: "usd",
                        decimals: 8,
                        displayDecimals: 8
                    ),
                    high: Money(
                        amount: "162.50000000",
                        currency: "usd",
                        decimals: 8,
                        displayDecimals: 8
                    ),
                    low: Money(
                        amount: "160.20000000",
                        currency: "usd",
                        decimals: 8,
                        displayDecimals: 8
                    ),
                    open: Money(
                        amount: "161.00000000",
                        currency: "usd",
                        decimals: 8,
                        displayDecimals: 8
                    ),
                    startedAt: "2026-11-12T01:00:00.000Z",
                    volume: Nullable<Money>.value(Money(
                        amount: "1200.00",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ))
                )
            ],
            pageInfo: ListCandlesResponsePageInfo(
                endCursor: Nullable<String>.value("Mg"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("MQ")
            )
        )
        let response = try await client.trades.candles.list(
            market: "market",
            interval: .oneH,
            from: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
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
                      "close": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "high": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "low": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "open": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "started_at": "started_at",
                      "volume": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      }
                    },
                    {
                      "close": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "high": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "low": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "open": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "started_at": "started_at",
                      "volume": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      }
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
        let expectedResponse = ListCandlesResponse(
            data: [
                Candle(
                    close: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    high: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    low: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    open: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    startedAt: "started_at",
                    volume: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ))
                ),
                Candle(
                    close: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    high: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    low: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    open: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    startedAt: "started_at",
                    volume: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ))
                )
            ],
            pageInfo: ListCandlesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.trades.candles.list(
            market: "market",
            interval: .oneH,
            from: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}