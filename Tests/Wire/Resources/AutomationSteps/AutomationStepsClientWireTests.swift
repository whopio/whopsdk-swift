import Foundation
import Testing
import WhopSDK

@Suite("AutomationStepsClient Wire Tests") struct AutomationStepsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "action_type": "wait",
                      "automation_id": "ato_xxxxxxxxxxxxxx",
                      "config": {
                        "delay_seconds": 86400
                      },
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "id": "atos_xxxxxxxxxxxxxx",
                      "issues": [
                        "issues"
                      ],
                      "key": 2,
                      "previous_step_id": "atos_xxxxxxxxxxxxxx",
                      "sender": {
                        "address": "address",
                        "id": "id",
                        "object": "email_address"
                      },
                      "source_code": "export default () => message.send({ subject: \"Thanks!\", text: \"Thanks for your order!\" });",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "version": 1,
                      "waiting_enrollments_count": 0
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
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
        let expectedResponse = ListAutomationStepsResponse(
            data: [
                AutomationStep(
                    actionType: AutomationStepActionType.wait,
                    automationId: "ato_xxxxxxxxxxxxxx",
                    config: AutomationStepConfig.automationStepWaitConfig(
                        AutomationStepWaitConfig(
                            delaySeconds: 86400
                        )
                    ),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    id: "atos_xxxxxxxxxxxxxx",
                    issues: [
                        "issues"
                    ],
                    key: 2,
                    previousStepId: Nullable<String>.value("atos_xxxxxxxxxxxxxx"),
                    sender: Nullable<AutomationStepSender>.value(AutomationStepSender.emailAddress(
                        .init(
                            address: "address",
                            id: "id",
                            additionalProperties: [
                                "object": JSONValue.string("email_address")
                            ]
                        )
                    )),
                    sourceCode: Nullable<String>.value("export default () => message.send({ subject: \"Thanks!\", text: \"Thanks for your order!\" });"),
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    version: 1,
                    waitingEnrollmentsCount: 0
                )
            ],
            pageInfo: ListAutomationStepsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("MQ")
            )
        )
        let response = try await client.automationSteps.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "action_type": "wait",
                      "automation_id": "automation_id",
                      "config": {
                        "delay_seconds": 1
                      },
                      "created_at": "created_at",
                      "id": "id",
                      "issues": [
                        "issues",
                        "issues"
                      ],
                      "key": 1,
                      "previous_step_id": "previous_step_id",
                      "sender": {
                        "object": "email_address",
                        "address": "address",
                        "id": "id"
                      },
                      "source_code": "source_code",
                      "updated_at": "updated_at",
                      "version": 1,
                      "waiting_enrollments_count": 1
                    },
                    {
                      "action_type": "wait",
                      "automation_id": "automation_id",
                      "config": {
                        "delay_seconds": 1
                      },
                      "created_at": "created_at",
                      "id": "id",
                      "issues": [
                        "issues",
                        "issues"
                      ],
                      "key": 1,
                      "previous_step_id": "previous_step_id",
                      "sender": {
                        "object": "email_address",
                        "address": "address",
                        "id": "id"
                      },
                      "source_code": "source_code",
                      "updated_at": "updated_at",
                      "version": 1,
                      "waiting_enrollments_count": 1
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
        let expectedResponse = ListAutomationStepsResponse(
            data: [
                AutomationStep(
                    actionType: AutomationStepActionType.wait,
                    automationId: "automation_id",
                    config: AutomationStepConfig.automationStepWaitConfig(
                        AutomationStepWaitConfig(
                            delaySeconds: 1
                        )
                    ),
                    createdAt: "created_at",
                    id: "id",
                    issues: [
                        "issues",
                        "issues"
                    ],
                    key: 1,
                    previousStepId: Nullable<String>.value("previous_step_id"),
                    sender: Nullable<AutomationStepSender>.value(AutomationStepSender.emailAddress(
                        .init(
                            address: "address",
                            id: "id",
                            additionalProperties: [
                                "object": JSONValue.string("email_address")
                            ]
                        )
                    )),
                    sourceCode: Nullable<String>.value("source_code"),
                    updatedAt: "updated_at",
                    version: 1,
                    waitingEnrollmentsCount: 1
                ),
                AutomationStep(
                    actionType: AutomationStepActionType.wait,
                    automationId: "automation_id",
                    config: AutomationStepConfig.automationStepWaitConfig(
                        AutomationStepWaitConfig(
                            delaySeconds: 1
                        )
                    ),
                    createdAt: "created_at",
                    id: "id",
                    issues: [
                        "issues",
                        "issues"
                    ],
                    key: 1,
                    previousStepId: Nullable<String>.value("previous_step_id"),
                    sender: Nullable<AutomationStepSender>.value(AutomationStepSender.emailAddress(
                        .init(
                            address: "address",
                            id: "id",
                            additionalProperties: [
                                "object": JSONValue.string("email_address")
                            ]
                        )
                    )),
                    sourceCode: Nullable<String>.value("source_code"),
                    updatedAt: "updated_at",
                    version: 1,
                    waitingEnrollmentsCount: 1
                )
            ],
            pageInfo: ListAutomationStepsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.automationSteps.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "action_type": "wait",
                  "automation_id": "ato_xxxxxxxxxxxxxx",
                  "config": {
                    "delay_seconds": 86400
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "atos_xxxxxxxxxxxxxx",
                  "issues": [
                    "issues"
                  ],
                  "key": 2,
                  "previous_step_id": "atos_xxxxxxxxxxxxxx",
                  "sender": {
                    "address": "address",
                    "id": "id",
                    "object": "email_address"
                  },
                  "source_code": "export default () => message.send({ subject: \"Thanks!\", text: \"Thanks for your order!\" });",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "version": 1,
                  "waiting_enrollments_count": 0
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AutomationStep(
            actionType: AutomationStepActionType.wait,
            automationId: "ato_xxxxxxxxxxxxxx",
            config: AutomationStepConfig.automationStepWaitConfig(
                AutomationStepWaitConfig(
                    delaySeconds: 86400
                )
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            id: "atos_xxxxxxxxxxxxxx",
            issues: [
                "issues"
            ],
            key: 2,
            previousStepId: Nullable<String>.value("atos_xxxxxxxxxxxxxx"),
            sender: Nullable<AutomationStepSender>.value(AutomationStepSender.emailAddress(
                .init(
                    address: "address",
                    id: "id",
                    additionalProperties: [
                        "object": JSONValue.string("email_address")
                    ]
                )
            )),
            sourceCode: Nullable<String>.value("export default () => message.send({ subject: \"Thanks!\", text: \"Thanks for your order!\" });"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            version: 1,
            waitingEnrollmentsCount: 0
        )
        let response = try await client.automationSteps.create(
            request: .init(
                actionType: .wait,
                automationId: "ato_xxxxxxxxxxxxxx"
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
                  "action_type": "wait",
                  "automation_id": "automation_id",
                  "config": {
                    "delay_seconds": 1
                  },
                  "created_at": "created_at",
                  "id": "id",
                  "issues": [
                    "issues",
                    "issues"
                  ],
                  "key": 1,
                  "previous_step_id": "previous_step_id",
                  "sender": {
                    "object": "email_address",
                    "address": "address",
                    "id": "id"
                  },
                  "source_code": "source_code",
                  "updated_at": "updated_at",
                  "version": 1,
                  "waiting_enrollments_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AutomationStep(
            actionType: AutomationStepActionType.wait,
            automationId: "automation_id",
            config: AutomationStepConfig.automationStepWaitConfig(
                AutomationStepWaitConfig(
                    delaySeconds: 1
                )
            ),
            createdAt: "created_at",
            id: "id",
            issues: [
                "issues",
                "issues"
            ],
            key: 1,
            previousStepId: Nullable<String>.value("previous_step_id"),
            sender: Nullable<AutomationStepSender>.value(AutomationStepSender.emailAddress(
                .init(
                    address: "address",
                    id: "id",
                    additionalProperties: [
                        "object": JSONValue.string("email_address")
                    ]
                )
            )),
            sourceCode: Nullable<String>.value("source_code"),
            updatedAt: "updated_at",
            version: 1,
            waitingEnrollmentsCount: 1
        )
        let response = try await client.automationSteps.create(
            request: .init(
                actionType: .wait,
                automationId: "automation_id"
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
                  "action_type": "wait",
                  "automation_id": "ato_xxxxxxxxxxxxxx",
                  "config": {
                    "delay_seconds": 86400
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "atos_xxxxxxxxxxxxxx",
                  "issues": [
                    "issues"
                  ],
                  "key": 2,
                  "previous_step_id": "atos_xxxxxxxxxxxxxx",
                  "sender": {
                    "address": "address",
                    "id": "id",
                    "object": "email_address"
                  },
                  "source_code": "export default () => message.send({ subject: \"Thanks!\", text: \"Thanks for your order!\" });",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "version": 1,
                  "waiting_enrollments_count": 0
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AutomationStep(
            actionType: AutomationStepActionType.wait,
            automationId: "ato_xxxxxxxxxxxxxx",
            config: AutomationStepConfig.automationStepWaitConfig(
                AutomationStepWaitConfig(
                    delaySeconds: 86400
                )
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            id: "atos_xxxxxxxxxxxxxx",
            issues: [
                "issues"
            ],
            key: 2,
            previousStepId: Nullable<String>.value("atos_xxxxxxxxxxxxxx"),
            sender: Nullable<AutomationStepSender>.value(AutomationStepSender.emailAddress(
                .init(
                    address: "address",
                    id: "id",
                    additionalProperties: [
                        "object": JSONValue.string("email_address")
                    ]
                )
            )),
            sourceCode: Nullable<String>.value("export default () => message.send({ subject: \"Thanks!\", text: \"Thanks for your order!\" });"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            version: 1,
            waitingEnrollmentsCount: 0
        )
        let response = try await client.automationSteps.retrieve(
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
                  "action_type": "wait",
                  "automation_id": "automation_id",
                  "config": {
                    "delay_seconds": 1
                  },
                  "created_at": "created_at",
                  "id": "id",
                  "issues": [
                    "issues",
                    "issues"
                  ],
                  "key": 1,
                  "previous_step_id": "previous_step_id",
                  "sender": {
                    "object": "email_address",
                    "address": "address",
                    "id": "id"
                  },
                  "source_code": "source_code",
                  "updated_at": "updated_at",
                  "version": 1,
                  "waiting_enrollments_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AutomationStep(
            actionType: AutomationStepActionType.wait,
            automationId: "automation_id",
            config: AutomationStepConfig.automationStepWaitConfig(
                AutomationStepWaitConfig(
                    delaySeconds: 1
                )
            ),
            createdAt: "created_at",
            id: "id",
            issues: [
                "issues",
                "issues"
            ],
            key: 1,
            previousStepId: Nullable<String>.value("previous_step_id"),
            sender: Nullable<AutomationStepSender>.value(AutomationStepSender.emailAddress(
                .init(
                    address: "address",
                    id: "id",
                    additionalProperties: [
                        "object": JSONValue.string("email_address")
                    ]
                )
            )),
            sourceCode: Nullable<String>.value("source_code"),
            updatedAt: "updated_at",
            version: 1,
            waitingEnrollmentsCount: 1
        )
        let response = try await client.automationSteps.retrieve(
            id: "id",
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
                  "action_type": "wait",
                  "automation_id": "ato_xxxxxxxxxxxxxx",
                  "config": {
                    "delay_seconds": 86400
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "atos_xxxxxxxxxxxxxx",
                  "issues": [
                    "issues"
                  ],
                  "key": 2,
                  "previous_step_id": "atos_xxxxxxxxxxxxxx",
                  "sender": {
                    "address": "address",
                    "id": "id",
                    "object": "email_address"
                  },
                  "source_code": "export default () => message.send({ subject: \"Thanks!\", text: \"Thanks for your order!\" });",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "version": 1,
                  "waiting_enrollments_count": 0
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AutomationStep(
            actionType: AutomationStepActionType.wait,
            automationId: "ato_xxxxxxxxxxxxxx",
            config: AutomationStepConfig.automationStepWaitConfig(
                AutomationStepWaitConfig(
                    delaySeconds: 86400
                )
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            id: "atos_xxxxxxxxxxxxxx",
            issues: [
                "issues"
            ],
            key: 2,
            previousStepId: Nullable<String>.value("atos_xxxxxxxxxxxxxx"),
            sender: Nullable<AutomationStepSender>.value(AutomationStepSender.emailAddress(
                .init(
                    address: "address",
                    id: "id",
                    additionalProperties: [
                        "object": JSONValue.string("email_address")
                    ]
                )
            )),
            sourceCode: Nullable<String>.value("export default () => message.send({ subject: \"Thanks!\", text: \"Thanks for your order!\" });"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            version: 1,
            waitingEnrollmentsCount: 0
        )
        let response = try await client.automationSteps.delete(
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
                  "action_type": "wait",
                  "automation_id": "automation_id",
                  "config": {
                    "delay_seconds": 1
                  },
                  "created_at": "created_at",
                  "id": "id",
                  "issues": [
                    "issues",
                    "issues"
                  ],
                  "key": 1,
                  "previous_step_id": "previous_step_id",
                  "sender": {
                    "object": "email_address",
                    "address": "address",
                    "id": "id"
                  },
                  "source_code": "source_code",
                  "updated_at": "updated_at",
                  "version": 1,
                  "waiting_enrollments_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AutomationStep(
            actionType: AutomationStepActionType.wait,
            automationId: "automation_id",
            config: AutomationStepConfig.automationStepWaitConfig(
                AutomationStepWaitConfig(
                    delaySeconds: 1
                )
            ),
            createdAt: "created_at",
            id: "id",
            issues: [
                "issues",
                "issues"
            ],
            key: 1,
            previousStepId: Nullable<String>.value("previous_step_id"),
            sender: Nullable<AutomationStepSender>.value(AutomationStepSender.emailAddress(
                .init(
                    address: "address",
                    id: "id",
                    additionalProperties: [
                        "object": JSONValue.string("email_address")
                    ]
                )
            )),
            sourceCode: Nullable<String>.value("source_code"),
            updatedAt: "updated_at",
            version: 1,
            waitingEnrollmentsCount: 1
        )
        let response = try await client.automationSteps.delete(
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
                  "action_type": "wait",
                  "automation_id": "ato_xxxxxxxxxxxxxx",
                  "config": {
                    "delay_seconds": 86400
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "atos_xxxxxxxxxxxxxx",
                  "issues": [
                    "issues"
                  ],
                  "key": 2,
                  "previous_step_id": "atos_xxxxxxxxxxxxxx",
                  "sender": {
                    "address": "address",
                    "id": "id",
                    "object": "email_address"
                  },
                  "source_code": "export default () => message.send({ subject: \"Thanks!\", text: \"Thanks for your order!\" });",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "version": 1,
                  "waiting_enrollments_count": 0
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AutomationStep(
            actionType: AutomationStepActionType.wait,
            automationId: "ato_xxxxxxxxxxxxxx",
            config: AutomationStepConfig.automationStepWaitConfig(
                AutomationStepWaitConfig(
                    delaySeconds: 86400
                )
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            id: "atos_xxxxxxxxxxxxxx",
            issues: [
                "issues"
            ],
            key: 2,
            previousStepId: Nullable<String>.value("atos_xxxxxxxxxxxxxx"),
            sender: Nullable<AutomationStepSender>.value(AutomationStepSender.emailAddress(
                .init(
                    address: "address",
                    id: "id",
                    additionalProperties: [
                        "object": JSONValue.string("email_address")
                    ]
                )
            )),
            sourceCode: Nullable<String>.value("export default () => message.send({ subject: \"Thanks!\", text: \"Thanks for your order!\" });"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            version: 1,
            waitingEnrollmentsCount: 0
        )
        let response = try await client.automationSteps.update(
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
                  "action_type": "wait",
                  "automation_id": "automation_id",
                  "config": {
                    "delay_seconds": 1
                  },
                  "created_at": "created_at",
                  "id": "id",
                  "issues": [
                    "issues",
                    "issues"
                  ],
                  "key": 1,
                  "previous_step_id": "previous_step_id",
                  "sender": {
                    "object": "email_address",
                    "address": "address",
                    "id": "id"
                  },
                  "source_code": "source_code",
                  "updated_at": "updated_at",
                  "version": 1,
                  "waiting_enrollments_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AutomationStep(
            actionType: AutomationStepActionType.wait,
            automationId: "automation_id",
            config: AutomationStepConfig.automationStepWaitConfig(
                AutomationStepWaitConfig(
                    delaySeconds: 1
                )
            ),
            createdAt: "created_at",
            id: "id",
            issues: [
                "issues",
                "issues"
            ],
            key: 1,
            previousStepId: Nullable<String>.value("previous_step_id"),
            sender: Nullable<AutomationStepSender>.value(AutomationStepSender.emailAddress(
                .init(
                    address: "address",
                    id: "id",
                    additionalProperties: [
                        "object": JSONValue.string("email_address")
                    ]
                )
            )),
            sourceCode: Nullable<String>.value("source_code"),
            updatedAt: "updated_at",
            version: 1,
            waitingEnrollmentsCount: 1
        )
        let response = try await client.automationSteps.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func preview1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "action_type": "email",
                  "html": "<html><body><p>Hi there</p><table role=\"presentation\" data-whop-footer width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:32px 0 0;border-top:1px solid #e6e6e6;\">\n<tr><td style=\"padding:20px 16px;text-align:center;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Helvetica,Arial,sans-serif;font-size:12px;line-height:18px;color:#6f6f6f;\">\n<p style=\"margin:0 0 8px;\">You&#39;re receiving this because you bought from Batman1. <a href=\"{{whop_unsubscribe_url}}\" style=\"color:#6f6f6f;text-decoration:underline;\">Unsubscribe from Batman1 marketing communications</a>.</p>\n<p style=\"margin:0 0 8px;\">Problem with your order? <a href=\"https://whop.com/@me/settings/resolution-center/\" style=\"color:#6f6f6f;text-decoration:underline;\">Open a case in the Resolution Center</a>.</p>\n<p style=\"margin:0;font-weight:600;color:#9a9a9a;\">Sent with Whop</p>\n<!--whop:open-pixel-->\n</td></tr>\n</table>\n\n</body></html>",
                  "outcome": "sent",
                  "preheader": "preheader",
                  "reason": "reason",
                  "subject": "How's the kettle?",
                  "text": "Hi there\n\n--\nYou're receiving this because you bought from Batman1. Unsubscribe from Batman1 marketing communications: {{whop_unsubscribe_url}}\nProblem with your order? Open a case in the Resolution Center: https://whop.com/@me/settings/resolution-center/\nSent with Whop"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AutomationStepPreview(
            actionType: AutomationStepPreviewActionType.email,
            html: Nullable<String>.value("<html><body><p>Hi there</p><table role=\"presentation\" data-whop-footer width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:32px 0 0;border-top:1px solid #e6e6e6;\">\n<tr><td style=\"padding:20px 16px;text-align:center;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Helvetica,Arial,sans-serif;font-size:12px;line-height:18px;color:#6f6f6f;\">\n<p style=\"margin:0 0 8px;\">You&#39;re receiving this because you bought from Batman1. <a href=\"{{whop_unsubscribe_url}}\" style=\"color:#6f6f6f;text-decoration:underline;\">Unsubscribe from Batman1 marketing communications</a>.</p>\n<p style=\"margin:0 0 8px;\">Problem with your order? <a href=\"https://whop.com/@me/settings/resolution-center/\" style=\"color:#6f6f6f;text-decoration:underline;\">Open a case in the Resolution Center</a>.</p>\n<p style=\"margin:0;font-weight:600;color:#9a9a9a;\">Sent with Whop</p>\n<!--whop:open-pixel-->\n</td></tr>\n</table>\n\n</body></html>"),
            outcome: AutomationStepPreviewOutcome.sent,
            preheader: Nullable<String>.value("preheader"),
            reason: Nullable<String>.value("reason"),
            subject: Nullable<String>.value("How's the kettle?"),
            text: Nullable<String>.value("Hi there\n\n--\nYou're receiving this because you bought from Batman1. Unsubscribe from Batman1 marketing communications: {{whop_unsubscribe_url}}\nProblem with your order? Open a case in the Resolution Center: https://whop.com/@me/settings/resolution-center/\nSent with Whop")
        )
        let response = try await client.automationSteps.preview(
            id: "id",
            request: .init(memberId: "mber_xxxxxxxxxxxxxx"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func preview2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "action_type": "email",
                  "html": "html",
                  "outcome": "sent",
                  "preheader": "preheader",
                  "reason": "reason",
                  "subject": "subject",
                  "text": "text"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AutomationStepPreview(
            actionType: AutomationStepPreviewActionType.email,
            html: Nullable<String>.value("html"),
            outcome: AutomationStepPreviewOutcome.sent,
            preheader: Nullable<String>.value("preheader"),
            reason: Nullable<String>.value("reason"),
            subject: Nullable<String>.value("subject"),
            text: Nullable<String>.value("text")
        )
        let response = try await client.automationSteps.preview(
            id: "id",
            request: .init(memberId: "member_id"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}