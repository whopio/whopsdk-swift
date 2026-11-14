import Foundation
import Testing
import WhopSDK

@Suite("AudiencesClient Wire Tests") struct AudiencesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "audience_type": "custom",
                      "auto_refresh": false,
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "error_message": "412 of 1,000 rows had no email or phone number, so the list could not be matched.",
                      "filters": {
                        "country": "US",
                        "last_seen_within_days": 30
                      },
                      "id": "adaud_xxxxxxxxxxxxxx",
                      "last_refreshed_at": "2026-01-01T12:00:00.000Z",
                      "lookalike_ratio": 0.04,
                      "lookalike_starting_ratio": 0.02,
                      "match_rates": [
                        {
                          "lower_bound": null,
                          "platform": "meta",
                          "status": null,
                          "upper_bound": null
                        }
                      ],
                      "matched_rows": 0,
                      "name": "Past purchasers Lookalike 2–4%",
                      "platform_audience_ids": [
                        "120246230799130687"
                      ],
                      "processed_rows": 0,
                      "progress_percent": 0,
                      "source_audience_id": "adaud_xxxxxxxxxxxxxx",
                      "source_type": "csv_upload",
                      "status": "pending",
                      "total_rows": 0,
                      "updated_at": "2026-01-01T12:00:00.000Z"
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
        let expectedResponse = ListAudiencesResponse(
            data: [
                Audience(
                    audienceType: AudienceAudienceType.custom,
                    autoRefresh: false,
                    createdAt: "2026-01-01T12:00:00.000Z",
                    errorMessage: Nullable<String>.value("412 of 1,000 rows had no email or phone number, so the list could not be matched."),
                    filters: Nullable<[String: JSONValue]>.value([
                        "country": JSONValue.string("US"), 
                        "last_seen_within_days": JSONValue.number(30)
                    ]),
                    id: "adaud_xxxxxxxxxxxxxx",
                    lastRefreshedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    lookalikeRatio: Nullable<Double>.value(0.04),
                    lookalikeStartingRatio: Nullable<Double>.value(0.02),
                    matchRates: [
                        AudienceMatchRate(
                            lowerBound: .null,
                            platform: AudienceMatchRatePlatform.meta,
                            status: .null,
                            upperBound: .null
                        )
                    ],
                    matchedRows: 0,
                    name: "Past purchasers Lookalike 2–4%",
                    platformAudienceIds: [
                        "120246230799130687"
                    ],
                    processedRows: 0,
                    progressPercent: 0,
                    sourceAudienceId: Nullable<String>.value("adaud_xxxxxxxxxxxxxx"),
                    sourceType: AudienceSourceType.csvUpload,
                    status: AudienceStatus.pending,
                    totalRows: 0,
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListAudiencesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.audiences.list(
            accountId: "account_id",
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
                      "audience_type": "custom",
                      "auto_refresh": true,
                      "created_at": "created_at",
                      "error_message": "error_message",
                      "filters": {
                        "filters": {
                          "key": "value"
                        }
                      },
                      "id": "id",
                      "last_refreshed_at": "last_refreshed_at",
                      "lookalike_ratio": 1.1,
                      "lookalike_starting_ratio": 1.1,
                      "match_rates": [
                        {
                          "lower_bound": 1.1,
                          "platform": "meta",
                          "status": "calculating",
                          "upper_bound": 1.1
                        },
                        {
                          "lower_bound": 1.1,
                          "platform": "meta",
                          "status": "calculating",
                          "upper_bound": 1.1
                        }
                      ],
                      "matched_rows": 1.1,
                      "name": "name",
                      "platform_audience_ids": [
                        "platform_audience_ids",
                        "platform_audience_ids"
                      ],
                      "processed_rows": 1.1,
                      "progress_percent": 1.1,
                      "source_audience_id": "source_audience_id",
                      "source_type": "csv_upload",
                      "status": "pending",
                      "total_rows": 1.1,
                      "updated_at": "updated_at"
                    },
                    {
                      "audience_type": "custom",
                      "auto_refresh": true,
                      "created_at": "created_at",
                      "error_message": "error_message",
                      "filters": {
                        "filters": {
                          "key": "value"
                        }
                      },
                      "id": "id",
                      "last_refreshed_at": "last_refreshed_at",
                      "lookalike_ratio": 1.1,
                      "lookalike_starting_ratio": 1.1,
                      "match_rates": [
                        {
                          "lower_bound": 1.1,
                          "platform": "meta",
                          "status": "calculating",
                          "upper_bound": 1.1
                        },
                        {
                          "lower_bound": 1.1,
                          "platform": "meta",
                          "status": "calculating",
                          "upper_bound": 1.1
                        }
                      ],
                      "matched_rows": 1.1,
                      "name": "name",
                      "platform_audience_ids": [
                        "platform_audience_ids",
                        "platform_audience_ids"
                      ],
                      "processed_rows": 1.1,
                      "progress_percent": 1.1,
                      "source_audience_id": "source_audience_id",
                      "source_type": "csv_upload",
                      "status": "pending",
                      "total_rows": 1.1,
                      "updated_at": "updated_at"
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
        let expectedResponse = ListAudiencesResponse(
            data: [
                Audience(
                    audienceType: AudienceAudienceType.custom,
                    autoRefresh: true,
                    createdAt: "created_at",
                    errorMessage: Nullable<String>.value("error_message"),
                    filters: Nullable<[String: JSONValue]>.value([
                        "filters": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    id: "id",
                    lastRefreshedAt: Nullable<String>.value("last_refreshed_at"),
                    lookalikeRatio: Nullable<Double>.value(1.1),
                    lookalikeStartingRatio: Nullable<Double>.value(1.1),
                    matchRates: [
                        AudienceMatchRate(
                            lowerBound: Nullable<Double>.value(1.1),
                            platform: AudienceMatchRatePlatform.meta,
                            status: Nullable<AudienceMatchRateStatus>.value(AudienceMatchRateStatus.calculating),
                            upperBound: Nullable<Double>.value(1.1)
                        ),
                        AudienceMatchRate(
                            lowerBound: Nullable<Double>.value(1.1),
                            platform: AudienceMatchRatePlatform.meta,
                            status: Nullable<AudienceMatchRateStatus>.value(AudienceMatchRateStatus.calculating),
                            upperBound: Nullable<Double>.value(1.1)
                        )
                    ],
                    matchedRows: 1.1,
                    name: "name",
                    platformAudienceIds: [
                        "platform_audience_ids",
                        "platform_audience_ids"
                    ],
                    processedRows: 1.1,
                    progressPercent: 1.1,
                    sourceAudienceId: Nullable<String>.value("source_audience_id"),
                    sourceType: AudienceSourceType.csvUpload,
                    status: AudienceStatus.pending,
                    totalRows: 1.1,
                    updatedAt: "updated_at"
                ),
                Audience(
                    audienceType: AudienceAudienceType.custom,
                    autoRefresh: true,
                    createdAt: "created_at",
                    errorMessage: Nullable<String>.value("error_message"),
                    filters: Nullable<[String: JSONValue]>.value([
                        "filters": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    id: "id",
                    lastRefreshedAt: Nullable<String>.value("last_refreshed_at"),
                    lookalikeRatio: Nullable<Double>.value(1.1),
                    lookalikeStartingRatio: Nullable<Double>.value(1.1),
                    matchRates: [
                        AudienceMatchRate(
                            lowerBound: Nullable<Double>.value(1.1),
                            platform: AudienceMatchRatePlatform.meta,
                            status: Nullable<AudienceMatchRateStatus>.value(AudienceMatchRateStatus.calculating),
                            upperBound: Nullable<Double>.value(1.1)
                        ),
                        AudienceMatchRate(
                            lowerBound: Nullable<Double>.value(1.1),
                            platform: AudienceMatchRatePlatform.meta,
                            status: Nullable<AudienceMatchRateStatus>.value(AudienceMatchRateStatus.calculating),
                            upperBound: Nullable<Double>.value(1.1)
                        )
                    ],
                    matchedRows: 1.1,
                    name: "name",
                    platformAudienceIds: [
                        "platform_audience_ids",
                        "platform_audience_ids"
                    ],
                    processedRows: 1.1,
                    progressPercent: 1.1,
                    sourceAudienceId: Nullable<String>.value("source_audience_id"),
                    sourceType: AudienceSourceType.csvUpload,
                    status: AudienceStatus.pending,
                    totalRows: 1.1,
                    updatedAt: "updated_at"
                )
            ],
            pageInfo: ListAudiencesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.audiences.list(
            accountId: "account_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "audience_type": "custom",
                  "auto_refresh": false,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "error_message": "412 of 1,000 rows had no email or phone number, so the list could not be matched.",
                  "filters": {
                    "country": "US",
                    "last_seen_within_days": 30
                  },
                  "id": "adaud_xxxxxxxxxxxxxx",
                  "last_refreshed_at": "2026-01-01T12:00:00.000Z",
                  "lookalike_ratio": 0.04,
                  "lookalike_starting_ratio": 0.02,
                  "match_rates": [
                    {
                      "lower_bound": 1.1,
                      "platform": "meta",
                      "status": "calculating",
                      "upper_bound": 1.1
                    }
                  ],
                  "matched_rows": 0,
                  "name": "Past purchasers Lookalike 2–4%",
                  "platform_audience_ids": [
                    "120246230799130687"
                  ],
                  "processed_rows": 0,
                  "progress_percent": 0,
                  "source_audience_id": "adaud_xxxxxxxxxxxxxx",
                  "source_type": "csv_upload",
                  "status": "pending",
                  "total_rows": 0,
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateAudiencesResponse.audience(
            Audience(
                audienceType: AudienceAudienceType.custom,
                autoRefresh: false,
                createdAt: "2026-01-01T12:00:00.000Z",
                errorMessage: Nullable<String>.value("412 of 1,000 rows had no email or phone number, so the list could not be matched."),
                filters: Nullable<[String: JSONValue]>.value([
                    "country": JSONValue.string("US"), 
                    "last_seen_within_days": JSONValue.number(30)
                ]),
                id: "adaud_xxxxxxxxxxxxxx",
                lastRefreshedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                lookalikeRatio: Nullable<Double>.value(0.04),
                lookalikeStartingRatio: Nullable<Double>.value(0.02),
                matchRates: [
                    AudienceMatchRate(
                        lowerBound: Nullable<Double>.value(1.1),
                        platform: AudienceMatchRatePlatform.meta,
                        status: Nullable<AudienceMatchRateStatus>.value(AudienceMatchRateStatus.calculating),
                        upperBound: Nullable<Double>.value(1.1)
                    )
                ],
                matchedRows: 0,
                name: "Past purchasers Lookalike 2–4%",
                platformAudienceIds: [
                    "120246230799130687"
                ],
                processedRows: 0,
                progressPercent: 0,
                sourceAudienceId: Nullable<String>.value("adaud_xxxxxxxxxxxxxx"),
                sourceType: AudienceSourceType.csvUpload,
                status: AudienceStatus.pending,
                totalRows: 0,
                updatedAt: "2026-01-01T12:00:00.000Z"
            )
        )
        let response = try await client.audiences.create(
            request: .init(accountId: "biz_xxxxxxxxxxxxxx"),
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
                  "audience_type": "custom",
                  "auto_refresh": true,
                  "created_at": "created_at",
                  "error_message": "error_message",
                  "filters": {
                    "filters": {
                      "key": "value"
                    }
                  },
                  "id": "id",
                  "last_refreshed_at": "last_refreshed_at",
                  "lookalike_ratio": 1.1,
                  "lookalike_starting_ratio": 1.1,
                  "match_rates": [
                    {
                      "lower_bound": 1.1,
                      "platform": "meta",
                      "status": "calculating",
                      "upper_bound": 1.1
                    },
                    {
                      "lower_bound": 1.1,
                      "platform": "meta",
                      "status": "calculating",
                      "upper_bound": 1.1
                    }
                  ],
                  "matched_rows": 1.1,
                  "name": "name",
                  "platform_audience_ids": [
                    "platform_audience_ids",
                    "platform_audience_ids"
                  ],
                  "processed_rows": 1.1,
                  "progress_percent": 1.1,
                  "source_audience_id": "source_audience_id",
                  "source_type": "csv_upload",
                  "status": "pending",
                  "total_rows": 1.1,
                  "updated_at": "updated_at"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateAudiencesResponse.audience(
            Audience(
                audienceType: AudienceAudienceType.custom,
                autoRefresh: true,
                createdAt: "created_at",
                errorMessage: Nullable<String>.value("error_message"),
                filters: Nullable<[String: JSONValue]>.value([
                    "filters": JSONValue.object(
                        [
                            "key": JSONValue.string("value")
                        ]
                    )
                ]),
                id: "id",
                lastRefreshedAt: Nullable<String>.value("last_refreshed_at"),
                lookalikeRatio: Nullable<Double>.value(1.1),
                lookalikeStartingRatio: Nullable<Double>.value(1.1),
                matchRates: [
                    AudienceMatchRate(
                        lowerBound: Nullable<Double>.value(1.1),
                        platform: AudienceMatchRatePlatform.meta,
                        status: Nullable<AudienceMatchRateStatus>.value(AudienceMatchRateStatus.calculating),
                        upperBound: Nullable<Double>.value(1.1)
                    ),
                    AudienceMatchRate(
                        lowerBound: Nullable<Double>.value(1.1),
                        platform: AudienceMatchRatePlatform.meta,
                        status: Nullable<AudienceMatchRateStatus>.value(AudienceMatchRateStatus.calculating),
                        upperBound: Nullable<Double>.value(1.1)
                    )
                ],
                matchedRows: 1.1,
                name: "name",
                platformAudienceIds: [
                    "platform_audience_ids",
                    "platform_audience_ids"
                ],
                processedRows: 1.1,
                progressPercent: 1.1,
                sourceAudienceId: Nullable<String>.value("source_audience_id"),
                sourceType: AudienceSourceType.csvUpload,
                status: AudienceStatus.pending,
                totalRows: 1.1,
                updatedAt: "updated_at"
            )
        )
        let response = try await client.audiences.create(
            request: .init(accountId: "account_id"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "success": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteAudiencesResponse(
            success: true
        )
        let response = try await client.audiences.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "success": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteAudiencesResponse(
            success: true
        )
        let response = try await client.audiences.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "audience_type": "custom",
                  "auto_refresh": false,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "error_message": "412 of 1,000 rows had no email or phone number, so the list could not be matched.",
                  "filters": {
                    "country": "US",
                    "last_seen_within_days": 30
                  },
                  "id": "adaud_xxxxxxxxxxxxxx",
                  "last_refreshed_at": "2026-01-01T12:00:00.000Z",
                  "lookalike_ratio": 0.04,
                  "lookalike_starting_ratio": 0.02,
                  "match_rates": [
                    {
                      "lower_bound": 1.1,
                      "platform": "meta",
                      "status": "calculating",
                      "upper_bound": 1.1
                    }
                  ],
                  "matched_rows": 0,
                  "name": "Past purchasers Lookalike 2–4%",
                  "platform_audience_ids": [
                    "120246230799130687"
                  ],
                  "processed_rows": 0,
                  "progress_percent": 0,
                  "source_audience_id": "adaud_xxxxxxxxxxxxxx",
                  "source_type": "csv_upload",
                  "status": "pending",
                  "total_rows": 0,
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Audience(
            audienceType: AudienceAudienceType.custom,
            autoRefresh: false,
            createdAt: "2026-01-01T12:00:00.000Z",
            errorMessage: Nullable<String>.value("412 of 1,000 rows had no email or phone number, so the list could not be matched."),
            filters: Nullable<[String: JSONValue]>.value([
                "country": JSONValue.string("US"), 
                "last_seen_within_days": JSONValue.number(30)
            ]),
            id: "adaud_xxxxxxxxxxxxxx",
            lastRefreshedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            lookalikeRatio: Nullable<Double>.value(0.04),
            lookalikeStartingRatio: Nullable<Double>.value(0.02),
            matchRates: [
                AudienceMatchRate(
                    lowerBound: Nullable<Double>.value(1.1),
                    platform: AudienceMatchRatePlatform.meta,
                    status: Nullable<AudienceMatchRateStatus>.value(AudienceMatchRateStatus.calculating),
                    upperBound: Nullable<Double>.value(1.1)
                )
            ],
            matchedRows: 0,
            name: "Past purchasers Lookalike 2–4%",
            platformAudienceIds: [
                "120246230799130687"
            ],
            processedRows: 0,
            progressPercent: 0,
            sourceAudienceId: Nullable<String>.value("adaud_xxxxxxxxxxxxxx"),
            sourceType: AudienceSourceType.csvUpload,
            status: AudienceStatus.pending,
            totalRows: 0,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.audiences.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "audience_type": "custom",
                  "auto_refresh": true,
                  "created_at": "created_at",
                  "error_message": "error_message",
                  "filters": {
                    "filters": {
                      "key": "value"
                    }
                  },
                  "id": "id",
                  "last_refreshed_at": "last_refreshed_at",
                  "lookalike_ratio": 1.1,
                  "lookalike_starting_ratio": 1.1,
                  "match_rates": [
                    {
                      "lower_bound": 1.1,
                      "platform": "meta",
                      "status": "calculating",
                      "upper_bound": 1.1
                    },
                    {
                      "lower_bound": 1.1,
                      "platform": "meta",
                      "status": "calculating",
                      "upper_bound": 1.1
                    }
                  ],
                  "matched_rows": 1.1,
                  "name": "name",
                  "platform_audience_ids": [
                    "platform_audience_ids",
                    "platform_audience_ids"
                  ],
                  "processed_rows": 1.1,
                  "progress_percent": 1.1,
                  "source_audience_id": "source_audience_id",
                  "source_type": "csv_upload",
                  "status": "pending",
                  "total_rows": 1.1,
                  "updated_at": "updated_at"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Audience(
            audienceType: AudienceAudienceType.custom,
            autoRefresh: true,
            createdAt: "created_at",
            errorMessage: Nullable<String>.value("error_message"),
            filters: Nullable<[String: JSONValue]>.value([
                "filters": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            id: "id",
            lastRefreshedAt: Nullable<String>.value("last_refreshed_at"),
            lookalikeRatio: Nullable<Double>.value(1.1),
            lookalikeStartingRatio: Nullable<Double>.value(1.1),
            matchRates: [
                AudienceMatchRate(
                    lowerBound: Nullable<Double>.value(1.1),
                    platform: AudienceMatchRatePlatform.meta,
                    status: Nullable<AudienceMatchRateStatus>.value(AudienceMatchRateStatus.calculating),
                    upperBound: Nullable<Double>.value(1.1)
                ),
                AudienceMatchRate(
                    lowerBound: Nullable<Double>.value(1.1),
                    platform: AudienceMatchRatePlatform.meta,
                    status: Nullable<AudienceMatchRateStatus>.value(AudienceMatchRateStatus.calculating),
                    upperBound: Nullable<Double>.value(1.1)
                )
            ],
            matchedRows: 1.1,
            name: "name",
            platformAudienceIds: [
                "platform_audience_ids",
                "platform_audience_ids"
            ],
            processedRows: 1.1,
            progressPercent: 1.1,
            sourceAudienceId: Nullable<String>.value("source_audience_id"),
            sourceType: AudienceSourceType.csvUpload,
            status: AudienceStatus.pending,
            totalRows: 1.1,
            updatedAt: "updated_at"
        )
        let response = try await client.audiences.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func addPeople1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "audience_type": "custom",
                  "auto_refresh": false,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "error_message": "412 of 1,000 rows had no email or phone number, so the list could not be matched.",
                  "filters": {
                    "country": "US",
                    "last_seen_within_days": 30
                  },
                  "id": "adaud_xxxxxxxxxxxxxx",
                  "last_refreshed_at": "2026-01-01T12:00:00.000Z",
                  "lookalike_ratio": 0.04,
                  "lookalike_starting_ratio": 0.02,
                  "match_rates": [
                    {
                      "lower_bound": 1.1,
                      "platform": "meta",
                      "status": "calculating",
                      "upper_bound": 1.1
                    }
                  ],
                  "matched_rows": 0,
                  "name": "Past purchasers Lookalike 2–4%",
                  "platform_audience_ids": [
                    "120246230799130687"
                  ],
                  "processed_rows": 0,
                  "progress_percent": 0,
                  "source_audience_id": "adaud_xxxxxxxxxxxxxx",
                  "source_type": "csv_upload",
                  "status": "pending",
                  "total_rows": 0,
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Audience(
            audienceType: AudienceAudienceType.custom,
            autoRefresh: false,
            createdAt: "2026-01-01T12:00:00.000Z",
            errorMessage: Nullable<String>.value("412 of 1,000 rows had no email or phone number, so the list could not be matched."),
            filters: Nullable<[String: JSONValue]>.value([
                "country": JSONValue.string("US"), 
                "last_seen_within_days": JSONValue.number(30)
            ]),
            id: "adaud_xxxxxxxxxxxxxx",
            lastRefreshedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            lookalikeRatio: Nullable<Double>.value(0.04),
            lookalikeStartingRatio: Nullable<Double>.value(0.02),
            matchRates: [
                AudienceMatchRate(
                    lowerBound: Nullable<Double>.value(1.1),
                    platform: AudienceMatchRatePlatform.meta,
                    status: Nullable<AudienceMatchRateStatus>.value(AudienceMatchRateStatus.calculating),
                    upperBound: Nullable<Double>.value(1.1)
                )
            ],
            matchedRows: 0,
            name: "Past purchasers Lookalike 2–4%",
            platformAudienceIds: [
                "120246230799130687"
            ],
            processedRows: 0,
            progressPercent: 0,
            sourceAudienceId: Nullable<String>.value("adaud_xxxxxxxxxxxxxx"),
            sourceType: AudienceSourceType.csvUpload,
            status: AudienceStatus.pending,
            totalRows: 0,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.audiences.addPeople(
            id: "id",
            request: .init(fileId: "file_xxxxxxxxxxxxxx"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func addPeople2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "audience_type": "custom",
                  "auto_refresh": true,
                  "created_at": "created_at",
                  "error_message": "error_message",
                  "filters": {
                    "filters": {
                      "key": "value"
                    }
                  },
                  "id": "id",
                  "last_refreshed_at": "last_refreshed_at",
                  "lookalike_ratio": 1.1,
                  "lookalike_starting_ratio": 1.1,
                  "match_rates": [
                    {
                      "lower_bound": 1.1,
                      "platform": "meta",
                      "status": "calculating",
                      "upper_bound": 1.1
                    },
                    {
                      "lower_bound": 1.1,
                      "platform": "meta",
                      "status": "calculating",
                      "upper_bound": 1.1
                    }
                  ],
                  "matched_rows": 1.1,
                  "name": "name",
                  "platform_audience_ids": [
                    "platform_audience_ids",
                    "platform_audience_ids"
                  ],
                  "processed_rows": 1.1,
                  "progress_percent": 1.1,
                  "source_audience_id": "source_audience_id",
                  "source_type": "csv_upload",
                  "status": "pending",
                  "total_rows": 1.1,
                  "updated_at": "updated_at"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Audience(
            audienceType: AudienceAudienceType.custom,
            autoRefresh: true,
            createdAt: "created_at",
            errorMessage: Nullable<String>.value("error_message"),
            filters: Nullable<[String: JSONValue]>.value([
                "filters": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            id: "id",
            lastRefreshedAt: Nullable<String>.value("last_refreshed_at"),
            lookalikeRatio: Nullable<Double>.value(1.1),
            lookalikeStartingRatio: Nullable<Double>.value(1.1),
            matchRates: [
                AudienceMatchRate(
                    lowerBound: Nullable<Double>.value(1.1),
                    platform: AudienceMatchRatePlatform.meta,
                    status: Nullable<AudienceMatchRateStatus>.value(AudienceMatchRateStatus.calculating),
                    upperBound: Nullable<Double>.value(1.1)
                ),
                AudienceMatchRate(
                    lowerBound: Nullable<Double>.value(1.1),
                    platform: AudienceMatchRatePlatform.meta,
                    status: Nullable<AudienceMatchRateStatus>.value(AudienceMatchRateStatus.calculating),
                    upperBound: Nullable<Double>.value(1.1)
                )
            ],
            matchedRows: 1.1,
            name: "name",
            platformAudienceIds: [
                "platform_audience_ids",
                "platform_audience_ids"
            ],
            processedRows: 1.1,
            progressPercent: 1.1,
            sourceAudienceId: Nullable<String>.value("source_audience_id"),
            sourceType: AudienceSourceType.csvUpload,
            status: AudienceStatus.pending,
            totalRows: 1.1,
            updatedAt: "updated_at"
        )
        let response = try await client.audiences.addPeople(
            id: "id",
            request: .init(fileId: "file_id"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}