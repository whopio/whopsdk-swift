import Foundation
import Testing
import WhopSDK

@Suite("AutomationsClient Wire Tests") struct AutomationsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "active_enrollments_count": 0,
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "created_by_actor": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "object": "user"
                      },
                      "draft_version": 2,
                      "has_unpublished_changes": false,
                      "id": "ato_xxxxxxxxxxxxxx",
                      "name": "After an order",
                      "published_at": "2026-01-01T12:00:00.000Z",
                      "published_by_actor": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "object": "user"
                      },
                      "published_version": 1,
                      "secret_names": [
                        "SHOP_TOKEN"
                      ],
                      "status": "active",
                      "total_enrollments_count": 0,
                      "trigger_event": "payment.succeeded",
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
        let expectedResponse = ListAutomationsResponse(
            data: [
                Automation(
                    accountId: "biz_xxxxxxxxxxxxxx",
                    activeEnrollmentsCount: 0,
                    createdAt: "2026-01-01T12:00:00.000Z",
                    createdByActor: AutomationActor(
                        id: "biz_xxxxxxxxxxxxxx",
                        object: AutomationActorObject.user
                    ),
                    draftVersion: 2,
                    hasUnpublishedChanges: false,
                    id: "ato_xxxxxxxxxxxxxx",
                    name: "After an order",
                    publishedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    publishedByActor: Nullable<AutomationActor>.value(AutomationActor(
                        id: "biz_xxxxxxxxxxxxxx",
                        object: AutomationActorObject.user
                    )),
                    publishedVersion: Nullable<Int>.value(1),
                    secretNames: [
                        "SHOP_TOKEN"
                    ],
                    status: AutomationStatus.active,
                    totalEnrollmentsCount: 0,
                    triggerEvent: Nullable<AutomationTriggerEvent>.value(AutomationTriggerEvent.paymentSucceeded),
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListAutomationsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.automations.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "active_enrollments_count": 0,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "created_by_actor": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "object": "user"
                  },
                  "draft_version": 2,
                  "has_unpublished_changes": false,
                  "id": "ato_xxxxxxxxxxxxxx",
                  "name": "After an order",
                  "published_at": "2026-01-01T12:00:00.000Z",
                  "published_by_actor": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "object": "user"
                  },
                  "published_version": 1,
                  "secret_names": [
                    "SHOP_TOKEN"
                  ],
                  "status": "active",
                  "total_enrollments_count": 0,
                  "trigger_event": "payment.succeeded",
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
        let expectedResponse = Automation(
            accountId: "biz_xxxxxxxxxxxxxx",
            activeEnrollmentsCount: 0,
            createdAt: "2026-01-01T12:00:00.000Z",
            createdByActor: AutomationActor(
                id: "biz_xxxxxxxxxxxxxx",
                object: AutomationActorObject.user
            ),
            draftVersion: 2,
            hasUnpublishedChanges: false,
            id: "ato_xxxxxxxxxxxxxx",
            name: "After an order",
            publishedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            publishedByActor: Nullable<AutomationActor>.value(AutomationActor(
                id: "biz_xxxxxxxxxxxxxx",
                object: AutomationActorObject.user
            )),
            publishedVersion: Nullable<Int>.value(1),
            secretNames: [
                "SHOP_TOKEN"
            ],
            status: AutomationStatus.active,
            totalEnrollmentsCount: 0,
            triggerEvent: Nullable<AutomationTriggerEvent>.value(AutomationTriggerEvent.paymentSucceeded),
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.automations.create(
            request: .init(name: "Welcome"),
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "active_enrollments_count": 0,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "created_by_actor": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "object": "user"
                  },
                  "draft_version": 2,
                  "has_unpublished_changes": false,
                  "id": "ato_xxxxxxxxxxxxxx",
                  "name": "After an order",
                  "published_at": "2026-01-01T12:00:00.000Z",
                  "published_by_actor": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "object": "user"
                  },
                  "published_version": 1,
                  "secret_names": [
                    "SHOP_TOKEN"
                  ],
                  "status": "active",
                  "total_enrollments_count": 0,
                  "trigger_event": "payment.succeeded",
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
        let expectedResponse = Automation(
            accountId: "biz_xxxxxxxxxxxxxx",
            activeEnrollmentsCount: 0,
            createdAt: "2026-01-01T12:00:00.000Z",
            createdByActor: AutomationActor(
                id: "biz_xxxxxxxxxxxxxx",
                object: AutomationActorObject.user
            ),
            draftVersion: 2,
            hasUnpublishedChanges: false,
            id: "ato_xxxxxxxxxxxxxx",
            name: "After an order",
            publishedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            publishedByActor: Nullable<AutomationActor>.value(AutomationActor(
                id: "biz_xxxxxxxxxxxxxx",
                object: AutomationActorObject.user
            )),
            publishedVersion: Nullable<Int>.value(1),
            secretNames: [
                "SHOP_TOKEN"
            ],
            status: AutomationStatus.active,
            totalEnrollmentsCount: 0,
            triggerEvent: Nullable<AutomationTriggerEvent>.value(AutomationTriggerEvent.paymentSucceeded),
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.automations.retrieve(
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "active_enrollments_count": 0,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "created_by_actor": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "object": "user"
                  },
                  "draft_version": 2,
                  "has_unpublished_changes": false,
                  "id": "ato_xxxxxxxxxxxxxx",
                  "name": "After an order",
                  "published_at": "2026-01-01T12:00:00.000Z",
                  "published_by_actor": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "object": "user"
                  },
                  "published_version": 1,
                  "secret_names": [
                    "SHOP_TOKEN"
                  ],
                  "status": "active",
                  "total_enrollments_count": 0,
                  "trigger_event": "payment.succeeded",
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
        let expectedResponse = Automation(
            accountId: "biz_xxxxxxxxxxxxxx",
            activeEnrollmentsCount: 0,
            createdAt: "2026-01-01T12:00:00.000Z",
            createdByActor: AutomationActor(
                id: "biz_xxxxxxxxxxxxxx",
                object: AutomationActorObject.user
            ),
            draftVersion: 2,
            hasUnpublishedChanges: false,
            id: "ato_xxxxxxxxxxxxxx",
            name: "After an order",
            publishedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            publishedByActor: Nullable<AutomationActor>.value(AutomationActor(
                id: "biz_xxxxxxxxxxxxxx",
                object: AutomationActorObject.user
            )),
            publishedVersion: Nullable<Int>.value(1),
            secretNames: [
                "SHOP_TOKEN"
            ],
            status: AutomationStatus.active,
            totalEnrollmentsCount: 0,
            triggerEvent: Nullable<AutomationTriggerEvent>.value(AutomationTriggerEvent.paymentSucceeded),
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.automations.delete(
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
                  "active_enrollments_count": 0,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "created_by_actor": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "object": "user"
                  },
                  "draft_version": 2,
                  "has_unpublished_changes": false,
                  "id": "ato_xxxxxxxxxxxxxx",
                  "name": "After an order",
                  "published_at": "2026-01-01T12:00:00.000Z",
                  "published_by_actor": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "object": "user"
                  },
                  "published_version": 1,
                  "secret_names": [
                    "SHOP_TOKEN"
                  ],
                  "status": "active",
                  "total_enrollments_count": 0,
                  "trigger_event": "payment.succeeded",
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
        let expectedResponse = Automation(
            accountId: "biz_xxxxxxxxxxxxxx",
            activeEnrollmentsCount: 0,
            createdAt: "2026-01-01T12:00:00.000Z",
            createdByActor: AutomationActor(
                id: "biz_xxxxxxxxxxxxxx",
                object: AutomationActorObject.user
            ),
            draftVersion: 2,
            hasUnpublishedChanges: false,
            id: "ato_xxxxxxxxxxxxxx",
            name: "After an order",
            publishedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            publishedByActor: Nullable<AutomationActor>.value(AutomationActor(
                id: "biz_xxxxxxxxxxxxxx",
                object: AutomationActorObject.user
            )),
            publishedVersion: Nullable<Int>.value(1),
            secretNames: [
                "SHOP_TOKEN"
            ],
            status: AutomationStatus.active,
            totalEnrollmentsCount: 0,
            triggerEvent: Nullable<AutomationTriggerEvent>.value(AutomationTriggerEvent.paymentSucceeded),
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.automations.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func publish1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "active_enrollments_count": 0,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "created_by_actor": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "object": "user"
                  },
                  "draft_version": 2,
                  "has_unpublished_changes": false,
                  "id": "ato_xxxxxxxxxxxxxx",
                  "name": "After an order",
                  "published_at": "2026-01-01T12:00:00.000Z",
                  "published_by_actor": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "object": "user"
                  },
                  "published_version": 1,
                  "secret_names": [
                    "SHOP_TOKEN"
                  ],
                  "status": "active",
                  "total_enrollments_count": 0,
                  "trigger_event": "payment.succeeded",
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
        let expectedResponse = Automation(
            accountId: "biz_xxxxxxxxxxxxxx",
            activeEnrollmentsCount: 0,
            createdAt: "2026-01-01T12:00:00.000Z",
            createdByActor: AutomationActor(
                id: "biz_xxxxxxxxxxxxxx",
                object: AutomationActorObject.user
            ),
            draftVersion: 2,
            hasUnpublishedChanges: false,
            id: "ato_xxxxxxxxxxxxxx",
            name: "After an order",
            publishedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            publishedByActor: Nullable<AutomationActor>.value(AutomationActor(
                id: "biz_xxxxxxxxxxxxxx",
                object: AutomationActorObject.user
            )),
            publishedVersion: Nullable<Int>.value(1),
            secretNames: [
                "SHOP_TOKEN"
            ],
            status: AutomationStatus.active,
            totalEnrollmentsCount: 0,
            triggerEvent: Nullable<AutomationTriggerEvent>.value(AutomationTriggerEvent.paymentSucceeded),
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.automations.publish(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func trigger1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "active_enrollments_count": 0,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "created_by_actor": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "object": "user"
                  },
                  "draft_version": 2,
                  "has_unpublished_changes": false,
                  "id": "ato_xxxxxxxxxxxxxx",
                  "name": "After an order",
                  "published_at": "2026-01-01T12:00:00.000Z",
                  "published_by_actor": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "object": "user"
                  },
                  "published_version": 1,
                  "secret_names": [
                    "SHOP_TOKEN"
                  ],
                  "status": "active",
                  "total_enrollments_count": 0,
                  "trigger_event": "payment.succeeded",
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
        let expectedResponse = Automation(
            accountId: "biz_xxxxxxxxxxxxxx",
            activeEnrollmentsCount: 0,
            createdAt: "2026-01-01T12:00:00.000Z",
            createdByActor: AutomationActor(
                id: "biz_xxxxxxxxxxxxxx",
                object: AutomationActorObject.user
            ),
            draftVersion: 2,
            hasUnpublishedChanges: false,
            id: "ato_xxxxxxxxxxxxxx",
            name: "After an order",
            publishedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            publishedByActor: Nullable<AutomationActor>.value(AutomationActor(
                id: "biz_xxxxxxxxxxxxxx",
                object: AutomationActorObject.user
            )),
            publishedVersion: Nullable<Int>.value(1),
            secretNames: [
                "SHOP_TOKEN"
            ],
            status: AutomationStatus.active,
            totalEnrollmentsCount: 0,
            triggerEvent: Nullable<AutomationTriggerEvent>.value(AutomationTriggerEvent.paymentSucceeded),
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.automations.trigger(
            id: "id",
            request: .init(members: TriggerAutomationsRequestMembers.stringArray(
                [
                    "mber_xxxxxxxxxxxxxx"
                ]
            )),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}