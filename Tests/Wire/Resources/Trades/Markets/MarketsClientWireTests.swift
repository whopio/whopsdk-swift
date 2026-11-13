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
                      "size_decimals": 5
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
                      "size_decimals": 5
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
                      "size_decimals": 4
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
                      "size_decimals": 8
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
                      "size_decimals": 2
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
                      "size_decimals": 3
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
                      "size_decimals": 2
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
                      "size_decimals": 3
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
                    sizeDecimals: 5
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
                    sizeDecimals: 5
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
                    sizeDecimals: 4
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
                    sizeDecimals: 8
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
                    sizeDecimals: 2
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
                    sizeDecimals: 3
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
                    sizeDecimals: 2
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
                    sizeDecimals: 3
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
}