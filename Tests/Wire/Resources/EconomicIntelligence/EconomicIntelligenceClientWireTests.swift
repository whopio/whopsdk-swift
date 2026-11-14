import Foundation
import Testing
import WhopSDK

@Suite("EconomicIntelligenceClient Wire Tests") struct EconomicIntelligenceClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "acknowledged_at": "2026-01-01T12:00:00.000Z",
                      "action_type": "add_cancel_offer",
                      "ai_chat_id": "aich_xxxxxxxxxxxxxx",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "executed_at": "2026-01-01T12:00:00.000Z",
                      "expected_tool_calls": [
                        {
                          "description": "Increase the summer campaign budget",
                          "tool_name": "updateAdCampaign"
                        }
                      ],
                      "id": "reca_xxxxxxxxxxxxxx",
                      "input": "input",
                      "inputs": [
                        {
                          "answer": null,
                          "id": "id",
                          "label": "label",
                          "options": [
                            "options"
                          ],
                          "template": "template"
                        }
                      ],
                      "prompt": "Create a 20% off promo code for my members.",
                      "reasoning": "Capped 9 of 14 days.",
                      "result_url": "https://atlas.whop.site/",
                      "run_by_user_id": "user_xxxxxxxxxxxxxx",
                      "run_ended_at": "2026-01-01T12:00:00.000Z",
                      "run_started_at": "2026-01-01T12:00:00.000Z",
                      "sentiment": "positive",
                      "status": "queued",
                      "superseded_at": "2026-01-01T12:00:00.000Z",
                      "target_url": "https://example.com/join",
                      "title": "Move $180 from 3 dead ad groups into BATCH#3, +1.7x return",
                      "user_feedback": "user_feedback"
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
        let expectedResponse = ListEconomicIntelligenceResponse(
            data: [
                EconomicIntelligence(
                    accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    acknowledgedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    actionType: Nullable<String>.value("add_cancel_offer"),
                    aiChatId: Nullable<String>.value("aich_xxxxxxxxxxxxxx"),
                    createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    executedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    expectedToolCalls: Nullable<[EconomicIntelligenceOperation]>.value([
                        EconomicIntelligenceOperation(
                            description: Nullable<String>.value("Increase the summer campaign budget"),
                            toolName: "updateAdCampaign"
                        )
                    ]),
                    id: "reca_xxxxxxxxxxxxxx",
                    input: Nullable<String>.value("input"),
                    inputs: [
                        EconomicIntelligenceInput(
                            answer: .null,
                            id: "id",
                            label: "label",
                            options: [
                                "options"
                            ],
                            template: "template"
                        )
                    ],
                    prompt: Nullable<String>.value("Create a 20% off promo code for my members."),
                    reasoning: Nullable<String>.value("Capped 9 of 14 days."),
                    resultUrl: Nullable<String>.value("https://atlas.whop.site/"),
                    runByUserId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                    runEndedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    runStartedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    sentiment: Nullable<EconomicIntelligenceSentiment>.value(EconomicIntelligenceSentiment.positive),
                    status: EconomicIntelligenceStatus.queued,
                    supersededAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    targetUrl: Optional(Nullable<String>.value("https://example.com/join")),
                    title: Nullable<String>.value("Move $180 from 3 dead ad groups into BATCH#3, +1.7x return"),
                    userFeedback: Nullable<String>.value("user_feedback")
                )
            ],
            pageInfo: ListEconomicIntelligenceResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.economicIntelligence.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "acknowledged_at": "acknowledged_at",
                      "action_type": "action_type",
                      "ai_chat_id": "ai_chat_id",
                      "created_at": "created_at",
                      "executed_at": "executed_at",
                      "expected_tool_calls": [
                        {
                          "description": "description",
                          "tool_name": "tool_name"
                        },
                        {
                          "description": "description",
                          "tool_name": "tool_name"
                        }
                      ],
                      "id": "id",
                      "input": "input",
                      "inputs": [
                        {
                          "answer": "answer",
                          "id": "id",
                          "label": "label",
                          "options": [
                            "options",
                            "options"
                          ],
                          "template": "template"
                        },
                        {
                          "answer": "answer",
                          "id": "id",
                          "label": "label",
                          "options": [
                            "options",
                            "options"
                          ],
                          "template": "template"
                        }
                      ],
                      "prompt": "prompt",
                      "reasoning": "reasoning",
                      "result_url": "result_url",
                      "run_by_user_id": "run_by_user_id",
                      "run_ended_at": "run_ended_at",
                      "run_started_at": "run_started_at",
                      "sentiment": "positive",
                      "status": "queued",
                      "superseded_at": "superseded_at",
                      "target_url": "target_url",
                      "title": "title",
                      "user_feedback": "user_feedback"
                    },
                    {
                      "account_id": "account_id",
                      "acknowledged_at": "acknowledged_at",
                      "action_type": "action_type",
                      "ai_chat_id": "ai_chat_id",
                      "created_at": "created_at",
                      "executed_at": "executed_at",
                      "expected_tool_calls": [
                        {
                          "description": "description",
                          "tool_name": "tool_name"
                        },
                        {
                          "description": "description",
                          "tool_name": "tool_name"
                        }
                      ],
                      "id": "id",
                      "input": "input",
                      "inputs": [
                        {
                          "answer": "answer",
                          "id": "id",
                          "label": "label",
                          "options": [
                            "options",
                            "options"
                          ],
                          "template": "template"
                        },
                        {
                          "answer": "answer",
                          "id": "id",
                          "label": "label",
                          "options": [
                            "options",
                            "options"
                          ],
                          "template": "template"
                        }
                      ],
                      "prompt": "prompt",
                      "reasoning": "reasoning",
                      "result_url": "result_url",
                      "run_by_user_id": "run_by_user_id",
                      "run_ended_at": "run_ended_at",
                      "run_started_at": "run_started_at",
                      "sentiment": "positive",
                      "status": "queued",
                      "superseded_at": "superseded_at",
                      "target_url": "target_url",
                      "title": "title",
                      "user_feedback": "user_feedback"
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
        let expectedResponse = ListEconomicIntelligenceResponse(
            data: [
                EconomicIntelligence(
                    accountId: Nullable<String>.value("account_id"),
                    acknowledgedAt: Nullable<String>.value("acknowledged_at"),
                    actionType: Nullable<String>.value("action_type"),
                    aiChatId: Nullable<String>.value("ai_chat_id"),
                    createdAt: Nullable<String>.value("created_at"),
                    executedAt: Nullable<String>.value("executed_at"),
                    expectedToolCalls: Nullable<[EconomicIntelligenceOperation]>.value([
                        EconomicIntelligenceOperation(
                            description: Nullable<String>.value("description"),
                            toolName: "tool_name"
                        ),
                        EconomicIntelligenceOperation(
                            description: Nullable<String>.value("description"),
                            toolName: "tool_name"
                        )
                    ]),
                    id: "id",
                    input: Nullable<String>.value("input"),
                    inputs: [
                        EconomicIntelligenceInput(
                            answer: Nullable<String>.value("answer"),
                            id: "id",
                            label: "label",
                            options: [
                                "options",
                                "options"
                            ],
                            template: "template"
                        ),
                        EconomicIntelligenceInput(
                            answer: Nullable<String>.value("answer"),
                            id: "id",
                            label: "label",
                            options: [
                                "options",
                                "options"
                            ],
                            template: "template"
                        )
                    ],
                    prompt: Nullable<String>.value("prompt"),
                    reasoning: Nullable<String>.value("reasoning"),
                    resultUrl: Nullable<String>.value("result_url"),
                    runByUserId: Nullable<String>.value("run_by_user_id"),
                    runEndedAt: Nullable<String>.value("run_ended_at"),
                    runStartedAt: Nullable<String>.value("run_started_at"),
                    sentiment: Nullable<EconomicIntelligenceSentiment>.value(EconomicIntelligenceSentiment.positive),
                    status: EconomicIntelligenceStatus.queued,
                    supersededAt: Nullable<String>.value("superseded_at"),
                    targetUrl: Optional(Nullable<String>.value("target_url")),
                    title: Nullable<String>.value("title"),
                    userFeedback: Nullable<String>.value("user_feedback")
                ),
                EconomicIntelligence(
                    accountId: Nullable<String>.value("account_id"),
                    acknowledgedAt: Nullable<String>.value("acknowledged_at"),
                    actionType: Nullable<String>.value("action_type"),
                    aiChatId: Nullable<String>.value("ai_chat_id"),
                    createdAt: Nullable<String>.value("created_at"),
                    executedAt: Nullable<String>.value("executed_at"),
                    expectedToolCalls: Nullable<[EconomicIntelligenceOperation]>.value([
                        EconomicIntelligenceOperation(
                            description: Nullable<String>.value("description"),
                            toolName: "tool_name"
                        ),
                        EconomicIntelligenceOperation(
                            description: Nullable<String>.value("description"),
                            toolName: "tool_name"
                        )
                    ]),
                    id: "id",
                    input: Nullable<String>.value("input"),
                    inputs: [
                        EconomicIntelligenceInput(
                            answer: Nullable<String>.value("answer"),
                            id: "id",
                            label: "label",
                            options: [
                                "options",
                                "options"
                            ],
                            template: "template"
                        ),
                        EconomicIntelligenceInput(
                            answer: Nullable<String>.value("answer"),
                            id: "id",
                            label: "label",
                            options: [
                                "options",
                                "options"
                            ],
                            template: "template"
                        )
                    ],
                    prompt: Nullable<String>.value("prompt"),
                    reasoning: Nullable<String>.value("reasoning"),
                    resultUrl: Nullable<String>.value("result_url"),
                    runByUserId: Nullable<String>.value("run_by_user_id"),
                    runEndedAt: Nullable<String>.value("run_ended_at"),
                    runStartedAt: Nullable<String>.value("run_started_at"),
                    sentiment: Nullable<EconomicIntelligenceSentiment>.value(EconomicIntelligenceSentiment.positive),
                    status: EconomicIntelligenceStatus.queued,
                    supersededAt: Nullable<String>.value("superseded_at"),
                    targetUrl: Optional(Nullable<String>.value("target_url")),
                    title: Nullable<String>.value("title"),
                    userFeedback: Nullable<String>.value("user_feedback")
                )
            ],
            pageInfo: ListEconomicIntelligenceResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.economicIntelligence.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func update1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "acknowledged_at": "2026-01-01T12:00:00.000Z",
                  "action_type": "add_cancel_offer",
                  "ai_chat_id": "aich_xxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "executed_at": "2026-01-01T12:00:00.000Z",
                  "expected_tool_calls": [
                    {
                      "description": "Increase the summer campaign budget",
                      "tool_name": "updateAdCampaign"
                    }
                  ],
                  "id": "reca_xxxxxxxxxxxxxx",
                  "input": "input",
                  "inputs": [
                    {
                      "answer": "answer",
                      "id": "id",
                      "label": "label",
                      "options": [
                        "options"
                      ],
                      "template": "template"
                    }
                  ],
                  "prompt": "Create a 20% off promo code for my members.",
                  "reasoning": "Capped 9 of 14 days.",
                  "result_url": "https://atlas.whop.site/",
                  "run_by_user_id": "user_xxxxxxxxxxxxxx",
                  "run_ended_at": "2026-01-01T12:00:00.000Z",
                  "run_started_at": "2026-01-01T12:00:00.000Z",
                  "sentiment": "positive",
                  "status": "queued",
                  "superseded_at": "2026-01-01T12:00:00.000Z",
                  "target_url": "https://example.com/join",
                  "title": "Move $180 from 3 dead ad groups into BATCH#3, +1.7x return",
                  "user_feedback": "user_feedback"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = EconomicIntelligence(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            acknowledgedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            actionType: Nullable<String>.value("add_cancel_offer"),
            aiChatId: Nullable<String>.value("aich_xxxxxxxxxxxxxx"),
            createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            executedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            expectedToolCalls: Nullable<[EconomicIntelligenceOperation]>.value([
                EconomicIntelligenceOperation(
                    description: Nullable<String>.value("Increase the summer campaign budget"),
                    toolName: "updateAdCampaign"
                )
            ]),
            id: "reca_xxxxxxxxxxxxxx",
            input: Nullable<String>.value("input"),
            inputs: [
                EconomicIntelligenceInput(
                    answer: Nullable<String>.value("answer"),
                    id: "id",
                    label: "label",
                    options: [
                        "options"
                    ],
                    template: "template"
                )
            ],
            prompt: Nullable<String>.value("Create a 20% off promo code for my members."),
            reasoning: Nullable<String>.value("Capped 9 of 14 days."),
            resultUrl: Nullable<String>.value("https://atlas.whop.site/"),
            runByUserId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
            runEndedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            runStartedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            sentiment: Nullable<EconomicIntelligenceSentiment>.value(EconomicIntelligenceSentiment.positive),
            status: EconomicIntelligenceStatus.queued,
            supersededAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            targetUrl: Optional(Nullable<String>.value("https://example.com/join")),
            title: Nullable<String>.value("Move $180 from 3 dead ad groups into BATCH#3, +1.7x return"),
            userFeedback: Nullable<String>.value("user_feedback")
        )
        let response = try await client.economicIntelligence.update(
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
                  "acknowledged_at": "acknowledged_at",
                  "action_type": "action_type",
                  "ai_chat_id": "ai_chat_id",
                  "created_at": "created_at",
                  "executed_at": "executed_at",
                  "expected_tool_calls": [
                    {
                      "description": "description",
                      "tool_name": "tool_name"
                    },
                    {
                      "description": "description",
                      "tool_name": "tool_name"
                    }
                  ],
                  "id": "id",
                  "input": "input",
                  "inputs": [
                    {
                      "answer": "answer",
                      "id": "id",
                      "label": "label",
                      "options": [
                        "options",
                        "options"
                      ],
                      "template": "template"
                    },
                    {
                      "answer": "answer",
                      "id": "id",
                      "label": "label",
                      "options": [
                        "options",
                        "options"
                      ],
                      "template": "template"
                    }
                  ],
                  "prompt": "prompt",
                  "reasoning": "reasoning",
                  "result_url": "result_url",
                  "run_by_user_id": "run_by_user_id",
                  "run_ended_at": "run_ended_at",
                  "run_started_at": "run_started_at",
                  "sentiment": "positive",
                  "status": "queued",
                  "superseded_at": "superseded_at",
                  "target_url": "target_url",
                  "title": "title",
                  "user_feedback": "user_feedback"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = EconomicIntelligence(
            accountId: Nullable<String>.value("account_id"),
            acknowledgedAt: Nullable<String>.value("acknowledged_at"),
            actionType: Nullable<String>.value("action_type"),
            aiChatId: Nullable<String>.value("ai_chat_id"),
            createdAt: Nullable<String>.value("created_at"),
            executedAt: Nullable<String>.value("executed_at"),
            expectedToolCalls: Nullable<[EconomicIntelligenceOperation]>.value([
                EconomicIntelligenceOperation(
                    description: Nullable<String>.value("description"),
                    toolName: "tool_name"
                ),
                EconomicIntelligenceOperation(
                    description: Nullable<String>.value("description"),
                    toolName: "tool_name"
                )
            ]),
            id: "id",
            input: Nullable<String>.value("input"),
            inputs: [
                EconomicIntelligenceInput(
                    answer: Nullable<String>.value("answer"),
                    id: "id",
                    label: "label",
                    options: [
                        "options",
                        "options"
                    ],
                    template: "template"
                ),
                EconomicIntelligenceInput(
                    answer: Nullable<String>.value("answer"),
                    id: "id",
                    label: "label",
                    options: [
                        "options",
                        "options"
                    ],
                    template: "template"
                )
            ],
            prompt: Nullable<String>.value("prompt"),
            reasoning: Nullable<String>.value("reasoning"),
            resultUrl: Nullable<String>.value("result_url"),
            runByUserId: Nullable<String>.value("run_by_user_id"),
            runEndedAt: Nullable<String>.value("run_ended_at"),
            runStartedAt: Nullable<String>.value("run_started_at"),
            sentiment: Nullable<EconomicIntelligenceSentiment>.value(EconomicIntelligenceSentiment.positive),
            status: EconomicIntelligenceStatus.queued,
            supersededAt: Nullable<String>.value("superseded_at"),
            targetUrl: Optional(Nullable<String>.value("target_url")),
            title: Nullable<String>.value("title"),
            userFeedback: Nullable<String>.value("user_feedback")
        )
        let response = try await client.economicIntelligence.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}