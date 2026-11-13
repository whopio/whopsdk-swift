import Foundation
import Testing
import WhopSDK

@Suite("AutomationEnrollmentsClient Wire Tests") struct AutomationEnrollmentsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "automation_id": "ato_xxxxxxxxxxxxxx",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "ended_at": "2026-01-01T12:00:00.000Z",
                      "id": "atoe_xxxxxxxxxxxxxx",
                      "member_id": "mber_xxxxxxxxxxxxxx",
                      "next_run_at": "2026-01-01T12:00:00.000Z",
                      "next_step_id": "atos_xxxxxxxxxxxxxx",
                      "next_step_key": 1,
                      "status": "active",
                      "trigger_event": "payment.succeeded",
                      "trigger_resource_id": "mber_xxxxxxxxxxxxxx",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "user_id": "user_xxxxxxxxxxxxxx",
                      "version": 1
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
        let expectedResponse = ListAutomationEnrollmentsResponse(
            data: [
                AutomationEnrollment(
                    accountId: "biz_xxxxxxxxxxxxxx",
                    automationId: "ato_xxxxxxxxxxxxxx",
                    createdAt: "2026-01-01T12:00:00.000Z",
                    endedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    id: "atoe_xxxxxxxxxxxxxx",
                    memberId: "mber_xxxxxxxxxxxxxx",
                    nextRunAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    nextStepId: Nullable<String>.value("atos_xxxxxxxxxxxxxx"),
                    nextStepKey: Nullable<Int>.value(1),
                    status: AutomationEnrollmentStatus.active,
                    triggerEvent: Nullable<AutomationEnrollmentTriggerEvent>.value(AutomationEnrollmentTriggerEvent.paymentSucceeded),
                    triggerResourceId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                    version: 1
                )
            ],
            pageInfo: ListAutomationEnrollmentsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.automationEnrollments.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "automation_id": "ato_xxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "ended_at": "2026-01-01T12:00:00.000Z",
                  "id": "atoe_xxxxxxxxxxxxxx",
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "next_run_at": "2026-01-01T12:00:00.000Z",
                  "next_step_id": "atos_xxxxxxxxxxxxxx",
                  "next_step_key": 1,
                  "status": "active",
                  "trigger_event": "payment.succeeded",
                  "trigger_resource_id": "mber_xxxxxxxxxxxxxx",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_xxxxxxxxxxxxxx",
                  "version": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AutomationEnrollment(
            accountId: "biz_xxxxxxxxxxxxxx",
            automationId: "ato_xxxxxxxxxxxxxx",
            createdAt: "2026-01-01T12:00:00.000Z",
            endedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "atoe_xxxxxxxxxxxxxx",
            memberId: "mber_xxxxxxxxxxxxxx",
            nextRunAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            nextStepId: Nullable<String>.value("atos_xxxxxxxxxxxxxx"),
            nextStepKey: Nullable<Int>.value(1),
            status: AutomationEnrollmentStatus.active,
            triggerEvent: Nullable<AutomationEnrollmentTriggerEvent>.value(AutomationEnrollmentTriggerEvent.paymentSucceeded),
            triggerResourceId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
            version: 1
        )
        let response = try await client.automationEnrollments.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func cancel1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "automation_id": "ato_xxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "ended_at": "2026-01-01T12:00:00.000Z",
                  "id": "atoe_xxxxxxxxxxxxxx",
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "next_run_at": "2026-01-01T12:00:00.000Z",
                  "next_step_id": "atos_xxxxxxxxxxxxxx",
                  "next_step_key": 1,
                  "status": "active",
                  "trigger_event": "payment.succeeded",
                  "trigger_resource_id": "mber_xxxxxxxxxxxxxx",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_xxxxxxxxxxxxxx",
                  "version": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AutomationEnrollment(
            accountId: "biz_xxxxxxxxxxxxxx",
            automationId: "ato_xxxxxxxxxxxxxx",
            createdAt: "2026-01-01T12:00:00.000Z",
            endedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "atoe_xxxxxxxxxxxxxx",
            memberId: "mber_xxxxxxxxxxxxxx",
            nextRunAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            nextStepId: Nullable<String>.value("atos_xxxxxxxxxxxxxx"),
            nextStepKey: Nullable<Int>.value(1),
            status: AutomationEnrollmentStatus.active,
            triggerEvent: Nullable<AutomationEnrollmentTriggerEvent>.value(AutomationEnrollmentTriggerEvent.paymentSucceeded),
            triggerResourceId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
            version: 1
        )
        let response = try await client.automationEnrollments.cancel(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}