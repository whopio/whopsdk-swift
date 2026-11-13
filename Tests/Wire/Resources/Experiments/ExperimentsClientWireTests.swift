import Foundation
import Testing
import WhopSDK

@Suite("ExperimentsClient Wire Tests") struct ExperimentsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "assignment_seed": "checkout_redesign_v21768435200",
                      "bucket_by": "user",
                      "configuration_revision": 1,
                      "control": {},
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "created_by": "user_xxxxxxxxxxxxxx",
                      "ended_at": "2026-01-01T12:00:00.000Z",
                      "feature_flag_only": false,
                      "findings": "Treatment lifted conversion 8%",
                      "flag_key": "checkout_redesign_v2",
                      "hypothesis": "Users will convert more",
                      "id": "expt_xxxxxxxxxxxxxx",
                      "metadata": {
                        "key": "value"
                      },
                      "name": "Checkout Redesign V2",
                      "related_resource": {
                        "id": "id",
                        "object": "app"
                      },
                      "started_at": "2026-01-01T12:00:00.000Z",
                      "status": "draft",
                      "targeting_rules": [
                        {
                          "conditions": []
                        }
                      ],
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "variants": [
                        {
                          "name": "treatment",
                          "weight": 50
                        }
                      ],
                      "winning_arm": "treatment"
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
        let expectedResponse = ListExperimentsResponse(
            data: [
                Experiment(
                    accountId: "biz_xxxxxxxxxxxxxx",
                    assignmentSeed: "checkout_redesign_v21768435200",
                    bucketBy: Optional(Nullable<ExperimentBucketBy>.value(ExperimentBucketBy.user)),
                    configurationRevision: 1,
                    control: ExperimentControl(

                    ),
                    createdAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
                    createdBy: Optional(Nullable<String>.value("user_xxxxxxxxxxxxxx")),
                    endedAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
                    featureFlagOnly: Optional(Nullable<Bool>.value(false)),
                    findings: Optional(Nullable<String>.value("Treatment lifted conversion 8%")),
                    flagKey: "checkout_redesign_v2",
                    hypothesis: Optional(Nullable<String>.value("Users will convert more")),
                    id: "expt_xxxxxxxxxxxxxx",
                    metadata: Optional([
                        "key": "value"
                    ]),
                    name: "Checkout Redesign V2",
                    relatedResource: ExperimentResourceReference(
                        id: "id",
                        object: ExperimentResourceReferenceObject.app
                    ),
                    startedAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
                    status: ExperimentStatus.draft,
                    targetingRules: [
                        ExperimentTargetingRulesItem(
                            conditions: []
                        )
                    ],
                    updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    variants: [
                        ExperimentVariantsItem(
                            name: "treatment",
                            weight: 50
                        )
                    ],
                    winningArm: Optional(Nullable<String>.value("treatment"))
                )
            ],
            pageInfo: ListExperimentsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.experiments.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "assignment_seed": "checkout_redesign_v21768435200",
                  "bucket_by": "user",
                  "configuration_revision": 1,
                  "control": {
                    "related_resource": {
                      "id": "id",
                      "object": "app"
                    }
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "created_by": "user_xxxxxxxxxxxxxx",
                  "ended_at": "2026-01-01T12:00:00.000Z",
                  "feature_flag_only": false,
                  "findings": "Treatment lifted conversion 8%",
                  "flag_key": "checkout_redesign_v2",
                  "hypothesis": "Users will convert more",
                  "id": "expt_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "name": "Checkout Redesign V2",
                  "related_resource": {
                    "id": "id",
                    "object": "app"
                  },
                  "started_at": "2026-01-01T12:00:00.000Z",
                  "status": "draft",
                  "targeting_rules": [
                    {
                      "conditions": [],
                      "pass_percentage": 1.1,
                      "type": "include"
                    }
                  ],
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variants": [
                    {
                      "name": "treatment",
                      "ranges": [
                        [
                          0,
                          50
                        ]
                      ],
                      "related_resource": {
                        "id": "id",
                        "object": "app"
                      },
                      "weight": 50
                    }
                  ],
                  "winning_arm": "treatment"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experiment(
            accountId: "biz_xxxxxxxxxxxxxx",
            assignmentSeed: "checkout_redesign_v21768435200",
            bucketBy: Optional(Nullable<ExperimentBucketBy>.value(ExperimentBucketBy.user)),
            configurationRevision: 1,
            control: ExperimentControl(
                relatedResource: Optional(ExperimentResourceReference(
                    id: "id",
                    object: ExperimentResourceReferenceObject.app
                ))
            ),
            createdAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            createdBy: Optional(Nullable<String>.value("user_xxxxxxxxxxxxxx")),
            endedAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            featureFlagOnly: Optional(Nullable<Bool>.value(false)),
            findings: Optional(Nullable<String>.value("Treatment lifted conversion 8%")),
            flagKey: "checkout_redesign_v2",
            hypothesis: Optional(Nullable<String>.value("Users will convert more")),
            id: "expt_xxxxxxxxxxxxxx",
            metadata: Optional([
                "key": "value"
            ]),
            name: "Checkout Redesign V2",
            relatedResource: ExperimentResourceReference(
                id: "id",
                object: ExperimentResourceReferenceObject.app
            ),
            startedAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            status: ExperimentStatus.draft,
            targetingRules: [
                ExperimentTargetingRulesItem(
                    conditions: [],
                    passPercentage: Optional(1.1),
                    type: Optional(ExperimentTargetingRulesItemType.include)
                )
            ],
            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            variants: [
                ExperimentVariantsItem(
                    name: "treatment",
                    ranges: Optional([
                        [
                            0,
                            50
                        ]
                    ]),
                    relatedResource: Optional(ExperimentResourceReference(
                        id: "id",
                        object: ExperimentResourceReferenceObject.app
                    )),
                    weight: 50
                )
            ],
            winningArm: Optional(Nullable<String>.value("treatment"))
        )
        let response = try await client.experiments.create(
            request: .init(
                accountId: "biz_xxxxxxxxxxxxxx",
                flagKey: "checkout_redesign_v2"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func exposures1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "configuration_revision": 1,
                  "enabled": true,
                  "experiment_id": "experiment_id",
                  "flag_key": "checkout_redesign",
                  "related_resource": {
                    "id": "id",
                    "object": "app"
                  },
                  "variant": "treatment"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ExposuresExperimentsResponse.experimentExposure(
            ExperimentExposure(
                configurationRevision: Optional(1),
                enabled: true,
                experimentId: Optional("experiment_id"),
                flagKey: Optional("checkout_redesign"),
                relatedResource: Optional(ExperimentResourceReference(
                    id: "id",
                    object: ExperimentResourceReferenceObject.app
                )),
                variant: Nullable<String>.value("treatment")
            )
        )
        let response = try await client.experiments.exposures(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "assignment_seed": "checkout_redesign_v21768435200",
                  "bucket_by": "user",
                  "configuration_revision": 1,
                  "control": {
                    "related_resource": {
                      "id": "id",
                      "object": "app"
                    }
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "created_by": "user_xxxxxxxxxxxxxx",
                  "ended_at": "2026-01-01T12:00:00.000Z",
                  "feature_flag_only": false,
                  "findings": "Treatment lifted conversion 8%",
                  "flag_key": "checkout_redesign_v2",
                  "hypothesis": "Users will convert more",
                  "id": "expt_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "name": "Checkout Redesign V2",
                  "related_resource": {
                    "id": "id",
                    "object": "app"
                  },
                  "started_at": "2026-01-01T12:00:00.000Z",
                  "status": "draft",
                  "targeting_rules": [
                    {
                      "conditions": [],
                      "pass_percentage": 1.1,
                      "type": "include"
                    }
                  ],
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variants": [
                    {
                      "name": "treatment",
                      "ranges": [
                        [
                          0,
                          50
                        ]
                      ],
                      "related_resource": {
                        "id": "id",
                        "object": "app"
                      },
                      "weight": 50
                    }
                  ],
                  "winning_arm": "treatment"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experiment(
            accountId: "biz_xxxxxxxxxxxxxx",
            assignmentSeed: "checkout_redesign_v21768435200",
            bucketBy: Optional(Nullable<ExperimentBucketBy>.value(ExperimentBucketBy.user)),
            configurationRevision: 1,
            control: ExperimentControl(
                relatedResource: Optional(ExperimentResourceReference(
                    id: "id",
                    object: ExperimentResourceReferenceObject.app
                ))
            ),
            createdAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            createdBy: Optional(Nullable<String>.value("user_xxxxxxxxxxxxxx")),
            endedAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            featureFlagOnly: Optional(Nullable<Bool>.value(false)),
            findings: Optional(Nullable<String>.value("Treatment lifted conversion 8%")),
            flagKey: "checkout_redesign_v2",
            hypothesis: Optional(Nullable<String>.value("Users will convert more")),
            id: "expt_xxxxxxxxxxxxxx",
            metadata: Optional([
                "key": "value"
            ]),
            name: "Checkout Redesign V2",
            relatedResource: ExperimentResourceReference(
                id: "id",
                object: ExperimentResourceReferenceObject.app
            ),
            startedAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            status: ExperimentStatus.draft,
            targetingRules: [
                ExperimentTargetingRulesItem(
                    conditions: [],
                    passPercentage: Optional(1.1),
                    type: Optional(ExperimentTargetingRulesItemType.include)
                )
            ],
            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            variants: [
                ExperimentVariantsItem(
                    name: "treatment",
                    ranges: Optional([
                        [
                            0,
                            50
                        ]
                    ]),
                    relatedResource: Optional(ExperimentResourceReference(
                        id: "id",
                        object: ExperimentResourceReferenceObject.app
                    )),
                    weight: 50
                )
            ],
            winningArm: Optional(Nullable<String>.value("treatment"))
        )
        let response = try await client.experiments.retrieve(
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "assignment_seed": "checkout_redesign_v21768435200",
                  "bucket_by": "user",
                  "configuration_revision": 1,
                  "control": {
                    "related_resource": {
                      "id": "id",
                      "object": "app"
                    }
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "created_by": "user_xxxxxxxxxxxxxx",
                  "ended_at": "2026-01-01T12:00:00.000Z",
                  "feature_flag_only": false,
                  "findings": "Treatment lifted conversion 8%",
                  "flag_key": "checkout_redesign_v2",
                  "hypothesis": "Users will convert more",
                  "id": "expt_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "name": "Checkout Redesign V2",
                  "related_resource": {
                    "id": "id",
                    "object": "app"
                  },
                  "started_at": "2026-01-01T12:00:00.000Z",
                  "status": "draft",
                  "targeting_rules": [
                    {
                      "conditions": [],
                      "pass_percentage": 1.1,
                      "type": "include"
                    }
                  ],
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variants": [
                    {
                      "name": "treatment",
                      "ranges": [
                        [
                          0,
                          50
                        ]
                      ],
                      "related_resource": {
                        "id": "id",
                        "object": "app"
                      },
                      "weight": 50
                    }
                  ],
                  "winning_arm": "treatment"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experiment(
            accountId: "biz_xxxxxxxxxxxxxx",
            assignmentSeed: "checkout_redesign_v21768435200",
            bucketBy: Optional(Nullable<ExperimentBucketBy>.value(ExperimentBucketBy.user)),
            configurationRevision: 1,
            control: ExperimentControl(
                relatedResource: Optional(ExperimentResourceReference(
                    id: "id",
                    object: ExperimentResourceReferenceObject.app
                ))
            ),
            createdAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            createdBy: Optional(Nullable<String>.value("user_xxxxxxxxxxxxxx")),
            endedAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            featureFlagOnly: Optional(Nullable<Bool>.value(false)),
            findings: Optional(Nullable<String>.value("Treatment lifted conversion 8%")),
            flagKey: "checkout_redesign_v2",
            hypothesis: Optional(Nullable<String>.value("Users will convert more")),
            id: "expt_xxxxxxxxxxxxxx",
            metadata: Optional([
                "key": "value"
            ]),
            name: "Checkout Redesign V2",
            relatedResource: ExperimentResourceReference(
                id: "id",
                object: ExperimentResourceReferenceObject.app
            ),
            startedAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            status: ExperimentStatus.draft,
            targetingRules: [
                ExperimentTargetingRulesItem(
                    conditions: [],
                    passPercentage: Optional(1.1),
                    type: Optional(ExperimentTargetingRulesItemType.include)
                )
            ],
            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            variants: [
                ExperimentVariantsItem(
                    name: "treatment",
                    ranges: Optional([
                        [
                            0,
                            50
                        ]
                    ]),
                    relatedResource: Optional(ExperimentResourceReference(
                        id: "id",
                        object: ExperimentResourceReferenceObject.app
                    )),
                    weight: 50
                )
            ],
            winningArm: Optional(Nullable<String>.value("treatment"))
        )
        let response = try await client.experiments.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func activate1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "assignment_seed": "checkout_redesign_v21768435200",
                  "bucket_by": "user",
                  "configuration_revision": 1,
                  "control": {
                    "related_resource": {
                      "id": "id",
                      "object": "app"
                    }
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "created_by": "user_xxxxxxxxxxxxxx",
                  "ended_at": "2026-01-01T12:00:00.000Z",
                  "feature_flag_only": false,
                  "findings": "Treatment lifted conversion 8%",
                  "flag_key": "checkout_redesign_v2",
                  "hypothesis": "Users will convert more",
                  "id": "expt_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "name": "Checkout Redesign V2",
                  "related_resource": {
                    "id": "id",
                    "object": "app"
                  },
                  "started_at": "2026-01-01T12:00:00.000Z",
                  "status": "draft",
                  "targeting_rules": [
                    {
                      "conditions": [],
                      "pass_percentage": 1.1,
                      "type": "include"
                    }
                  ],
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variants": [
                    {
                      "name": "treatment",
                      "ranges": [
                        [
                          0,
                          50
                        ]
                      ],
                      "related_resource": {
                        "id": "id",
                        "object": "app"
                      },
                      "weight": 50
                    }
                  ],
                  "winning_arm": "treatment"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experiment(
            accountId: "biz_xxxxxxxxxxxxxx",
            assignmentSeed: "checkout_redesign_v21768435200",
            bucketBy: Optional(Nullable<ExperimentBucketBy>.value(ExperimentBucketBy.user)),
            configurationRevision: 1,
            control: ExperimentControl(
                relatedResource: Optional(ExperimentResourceReference(
                    id: "id",
                    object: ExperimentResourceReferenceObject.app
                ))
            ),
            createdAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            createdBy: Optional(Nullable<String>.value("user_xxxxxxxxxxxxxx")),
            endedAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            featureFlagOnly: Optional(Nullable<Bool>.value(false)),
            findings: Optional(Nullable<String>.value("Treatment lifted conversion 8%")),
            flagKey: "checkout_redesign_v2",
            hypothesis: Optional(Nullable<String>.value("Users will convert more")),
            id: "expt_xxxxxxxxxxxxxx",
            metadata: Optional([
                "key": "value"
            ]),
            name: "Checkout Redesign V2",
            relatedResource: ExperimentResourceReference(
                id: "id",
                object: ExperimentResourceReferenceObject.app
            ),
            startedAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            status: ExperimentStatus.draft,
            targetingRules: [
                ExperimentTargetingRulesItem(
                    conditions: [],
                    passPercentage: Optional(1.1),
                    type: Optional(ExperimentTargetingRulesItemType.include)
                )
            ],
            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            variants: [
                ExperimentVariantsItem(
                    name: "treatment",
                    ranges: Optional([
                        [
                            0,
                            50
                        ]
                    ]),
                    relatedResource: Optional(ExperimentResourceReference(
                        id: "id",
                        object: ExperimentResourceReferenceObject.app
                    )),
                    weight: 50
                )
            ],
            winningArm: Optional(Nullable<String>.value("treatment"))
        )
        let response = try await client.experiments.activate(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func end1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "assignment_seed": "checkout_redesign_v21768435200",
                  "bucket_by": "user",
                  "configuration_revision": 1,
                  "control": {
                    "related_resource": {
                      "id": "id",
                      "object": "app"
                    }
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "created_by": "user_xxxxxxxxxxxxxx",
                  "ended_at": "2026-01-01T12:00:00.000Z",
                  "feature_flag_only": false,
                  "findings": "Treatment lifted conversion 8%",
                  "flag_key": "checkout_redesign_v2",
                  "hypothesis": "Users will convert more",
                  "id": "expt_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "name": "Checkout Redesign V2",
                  "related_resource": {
                    "id": "id",
                    "object": "app"
                  },
                  "started_at": "2026-01-01T12:00:00.000Z",
                  "status": "draft",
                  "targeting_rules": [
                    {
                      "conditions": [],
                      "pass_percentage": 1.1,
                      "type": "include"
                    }
                  ],
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variants": [
                    {
                      "name": "treatment",
                      "ranges": [
                        [
                          0,
                          50
                        ]
                      ],
                      "related_resource": {
                        "id": "id",
                        "object": "app"
                      },
                      "weight": 50
                    }
                  ],
                  "winning_arm": "treatment"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experiment(
            accountId: "biz_xxxxxxxxxxxxxx",
            assignmentSeed: "checkout_redesign_v21768435200",
            bucketBy: Optional(Nullable<ExperimentBucketBy>.value(ExperimentBucketBy.user)),
            configurationRevision: 1,
            control: ExperimentControl(
                relatedResource: Optional(ExperimentResourceReference(
                    id: "id",
                    object: ExperimentResourceReferenceObject.app
                ))
            ),
            createdAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            createdBy: Optional(Nullable<String>.value("user_xxxxxxxxxxxxxx")),
            endedAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            featureFlagOnly: Optional(Nullable<Bool>.value(false)),
            findings: Optional(Nullable<String>.value("Treatment lifted conversion 8%")),
            flagKey: "checkout_redesign_v2",
            hypothesis: Optional(Nullable<String>.value("Users will convert more")),
            id: "expt_xxxxxxxxxxxxxx",
            metadata: Optional([
                "key": "value"
            ]),
            name: "Checkout Redesign V2",
            relatedResource: ExperimentResourceReference(
                id: "id",
                object: ExperimentResourceReferenceObject.app
            ),
            startedAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            status: ExperimentStatus.draft,
            targetingRules: [
                ExperimentTargetingRulesItem(
                    conditions: [],
                    passPercentage: Optional(1.1),
                    type: Optional(ExperimentTargetingRulesItemType.include)
                )
            ],
            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            variants: [
                ExperimentVariantsItem(
                    name: "treatment",
                    ranges: Optional([
                        [
                            0,
                            50
                        ]
                    ]),
                    relatedResource: Optional(ExperimentResourceReference(
                        id: "id",
                        object: ExperimentResourceReferenceObject.app
                    )),
                    weight: 50
                )
            ],
            winningArm: Optional(Nullable<String>.value("treatment"))
        )
        let response = try await client.experiments.end(
            id: "id",
            request: .init(findings: "Treatment lifted signups 12%, shipping it to everyone."),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func pause1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "assignment_seed": "checkout_redesign_v21768435200",
                  "bucket_by": "user",
                  "configuration_revision": 1,
                  "control": {
                    "related_resource": {
                      "id": "id",
                      "object": "app"
                    }
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "created_by": "user_xxxxxxxxxxxxxx",
                  "ended_at": "2026-01-01T12:00:00.000Z",
                  "feature_flag_only": false,
                  "findings": "Treatment lifted conversion 8%",
                  "flag_key": "checkout_redesign_v2",
                  "hypothesis": "Users will convert more",
                  "id": "expt_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "name": "Checkout Redesign V2",
                  "related_resource": {
                    "id": "id",
                    "object": "app"
                  },
                  "started_at": "2026-01-01T12:00:00.000Z",
                  "status": "draft",
                  "targeting_rules": [
                    {
                      "conditions": [],
                      "pass_percentage": 1.1,
                      "type": "include"
                    }
                  ],
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variants": [
                    {
                      "name": "treatment",
                      "ranges": [
                        [
                          0,
                          50
                        ]
                      ],
                      "related_resource": {
                        "id": "id",
                        "object": "app"
                      },
                      "weight": 50
                    }
                  ],
                  "winning_arm": "treatment"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experiment(
            accountId: "biz_xxxxxxxxxxxxxx",
            assignmentSeed: "checkout_redesign_v21768435200",
            bucketBy: Optional(Nullable<ExperimentBucketBy>.value(ExperimentBucketBy.user)),
            configurationRevision: 1,
            control: ExperimentControl(
                relatedResource: Optional(ExperimentResourceReference(
                    id: "id",
                    object: ExperimentResourceReferenceObject.app
                ))
            ),
            createdAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            createdBy: Optional(Nullable<String>.value("user_xxxxxxxxxxxxxx")),
            endedAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            featureFlagOnly: Optional(Nullable<Bool>.value(false)),
            findings: Optional(Nullable<String>.value("Treatment lifted conversion 8%")),
            flagKey: "checkout_redesign_v2",
            hypothesis: Optional(Nullable<String>.value("Users will convert more")),
            id: "expt_xxxxxxxxxxxxxx",
            metadata: Optional([
                "key": "value"
            ]),
            name: "Checkout Redesign V2",
            relatedResource: ExperimentResourceReference(
                id: "id",
                object: ExperimentResourceReferenceObject.app
            ),
            startedAt: Optional(Nullable<String>.value("2026-01-01T12:00:00.000Z")),
            status: ExperimentStatus.draft,
            targetingRules: [
                ExperimentTargetingRulesItem(
                    conditions: [],
                    passPercentage: Optional(1.1),
                    type: Optional(ExperimentTargetingRulesItemType.include)
                )
            ],
            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            variants: [
                ExperimentVariantsItem(
                    name: "treatment",
                    ranges: Optional([
                        [
                            0,
                            50
                        ]
                    ]),
                    relatedResource: Optional(ExperimentResourceReference(
                        id: "id",
                        object: ExperimentResourceReferenceObject.app
                    )),
                    weight: 50
                )
            ],
            winningArm: Optional(Nullable<String>.value("treatment"))
        )
        let response = try await client.experiments.pause(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}