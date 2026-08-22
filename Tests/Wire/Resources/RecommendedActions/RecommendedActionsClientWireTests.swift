import Foundation
import Testing
import WhopSDK

@Suite("RecommendedActionsClient Wire Tests") struct RecommendedActionsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "actions": [
                        {
                          "action": "create_ad_xxxxxxxxxxxxxx",
                          "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/marketing/ads",
                          "cta_label": "Create campaign",
                          "description": "Pick a budget",
                          "error": null,
                          "input": {
                            "name": "Ceramic coating — Austin launch"
                          },
                          "output": null,
                          "position": 0,
                          "reasoning": {
                            "summary": "Create the campaign shell first so ad groups have a parent."
                          },
                          "status": null,
                          "title": "Create a campaign"
                        }
                      ],
                      "description": "Get your product in front of buyers",
                      "id": "rac_chain_xxxxxxxxxxxx",
                      "reasoning": {
                        "summary": "Shine Time has a connected Meta account but no active campaigns; a first campaign unlocks lead tracking."
                      },
                      "title": "Launch an ad campaign"
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
        let expectedResponse = ListRecommendedActionsResponse(
            data: [
                AccountRecommendedActionChain(
                    actions: [
                        AccountRecommendedActionChainStep(
                            action: "create_ad_xxxxxxxxxxxxxx",
                            cta: "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/marketing/ads",
                            ctaLabel: "Create campaign",
                            description: "Pick a budget",
                            error: .null,
                            input: Nullable<[String: JSONValue]>.value([
                                "name": JSONValue.string("Ceramic coating — Austin launch")
                            ]),
                            output: .null,
                            position: 0,
                            reasoning: Nullable<[String: JSONValue]>.value([
                                "summary": JSONValue.string("Create the campaign shell first so ad groups have a parent.")
                            ]),
                            status: .null,
                            title: "Create a campaign"
                        )
                    ],
                    description: "Get your product in front of buyers",
                    id: "rac_chain_xxxxxxxxxxxx",
                    reasoning: Nullable<[String: JSONValue]>.value([
                        "summary": JSONValue.string("Shine Time has a connected Meta account but no active campaigns; a first campaign unlocks lead tracking.")
                    ]),
                    title: "Launch an ad campaign"
                )
            ]
        )
        let response = try await client.recommendedActions.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "actions": [
                    {
                      "action": "create_ad_xxxxxxxxxxxxxx",
                      "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/marketing/ads",
                      "cta_label": "Create campaign",
                      "description": "Pick a budget",
                      "error": "error",
                      "input": {
                        "name": "Ceramic coating — Austin launch"
                      },
                      "output": {
                        "key": "value"
                      },
                      "position": 0,
                      "reasoning": {
                        "summary": "Create the campaign shell first so ad groups have a parent."
                      },
                      "status": "pending",
                      "title": "Create a campaign"
                    }
                  ],
                  "description": "Get your product in front of buyers",
                  "id": "rac_chain_xxxxxxxxxxxx",
                  "reasoning": {
                    "summary": "Shine Time has a connected Meta account but no active campaigns; a first campaign unlocks lead tracking."
                  },
                  "title": "Launch an ad campaign"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AccountRecommendedActionChain(
            actions: [
                AccountRecommendedActionChainStep(
                    action: "create_ad_xxxxxxxxxxxxxx",
                    cta: "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/marketing/ads",
                    ctaLabel: "Create campaign",
                    description: "Pick a budget",
                    error: Nullable<String>.value("error"),
                    input: Nullable<[String: JSONValue]>.value([
                        "name": JSONValue.string("Ceramic coating — Austin launch")
                    ]),
                    output: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    position: 0,
                    reasoning: Nullable<[String: JSONValue]>.value([
                        "summary": JSONValue.string("Create the campaign shell first so ad groups have a parent.")
                    ]),
                    status: Nullable<AccountRecommendedActionChainStepStatus>.value(AccountRecommendedActionChainStepStatus.pending),
                    title: "Create a campaign"
                )
            ],
            description: "Get your product in front of buyers",
            id: "rac_chain_xxxxxxxxxxxx",
            reasoning: Nullable<[String: JSONValue]>.value([
                "summary": JSONValue.string("Shine Time has a connected Meta account but no active campaigns; a first campaign unlocks lead tracking.")
            ]),
            title: "Launch an ad campaign"
        )
        let response = try await client.recommendedActions.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func run1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "chain_id": "rac_seed_start_selling_xxxxxxxxxx",
                  "execution": "redirect"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RunRecommendedActionsResponse(
            chainId: "rac_seed_start_selling_xxxxxxxxxx",
            execution: RunRecommendedActionsResponseExecution.redirect
        )
        let response = try await client.recommendedActions.run(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func listExecutions1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "chain_id": "rac_chain_xxxxxxxxxxxx",
                  "executions": [
                    {
                      "action": "create_product",
                      "completed_at": "2026-01-01T12:00:00.000Z",
                      "error": "error",
                      "id": "raex_xxxxxxxxxxxxxx",
                      "output": {
                        "id": "prod_xxxxxxxxxxxxxx"
                      },
                      "position": 0,
                      "status": "pending"
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
        let expectedResponse = ListExecutionsRecommendedActionsResponse(
            chainId: "rac_chain_xxxxxxxxxxxx",
            executions: [
                RecommendedActionExecution(
                    action: "create_product",
                    completedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    error: Nullable<String>.value("error"),
                    id: "raex_xxxxxxxxxxxxxx",
                    output: Nullable<[String: JSONValue]>.value([
                        "id": JSONValue.string("prod_xxxxxxxxxxxxxx")
                    ]),
                    position: 0,
                    status: RecommendedActionExecutionStatus.pending
                )
            ]
        )
        let response = try await client.recommendedActions.listExecutions(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}