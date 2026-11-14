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

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "breakdowns": [
                        "breakdowns",
                        "breakdowns"
                      ],
                      "description": "description",
                      "key": "key",
                      "name": "name",
                      "properties": [
                        "properties",
                        "properties"
                      ],
                      "unit": "count",
                      "windows": [
                        "windows",
                        "windows"
                      ]
                    },
                    {
                      "breakdowns": [
                        "breakdowns",
                        "breakdowns"
                      ],
                      "description": "description",
                      "key": "key",
                      "name": "name",
                      "properties": [
                        "properties",
                        "properties"
                      ],
                      "unit": "count",
                      "windows": [
                        "windows",
                        "windows"
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
                        "breakdowns",
                        "breakdowns"
                    ]),
                    description: "description",
                    key: "key",
                    name: "name",
                    properties: [
                        "properties",
                        "properties"
                    ],
                    unit: ListTimeSeriesResponseDataItemUnit.count,
                    windows: Optional([
                        "windows",
                        "windows"
                    ])
                ),
                ListTimeSeriesResponseDataItem(
                    breakdowns: Optional([
                        "breakdowns",
                        "breakdowns"
                    ]),
                    description: "description",
                    key: "key",
                    name: "name",
                    properties: [
                        "properties",
                        "properties"
                    ],
                    unit: ListTimeSeriesResponseDataItemUnit.count,
                    windows: Optional([
                        "windows",
                        "windows"
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

    @Test func retrieve2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "complete": true,
                    "currency": "currency",
                    "points": [
                      {
                        "breakdown": [
                          {
                            "name": "name",
                            "steps": [
                              {
                                "conversion_rate": null,
                                "count": 1,
                                "step": 1
                              },
                              {
                                "conversion_rate": null,
                                "count": 1,
                                "step": 1
                              }
                            ],
                            "value": 1.1
                          },
                          {
                            "name": "name",
                            "steps": [
                              {
                                "conversion_rate": null,
                                "count": 1,
                                "step": 1
                              },
                              {
                                "conversion_rate": null,
                                "count": 1,
                                "step": 1
                              }
                            ],
                            "value": 1.1
                          }
                        ],
                        "steps": [
                          {
                            "conversion_rate": 1.1,
                            "count": 1,
                            "step": 1
                          },
                          {
                            "conversion_rate": 1.1,
                            "count": 1,
                            "step": 1
                          }
                        ],
                        "timestamp": 1,
                        "value": 1.1
                      },
                      {
                        "breakdown": [
                          {
                            "name": "name",
                            "steps": [
                              {
                                "conversion_rate": null,
                                "count": 1,
                                "step": 1
                              },
                              {
                                "conversion_rate": null,
                                "count": 1,
                                "step": 1
                              }
                            ],
                            "value": 1.1
                          },
                          {
                            "name": "name",
                            "steps": [
                              {
                                "conversion_rate": null,
                                "count": 1,
                                "step": 1
                              },
                              {
                                "conversion_rate": null,
                                "count": 1,
                                "step": 1
                              }
                            ],
                            "value": 1.1
                          }
                        ],
                        "steps": [
                          {
                            "conversion_rate": 1.1,
                            "count": 1,
                            "step": 1
                          },
                          {
                            "conversion_rate": 1.1,
                            "count": 1,
                            "step": 1
                          }
                        ],
                        "timestamp": 1,
                        "value": 1.1
                      }
                    ],
                    "totals": [
                      {
                        "comparison": {
                          "baseline": "baseline",
                          "difference_confidence_interval": null,
                          "difference_percentage_points": 1.1,
                          "relative_lift_percent": 1.1
                        },
                        "confidence_interval": {
                          "lower": 1.1,
                          "upper": 1.1
                        },
                        "name": "name",
                        "steps": [
                          {
                            "conversion_rate": 1.1,
                            "count": 1,
                            "step": 1
                          },
                          {
                            "conversion_rate": 1.1,
                            "count": 1,
                            "step": 1
                          }
                        ],
                        "value": 1.1
                      },
                      {
                        "comparison": {
                          "baseline": "baseline",
                          "difference_confidence_interval": null,
                          "difference_percentage_points": 1.1,
                          "relative_lift_percent": 1.1
                        },
                        "confidence_interval": {
                          "lower": 1.1,
                          "upper": 1.1
                        },
                        "name": "name",
                        "steps": [
                          {
                            "conversion_rate": 1.1,
                            "count": 1,
                            "step": 1
                          },
                          {
                            "conversion_rate": 1.1,
                            "count": 1,
                            "step": 1
                          }
                        ],
                        "value": 1.1
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
                complete: Optional(Nullable<Bool>.value(true)),
                currency: Optional(Nullable<String>.value("currency")),
                points: [
                    RetrieveTimeSeriesResponseDataPointsItem(
                        breakdown: Optional([
                            RetrieveTimeSeriesResponseDataPointsItemBreakdownItem(
                                name: "name",
                                steps: Optional([
                                    FunnelStepResult(
                                        conversionRate: .null,
                                        count: 1,
                                        step: 1
                                    ),
                                    FunnelStepResult(
                                        conversionRate: .null,
                                        count: 1,
                                        step: 1
                                    )
                                ]),
                                value: Nullable<Double>.value(1.1)
                            ),
                            RetrieveTimeSeriesResponseDataPointsItemBreakdownItem(
                                name: "name",
                                steps: Optional([
                                    FunnelStepResult(
                                        conversionRate: .null,
                                        count: 1,
                                        step: 1
                                    ),
                                    FunnelStepResult(
                                        conversionRate: .null,
                                        count: 1,
                                        step: 1
                                    )
                                ]),
                                value: Nullable<Double>.value(1.1)
                            )
                        ]),
                        steps: Optional([
                            FunnelStepResult(
                                conversionRate: Nullable<Double>.value(1.1),
                                count: 1,
                                step: 1
                            ),
                            FunnelStepResult(
                                conversionRate: Nullable<Double>.value(1.1),
                                count: 1,
                                step: 1
                            )
                        ]),
                        timestamp: 1,
                        value: Nullable<Double>.value(1.1)
                    ),
                    RetrieveTimeSeriesResponseDataPointsItem(
                        breakdown: Optional([
                            RetrieveTimeSeriesResponseDataPointsItemBreakdownItem(
                                name: "name",
                                steps: Optional([
                                    FunnelStepResult(
                                        conversionRate: .null,
                                        count: 1,
                                        step: 1
                                    ),
                                    FunnelStepResult(
                                        conversionRate: .null,
                                        count: 1,
                                        step: 1
                                    )
                                ]),
                                value: Nullable<Double>.value(1.1)
                            ),
                            RetrieveTimeSeriesResponseDataPointsItemBreakdownItem(
                                name: "name",
                                steps: Optional([
                                    FunnelStepResult(
                                        conversionRate: .null,
                                        count: 1,
                                        step: 1
                                    ),
                                    FunnelStepResult(
                                        conversionRate: .null,
                                        count: 1,
                                        step: 1
                                    )
                                ]),
                                value: Nullable<Double>.value(1.1)
                            )
                        ]),
                        steps: Optional([
                            FunnelStepResult(
                                conversionRate: Nullable<Double>.value(1.1),
                                count: 1,
                                step: 1
                            ),
                            FunnelStepResult(
                                conversionRate: Nullable<Double>.value(1.1),
                                count: 1,
                                step: 1
                            )
                        ]),
                        timestamp: 1,
                        value: Nullable<Double>.value(1.1)
                    )
                ],
                totals: Optional(Nullable<[RetrieveTimeSeriesResponseDataTotalsItem]>.value([
                    RetrieveTimeSeriesResponseDataTotalsItem(
                        comparison: Optional(Nullable<FunnelComparison>.value(FunnelComparison(
                            baseline: "baseline",
                            differenceConfidenceInterval: .null,
                            differencePercentagePoints: 1.1,
                            relativeLiftPercent: Nullable<Double>.value(1.1)
                        ))),
                        confidenceInterval: Optional(Nullable<FunnelConfidenceInterval>.value(FunnelConfidenceInterval(
                            lower: 1.1,
                            upper: 1.1
                        ))),
                        name: "name",
                        steps: Optional([
                            FunnelStepResult(
                                conversionRate: Nullable<Double>.value(1.1),
                                count: 1,
                                step: 1
                            ),
                            FunnelStepResult(
                                conversionRate: Nullable<Double>.value(1.1),
                                count: 1,
                                step: 1
                            )
                        ]),
                        value: Nullable<Double>.value(1.1)
                    ),
                    RetrieveTimeSeriesResponseDataTotalsItem(
                        comparison: Optional(Nullable<FunnelComparison>.value(FunnelComparison(
                            baseline: "baseline",
                            differenceConfidenceInterval: .null,
                            differencePercentagePoints: 1.1,
                            relativeLiftPercent: Nullable<Double>.value(1.1)
                        ))),
                        confidenceInterval: Optional(Nullable<FunnelConfidenceInterval>.value(FunnelConfidenceInterval(
                            lower: 1.1,
                            upper: 1.1
                        ))),
                        name: "name",
                        steps: Optional([
                            FunnelStepResult(
                                conversionRate: Nullable<Double>.value(1.1),
                                count: 1,
                                step: 1
                            ),
                            FunnelStepResult(
                                conversionRate: Nullable<Double>.value(1.1),
                                count: 1,
                                step: 1
                            )
                        ]),
                        value: Nullable<Double>.value(1.1)
                    )
                ]))
            )
        )
        let response = try await client.stats.timeSeries.retrieve(
            metric: "metric",
            from: "from",
            to: "to",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}