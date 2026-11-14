import Foundation
import Testing
import WhopSDK

@Suite("MarketsClient Wire Tests") struct MarketsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "change_24h_percentage": null,
                      "id": "BTC",
                      "instrument_type": "perpetual",
                      "logo_url": null,
                      "max_leverage": 40,
                      "price": {
                        "amount": "80155.500000",
                        "currency": "usd",
                        "decimals": 6,
                        "display_decimals": 6
                      },
                      "size_decimals": 5,
                      "volume_24h": null
                    },
                    {
                      "change_24h_percentage": null,
                      "id": "BTC",
                      "instrument_type": "spot",
                      "logo_url": null,
                      "max_leverage": null,
                      "price": {
                        "amount": "80065.50000000",
                        "currency": "usd",
                        "decimals": 8,
                        "display_decimals": 8
                      },
                      "size_decimals": 5,
                      "volume_24h": {
                        "amount": "21622161986.44",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      }
                    },
                    {
                      "change_24h_percentage": null,
                      "id": "ETH",
                      "instrument_type": "perpetual",
                      "logo_url": null,
                      "max_leverage": 25,
                      "price": {
                        "amount": "2322.350000",
                        "currency": "usd",
                        "decimals": 6,
                        "display_decimals": 6
                      },
                      "size_decimals": 4,
                      "volume_24h": null
                    },
                    {
                      "change_24h_percentage": 1.4235,
                      "id": "NVDA",
                      "instrument_type": "spot",
                      "logo_url": "https://cdn.zerion.io/nvda.png",
                      "max_leverage": null,
                      "price": {
                        "amount": "191.27000000",
                        "currency": "usd",
                        "decimals": 8,
                        "display_decimals": 8
                      },
                      "size_decimals": 8,
                      "volume_24h": {
                        "amount": "34341055.48",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      }
                    },
                    {
                      "change_24h_percentage": null,
                      "id": "SOL",
                      "instrument_type": "perpetual",
                      "logo_url": null,
                      "max_leverage": 20,
                      "price": {
                        "amount": "101.325000",
                        "currency": "usd",
                        "decimals": 6,
                        "display_decimals": 6
                      },
                      "size_decimals": 2,
                      "volume_24h": null
                    },
                    {
                      "change_24h_percentage": null,
                      "id": "SOL",
                      "instrument_type": "spot",
                      "logo_url": null,
                      "max_leverage": null,
                      "price": {
                        "amount": "101.23500000",
                        "currency": "usd",
                        "decimals": 8,
                        "display_decimals": 8
                      },
                      "size_decimals": 3,
                      "volume_24h": null
                    },
                    {
                      "change_24h_percentage": null,
                      "id": "XAUT",
                      "instrument_type": "spot",
                      "logo_url": null,
                      "max_leverage": null,
                      "price": {
                        "amount": "4012.85000000",
                        "currency": "usd",
                        "decimals": 8,
                        "display_decimals": 8
                      },
                      "size_decimals": 2,
                      "volume_24h": null
                    },
                    {
                      "change_24h_percentage": null,
                      "id": "xyz:TSLA",
                      "instrument_type": "perpetual",
                      "logo_url": null,
                      "max_leverage": 20,
                      "price": {
                        "amount": "441.500000",
                        "currency": "usd",
                        "decimals": 6,
                        "display_decimals": 6
                      },
                      "size_decimals": 3,
                      "volume_24h": null
                    }
                  ],
                  "page_info": {
                    "end_cursor": null,
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
        let expectedResponse = ListMarketsResponse(
            data: [
                Market(
                    change24HPercentage: .null,
                    id: "BTC",
                    instrumentType: MarketInstrumentType.perpetual,
                    logoUrl: .null,
                    maxLeverage: Nullable<Int>.value(40),
                    price: Nullable<Money>.value(Money(
                        amount: "80155.500000",
                        currency: "usd",
                        decimals: 6,
                        displayDecimals: 6
                    )),
                    sizeDecimals: 5,
                    volume24H: .null
                ),
                Market(
                    change24HPercentage: .null,
                    id: "BTC",
                    instrumentType: MarketInstrumentType.spot,
                    logoUrl: .null,
                    maxLeverage: .null,
                    price: Nullable<Money>.value(Money(
                        amount: "80065.50000000",
                        currency: "usd",
                        decimals: 8,
                        displayDecimals: 8
                    )),
                    sizeDecimals: 5,
                    volume24H: Nullable<Money>.value(Money(
                        amount: "21622161986.44",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ))
                ),
                Market(
                    change24HPercentage: .null,
                    id: "ETH",
                    instrumentType: MarketInstrumentType.perpetual,
                    logoUrl: .null,
                    maxLeverage: Nullable<Int>.value(25),
                    price: Nullable<Money>.value(Money(
                        amount: "2322.350000",
                        currency: "usd",
                        decimals: 6,
                        displayDecimals: 6
                    )),
                    sizeDecimals: 4,
                    volume24H: .null
                ),
                Market(
                    change24HPercentage: Nullable<Double>.value(1.4235),
                    id: "NVDA",
                    instrumentType: MarketInstrumentType.spot,
                    logoUrl: Nullable<String>.value("https://cdn.zerion.io/nvda.png"),
                    maxLeverage: .null,
                    price: Nullable<Money>.value(Money(
                        amount: "191.27000000",
                        currency: "usd",
                        decimals: 8,
                        displayDecimals: 8
                    )),
                    sizeDecimals: 8,
                    volume24H: Nullable<Money>.value(Money(
                        amount: "34341055.48",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ))
                ),
                Market(
                    change24HPercentage: .null,
                    id: "SOL",
                    instrumentType: MarketInstrumentType.perpetual,
                    logoUrl: .null,
                    maxLeverage: Nullable<Int>.value(20),
                    price: Nullable<Money>.value(Money(
                        amount: "101.325000",
                        currency: "usd",
                        decimals: 6,
                        displayDecimals: 6
                    )),
                    sizeDecimals: 2,
                    volume24H: .null
                ),
                Market(
                    change24HPercentage: .null,
                    id: "SOL",
                    instrumentType: MarketInstrumentType.spot,
                    logoUrl: .null,
                    maxLeverage: .null,
                    price: Nullable<Money>.value(Money(
                        amount: "101.23500000",
                        currency: "usd",
                        decimals: 8,
                        displayDecimals: 8
                    )),
                    sizeDecimals: 3,
                    volume24H: .null
                ),
                Market(
                    change24HPercentage: .null,
                    id: "XAUT",
                    instrumentType: MarketInstrumentType.spot,
                    logoUrl: .null,
                    maxLeverage: .null,
                    price: Nullable<Money>.value(Money(
                        amount: "4012.85000000",
                        currency: "usd",
                        decimals: 8,
                        displayDecimals: 8
                    )),
                    sizeDecimals: 2,
                    volume24H: .null
                ),
                Market(
                    change24HPercentage: .null,
                    id: "xyz:TSLA",
                    instrumentType: MarketInstrumentType.perpetual,
                    logoUrl: .null,
                    maxLeverage: Nullable<Int>.value(20),
                    price: Nullable<Money>.value(Money(
                        amount: "441.500000",
                        currency: "usd",
                        decimals: 6,
                        displayDecimals: 6
                    )),
                    sizeDecimals: 3,
                    volume24H: .null
                )
            ],
            pageInfo: ListMarketsResponsePageInfo(
                endCursor: .null,
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("MQ")
            )
        )
        let response = try await client.trades.markets.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "change_24h_percentage": 1.1,
                      "id": "id",
                      "instrument_type": "perpetual",
                      "logo_url": "logo_url",
                      "max_leverage": 1,
                      "price": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "size_decimals": 1,
                      "volume_24h": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      }
                    },
                    {
                      "change_24h_percentage": 1.1,
                      "id": "id",
                      "instrument_type": "perpetual",
                      "logo_url": "logo_url",
                      "max_leverage": 1,
                      "price": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "size_decimals": 1,
                      "volume_24h": {
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
        let expectedResponse = ListMarketsResponse(
            data: [
                Market(
                    change24HPercentage: Nullable<Double>.value(1.1),
                    id: "id",
                    instrumentType: MarketInstrumentType.perpetual,
                    logoUrl: Nullable<String>.value("logo_url"),
                    maxLeverage: Nullable<Int>.value(1),
                    price: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    sizeDecimals: 1,
                    volume24H: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ))
                ),
                Market(
                    change24HPercentage: Nullable<Double>.value(1.1),
                    id: "id",
                    instrumentType: MarketInstrumentType.perpetual,
                    logoUrl: Nullable<String>.value("logo_url"),
                    maxLeverage: Nullable<Int>.value(1),
                    price: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    sizeDecimals: 1,
                    volume24H: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ))
                )
            ],
            pageInfo: ListMarketsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.trades.markets.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }
}