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
        let expectedResponse = ListStatsResponse(
            data: [
                ListStatsResponseDataItem(
                    breakdowns: Optional([
                        "component"
                    ]),
                    description: "A 0 to 100 campaign score at each interval, over the hours since the current claim (at most the last 7 days) that the campaign was active or paused: half the share of its daily budget it charged in those hours, half the share of those hours it charged in. A claim that hasn't charged yet is not scored for its first 24 such hours. Several ad_xxxxxxxxxxxxxx_ids (up to 100) average their scores weighted by daily budget. breakdown_by=component, for one campaign, adds each part's score and weight and the totals behind them. A runner reads the campaigns they run; staff read any campaign with account_id=global.",
                    key: "ad_xxxxxxxxxxxxxx_score",
                    name: "Ad campaign score",
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
        let expectedResponse = ListStatsResponse(
            data: [
                ListStatsResponseDataItem(
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
                    unit: ListStatsResponseDataItemUnit.count,
                    windows: Optional([
                        "windows",
                        "windows"
                    ])
                ),
                ListStatsResponseDataItem(
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
                    unit: ListStatsResponseDataItemUnit.count,
                    windows: Optional([
                        "windows",
                        "windows"
                    ])
                )
            ]
        )
        let response = try await client.stats.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "complete": true,
                    "currency": "usd",
                    "points": [
                      {
                        "breakdown": [
                          {
                            "name": "control",
                            "steps": [
                              {
                                "conversion_rate": 100,
                                "count": 100,
                                "step": 1
                              }
                            ],
                            "value": 10
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
                        "value": 12
                      }
                    ],
                    "totals": [
                      {
                        "name": "funnel",
                        "steps": [
                          {
                            "conversion_rate": 100,
                            "count": 100,
                            "step": 1
                          }
                        ],
                        "value": 12
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
                complete: Optional(Nullable<Bool>.value(true)),
                currency: Optional(Nullable<String>.value("usd")),
                points: [
                    RetrieveStatsResponseDataPointsItem(
                        breakdown: Optional([
                            RetrieveStatsResponseDataPointsItemBreakdownItem(
                                name: "control",
                                steps: Optional([
                                    FunnelStepResult(
                                        conversionRate: Nullable<Double>.value(100),
                                        count: 100,
                                        step: 1
                                    )
                                ]),
                                value: Nullable<Double>.value(10)
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
                        value: Nullable<Double>.value(12)
                    )
                ],
                totals: Optional(Nullable<[RetrieveStatsResponseDataTotalsItem]>.value([
                    RetrieveStatsResponseDataTotalsItem(
                        name: "funnel",
                        steps: Optional([
                            FunnelStepResult(
                                conversionRate: Nullable<Double>.value(100),
                                count: 100,
                                step: 1
                            )
                        ]),
                        value: Nullable<Double>.value(12)
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
        let expectedResponse = RetrieveStatsResponse(
            data: RetrieveStatsResponseData(
                complete: Optional(Nullable<Bool>.value(true)),
                currency: Optional(Nullable<String>.value("currency")),
                points: [
                    RetrieveStatsResponseDataPointsItem(
                        breakdown: Optional([
                            RetrieveStatsResponseDataPointsItemBreakdownItem(
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
                            RetrieveStatsResponseDataPointsItemBreakdownItem(
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
                    RetrieveStatsResponseDataPointsItem(
                        breakdown: Optional([
                            RetrieveStatsResponseDataPointsItemBreakdownItem(
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
                            RetrieveStatsResponseDataPointsItemBreakdownItem(
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
                totals: Optional(Nullable<[RetrieveStatsResponseDataTotalsItem]>.value([
                    RetrieveStatsResponseDataTotalsItem(
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
                    RetrieveStatsResponseDataTotalsItem(
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
        let response = try await client.stats.retrieve(
            metric: "metric",
            from: "from",
            to: "to",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}