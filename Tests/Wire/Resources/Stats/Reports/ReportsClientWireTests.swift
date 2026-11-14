import Foundation
import Testing
import WhopSDK

@Suite("ReportsClient Wire Tests") struct ReportsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "breakdowns": [
                        "breakdowns"
                      ],
                      "columns": [
                        {
                          "key": "key",
                          "name": "name",
                          "type": "property"
                        }
                      ],
                      "description": "description",
                      "key": "key",
                      "path": "path",
                      "window_field": "window_field",
                      "window_kind": "range"
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
        let expectedResponse = ListReportsResponse(
            data: [
                ListReportsResponseDataItem(
                    breakdowns: [
                        "breakdowns"
                    ],
                    columns: [
                        ListReportsResponseDataItemColumnsItem(
                            key: "key",
                            name: "name",
                            type: ListReportsResponseDataItemColumnsItemType.property
                        )
                    ],
                    description: "description",
                    key: "key",
                    path: "path",
                    windowField: Nullable<String>.value("window_field"),
                    windowKind: ListReportsResponseDataItemWindowKind.range
                )
            ]
        )
        let response = try await client.stats.reports.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "columns": [
                        {
                          "aggregate": "sum",
                          "available_on": [
                            "available_on",
                            "available_on"
                          ],
                          "breakdowns": [
                            "breakdowns",
                            "breakdowns"
                          ],
                          "default": true,
                          "key": "key",
                          "name": "name",
                          "set": "fixed",
                          "type": "property",
                          "unit": "money",
                          "weight": "weight",
                          "windows": [
                            "windows",
                            "windows"
                          ]
                        },
                        {
                          "aggregate": "sum",
                          "available_on": [
                            "available_on",
                            "available_on"
                          ],
                          "breakdowns": [
                            "breakdowns",
                            "breakdowns"
                          ],
                          "default": true,
                          "key": "key",
                          "name": "name",
                          "set": "fixed",
                          "type": "property",
                          "unit": "money",
                          "weight": "weight",
                          "windows": [
                            "windows",
                            "windows"
                          ]
                        }
                      ],
                      "description": "description",
                      "key": "key",
                      "path": "path",
                      "window_field": "window_field",
                      "window_kind": "range"
                    },
                    {
                      "breakdowns": [
                        "breakdowns",
                        "breakdowns"
                      ],
                      "columns": [
                        {
                          "aggregate": "sum",
                          "available_on": [
                            "available_on",
                            "available_on"
                          ],
                          "breakdowns": [
                            "breakdowns",
                            "breakdowns"
                          ],
                          "default": true,
                          "key": "key",
                          "name": "name",
                          "set": "fixed",
                          "type": "property",
                          "unit": "money",
                          "weight": "weight",
                          "windows": [
                            "windows",
                            "windows"
                          ]
                        },
                        {
                          "aggregate": "sum",
                          "available_on": [
                            "available_on",
                            "available_on"
                          ],
                          "breakdowns": [
                            "breakdowns",
                            "breakdowns"
                          ],
                          "default": true,
                          "key": "key",
                          "name": "name",
                          "set": "fixed",
                          "type": "property",
                          "unit": "money",
                          "weight": "weight",
                          "windows": [
                            "windows",
                            "windows"
                          ]
                        }
                      ],
                      "description": "description",
                      "key": "key",
                      "path": "path",
                      "window_field": "window_field",
                      "window_kind": "range"
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
        let expectedResponse = ListReportsResponse(
            data: [
                ListReportsResponseDataItem(
                    breakdowns: [
                        "breakdowns",
                        "breakdowns"
                    ],
                    columns: [
                        ListReportsResponseDataItemColumnsItem(
                            aggregate: Optional(ListReportsResponseDataItemColumnsItemAggregate.sum),
                            availableOn: Optional([
                                "available_on",
                                "available_on"
                            ]),
                            breakdowns: Optional(Nullable<[String]>.value([
                                "breakdowns",
                                "breakdowns"
                            ])),
                            default: Optional(true),
                            key: "key",
                            name: "name",
                            set: Optional(ListReportsResponseDataItemColumnsItemSet.fixed),
                            type: ListReportsResponseDataItemColumnsItemType.property,
                            unit: Optional(ListReportsResponseDataItemColumnsItemUnit.money),
                            weight: Optional(Nullable<String>.value("weight")),
                            windows: Optional(Nullable<[String]>.value([
                                "windows",
                                "windows"
                            ]))
                        ),
                        ListReportsResponseDataItemColumnsItem(
                            aggregate: Optional(ListReportsResponseDataItemColumnsItemAggregate.sum),
                            availableOn: Optional([
                                "available_on",
                                "available_on"
                            ]),
                            breakdowns: Optional(Nullable<[String]>.value([
                                "breakdowns",
                                "breakdowns"
                            ])),
                            default: Optional(true),
                            key: "key",
                            name: "name",
                            set: Optional(ListReportsResponseDataItemColumnsItemSet.fixed),
                            type: ListReportsResponseDataItemColumnsItemType.property,
                            unit: Optional(ListReportsResponseDataItemColumnsItemUnit.money),
                            weight: Optional(Nullable<String>.value("weight")),
                            windows: Optional(Nullable<[String]>.value([
                                "windows",
                                "windows"
                            ]))
                        )
                    ],
                    description: "description",
                    key: "key",
                    path: "path",
                    windowField: Nullable<String>.value("window_field"),
                    windowKind: ListReportsResponseDataItemWindowKind.range
                ),
                ListReportsResponseDataItem(
                    breakdowns: [
                        "breakdowns",
                        "breakdowns"
                    ],
                    columns: [
                        ListReportsResponseDataItemColumnsItem(
                            aggregate: Optional(ListReportsResponseDataItemColumnsItemAggregate.sum),
                            availableOn: Optional([
                                "available_on",
                                "available_on"
                            ]),
                            breakdowns: Optional(Nullable<[String]>.value([
                                "breakdowns",
                                "breakdowns"
                            ])),
                            default: Optional(true),
                            key: "key",
                            name: "name",
                            set: Optional(ListReportsResponseDataItemColumnsItemSet.fixed),
                            type: ListReportsResponseDataItemColumnsItemType.property,
                            unit: Optional(ListReportsResponseDataItemColumnsItemUnit.money),
                            weight: Optional(Nullable<String>.value("weight")),
                            windows: Optional(Nullable<[String]>.value([
                                "windows",
                                "windows"
                            ]))
                        ),
                        ListReportsResponseDataItemColumnsItem(
                            aggregate: Optional(ListReportsResponseDataItemColumnsItemAggregate.sum),
                            availableOn: Optional([
                                "available_on",
                                "available_on"
                            ]),
                            breakdowns: Optional(Nullable<[String]>.value([
                                "breakdowns",
                                "breakdowns"
                            ])),
                            default: Optional(true),
                            key: "key",
                            name: "name",
                            set: Optional(ListReportsResponseDataItemColumnsItemSet.fixed),
                            type: ListReportsResponseDataItemColumnsItemType.property,
                            unit: Optional(ListReportsResponseDataItemColumnsItemUnit.money),
                            weight: Optional(Nullable<String>.value("weight")),
                            windows: Optional(Nullable<[String]>.value([
                                "windows",
                                "windows"
                            ]))
                        )
                    ],
                    description: "description",
                    key: "key",
                    path: "path",
                    windowField: Nullable<String>.value("window_field"),
                    windowKind: ListReportsResponseDataItemWindowKind.range
                )
            ]
        )
        let response = try await client.stats.reports.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func platformTrends1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "breakdown_by": "industry_type",
                    "columns": [
                      {
                        "key": "industry_type",
                        "name": "Industry type",
                        "type": "property"
                      },
                      {
                        "key": "business_type",
                        "name": "Business type",
                        "type": "property"
                      },
                      {
                        "aggregate": "sum",
                        "key": "gross_revenue",
                        "name": "Gross revenue",
                        "type": "metric",
                        "unit": "money"
                      },
                      {
                        "aggregate": "sum",
                        "key": "businesses",
                        "name": "Businesses",
                        "type": "metric",
                        "unit": "count"
                      }
                    ],
                    "data_as_of": "2026-10-07T04:48:34Z",
                    "report": "platform_trends",
                    "reports": [
                      {
                        "rows": [
                          {
                            "account_country": {
                              "id": "education",
                              "name": "Education"
                            },
                            "aov": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "business_type": {
                              "id": "services",
                              "name": "Services"
                            },
                            "businesses": 828,
                            "customer_country": {
                              "id": "education",
                              "name": "Education"
                            },
                            "gross_revenue": {
                              "amount": "7002670.25",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "industry_type": {
                              "id": "marketing_agency",
                              "name": "Marketing Agency"
                            },
                            "median_gross_revenue": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "product_category": {
                              "id": "education",
                              "name": "Education"
                            }
                          }
                        ],
                        "window": {
                          "as_of": null,
                          "from": "2026-09-30T04:00:00Z",
                          "key": "7d",
                          "kind": "range",
                          "time_zone": "Etc/UTC",
                          "to": "2026-10-07T04:00:00Z"
                        }
                      },
                      {
                        "rows": [
                          {
                            "account_country": {
                              "id": "education",
                              "name": "Education"
                            },
                            "aov": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "business_type": {
                              "id": "services",
                              "name": "Services"
                            },
                            "businesses": 796,
                            "customer_country": {
                              "id": "education",
                              "name": "Education"
                            },
                            "gross_revenue": {
                              "amount": "5841223.30",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "industry_type": {
                              "id": "marketing_agency",
                              "name": "Marketing Agency"
                            },
                            "median_gross_revenue": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "product_category": {
                              "id": "education",
                              "name": "Education"
                            }
                          }
                        ],
                        "window": {
                          "as_of": null,
                          "from": "2026-09-23T04:00:00Z",
                          "key": "prev:7d",
                          "kind": "range",
                          "time_zone": "Etc/UTC",
                          "to": "2026-09-30T04:00:00Z"
                        }
                      }
                    ]
                  },
                  "page_info": {
                    "end_cursor": "MQ",
                    "has_next_page": true,
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
        let expectedResponse = PlatformTrendsReportsResponse(
            data: PlatformTrendsReportsResponseData(
                breakdownBy: Nullable<String>.value("industry_type"),
                columns: [
                    PlatformTrendsReportsResponseDataColumnsItem(
                        key: "industry_type",
                        name: "Industry type",
                        type: PlatformTrendsReportsResponseDataColumnsItemType.property
                    ),
                    PlatformTrendsReportsResponseDataColumnsItem(
                        key: "business_type",
                        name: "Business type",
                        type: PlatformTrendsReportsResponseDataColumnsItemType.property
                    ),
                    PlatformTrendsReportsResponseDataColumnsItem(
                        aggregate: Optional(PlatformTrendsReportsResponseDataColumnsItemAggregate.sum),
                        key: "gross_revenue",
                        name: "Gross revenue",
                        type: PlatformTrendsReportsResponseDataColumnsItemType.metric,
                        unit: Optional(PlatformTrendsReportsResponseDataColumnsItemUnit.money)
                    ),
                    PlatformTrendsReportsResponseDataColumnsItem(
                        aggregate: Optional(PlatformTrendsReportsResponseDataColumnsItemAggregate.sum),
                        key: "businesses",
                        name: "Businesses",
                        type: PlatformTrendsReportsResponseDataColumnsItemType.metric,
                        unit: Optional(PlatformTrendsReportsResponseDataColumnsItemUnit.count)
                    )
                ],
                dataAsOf: "2026-10-07T04:48:34Z",
                report: "platform_trends",
                reports: [
                    PlatformTrendsReportsResponseDataReportsItem(
                        rows: [
                            PlatformTrendsReportsResponseDataReportsItemRowsItem(
                                accountCountry: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemAccountCountry>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemAccountCountry(
                                    id: "education",
                                    name: "Education"
                                ))),
                                aov: Optional(Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ))),
                                businessType: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemBusinessType>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemBusinessType(
                                    id: "services",
                                    name: "Services"
                                ))),
                                businesses: Optional(Nullable<Int>.value(828)),
                                customerCountry: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemCustomerCountry>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemCustomerCountry(
                                    id: "education",
                                    name: "Education"
                                ))),
                                grossRevenue: Optional(Nullable<Money>.value(Money(
                                    amount: "7002670.25",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ))),
                                industryType: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemIndustryType>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemIndustryType(
                                    id: "marketing_agency",
                                    name: "Marketing Agency"
                                ))),
                                medianGrossRevenue: Optional(Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ))),
                                productCategory: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemProductCategory>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemProductCategory(
                                    id: "education",
                                    name: "Education"
                                )))
                            )
                        ],
                        window: PlatformTrendsReportsResponseDataReportsItemWindow(
                            asOf: .null,
                            from: Nullable<String>.value("2026-09-30T04:00:00Z"),
                            key: "7d",
                            kind: PlatformTrendsReportsResponseDataReportsItemWindowKind.range,
                            timeZone: "Etc/UTC",
                            to: Nullable<String>.value("2026-10-07T04:00:00Z")
                        )
                    ),
                    PlatformTrendsReportsResponseDataReportsItem(
                        rows: [
                            PlatformTrendsReportsResponseDataReportsItemRowsItem(
                                accountCountry: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemAccountCountry>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemAccountCountry(
                                    id: "education",
                                    name: "Education"
                                ))),
                                aov: Optional(Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ))),
                                businessType: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemBusinessType>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemBusinessType(
                                    id: "services",
                                    name: "Services"
                                ))),
                                businesses: Optional(Nullable<Int>.value(796)),
                                customerCountry: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemCustomerCountry>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemCustomerCountry(
                                    id: "education",
                                    name: "Education"
                                ))),
                                grossRevenue: Optional(Nullable<Money>.value(Money(
                                    amount: "5841223.30",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ))),
                                industryType: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemIndustryType>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemIndustryType(
                                    id: "marketing_agency",
                                    name: "Marketing Agency"
                                ))),
                                medianGrossRevenue: Optional(Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ))),
                                productCategory: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemProductCategory>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemProductCategory(
                                    id: "education",
                                    name: "Education"
                                )))
                            )
                        ],
                        window: PlatformTrendsReportsResponseDataReportsItemWindow(
                            asOf: .null,
                            from: Nullable<String>.value("2026-09-23T04:00:00Z"),
                            key: "prev:7d",
                            kind: PlatformTrendsReportsResponseDataReportsItemWindowKind.range,
                            timeZone: "Etc/UTC",
                            to: Nullable<String>.value("2026-09-30T04:00:00Z")
                        )
                    )
                ]
            ),
            pageInfo: PlatformTrendsReportsResponsePageInfo(
                endCursor: Nullable<String>.value("MQ"),
                hasNextPage: true,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("MQ")
            )
        )
        let response = try await client.stats.reports.platformTrends(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func platformTrends2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "breakdown_by": "breakdown_by",
                    "columns": [
                      {
                        "aggregate": "sum",
                        "key": "key",
                        "name": "name",
                        "type": "property",
                        "unit": "money",
                        "weight": "weight"
                      },
                      {
                        "aggregate": "sum",
                        "key": "key",
                        "name": "name",
                        "type": "property",
                        "unit": "money",
                        "weight": "weight"
                      }
                    ],
                    "data_as_of": "data_as_of",
                    "report": "report",
                    "reports": [
                      {
                        "rows": [
                          {
                            "account_country": {
                              "id": "id",
                              "name": "name"
                            },
                            "aov": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "avg_business_age": 1.1,
                            "avg_customer_age": 1.1,
                            "avg_owner_age": 1.1,
                            "business_type": {
                              "id": "id",
                              "name": "name"
                            },
                            "businesses": 1,
                            "customer_country": {
                              "id": "id",
                              "name": "name"
                            },
                            "customers": 1,
                            "gross_revenue": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "industry_type": {
                              "id": "id",
                              "name": "name"
                            },
                            "median_gross_revenue": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "new_businesses": 1,
                            "new_customers": 1,
                            "payments": 1,
                            "product_category": {
                              "id": "id",
                              "name": "name"
                            },
                            "products": 1,
                            "repeat_rate": 1.1
                          },
                          {
                            "account_country": {
                              "id": "id",
                              "name": "name"
                            },
                            "aov": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "avg_business_age": 1.1,
                            "avg_customer_age": 1.1,
                            "avg_owner_age": 1.1,
                            "business_type": {
                              "id": "id",
                              "name": "name"
                            },
                            "businesses": 1,
                            "customer_country": {
                              "id": "id",
                              "name": "name"
                            },
                            "customers": 1,
                            "gross_revenue": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "industry_type": {
                              "id": "id",
                              "name": "name"
                            },
                            "median_gross_revenue": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "new_businesses": 1,
                            "new_customers": 1,
                            "payments": 1,
                            "product_category": {
                              "id": "id",
                              "name": "name"
                            },
                            "products": 1,
                            "repeat_rate": 1.1
                          }
                        ],
                        "window": {
                          "as_of": "as_of",
                          "from": "from",
                          "key": "key",
                          "kind": "range",
                          "time_zone": "time_zone",
                          "to": "to"
                        }
                      },
                      {
                        "rows": [
                          {
                            "account_country": {
                              "id": "id",
                              "name": "name"
                            },
                            "aov": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "avg_business_age": 1.1,
                            "avg_customer_age": 1.1,
                            "avg_owner_age": 1.1,
                            "business_type": {
                              "id": "id",
                              "name": "name"
                            },
                            "businesses": 1,
                            "customer_country": {
                              "id": "id",
                              "name": "name"
                            },
                            "customers": 1,
                            "gross_revenue": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "industry_type": {
                              "id": "id",
                              "name": "name"
                            },
                            "median_gross_revenue": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "new_businesses": 1,
                            "new_customers": 1,
                            "payments": 1,
                            "product_category": {
                              "id": "id",
                              "name": "name"
                            },
                            "products": 1,
                            "repeat_rate": 1.1
                          },
                          {
                            "account_country": {
                              "id": "id",
                              "name": "name"
                            },
                            "aov": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "avg_business_age": 1.1,
                            "avg_customer_age": 1.1,
                            "avg_owner_age": 1.1,
                            "business_type": {
                              "id": "id",
                              "name": "name"
                            },
                            "businesses": 1,
                            "customer_country": {
                              "id": "id",
                              "name": "name"
                            },
                            "customers": 1,
                            "gross_revenue": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "industry_type": {
                              "id": "id",
                              "name": "name"
                            },
                            "median_gross_revenue": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "new_businesses": 1,
                            "new_customers": 1,
                            "payments": 1,
                            "product_category": {
                              "id": "id",
                              "name": "name"
                            },
                            "products": 1,
                            "repeat_rate": 1.1
                          }
                        ],
                        "window": {
                          "as_of": "as_of",
                          "from": "from",
                          "key": "key",
                          "kind": "range",
                          "time_zone": "time_zone",
                          "to": "to"
                        }
                      }
                    ]
                  },
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
        let expectedResponse = PlatformTrendsReportsResponse(
            data: PlatformTrendsReportsResponseData(
                breakdownBy: Nullable<String>.value("breakdown_by"),
                columns: [
                    PlatformTrendsReportsResponseDataColumnsItem(
                        aggregate: Optional(PlatformTrendsReportsResponseDataColumnsItemAggregate.sum),
                        key: "key",
                        name: "name",
                        type: PlatformTrendsReportsResponseDataColumnsItemType.property,
                        unit: Optional(PlatformTrendsReportsResponseDataColumnsItemUnit.money),
                        weight: Optional(Nullable<String>.value("weight"))
                    ),
                    PlatformTrendsReportsResponseDataColumnsItem(
                        aggregate: Optional(PlatformTrendsReportsResponseDataColumnsItemAggregate.sum),
                        key: "key",
                        name: "name",
                        type: PlatformTrendsReportsResponseDataColumnsItemType.property,
                        unit: Optional(PlatformTrendsReportsResponseDataColumnsItemUnit.money),
                        weight: Optional(Nullable<String>.value("weight"))
                    )
                ],
                dataAsOf: "data_as_of",
                report: "report",
                reports: [
                    PlatformTrendsReportsResponseDataReportsItem(
                        rows: [
                            PlatformTrendsReportsResponseDataReportsItemRowsItem(
                                accountCountry: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemAccountCountry>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemAccountCountry(
                                    id: "id",
                                    name: "name"
                                ))),
                                aov: Optional(Nullable<Money>.value(Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ))),
                                avgBusinessAge: Optional(Nullable<Double>.value(1.1)),
                                avgCustomerAge: Optional(Nullable<Double>.value(1.1)),
                                avgOwnerAge: Optional(Nullable<Double>.value(1.1)),
                                businessType: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemBusinessType>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemBusinessType(
                                    id: "id",
                                    name: "name"
                                ))),
                                businesses: Optional(Nullable<Int>.value(1)),
                                customerCountry: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemCustomerCountry>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemCustomerCountry(
                                    id: "id",
                                    name: "name"
                                ))),
                                customers: Optional(Nullable<Int>.value(1)),
                                grossRevenue: Optional(Nullable<Money>.value(Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ))),
                                industryType: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemIndustryType>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemIndustryType(
                                    id: "id",
                                    name: "name"
                                ))),
                                medianGrossRevenue: Optional(Nullable<Money>.value(Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ))),
                                newBusinesses: Optional(Nullable<Int>.value(1)),
                                newCustomers: Optional(Nullable<Int>.value(1)),
                                payments: Optional(Nullable<Int>.value(1)),
                                productCategory: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemProductCategory>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemProductCategory(
                                    id: "id",
                                    name: "name"
                                ))),
                                products: Optional(Nullable<Int>.value(1)),
                                repeatRate: Optional(Nullable<Double>.value(1.1))
                            ),
                            PlatformTrendsReportsResponseDataReportsItemRowsItem(
                                accountCountry: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemAccountCountry>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemAccountCountry(
                                    id: "id",
                                    name: "name"
                                ))),
                                aov: Optional(Nullable<Money>.value(Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ))),
                                avgBusinessAge: Optional(Nullable<Double>.value(1.1)),
                                avgCustomerAge: Optional(Nullable<Double>.value(1.1)),
                                avgOwnerAge: Optional(Nullable<Double>.value(1.1)),
                                businessType: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemBusinessType>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemBusinessType(
                                    id: "id",
                                    name: "name"
                                ))),
                                businesses: Optional(Nullable<Int>.value(1)),
                                customerCountry: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemCustomerCountry>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemCustomerCountry(
                                    id: "id",
                                    name: "name"
                                ))),
                                customers: Optional(Nullable<Int>.value(1)),
                                grossRevenue: Optional(Nullable<Money>.value(Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ))),
                                industryType: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemIndustryType>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemIndustryType(
                                    id: "id",
                                    name: "name"
                                ))),
                                medianGrossRevenue: Optional(Nullable<Money>.value(Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ))),
                                newBusinesses: Optional(Nullable<Int>.value(1)),
                                newCustomers: Optional(Nullable<Int>.value(1)),
                                payments: Optional(Nullable<Int>.value(1)),
                                productCategory: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemProductCategory>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemProductCategory(
                                    id: "id",
                                    name: "name"
                                ))),
                                products: Optional(Nullable<Int>.value(1)),
                                repeatRate: Optional(Nullable<Double>.value(1.1))
                            )
                        ],
                        window: PlatformTrendsReportsResponseDataReportsItemWindow(
                            asOf: Nullable<String>.value("as_of"),
                            from: Nullable<String>.value("from"),
                            key: "key",
                            kind: PlatformTrendsReportsResponseDataReportsItemWindowKind.range,
                            timeZone: "time_zone",
                            to: Nullable<String>.value("to")
                        )
                    ),
                    PlatformTrendsReportsResponseDataReportsItem(
                        rows: [
                            PlatformTrendsReportsResponseDataReportsItemRowsItem(
                                accountCountry: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemAccountCountry>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemAccountCountry(
                                    id: "id",
                                    name: "name"
                                ))),
                                aov: Optional(Nullable<Money>.value(Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ))),
                                avgBusinessAge: Optional(Nullable<Double>.value(1.1)),
                                avgCustomerAge: Optional(Nullable<Double>.value(1.1)),
                                avgOwnerAge: Optional(Nullable<Double>.value(1.1)),
                                businessType: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemBusinessType>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemBusinessType(
                                    id: "id",
                                    name: "name"
                                ))),
                                businesses: Optional(Nullable<Int>.value(1)),
                                customerCountry: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemCustomerCountry>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemCustomerCountry(
                                    id: "id",
                                    name: "name"
                                ))),
                                customers: Optional(Nullable<Int>.value(1)),
                                grossRevenue: Optional(Nullable<Money>.value(Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ))),
                                industryType: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemIndustryType>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemIndustryType(
                                    id: "id",
                                    name: "name"
                                ))),
                                medianGrossRevenue: Optional(Nullable<Money>.value(Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ))),
                                newBusinesses: Optional(Nullable<Int>.value(1)),
                                newCustomers: Optional(Nullable<Int>.value(1)),
                                payments: Optional(Nullable<Int>.value(1)),
                                productCategory: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemProductCategory>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemProductCategory(
                                    id: "id",
                                    name: "name"
                                ))),
                                products: Optional(Nullable<Int>.value(1)),
                                repeatRate: Optional(Nullable<Double>.value(1.1))
                            ),
                            PlatformTrendsReportsResponseDataReportsItemRowsItem(
                                accountCountry: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemAccountCountry>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemAccountCountry(
                                    id: "id",
                                    name: "name"
                                ))),
                                aov: Optional(Nullable<Money>.value(Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ))),
                                avgBusinessAge: Optional(Nullable<Double>.value(1.1)),
                                avgCustomerAge: Optional(Nullable<Double>.value(1.1)),
                                avgOwnerAge: Optional(Nullable<Double>.value(1.1)),
                                businessType: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemBusinessType>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemBusinessType(
                                    id: "id",
                                    name: "name"
                                ))),
                                businesses: Optional(Nullable<Int>.value(1)),
                                customerCountry: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemCustomerCountry>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemCustomerCountry(
                                    id: "id",
                                    name: "name"
                                ))),
                                customers: Optional(Nullable<Int>.value(1)),
                                grossRevenue: Optional(Nullable<Money>.value(Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ))),
                                industryType: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemIndustryType>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemIndustryType(
                                    id: "id",
                                    name: "name"
                                ))),
                                medianGrossRevenue: Optional(Nullable<Money>.value(Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                ))),
                                newBusinesses: Optional(Nullable<Int>.value(1)),
                                newCustomers: Optional(Nullable<Int>.value(1)),
                                payments: Optional(Nullable<Int>.value(1)),
                                productCategory: Optional(Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemProductCategory>.value(PlatformTrendsReportsResponseDataReportsItemRowsItemProductCategory(
                                    id: "id",
                                    name: "name"
                                ))),
                                products: Optional(Nullable<Int>.value(1)),
                                repeatRate: Optional(Nullable<Double>.value(1.1))
                            )
                        ],
                        window: PlatformTrendsReportsResponseDataReportsItemWindow(
                            asOf: Nullable<String>.value("as_of"),
                            from: Nullable<String>.value("from"),
                            key: "key",
                            kind: PlatformTrendsReportsResponseDataReportsItemWindowKind.range,
                            timeZone: "time_zone",
                            to: Nullable<String>.value("to")
                        )
                    )
                ]
            ),
            pageInfo: PlatformTrendsReportsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.stats.reports.platformTrends(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }
}