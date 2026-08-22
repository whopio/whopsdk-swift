import Foundation
import Testing
import WhopSDK

@Suite("StatsClient Wire Tests") struct StatsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "description": "Share of paid receipts in the selected sales cohort disputed within 14 days of purchase.",
                      "key": "snapshot_cohorted_dispute_rate_14d_attr",
                      "name": "Cohorted dispute rate (14-day attribution)",
                      "properties": [
                        "source"
                      ],
                      "unit": "count",
                      "windows": [
                        "7d"
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
        let expectedResponse = ListStatsResponse(
            data: [
                ListStatsResponseDataItem(
                    description: "Share of paid receipts in the selected sales cohort disputed within 14 days of purchase.",
                    key: "snapshot_cohorted_dispute_rate_14d_attr",
                    name: "Cohorted dispute rate (14-day attribution)",
                    properties: [
                        "source"
                    ],
                    unit: ListStatsResponseDataItemUnit.count,
                    windows: Optional([
                        "7d"
                    ])
                )
            ]
        )
        let response = try await client.stats.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func describeStats1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "nodes": [
                    "nodes"
                  ],
                  "views": [
                    "views"
                  ],
                  "metrics": [
                    {
                      "name": "name",
                      "node_path": "node_path",
                      "supported_engines": [
                        "supported_engines"
                      ]
                    }
                  ],
                  "debug": {
                    "request_id": "request_id"
                  },
                  "typename": "DescribeRoot"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DescribeStatsResponse.describeRoot(
            .init(
                nodes: [
                    "nodes"
                ],
                views: [
                    "views"
                ],
                metrics: [
                    DescribeStatsResponseDescribeRootMetricsItem(
                        name: "name",
                        nodePath: "node_path",
                        supportedEngines: [
                            "supported_engines"
                        ]
                    )
                ],
                debug: Nullable<DescribeStatsResponseDescribeRootDebug>.value(DescribeStatsResponseDescribeRootDebug(
                    requestId: Nullable<String>.value("request_id")
                )),
                additionalProperties: [
                    "typename": JSONValue.string("DescribeRoot")
                ]
            )
        )
        let response = try await client.stats.describeStats(
            companyId: "biz_xxxxxxxxxxxxxx",
            userId: "user_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func metricStats1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "columns": [
                    "columns"
                  ],
                  "data": [
                    {
                      "key": "value"
                    }
                  ],
                  "debug": {
                    "engine": "engine",
                    "request_id": "request_id",
                    "sql": "sql"
                  },
                  "node": "node",
                  "pagination": {
                    "next_cursor": "next_cursor"
                  },
                  "typename": "Result"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = MetricStatsResponse(
            columns: Nullable<[String]>.value([
                "columns"
            ]),
            data: Nullable<[[String: JSONValue]]>.value([
                [
                    "key": JSONValue.string("value")
                ]
            ]),
            debug: Nullable<MetricStatsResponseDebug>.value(MetricStatsResponseDebug(
                engine: Nullable<String>.value("engine"),
                requestId: Nullable<String>.value("request_id"),
                sql: Nullable<String>.value("sql")
            )),
            node: Nullable<String>.value("node"),
            pagination: Nullable<MetricStatsResponsePagination>.value(MetricStatsResponsePagination(
                nextCursor: Nullable<String>.value("next_cursor")
            )),
            typename: MetricStatsResponseTypename.result
        )
        let response = try await client.stats.metricStats(
            resource: "resource",
            from: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            to: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            companyId: "biz_xxxxxxxxxxxxxx",
            userId: "user_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func rawStats1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "columns": [
                    "columns"
                  ],
                  "data": [
                    {
                      "key": "value"
                    }
                  ],
                  "debug": {
                    "engine": "engine",
                    "request_id": "request_id",
                    "sql": "sql"
                  },
                  "node": "node",
                  "pagination": {
                    "next_cursor": "next_cursor"
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
        let expectedResponse = RawStatsResponse(
            columns: Nullable<[String]>.value([
                "columns"
            ]),
            data: Nullable<[[String: JSONValue]]>.value([
                [
                    "key": JSONValue.string("value")
                ]
            ]),
            debug: Nullable<RawStatsResponseDebug>.value(RawStatsResponseDebug(
                engine: Nullable<String>.value("engine"),
                requestId: Nullable<String>.value("request_id"),
                sql: Nullable<String>.value("sql")
            )),
            node: Nullable<String>.value("node"),
            pagination: Nullable<RawStatsResponsePagination>.value(RawStatsResponsePagination(
                nextCursor: Nullable<String>.value("next_cursor")
            ))
        )
        let response = try await client.stats.rawStats(
            resource: "resource",
            from: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            to: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            limit: 42,
            companyId: "biz_xxxxxxxxxxxxxx",
            userId: "user_xxxxxxxxxxxxx",
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
                  "data": {
                    "currency": "usd",
                    "points": [
                      {
                        "breakdown": [
                          {
                            "name": "spend",
                            "value": 2.82
                          }
                        ],
                        "timestamp": 1767268800,
                        "value": 16.67
                      }
                    ],
                    "totals": [
                      {
                        "name": "spend",
                        "value": 2.82
                      }
                    ]
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
        let expectedResponse = RetrieveStatsResponse(
            data: RetrieveStatsResponseData(
                currency: Optional(Nullable<String>.value("usd")),
                points: [
                    RetrieveStatsResponseDataPointsItem(
                        breakdown: Optional([
                            RetrieveStatsResponseDataPointsItemBreakdownItem(
                                name: "spend",
                                value: Nullable<Double>.value(2.82)
                            )
                        ]),
                        timestamp: 1767268800,
                        value: Nullable<Double>.value(16.67)
                    )
                ],
                totals: Optional(Nullable<[RetrieveStatsResponseDataTotalsItem]>.value([
                    RetrieveStatsResponseDataTotalsItem(
                        name: "spend",
                        value: Nullable<Double>.value(2.82)
                    )
                ]))
            )
        )
        let response = try await client.stats.retrieve(
            metric: "metric",
            from: "from",
            to: "to",
            adCampaignIds: [
                "adcamp_xxxxxxxxxxxxxx"
            ],
            adGroupIds: [
                "adgrp_xxxxxxxxxxxxxx"
            ],
            adIds: [
                "ad_xxxxxxxxxxxxxx"
            ],
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}