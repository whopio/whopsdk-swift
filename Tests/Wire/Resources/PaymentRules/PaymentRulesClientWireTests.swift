import Foundation
import Testing
import WhopSDK

@Suite("PaymentRulesClient Wire Tests") struct PaymentRulesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "action": "allow",
                      "conditions": {
                        "all": [
                          {
                            "field": "risk_score",
                            "operator": "eq",
                            "value": 1.1
                          }
                        ]
                      },
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "deleted_at": "deleted_at",
                      "id": "prule_xxxxxxxxxxxxxx",
                      "metadata": {
                        "key": "value"
                      },
                      "name": "Block high risk",
                      "status": "active",
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
        let expectedResponse = ListPaymentRulesResponse(
            data: [
                PaymentRule(
                    accountId: "biz_xxxxxxxxxxxxxx",
                    action: PaymentRuleAction.allow,
                    conditions: PaymentRuleConditions(
                        all: [
                            PaymentRuleCondition(
                                field: PaymentRuleConditionField.riskScore,
                                operator: PaymentRuleConditionOperator.eq,
                                value: PaymentRuleConditionValue.double(
                                    1.1
                                )
                            )
                        ]
                    ),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    deletedAt: Nullable<String>.value("deleted_at"),
                    id: "prule_xxxxxxxxxxxxxx",
                    metadata: [
                        "key": JSONValue.string("value")
                    ],
                    name: "Block high risk",
                    status: PaymentRuleStatus.active,
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListPaymentRulesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.paymentRules.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "action": "allow",
                      "conditions": {
                        "all": [
                          {
                            "field": "risk_score",
                            "operator": "eq",
                            "value": 1.1
                          },
                          {
                            "field": "risk_score",
                            "operator": "eq",
                            "value": 1.1
                          }
                        ]
                      },
                      "created_at": "created_at",
                      "deleted_at": "deleted_at",
                      "id": "id",
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "name": "name",
                      "status": "active",
                      "updated_at": "updated_at"
                    },
                    {
                      "account_id": "account_id",
                      "action": "allow",
                      "conditions": {
                        "all": [
                          {
                            "field": "risk_score",
                            "operator": "eq",
                            "value": 1.1
                          },
                          {
                            "field": "risk_score",
                            "operator": "eq",
                            "value": 1.1
                          }
                        ]
                      },
                      "created_at": "created_at",
                      "deleted_at": "deleted_at",
                      "id": "id",
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "name": "name",
                      "status": "active",
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
        let expectedResponse = ListPaymentRulesResponse(
            data: [
                PaymentRule(
                    accountId: "account_id",
                    action: PaymentRuleAction.allow,
                    conditions: PaymentRuleConditions(
                        all: [
                            PaymentRuleCondition(
                                field: PaymentRuleConditionField.riskScore,
                                operator: PaymentRuleConditionOperator.eq,
                                value: PaymentRuleConditionValue.double(
                                    1.1
                                )
                            ),
                            PaymentRuleCondition(
                                field: PaymentRuleConditionField.riskScore,
                                operator: PaymentRuleConditionOperator.eq,
                                value: PaymentRuleConditionValue.double(
                                    1.1
                                )
                            )
                        ]
                    ),
                    createdAt: "created_at",
                    deletedAt: Nullable<String>.value("deleted_at"),
                    id: "id",
                    metadata: [
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    name: "name",
                    status: PaymentRuleStatus.active,
                    updatedAt: "updated_at"
                ),
                PaymentRule(
                    accountId: "account_id",
                    action: PaymentRuleAction.allow,
                    conditions: PaymentRuleConditions(
                        all: [
                            PaymentRuleCondition(
                                field: PaymentRuleConditionField.riskScore,
                                operator: PaymentRuleConditionOperator.eq,
                                value: PaymentRuleConditionValue.double(
                                    1.1
                                )
                            ),
                            PaymentRuleCondition(
                                field: PaymentRuleConditionField.riskScore,
                                operator: PaymentRuleConditionOperator.eq,
                                value: PaymentRuleConditionValue.double(
                                    1.1
                                )
                            )
                        ]
                    ),
                    createdAt: "created_at",
                    deletedAt: Nullable<String>.value("deleted_at"),
                    id: "id",
                    metadata: [
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    name: "name",
                    status: PaymentRuleStatus.active,
                    updatedAt: "updated_at"
                )
            ],
            pageInfo: ListPaymentRulesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.paymentRules.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "action": "allow",
                  "conditions": {
                    "all": [
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      }
                    ]
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "deleted_at": "deleted_at",
                  "id": "prule_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "name": "Block high risk",
                  "status": "active",
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
        let expectedResponse = PaymentRule(
            accountId: "biz_xxxxxxxxxxxxxx",
            action: PaymentRuleAction.allow,
            conditions: PaymentRuleConditions(
                all: [
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    )
                ]
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            deletedAt: Nullable<String>.value("deleted_at"),
            id: "prule_xxxxxxxxxxxxxx",
            metadata: [
                "key": JSONValue.string("value")
            ],
            name: "Block high risk",
            status: PaymentRuleStatus.active,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.paymentRules.create(
            request: .init(
                action: .allow,
                conditions: CreatePaymentRulesRequestConditions(
                    all: [
                        CreatePaymentRulesRequestConditionsAllItem(
                            field: .riskScore,
                            operator: .gte,
                            value: PaymentRuleConditionValue.double(
                                70
                            )
                        )
                    ]
                ),
                name: "Review risky cards"
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
                  "action": "allow",
                  "conditions": {
                    "all": [
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      },
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      }
                    ]
                  },
                  "created_at": "created_at",
                  "deleted_at": "deleted_at",
                  "id": "id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "name": "name",
                  "status": "active",
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
        let expectedResponse = PaymentRule(
            accountId: "account_id",
            action: PaymentRuleAction.allow,
            conditions: PaymentRuleConditions(
                all: [
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    ),
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    )
                ]
            ),
            createdAt: "created_at",
            deletedAt: Nullable<String>.value("deleted_at"),
            id: "id",
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            name: "name",
            status: PaymentRuleStatus.active,
            updatedAt: "updated_at"
        )
        let response = try await client.paymentRules.create(
            request: .init(
                action: .allow,
                conditions: CreatePaymentRulesRequestConditions(
                    all: [
                        CreatePaymentRulesRequestConditionsAllItem(
                            field: .riskScore,
                            operator: .eq,
                            value: PaymentRuleConditionValue.double(
                                1.1
                            )
                        ),
                        CreatePaymentRulesRequestConditionsAllItem(
                            field: .riskScore,
                            operator: .eq,
                            value: PaymentRuleConditionValue.double(
                                1.1
                            )
                        )
                    ]
                ),
                name: "x"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func listFields1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "field": "risk_score",
                      "maximum": 100,
                      "minimum": 0,
                      "operators": [
                        "eq"
                      ],
                      "options": [
                        {
                          "label": "Abkhazia",
                          "value": "AB"
                        }
                      ],
                      "type": "integer"
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
        let expectedResponse = ListFieldsPaymentRulesResponse(
            data: [
                PaymentRuleField(
                    field: PaymentRuleFieldField.riskScore,
                    maximum: Nullable<Int>.value(100),
                    minimum: Nullable<Int>.value(0),
                    operators: [
                        PaymentRuleFieldOperatorsItem.eq
                    ],
                    options: Nullable<[PaymentRuleFieldOption]>.value([
                        PaymentRuleFieldOption(
                            label: "Abkhazia",
                            value: "AB"
                        )
                    ]),
                    type: PaymentRuleFieldType.integer
                )
            ],
            pageInfo: ListFieldsPaymentRulesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.paymentRules.listFields(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func listFields2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "field": "risk_score",
                      "maximum": 1,
                      "minimum": 1,
                      "operators": [
                        "eq",
                        "eq"
                      ],
                      "options": [
                        {
                          "label": "label",
                          "value": "value"
                        },
                        {
                          "label": "label",
                          "value": "value"
                        }
                      ],
                      "type": "integer"
                    },
                    {
                      "field": "risk_score",
                      "maximum": 1,
                      "minimum": 1,
                      "operators": [
                        "eq",
                        "eq"
                      ],
                      "options": [
                        {
                          "label": "label",
                          "value": "value"
                        },
                        {
                          "label": "label",
                          "value": "value"
                        }
                      ],
                      "type": "integer"
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
        let expectedResponse = ListFieldsPaymentRulesResponse(
            data: [
                PaymentRuleField(
                    field: PaymentRuleFieldField.riskScore,
                    maximum: Nullable<Int>.value(1),
                    minimum: Nullable<Int>.value(1),
                    operators: [
                        PaymentRuleFieldOperatorsItem.eq,
                        PaymentRuleFieldOperatorsItem.eq
                    ],
                    options: Nullable<[PaymentRuleFieldOption]>.value([
                        PaymentRuleFieldOption(
                            label: "label",
                            value: "value"
                        ),
                        PaymentRuleFieldOption(
                            label: "label",
                            value: "value"
                        )
                    ]),
                    type: PaymentRuleFieldType.integer
                ),
                PaymentRuleField(
                    field: PaymentRuleFieldField.riskScore,
                    maximum: Nullable<Int>.value(1),
                    minimum: Nullable<Int>.value(1),
                    operators: [
                        PaymentRuleFieldOperatorsItem.eq,
                        PaymentRuleFieldOperatorsItem.eq
                    ],
                    options: Nullable<[PaymentRuleFieldOption]>.value([
                        PaymentRuleFieldOption(
                            label: "label",
                            value: "value"
                        ),
                        PaymentRuleFieldOption(
                            label: "label",
                            value: "value"
                        )
                    ]),
                    type: PaymentRuleFieldType.integer
                )
            ],
            pageInfo: ListFieldsPaymentRulesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.paymentRules.listFields(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "action": "allow",
                  "conditions": {
                    "all": [
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      }
                    ]
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "deleted_at": "deleted_at",
                  "id": "prule_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "name": "Block high risk",
                  "status": "active",
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
        let expectedResponse = PaymentRule(
            accountId: "biz_xxxxxxxxxxxxxx",
            action: PaymentRuleAction.allow,
            conditions: PaymentRuleConditions(
                all: [
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    )
                ]
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            deletedAt: Nullable<String>.value("deleted_at"),
            id: "prule_xxxxxxxxxxxxxx",
            metadata: [
                "key": JSONValue.string("value")
            ],
            name: "Block high risk",
            status: PaymentRuleStatus.active,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.paymentRules.retrieve(
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
                  "action": "allow",
                  "conditions": {
                    "all": [
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      },
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      }
                    ]
                  },
                  "created_at": "created_at",
                  "deleted_at": "deleted_at",
                  "id": "id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "name": "name",
                  "status": "active",
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
        let expectedResponse = PaymentRule(
            accountId: "account_id",
            action: PaymentRuleAction.allow,
            conditions: PaymentRuleConditions(
                all: [
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    ),
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    )
                ]
            ),
            createdAt: "created_at",
            deletedAt: Nullable<String>.value("deleted_at"),
            id: "id",
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            name: "name",
            status: PaymentRuleStatus.active,
            updatedAt: "updated_at"
        )
        let response = try await client.paymentRules.retrieve(
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
                  "action": "allow",
                  "conditions": {
                    "all": [
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      }
                    ]
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "deleted_at": "deleted_at",
                  "id": "prule_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "name": "Block high risk",
                  "status": "active",
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
        let expectedResponse = PaymentRule(
            accountId: "biz_xxxxxxxxxxxxxx",
            action: PaymentRuleAction.allow,
            conditions: PaymentRuleConditions(
                all: [
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    )
                ]
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            deletedAt: Nullable<String>.value("deleted_at"),
            id: "prule_xxxxxxxxxxxxxx",
            metadata: [
                "key": JSONValue.string("value")
            ],
            name: "Block high risk",
            status: PaymentRuleStatus.active,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.paymentRules.update(
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
                  "account_id": "account_id",
                  "action": "allow",
                  "conditions": {
                    "all": [
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      },
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      }
                    ]
                  },
                  "created_at": "created_at",
                  "deleted_at": "deleted_at",
                  "id": "id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "name": "name",
                  "status": "active",
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
        let expectedResponse = PaymentRule(
            accountId: "account_id",
            action: PaymentRuleAction.allow,
            conditions: PaymentRuleConditions(
                all: [
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    ),
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    )
                ]
            ),
            createdAt: "created_at",
            deletedAt: Nullable<String>.value("deleted_at"),
            id: "id",
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            name: "name",
            status: PaymentRuleStatus.active,
            updatedAt: "updated_at"
        )
        let response = try await client.paymentRules.update(
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
                  "action": "allow",
                  "conditions": {
                    "all": [
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      }
                    ]
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "deleted_at": "deleted_at",
                  "id": "prule_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "name": "Block high risk",
                  "status": "active",
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
        let expectedResponse = PaymentRule(
            accountId: "biz_xxxxxxxxxxxxxx",
            action: PaymentRuleAction.allow,
            conditions: PaymentRuleConditions(
                all: [
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    )
                ]
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            deletedAt: Nullable<String>.value("deleted_at"),
            id: "prule_xxxxxxxxxxxxxx",
            metadata: [
                "key": JSONValue.string("value")
            ],
            name: "Block high risk",
            status: PaymentRuleStatus.active,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.paymentRules.activate(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func activate2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "action": "allow",
                  "conditions": {
                    "all": [
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      },
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      }
                    ]
                  },
                  "created_at": "created_at",
                  "deleted_at": "deleted_at",
                  "id": "id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "name": "name",
                  "status": "active",
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
        let expectedResponse = PaymentRule(
            accountId: "account_id",
            action: PaymentRuleAction.allow,
            conditions: PaymentRuleConditions(
                all: [
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    ),
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    )
                ]
            ),
            createdAt: "created_at",
            deletedAt: Nullable<String>.value("deleted_at"),
            id: "id",
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            name: "name",
            status: PaymentRuleStatus.active,
            updatedAt: "updated_at"
        )
        let response = try await client.paymentRules.activate(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func deactivate1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "action": "allow",
                  "conditions": {
                    "all": [
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      }
                    ]
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "deleted_at": "deleted_at",
                  "id": "prule_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "name": "Block high risk",
                  "status": "active",
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
        let expectedResponse = PaymentRule(
            accountId: "biz_xxxxxxxxxxxxxx",
            action: PaymentRuleAction.allow,
            conditions: PaymentRuleConditions(
                all: [
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    )
                ]
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            deletedAt: Nullable<String>.value("deleted_at"),
            id: "prule_xxxxxxxxxxxxxx",
            metadata: [
                "key": JSONValue.string("value")
            ],
            name: "Block high risk",
            status: PaymentRuleStatus.active,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.paymentRules.deactivate(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func deactivate2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "action": "allow",
                  "conditions": {
                    "all": [
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      },
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      }
                    ]
                  },
                  "created_at": "created_at",
                  "deleted_at": "deleted_at",
                  "id": "id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "name": "name",
                  "status": "active",
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
        let expectedResponse = PaymentRule(
            accountId: "account_id",
            action: PaymentRuleAction.allow,
            conditions: PaymentRuleConditions(
                all: [
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    ),
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    )
                ]
            ),
            createdAt: "created_at",
            deletedAt: Nullable<String>.value("deleted_at"),
            id: "id",
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            name: "name",
            status: PaymentRuleStatus.active,
            updatedAt: "updated_at"
        )
        let response = try await client.paymentRules.deactivate(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func replace1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "action": "allow",
                  "conditions": {
                    "all": [
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      }
                    ]
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "deleted_at": "deleted_at",
                  "id": "prule_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "name": "Block high risk",
                  "status": "active",
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
        let expectedResponse = PaymentRule(
            accountId: "biz_xxxxxxxxxxxxxx",
            action: PaymentRuleAction.allow,
            conditions: PaymentRuleConditions(
                all: [
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    )
                ]
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            deletedAt: Nullable<String>.value("deleted_at"),
            id: "prule_xxxxxxxxxxxxxx",
            metadata: [
                "key": JSONValue.string("value")
            ],
            name: "Block high risk",
            status: PaymentRuleStatus.active,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.paymentRules.replace(
            id: "id",
            request: .init(
                action: .allow,
                conditions: ReplacePaymentRulesRequestConditions(
                    all: [
                        ReplacePaymentRulesRequestConditionsAllItem(
                            field: .riskScore,
                            operator: .gte,
                            value: PaymentRuleConditionValue.double(
                                70
                            )
                        )
                    ]
                )
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func replace2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "action": "allow",
                  "conditions": {
                    "all": [
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      },
                      {
                        "field": "risk_score",
                        "operator": "eq",
                        "value": 1.1
                      }
                    ]
                  },
                  "created_at": "created_at",
                  "deleted_at": "deleted_at",
                  "id": "id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "name": "name",
                  "status": "active",
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
        let expectedResponse = PaymentRule(
            accountId: "account_id",
            action: PaymentRuleAction.allow,
            conditions: PaymentRuleConditions(
                all: [
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    ),
                    PaymentRuleCondition(
                        field: PaymentRuleConditionField.riskScore,
                        operator: PaymentRuleConditionOperator.eq,
                        value: PaymentRuleConditionValue.double(
                            1.1
                        )
                    )
                ]
            ),
            createdAt: "created_at",
            deletedAt: Nullable<String>.value("deleted_at"),
            id: "id",
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            name: "name",
            status: PaymentRuleStatus.active,
            updatedAt: "updated_at"
        )
        let response = try await client.paymentRules.replace(
            id: "id",
            request: .init(
                action: .allow,
                conditions: ReplacePaymentRulesRequestConditions(
                    all: [
                        ReplacePaymentRulesRequestConditionsAllItem(
                            field: .riskScore,
                            operator: .eq,
                            value: PaymentRuleConditionValue.double(
                                1.1
                            )
                        ),
                        ReplacePaymentRulesRequestConditionsAllItem(
                            field: .riskScore,
                            operator: .eq,
                            value: PaymentRuleConditionValue.double(
                                1.1
                            )
                        )
                    ]
                )
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}