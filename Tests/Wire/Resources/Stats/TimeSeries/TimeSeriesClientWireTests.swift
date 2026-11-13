import Foundation
import Testing
import WhopSDK

@Suite("TimeSeriesClient Wire Tests") struct TimeSeriesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "breakdowns": [
                        "component"
                      ],
                      "description": "A 0 to 100 campaign score at each interval, over the hours since the current claim (at most the last 7 days) that the campaign was active or paused: half the share of its daily budget it charged in those hours, half the share of those hours it charged in. A claim that hasn't charged yet is not scored for its first 24 such hours. Several ad_xxxxxxxxxxxxxx_ids (up to 100) average their scores weighted by daily budget. breakdown_by=component, for one campaign, adds each part's score and weight and the totals behind them. A runner reads the campaigns they run; staff read any campaign with account_id=global.",
                      "key": "ad_xxxxxxxxxxxxxx_score",
                      "name": "Ad campaign score",
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
        let expectedResponse = ListTimeSeriesResponse(
            data: [
                ListTimeSeriesResponseDataItem(
                    breakdowns: Optional([
                        "component"
                    ]),
                    description: "A 0 to 100 campaign score at each interval, over the hours since the current claim (at most the last 7 days) that the campaign was active or paused: half the share of its daily budget it charged in those hours, half the share of those hours it charged in. A claim that hasn't charged yet is not scored for its first 24 such hours. Several ad_xxxxxxxxxxxxxx_ids (up to 100) average their scores weighted by daily budget. breakdown_by=component, for one campaign, adds each part's score and weight and the totals behind them. A runner reads the campaigns they run; staff read any campaign with account_id=global.",
                    key: "ad_xxxxxxxxxxxxxx_score",
                    name: "Ad campaign score",
                    properties: [
                        "source"
                    ],
                    unit: ListTimeSeriesResponseDataItemUnit.count,
                    windows: Optional([
                        "7d"
                    ])
                )
            ]
        )
        let response = try await client.stats.timeSeries.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "complete": false,
                    "currency": "usd",
                    "points": [
                      {
                        "breakdown": [
                          {
                            "name": "success",
                            "steps": [
                              {
                                "conversion_rate": 100,
                                "count": 100,
                                "step": 1
                              }
                            ],
                            "value": 5
                          }
                        ],
                        "steps": [
                          {
                            "conversion_rate": 100,
                            "count": 100,
                            "step": 1
                          }
                        ],
                        "timestamp": 1767268800,
                        "value": 3
                      }
                    ],
                    "totals": [
                      {
                        "name": "wins",
                        "steps": [
                          {
                            "conversion_rate": 100,
                            "count": 100,
                            "step": 1
                          }
                        ],
                        "value": 4
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
        let expectedResponse = RetrieveTimeSeriesResponse(
            data: RetrieveTimeSeriesResponseData(
                complete: Optional(Nullable<Bool>.value(false)),
                currency: Optional(Nullable<String>.value("usd")),
                points: [
                    RetrieveTimeSeriesResponseDataPointsItem(
                        breakdown: Optional([
                            RetrieveTimeSeriesResponseDataPointsItemBreakdownItem(
                                name: "success",
                                steps: Optional([
                                    FunnelStepResult(
                                        conversionRate: Nullable<Double>.value(100),
                                        count: 100,
                                        step: 1
                                    )
                                ]),
                                value: Nullable<Double>.value(5)
                            )
                        ]),
                        steps: Optional([
                            FunnelStepResult(
                                conversionRate: Nullable<Double>.value(100),
                                count: 100,
                                step: 1
                            )
                        ]),
                        timestamp: 1767268800,
                        value: Nullable<Double>.value(3)
                    )
                ],
                totals: Optional(Nullable<[RetrieveTimeSeriesResponseDataTotalsItem]>.value([
                    RetrieveTimeSeriesResponseDataTotalsItem(
                        name: "wins",
                        steps: Optional([
                            FunnelStepResult(
                                conversionRate: Nullable<Double>.value(100),
                                count: 100,
                                step: 1
                            )
                        ]),
                        value: Nullable<Double>.value(4)
                    )
                ]))
            )
        )
        let response = try await client.stats.timeSeries.retrieve(
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