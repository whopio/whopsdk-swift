import Foundation
import Testing
import WhopSDK

@Suite("WebhooksClient Wire Tests") struct WebhooksClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "api_version": "v1",
                      "api_version_date": "2026-01-01",
                      "child_resource_events": false,
                      "consecutive_failures": 0,
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "disabled_at": "2026-01-01T12:00:00.000Z",
                      "disabled_reason": "delivery_failures",
                      "enabled": false,
                      "events": [
                        "account.updated"
                      ],
                      "failing_since": "2026-01-01T12:00:00.000Z",
                      "id": "hook_xxxxxxxxxxxxxx",
                      "last_failure_at": "2026-01-01T12:00:00.000Z",
                      "resource_id": "biz_xxxxxxxxxxxxxx",
                      "title": "title",
                      "url": "https://example.com/shine-time/whop",
                      "webhook_secret": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
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
        let expectedResponse = ListWebhooksResponse(
            data: [
                WebhookListItem(
                    apiVersion: WebhookListItemApiVersion.v1,
                    apiVersionDate: Nullable<String>.value("2026-01-01"),
                    childResourceEvents: false,
                    consecutiveFailures: 0,
                    createdAt: "2026-01-01T12:00:00.000Z",
                    disabledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    disabledReason: Nullable<WebhookListItemDisabledReason>.value(WebhookListItemDisabledReason.deliveryFailures),
                    enabled: false,
                    events: [
                        WebhookListItemEventsItem.accountUpdated
                    ],
                    failingSince: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    id: "hook_xxxxxxxxxxxxxx",
                    lastFailureAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    resourceId: "biz_xxxxxxxxxxxxxx",
                    title: Nullable<String>.value("title"),
                    url: "https://example.com/shine-time/whop",
                    webhookSecret: Nullable<String>.value("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
                )
            ],
            pageInfo: ListWebhooksResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.webhooks.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "api_version": "v1",
                  "api_version_date": "2026-01-01",
                  "child_resource_events": false,
                  "consecutive_failures": 9,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "disabled_at": "2026-01-01T12:00:00.000Z",
                  "disabled_reason": "delivery_failures",
                  "enabled": false,
                  "events": [
                    "account.updated"
                  ],
                  "failing_since": "2026-01-01T12:00:00.000Z",
                  "id": "hook_xxxxxxxxxxxxxx",
                  "last_failure_at": "2026-01-01T12:00:00.000Z",
                  "resource_id": "biz_xxxxxxxxxxxxxx",
                  "testable_events": [
                    "account.updated"
                  ],
                  "title": "Production",
                  "url": "https://example.com/hooks",
                  "webhook_secret": "ws_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Webhook(
            apiVersion: WebhookApiVersion.v1,
            apiVersionDate: Nullable<String>.value("2026-01-01"),
            childResourceEvents: false,
            consecutiveFailures: 9,
            createdAt: "2026-01-01T12:00:00.000Z",
            disabledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            disabledReason: Nullable<WebhookDisabledReason>.value(WebhookDisabledReason.deliveryFailures),
            enabled: false,
            events: [
                WebhookEventsItem.accountUpdated
            ],
            failingSince: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "hook_xxxxxxxxxxxxxx",
            lastFailureAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            resourceId: "biz_xxxxxxxxxxxxxx",
            testableEvents: [
                WebhookTestableEventsItem.accountUpdated
            ],
            title: Nullable<String>.value("Production"),
            url: "https://example.com/hooks",
            webhookSecret: Nullable<String>.value("ws_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
        )
        let response = try await client.webhooks.create(
            request: .init(url: "https://example.com/hooks"),
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
                  "api_version": "v1",
                  "api_version_date": "2026-01-01",
                  "child_resource_events": false,
                  "consecutive_failures": 9,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "disabled_at": "2026-01-01T12:00:00.000Z",
                  "disabled_reason": "delivery_failures",
                  "enabled": false,
                  "events": [
                    "account.updated"
                  ],
                  "failing_since": "2026-01-01T12:00:00.000Z",
                  "id": "hook_xxxxxxxxxxxxxx",
                  "last_failure_at": "2026-01-01T12:00:00.000Z",
                  "resource_id": "biz_xxxxxxxxxxxxxx",
                  "testable_events": [
                    "account.updated"
                  ],
                  "title": "Production",
                  "url": "https://example.com/hooks",
                  "webhook_secret": "ws_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Webhook(
            apiVersion: WebhookApiVersion.v1,
            apiVersionDate: Nullable<String>.value("2026-01-01"),
            childResourceEvents: false,
            consecutiveFailures: 9,
            createdAt: "2026-01-01T12:00:00.000Z",
            disabledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            disabledReason: Nullable<WebhookDisabledReason>.value(WebhookDisabledReason.deliveryFailures),
            enabled: false,
            events: [
                WebhookEventsItem.accountUpdated
            ],
            failingSince: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "hook_xxxxxxxxxxxxxx",
            lastFailureAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            resourceId: "biz_xxxxxxxxxxxxxx",
            testableEvents: [
                WebhookTestableEventsItem.accountUpdated
            ],
            title: Nullable<String>.value("Production"),
            url: "https://example.com/hooks",
            webhookSecret: Nullable<String>.value("ws_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
        )
        let response = try await client.webhooks.retrieve(
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
                  "deleted": true,
                  "id": "hook_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteWebhooksResponse(
            deleted: true,
            id: "hook_xxxxxxxxxxxxxx"
        )
        let response = try await client.webhooks.delete(
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
                  "api_version": "v1",
                  "api_version_date": "2026-01-01",
                  "child_resource_events": false,
                  "consecutive_failures": 9,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "disabled_at": "2026-01-01T12:00:00.000Z",
                  "disabled_reason": "delivery_failures",
                  "enabled": false,
                  "events": [
                    "account.updated"
                  ],
                  "failing_since": "2026-01-01T12:00:00.000Z",
                  "id": "hook_xxxxxxxxxxxxxx",
                  "last_failure_at": "2026-01-01T12:00:00.000Z",
                  "resource_id": "biz_xxxxxxxxxxxxxx",
                  "testable_events": [
                    "account.updated"
                  ],
                  "title": "Production",
                  "url": "https://example.com/hooks",
                  "webhook_secret": "ws_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Webhook(
            apiVersion: WebhookApiVersion.v1,
            apiVersionDate: Nullable<String>.value("2026-01-01"),
            childResourceEvents: false,
            consecutiveFailures: 9,
            createdAt: "2026-01-01T12:00:00.000Z",
            disabledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            disabledReason: Nullable<WebhookDisabledReason>.value(WebhookDisabledReason.deliveryFailures),
            enabled: false,
            events: [
                WebhookEventsItem.accountUpdated
            ],
            failingSince: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "hook_xxxxxxxxxxxxxx",
            lastFailureAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            resourceId: "biz_xxxxxxxxxxxxxx",
            testableEvents: [
                WebhookTestableEventsItem.accountUpdated
            ],
            title: Nullable<String>.value("Production"),
            url: "https://example.com/hooks",
            webhookSecret: Nullable<String>.value("ws_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
        )
        let response = try await client.webhooks.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func listDeliveries1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "event": "payment.succeeded",
                      "id": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                      "replayed_from": "whdel_MTcwMDAwMDAwMDAwMHx0ZXN0",
                      "request_body": {
                        "data": {
                          "id": "pay_123"
                        },
                        "id": "msg_original",
                        "type": "payment.succeeded"
                      },
                      "resource_id": "pay_123",
                      "response_body": {
                        "ok": true
                      },
                      "response_code": 200,
                      "sent_at": "2026-01-01T12:00:00.000Z",
                      "status": "success",
                      "success": true,
                      "total_time": 0.31
                    }
                  ],
                  "page_info": {
                    "end_cursor": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--xxxxxxxxxxxxxxxx--xxxxxxxxxxxxxxxxxxxxxx",
                    "has_next_page": false,
                    "has_previous_page": false,
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
        let expectedResponse = ListDeliveriesWebhooksResponse(
            data: [
                WebhookDelivery(
                    event: Nullable<String>.value("payment.succeeded"),
                    id: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                    replayedFrom: Nullable<String>.value("whdel_MTcwMDAwMDAwMDAwMHx0ZXN0"),
                    requestBody: [
                        "data": JSONValue.object(
                            [
                                "id": JSONValue.string("pay_123")
                            ]
                        ), 
                        "id": JSONValue.string("msg_original"), 
                        "type": JSONValue.string("payment.succeeded")
                    ],
                    resourceId: "pay_123",
                    responseBody: Nullable<[String: JSONValue]>.value([
                        "ok": JSONValue.bool(true)
                    ]),
                    responseCode: 200,
                    sentAt: "2026-01-01T12:00:00.000Z",
                    status: WebhookDeliveryStatus.success,
                    success: true,
                    totalTime: 0.31
                )
            ],
            pageInfo: ListDeliveriesWebhooksResponsePageInfo(
                endCursor: Nullable<String>.value("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--xxxxxxxxxxxxxxxx--xxxxxxxxxxxxxxxxxxxxxx"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.webhooks.listDeliveries(
            id: "id",
            resourceId: "pay_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func replayDelivery1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "body": "OK",
                  "status": 200,
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
        let expectedResponse = ReplayDeliveryWebhooksResponse(
            body: "OK",
            status: 200,
            success: true
        )
        let response = try await client.webhooks.replayDelivery(
            id: "id",
            deliveryId: "delivery_id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func replay1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "queued": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ReplayWebhooksResponse(
            queued: true
        )
        let response = try await client.webhooks.replay(
            id: "id",
            request: .init(sentAfter: "2026-01-01T12:00:00.000Z"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func test1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "body": "OK",
                  "status": 200,
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
        let expectedResponse = TestWebhooksResponse(
            body: JSONValue.string("OK"),
            status: 200,
            success: true
        )
        let response = try await client.webhooks.test(
            id: "id",
            request: .init(event: "payment.succeeded"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}