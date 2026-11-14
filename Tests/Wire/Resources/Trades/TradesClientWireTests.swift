import Foundation
import Testing
import WhopSDK

@Suite("TradesClient Wire Tests") struct TradesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "amount": "25",
                      "average_price": "average_price",
                      "client_order_id": "client_order_id",
                      "completed_at": "completed_at",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "external_order_id": "0x63cabad10f072c65ad84526e0c33081b",
                      "failure_code": "market_unavailable",
                      "filled_size": "filled_size",
                      "funds_location": "wallet",
                      "id": "tint_xxxxxxxxxxxxxx",
                      "instrument_type": "perpetual",
                      "leverage": 10,
                      "market": "BTC",
                      "metadata": {
                        "key": "value"
                      },
                      "object": "trade",
                      "order_type": "market",
                      "parent_id": "parent_id",
                      "price": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "reduce_only": true,
                      "side": "buy",
                      "size": "size",
                      "status": "pending",
                      "status_detail": "partial_fill",
                      "step": "depositing",
                      "trigger_price": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "type": "close",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "user_id": "user_id"
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
        let expectedResponse = ListTradesResponse(
            data: [
                Trade(
                    accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    amount: Nullable<String>.value("25"),
                    averagePrice: Nullable<String>.value("average_price"),
                    clientOrderId: Nullable<String>.value("client_order_id"),
                    completedAt: Nullable<String>.value("completed_at"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    externalOrderId: Nullable<String>.value("0x63cabad10f072c65ad84526e0c33081b"),
                    failureCode: Nullable<TradeFailureCode>.value(TradeFailureCode.marketUnavailable),
                    filledSize: Nullable<String>.value("filled_size"),
                    fundsLocation: Nullable<TradeFundsLocation>.value(TradeFundsLocation.wallet),
                    id: "tint_xxxxxxxxxxxxxx",
                    instrumentType: Nullable<TradeInstrumentType>.value(TradeInstrumentType.perpetual),
                    leverage: Nullable<Int>.value(10),
                    market: Nullable<String>.value("BTC"),
                    metadata: [
                        "key": JSONValue.string("value")
                    ],
                    object: TradeObject.trade,
                    orderType: Nullable<TradeOrderType>.value(TradeOrderType.market),
                    parentId: Nullable<String>.value("parent_id"),
                    price: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    reduceOnly: Nullable<Bool>.value(true),
                    side: Nullable<TradeSide>.value(TradeSide.buy),
                    size: Nullable<String>.value("size"),
                    status: TradeStatus.pending,
                    statusDetail: Nullable<TradeStatusDetail>.value(TradeStatusDetail.partialFill),
                    step: Nullable<TradeStep>.value(TradeStep.depositing),
                    triggerPrice: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    type: TradeType.close,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    userId: Nullable<String>.value("user_id")
                )
            ],
            pageInfo: ListTradesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.trades.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "account_id": "account_id",
                      "amount": "amount",
                      "average_price": "average_price",
                      "client_order_id": "client_order_id",
                      "completed_at": "completed_at",
                      "created_at": "created_at",
                      "external_order_id": "external_order_id",
                      "failure_code": "market_unavailable",
                      "filled_size": "filled_size",
                      "funds_location": "wallet",
                      "id": "id",
                      "instrument_type": "perpetual",
                      "leverage": 1,
                      "market": "market",
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "object": "trade",
                      "order_type": "market",
                      "parent_id": "parent_id",
                      "price": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "reduce_only": true,
                      "side": "buy",
                      "size": "size",
                      "status": "pending",
                      "status_detail": "partial_fill",
                      "step": "depositing",
                      "trigger_price": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "type": "close",
                      "updated_at": "updated_at",
                      "user_id": "user_id"
                    },
                    {
                      "account_id": "account_id",
                      "amount": "amount",
                      "average_price": "average_price",
                      "client_order_id": "client_order_id",
                      "completed_at": "completed_at",
                      "created_at": "created_at",
                      "external_order_id": "external_order_id",
                      "failure_code": "market_unavailable",
                      "filled_size": "filled_size",
                      "funds_location": "wallet",
                      "id": "id",
                      "instrument_type": "perpetual",
                      "leverage": 1,
                      "market": "market",
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "object": "trade",
                      "order_type": "market",
                      "parent_id": "parent_id",
                      "price": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "reduce_only": true,
                      "side": "buy",
                      "size": "size",
                      "status": "pending",
                      "status_detail": "partial_fill",
                      "step": "depositing",
                      "trigger_price": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "type": "close",
                      "updated_at": "updated_at",
                      "user_id": "user_id"
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
        let expectedResponse = ListTradesResponse(
            data: [
                Trade(
                    accountId: Nullable<String>.value("account_id"),
                    amount: Nullable<String>.value("amount"),
                    averagePrice: Nullable<String>.value("average_price"),
                    clientOrderId: Nullable<String>.value("client_order_id"),
                    completedAt: Nullable<String>.value("completed_at"),
                    createdAt: "created_at",
                    externalOrderId: Nullable<String>.value("external_order_id"),
                    failureCode: Nullable<TradeFailureCode>.value(TradeFailureCode.marketUnavailable),
                    filledSize: Nullable<String>.value("filled_size"),
                    fundsLocation: Nullable<TradeFundsLocation>.value(TradeFundsLocation.wallet),
                    id: "id",
                    instrumentType: Nullable<TradeInstrumentType>.value(TradeInstrumentType.perpetual),
                    leverage: Nullable<Int>.value(1),
                    market: Nullable<String>.value("market"),
                    metadata: [
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    object: TradeObject.trade,
                    orderType: Nullable<TradeOrderType>.value(TradeOrderType.market),
                    parentId: Nullable<String>.value("parent_id"),
                    price: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    reduceOnly: Nullable<Bool>.value(true),
                    side: Nullable<TradeSide>.value(TradeSide.buy),
                    size: Nullable<String>.value("size"),
                    status: TradeStatus.pending,
                    statusDetail: Nullable<TradeStatusDetail>.value(TradeStatusDetail.partialFill),
                    step: Nullable<TradeStep>.value(TradeStep.depositing),
                    triggerPrice: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    type: TradeType.close,
                    updatedAt: "updated_at",
                    userId: Nullable<String>.value("user_id")
                ),
                Trade(
                    accountId: Nullable<String>.value("account_id"),
                    amount: Nullable<String>.value("amount"),
                    averagePrice: Nullable<String>.value("average_price"),
                    clientOrderId: Nullable<String>.value("client_order_id"),
                    completedAt: Nullable<String>.value("completed_at"),
                    createdAt: "created_at",
                    externalOrderId: Nullable<String>.value("external_order_id"),
                    failureCode: Nullable<TradeFailureCode>.value(TradeFailureCode.marketUnavailable),
                    filledSize: Nullable<String>.value("filled_size"),
                    fundsLocation: Nullable<TradeFundsLocation>.value(TradeFundsLocation.wallet),
                    id: "id",
                    instrumentType: Nullable<TradeInstrumentType>.value(TradeInstrumentType.perpetual),
                    leverage: Nullable<Int>.value(1),
                    market: Nullable<String>.value("market"),
                    metadata: [
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    object: TradeObject.trade,
                    orderType: Nullable<TradeOrderType>.value(TradeOrderType.market),
                    parentId: Nullable<String>.value("parent_id"),
                    price: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    reduceOnly: Nullable<Bool>.value(true),
                    side: Nullable<TradeSide>.value(TradeSide.buy),
                    size: Nullable<String>.value("size"),
                    status: TradeStatus.pending,
                    statusDetail: Nullable<TradeStatusDetail>.value(TradeStatusDetail.partialFill),
                    step: Nullable<TradeStep>.value(TradeStep.depositing),
                    triggerPrice: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    type: TradeType.close,
                    updatedAt: "updated_at",
                    userId: Nullable<String>.value("user_id")
                )
            ],
            pageInfo: ListTradesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.trades.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount": "25",
                  "average_price": "average_price",
                  "client_order_id": "client_order_id",
                  "completed_at": "completed_at",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "external_order_id": "0x63cabad10f072c65ad84526e0c33081b",
                  "failure_code": "market_unavailable",
                  "filled_size": "filled_size",
                  "funds_location": "wallet",
                  "id": "tint_xxxxxxxxxxxxxx",
                  "instrument_type": "perpetual",
                  "leverage": 10,
                  "market": "BTC",
                  "metadata": {
                    "key": "value"
                  },
                  "object": "trade",
                  "order_type": "market",
                  "parent_id": "parent_id",
                  "price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "reduce_only": true,
                  "side": "buy",
                  "size": "size",
                  "status": "pending",
                  "status_detail": "partial_fill",
                  "step": "depositing",
                  "trigger_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "type": "close",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Trade(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: Nullable<String>.value("25"),
            averagePrice: Nullable<String>.value("average_price"),
            clientOrderId: Nullable<String>.value("client_order_id"),
            completedAt: Nullable<String>.value("completed_at"),
            createdAt: "2026-01-01T12:00:00.000Z",
            externalOrderId: Nullable<String>.value("0x63cabad10f072c65ad84526e0c33081b"),
            failureCode: Nullable<TradeFailureCode>.value(TradeFailureCode.marketUnavailable),
            filledSize: Nullable<String>.value("filled_size"),
            fundsLocation: Nullable<TradeFundsLocation>.value(TradeFundsLocation.wallet),
            id: "tint_xxxxxxxxxxxxxx",
            instrumentType: Nullable<TradeInstrumentType>.value(TradeInstrumentType.perpetual),
            leverage: Nullable<Int>.value(10),
            market: Nullable<String>.value("BTC"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            object: TradeObject.trade,
            orderType: Nullable<TradeOrderType>.value(TradeOrderType.market),
            parentId: Nullable<String>.value("parent_id"),
            price: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            reduceOnly: Nullable<Bool>.value(true),
            side: Nullable<TradeSide>.value(TradeSide.buy),
            size: Nullable<String>.value("size"),
            status: TradeStatus.pending,
            statusDetail: Nullable<TradeStatusDetail>.value(TradeStatusDetail.partialFill),
            step: Nullable<TradeStep>.value(TradeStep.depositing),
            triggerPrice: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            type: TradeType.close,
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.trades.create(
            request: .init(
                accountId: "biz_xxxxxxxxxxxxxx",
                type: .close
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
                  "account_id": "account_id",
                  "amount": "amount",
                  "average_price": "average_price",
                  "client_order_id": "client_order_id",
                  "completed_at": "completed_at",
                  "created_at": "created_at",
                  "external_order_id": "external_order_id",
                  "failure_code": "market_unavailable",
                  "filled_size": "filled_size",
                  "funds_location": "wallet",
                  "id": "id",
                  "instrument_type": "perpetual",
                  "leverage": 1,
                  "market": "market",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "object": "trade",
                  "order_type": "market",
                  "parent_id": "parent_id",
                  "price": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "reduce_only": true,
                  "side": "buy",
                  "size": "size",
                  "status": "pending",
                  "status_detail": "partial_fill",
                  "step": "depositing",
                  "trigger_price": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "type": "close",
                  "updated_at": "updated_at",
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Trade(
            accountId: Nullable<String>.value("account_id"),
            amount: Nullable<String>.value("amount"),
            averagePrice: Nullable<String>.value("average_price"),
            clientOrderId: Nullable<String>.value("client_order_id"),
            completedAt: Nullable<String>.value("completed_at"),
            createdAt: "created_at",
            externalOrderId: Nullable<String>.value("external_order_id"),
            failureCode: Nullable<TradeFailureCode>.value(TradeFailureCode.marketUnavailable),
            filledSize: Nullable<String>.value("filled_size"),
            fundsLocation: Nullable<TradeFundsLocation>.value(TradeFundsLocation.wallet),
            id: "id",
            instrumentType: Nullable<TradeInstrumentType>.value(TradeInstrumentType.perpetual),
            leverage: Nullable<Int>.value(1),
            market: Nullable<String>.value("market"),
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            object: TradeObject.trade,
            orderType: Nullable<TradeOrderType>.value(TradeOrderType.market),
            parentId: Nullable<String>.value("parent_id"),
            price: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            reduceOnly: Nullable<Bool>.value(true),
            side: Nullable<TradeSide>.value(TradeSide.buy),
            size: Nullable<String>.value("size"),
            status: TradeStatus.pending,
            statusDetail: Nullable<TradeStatusDetail>.value(TradeStatusDetail.partialFill),
            step: Nullable<TradeStep>.value(TradeStep.depositing),
            triggerPrice: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            type: TradeType.close,
            updatedAt: "updated_at",
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.trades.create(
            request: .init(
                accountId: "account_id",
                type: .close
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount": "25",
                  "average_price": "average_price",
                  "client_order_id": "client_order_id",
                  "completed_at": "completed_at",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "external_order_id": "0x63cabad10f072c65ad84526e0c33081b",
                  "failure_code": "market_unavailable",
                  "filled_size": "filled_size",
                  "funds_location": "wallet",
                  "id": "tint_xxxxxxxxxxxxxx",
                  "instrument_type": "perpetual",
                  "leverage": 10,
                  "market": "BTC",
                  "metadata": {
                    "key": "value"
                  },
                  "object": "trade",
                  "order_type": "market",
                  "parent_id": "parent_id",
                  "price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "reduce_only": true,
                  "side": "buy",
                  "size": "size",
                  "status": "pending",
                  "status_detail": "partial_fill",
                  "step": "depositing",
                  "trigger_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "type": "close",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Trade(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: Nullable<String>.value("25"),
            averagePrice: Nullable<String>.value("average_price"),
            clientOrderId: Nullable<String>.value("client_order_id"),
            completedAt: Nullable<String>.value("completed_at"),
            createdAt: "2026-01-01T12:00:00.000Z",
            externalOrderId: Nullable<String>.value("0x63cabad10f072c65ad84526e0c33081b"),
            failureCode: Nullable<TradeFailureCode>.value(TradeFailureCode.marketUnavailable),
            filledSize: Nullable<String>.value("filled_size"),
            fundsLocation: Nullable<TradeFundsLocation>.value(TradeFundsLocation.wallet),
            id: "tint_xxxxxxxxxxxxxx",
            instrumentType: Nullable<TradeInstrumentType>.value(TradeInstrumentType.perpetual),
            leverage: Nullable<Int>.value(10),
            market: Nullable<String>.value("BTC"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            object: TradeObject.trade,
            orderType: Nullable<TradeOrderType>.value(TradeOrderType.market),
            parentId: Nullable<String>.value("parent_id"),
            price: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            reduceOnly: Nullable<Bool>.value(true),
            side: Nullable<TradeSide>.value(TradeSide.buy),
            size: Nullable<String>.value("size"),
            status: TradeStatus.pending,
            statusDetail: Nullable<TradeStatusDetail>.value(TradeStatusDetail.partialFill),
            step: Nullable<TradeStep>.value(TradeStep.depositing),
            triggerPrice: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            type: TradeType.close,
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.trades.retrieve(
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
                  "account_id": "account_id",
                  "amount": "amount",
                  "average_price": "average_price",
                  "client_order_id": "client_order_id",
                  "completed_at": "completed_at",
                  "created_at": "created_at",
                  "external_order_id": "external_order_id",
                  "failure_code": "market_unavailable",
                  "filled_size": "filled_size",
                  "funds_location": "wallet",
                  "id": "id",
                  "instrument_type": "perpetual",
                  "leverage": 1,
                  "market": "market",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "object": "trade",
                  "order_type": "market",
                  "parent_id": "parent_id",
                  "price": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "reduce_only": true,
                  "side": "buy",
                  "size": "size",
                  "status": "pending",
                  "status_detail": "partial_fill",
                  "step": "depositing",
                  "trigger_price": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "type": "close",
                  "updated_at": "updated_at",
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Trade(
            accountId: Nullable<String>.value("account_id"),
            amount: Nullable<String>.value("amount"),
            averagePrice: Nullable<String>.value("average_price"),
            clientOrderId: Nullable<String>.value("client_order_id"),
            completedAt: Nullable<String>.value("completed_at"),
            createdAt: "created_at",
            externalOrderId: Nullable<String>.value("external_order_id"),
            failureCode: Nullable<TradeFailureCode>.value(TradeFailureCode.marketUnavailable),
            filledSize: Nullable<String>.value("filled_size"),
            fundsLocation: Nullable<TradeFundsLocation>.value(TradeFundsLocation.wallet),
            id: "id",
            instrumentType: Nullable<TradeInstrumentType>.value(TradeInstrumentType.perpetual),
            leverage: Nullable<Int>.value(1),
            market: Nullable<String>.value("market"),
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            object: TradeObject.trade,
            orderType: Nullable<TradeOrderType>.value(TradeOrderType.market),
            parentId: Nullable<String>.value("parent_id"),
            price: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            reduceOnly: Nullable<Bool>.value(true),
            side: Nullable<TradeSide>.value(TradeSide.buy),
            size: Nullable<String>.value("size"),
            status: TradeStatus.pending,
            statusDetail: Nullable<TradeStatusDetail>.value(TradeStatusDetail.partialFill),
            step: Nullable<TradeStep>.value(TradeStep.depositing),
            triggerPrice: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            type: TradeType.close,
            updatedAt: "updated_at",
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.trades.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func cancel1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount": "25",
                  "average_price": "average_price",
                  "client_order_id": "client_order_id",
                  "completed_at": "completed_at",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "external_order_id": "0x63cabad10f072c65ad84526e0c33081b",
                  "failure_code": "market_unavailable",
                  "filled_size": "filled_size",
                  "funds_location": "wallet",
                  "id": "tint_xxxxxxxxxxxxxx",
                  "instrument_type": "perpetual",
                  "leverage": 10,
                  "market": "BTC",
                  "metadata": {
                    "key": "value"
                  },
                  "object": "trade",
                  "order_type": "market",
                  "parent_id": "parent_id",
                  "price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "reduce_only": true,
                  "side": "buy",
                  "size": "size",
                  "status": "pending",
                  "status_detail": "partial_fill",
                  "step": "depositing",
                  "trigger_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "type": "close",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Trade(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: Nullable<String>.value("25"),
            averagePrice: Nullable<String>.value("average_price"),
            clientOrderId: Nullable<String>.value("client_order_id"),
            completedAt: Nullable<String>.value("completed_at"),
            createdAt: "2026-01-01T12:00:00.000Z",
            externalOrderId: Nullable<String>.value("0x63cabad10f072c65ad84526e0c33081b"),
            failureCode: Nullable<TradeFailureCode>.value(TradeFailureCode.marketUnavailable),
            filledSize: Nullable<String>.value("filled_size"),
            fundsLocation: Nullable<TradeFundsLocation>.value(TradeFundsLocation.wallet),
            id: "tint_xxxxxxxxxxxxxx",
            instrumentType: Nullable<TradeInstrumentType>.value(TradeInstrumentType.perpetual),
            leverage: Nullable<Int>.value(10),
            market: Nullable<String>.value("BTC"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            object: TradeObject.trade,
            orderType: Nullable<TradeOrderType>.value(TradeOrderType.market),
            parentId: Nullable<String>.value("parent_id"),
            price: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            reduceOnly: Nullable<Bool>.value(true),
            side: Nullable<TradeSide>.value(TradeSide.buy),
            size: Nullable<String>.value("size"),
            status: TradeStatus.pending,
            statusDetail: Nullable<TradeStatusDetail>.value(TradeStatusDetail.partialFill),
            step: Nullable<TradeStep>.value(TradeStep.depositing),
            triggerPrice: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            type: TradeType.close,
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.trades.cancel(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func cancel2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "amount": "amount",
                  "average_price": "average_price",
                  "client_order_id": "client_order_id",
                  "completed_at": "completed_at",
                  "created_at": "created_at",
                  "external_order_id": "external_order_id",
                  "failure_code": "market_unavailable",
                  "filled_size": "filled_size",
                  "funds_location": "wallet",
                  "id": "id",
                  "instrument_type": "perpetual",
                  "leverage": 1,
                  "market": "market",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "object": "trade",
                  "order_type": "market",
                  "parent_id": "parent_id",
                  "price": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "reduce_only": true,
                  "side": "buy",
                  "size": "size",
                  "status": "pending",
                  "status_detail": "partial_fill",
                  "step": "depositing",
                  "trigger_price": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "type": "close",
                  "updated_at": "updated_at",
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Trade(
            accountId: Nullable<String>.value("account_id"),
            amount: Nullable<String>.value("amount"),
            averagePrice: Nullable<String>.value("average_price"),
            clientOrderId: Nullable<String>.value("client_order_id"),
            completedAt: Nullable<String>.value("completed_at"),
            createdAt: "created_at",
            externalOrderId: Nullable<String>.value("external_order_id"),
            failureCode: Nullable<TradeFailureCode>.value(TradeFailureCode.marketUnavailable),
            filledSize: Nullable<String>.value("filled_size"),
            fundsLocation: Nullable<TradeFundsLocation>.value(TradeFundsLocation.wallet),
            id: "id",
            instrumentType: Nullable<TradeInstrumentType>.value(TradeInstrumentType.perpetual),
            leverage: Nullable<Int>.value(1),
            market: Nullable<String>.value("market"),
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            object: TradeObject.trade,
            orderType: Nullable<TradeOrderType>.value(TradeOrderType.market),
            parentId: Nullable<String>.value("parent_id"),
            price: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            reduceOnly: Nullable<Bool>.value(true),
            side: Nullable<TradeSide>.value(TradeSide.buy),
            size: Nullable<String>.value("size"),
            status: TradeStatus.pending,
            statusDetail: Nullable<TradeStatusDetail>.value(TradeStatusDetail.partialFill),
            step: Nullable<TradeStep>.value(TradeStep.depositing),
            triggerPrice: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            type: TradeType.close,
            updatedAt: "updated_at",
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.trades.cancel(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}