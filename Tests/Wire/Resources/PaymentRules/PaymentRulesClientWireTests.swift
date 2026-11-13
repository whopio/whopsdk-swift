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
}