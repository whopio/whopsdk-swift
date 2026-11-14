import Foundation
import Testing
import WhopSDK

@Suite("SwapsClient Wire Tests") struct SwapsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "amount": "0.052341",
                      "error": "Swap reverted: quoted price moved beyond the slippage tolerance",
                      "id": "vault-swap-cwal_xxxxxxxxxxxxxx",
                      "object": "swap",
                      "status": "queued",
                      "tx_hashes": [
                        "0xabc"
                      ],
                      "user_id": "user_id"
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
        let expectedResponse = ListSwapsResponse(
            data: [
                ListSwapsResponseDataItem(
                    accountId: "biz_xxxxxxxxxxxxxx",
                    amount: Nullable<String>.value("0.052341"),
                    error: Optional(Nullable<String>.value("Swap reverted: quoted price moved beyond the slippage tolerance")),
                    id: "vault-swap-cwal_xxxxxxxxxxxxxx",
                    object: ListSwapsResponseDataItemObject.swap,
                    status: ListSwapsResponseDataItemStatus.queued,
                    txHashes: [
                        "0xabc"
                    ],
                    userId: Nullable<String>.value("user_id")
                )
            ]
        )
        let response = try await client.swaps.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "error": "error",
                      "id": "id",
                      "object": "swap",
                      "status": "queued",
                      "tx_hashes": [
                        "tx_hashes",
                        "tx_hashes"
                      ],
                      "user_id": "user_id"
                    },
                    {
                      "account_id": "account_id",
                      "amount": "amount",
                      "error": "error",
                      "id": "id",
                      "object": "swap",
                      "status": "queued",
                      "tx_hashes": [
                        "tx_hashes",
                        "tx_hashes"
                      ],
                      "user_id": "user_id"
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
        let expectedResponse = ListSwapsResponse(
            data: [
                ListSwapsResponseDataItem(
                    accountId: "account_id",
                    amount: Nullable<String>.value("amount"),
                    error: Optional(Nullable<String>.value("error")),
                    id: "id",
                    object: ListSwapsResponseDataItemObject.swap,
                    status: ListSwapsResponseDataItemStatus.queued,
                    txHashes: [
                        "tx_hashes",
                        "tx_hashes"
                    ],
                    userId: Nullable<String>.value("user_id")
                ),
                ListSwapsResponseDataItem(
                    accountId: "account_id",
                    amount: Nullable<String>.value("amount"),
                    error: Optional(Nullable<String>.value("error")),
                    id: "id",
                    object: ListSwapsResponseDataItemObject.swap,
                    status: ListSwapsResponseDataItemStatus.queued,
                    txHashes: [
                        "tx_hashes",
                        "tx_hashes"
                    ],
                    userId: Nullable<String>.value("user_id")
                )
            ]
        )
        let response = try await client.swaps.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount": "100.0",
                  "amount_in": 131.4,
                  "amount_out": 180,
                  "amount_out_expected": "98.9",
                  "amount_out_min": "98.4",
                  "from_token": {
                    "symbol": "usd"
                  },
                  "id": "vault-swap-cwal_xxxxxxxxxxxxxx",
                  "object": "swap",
                  "rate": "0.989",
                  "status": "queued",
                  "to_chain": "ethereum",
                  "to_token": {
                    "symbol": "cad"
                  },
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
        let expectedResponse = CreateSwapsResponse(
            accountId: "biz_xxxxxxxxxxxxxx",
            amount: Optional(Nullable<String>.value("100.0")),
            amountIn: Optional(Nullable<Double>.value(131.4)),
            amountOut: Optional(Nullable<Double>.value(180)),
            amountOutExpected: Optional("98.9"),
            amountOutMin: Optional("98.4"),
            fromToken: Optional(Nullable<CreateSwapsResponseFromToken>.value(CreateSwapsResponseFromToken(
                symbol: Optional("usd")
            ))),
            id: Optional("vault-swap-cwal_xxxxxxxxxxxxxx"),
            object: CreateSwapsResponseObject.swap,
            rate: Optional("0.989"),
            status: CreateSwapsResponseStatus.queued,
            toChain: Optional("ethereum"),
            toToken: Optional(Nullable<CreateSwapsResponseToToken>.value(CreateSwapsResponseToToken(
                symbol: Optional("cad")
            ))),
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.swaps.create(
            request: .init(
                fromToken: "usd",
                toToken: "cad"
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
                  "amount_in": 1.1,
                  "amount_out": 1.1,
                  "amount_out_expected": "amount_out_expected",
                  "amount_out_min": "amount_out_min",
                  "from_token": {
                    "symbol": "symbol"
                  },
                  "id": "id",
                  "object": "swap",
                  "rate": "rate",
                  "status": "queued",
                  "to_chain": "to_chain",
                  "to_token": {
                    "symbol": "symbol"
                  },
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
        let expectedResponse = CreateSwapsResponse(
            accountId: "account_id",
            amount: Optional(Nullable<String>.value("amount")),
            amountIn: Optional(Nullable<Double>.value(1.1)),
            amountOut: Optional(Nullable<Double>.value(1.1)),
            amountOutExpected: Optional("amount_out_expected"),
            amountOutMin: Optional("amount_out_min"),
            fromToken: Optional(Nullable<CreateSwapsResponseFromToken>.value(CreateSwapsResponseFromToken(
                symbol: Optional("symbol")
            ))),
            id: Optional("id"),
            object: CreateSwapsResponseObject.swap,
            rate: Optional("rate"),
            status: CreateSwapsResponseStatus.queued,
            toChain: Optional("to_chain"),
            toToken: Optional(Nullable<CreateSwapsResponseToToken>.value(CreateSwapsResponseToToken(
                symbol: Optional("symbol")
            ))),
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.swaps.create(
            request: .init(
                fromToken: "from_token",
                toToken: "to_token"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func createQuote1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "amount_in": "100",
                  "amount_out": "0.15",
                  "amount_out_min": "0.148",
                  "bridge_fee": "0.25",
                  "estimated_duration_seconds": 30,
                  "fee_bps": 100,
                  "from_address": "0x6f1c0a3d5b2e4f8a9c7d1e0b3a5f7c9d2e4b6a80",
                  "from_token": {
                    "address": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                    "chain_id": 9745,
                    "decimals": 6,
                    "network": "plasma",
                    "symbol": "USDT"
                  },
                  "metadata": {
                    "external_id": "shop_4417"
                  },
                  "object": "swap_quote",
                  "rate": "1.5",
                  "requires_token_approval": true,
                  "to_address": "0x9d2e4b6a806f1c0a3d5b2e4f8a9c7d1e0b3a5f7c",
                  "to_token": {
                    "address": "0x1b64b9025eebb9a6239575df9ea4b9ac46d4d193",
                    "chain_id": 9745,
                    "decimals": 6,
                    "network": "plasma",
                    "symbol": "XAUT"
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
        let expectedResponse = CreateQuoteSwapsResponse(
            amountIn: "100",
            amountOut: "0.15",
            amountOutMin: Optional("0.148"),
            bridgeFee: Optional(Nullable<String>.value("0.25")),
            estimatedDurationSeconds: Optional(Nullable<Int>.value(30)),
            feeBps: 100,
            fromAddress: Optional(Nullable<String>.value("0x6f1c0a3d5b2e4f8a9c7d1e0b3a5f7c9d2e4b6a80")),
            fromToken: [
                "address": JSONValue.string("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"), 
                "chain_id": JSONValue.number(9745), 
                "decimals": JSONValue.number(6), 
                "network": JSONValue.string("plasma"), 
                "symbol": JSONValue.string("USDT")
            ],
            metadata: [
                "external_id": JSONValue.string("shop_4417")
            ],
            object: CreateQuoteSwapsResponseObject.swapQuote,
            rate: "1.5",
            requiresTokenApproval: Optional(Nullable<Bool>.value(true)),
            toAddress: Optional(Nullable<String>.value("0x9d2e4b6a806f1c0a3d5b2e4f8a9c7d1e0b3a5f7c")),
            toToken: [
                "address": JSONValue.string("0x1b64b9025eebb9a6239575df9ea4b9ac46d4d193"), 
                "chain_id": JSONValue.number(9745), 
                "decimals": JSONValue.number(6), 
                "network": JSONValue.string("plasma"), 
                "symbol": JSONValue.string("XAUT")
            ]
        )
        let response = try await client.swaps.createQuote(
            request: .init(
                amount: "100",
                fromToken: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                toToken: "0x1b64b9025eebb9a6239575df9ea4b9ac46d4d193"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func createQuote2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "amount_in": "amount_in",
                  "amount_out": "amount_out",
                  "amount_out_min": "amount_out_min",
                  "bridge_fee": "bridge_fee",
                  "estimated_duration_seconds": 1,
                  "fee_bps": 1,
                  "from_address": "from_address",
                  "from_token": {
                    "from_token": {
                      "key": "value"
                    }
                  },
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "object": "swap_quote",
                  "rate": "rate",
                  "requires_token_approval": true,
                  "to_address": "to_address",
                  "to_token": {
                    "to_token": {
                      "key": "value"
                    }
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
        let expectedResponse = CreateQuoteSwapsResponse(
            amountIn: "amount_in",
            amountOut: "amount_out",
            amountOutMin: Optional("amount_out_min"),
            bridgeFee: Optional(Nullable<String>.value("bridge_fee")),
            estimatedDurationSeconds: Optional(Nullable<Int>.value(1)),
            feeBps: 1,
            fromAddress: Optional(Nullable<String>.value("from_address")),
            fromToken: [
                "from_token": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            object: CreateQuoteSwapsResponseObject.swapQuote,
            rate: "rate",
            requiresTokenApproval: Optional(Nullable<Bool>.value(true)),
            toAddress: Optional(Nullable<String>.value("to_address")),
            toToken: [
                "to_token": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]
        )
        let response = try await client.swaps.createQuote(
            request: .init(
                amount: "amount",
                fromToken: "from_token",
                toToken: "to_token"
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
                  "amount": "0.052341",
                  "error": "Swap reverted: quoted price moved beyond the slippage tolerance",
                  "id": "vault-swap-cwal_xxxxxxxxxxxxxx",
                  "object": "swap",
                  "status": "queued",
                  "tx_hashes": [
                    "0xabc"
                  ],
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
        let expectedResponse = RetrieveSwapsResponse(
            accountId: "biz_xxxxxxxxxxxxxx",
            amount: Nullable<String>.value("0.052341"),
            error: Optional(Nullable<String>.value("Swap reverted: quoted price moved beyond the slippage tolerance")),
            id: "vault-swap-cwal_xxxxxxxxxxxxxx",
            object: RetrieveSwapsResponseObject.swap,
            status: RetrieveSwapsResponseStatus.queued,
            txHashes: [
                "0xabc"
            ],
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.swaps.retrieve(
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
                  "error": "error",
                  "id": "id",
                  "object": "swap",
                  "status": "queued",
                  "tx_hashes": [
                    "tx_hashes",
                    "tx_hashes"
                  ],
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
        let expectedResponse = RetrieveSwapsResponse(
            accountId: "account_id",
            amount: Nullable<String>.value("amount"),
            error: Optional(Nullable<String>.value("error")),
            id: "id",
            object: RetrieveSwapsResponseObject.swap,
            status: RetrieveSwapsResponseStatus.queued,
            txHashes: [
                "tx_hashes",
                "tx_hashes"
            ],
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.swaps.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}