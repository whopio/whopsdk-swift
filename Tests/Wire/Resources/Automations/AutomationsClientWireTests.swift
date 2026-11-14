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

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "account_id",
                      "active_enrollments_count": 1,
                      "created_at": "created_at",
                      "created_by_actor": {
                        "id": "id",
                        "object": "user"
                      },
                      "draft_version": 1,
                      "has_unpublished_changes": true,
                      "id": "id",
                      "name": "name",
                      "published_at": "published_at",
                      "published_by_actor": {
                        "id": "id",
                        "object": "user"
                      },
                      "published_version": 1,
                      "secret_names": [
                        "secret_names",
                        "secret_names"
                      ],
                      "status": "active",
                      "total_enrollments_count": 1,
                      "trigger_event": "payment.succeeded",
                      "updated_at": "updated_at"
                    },
                    {
                      "account_id": "account_id",
                      "active_enrollments_count": 1,
                      "created_at": "created_at",
                      "created_by_actor": {
                        "id": "id",
                        "object": "user"
                      },
                      "draft_version": 1,
                      "has_unpublished_changes": true,
                      "id": "id",
                      "name": "name",
                      "published_at": "published_at",
                      "published_by_actor": {
                        "id": "id",
                        "object": "user"
                      },
                      "published_version": 1,
                      "secret_names": [
                        "secret_names",
                        "secret_names"
                      ],
                      "status": "active",
                      "total_enrollments_count": 1,
                      "trigger_event": "payment.succeeded",
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
        let expectedResponse = ListAutomationsResponse(
            data: [
                Automation(
                    accountId: "account_id",
                    activeEnrollmentsCount: 1,
                    createdAt: "created_at",
                    createdByActor: AutomationActor(
                        id: "id",
                        object: AutomationActorObject.user
                    ),
                    draftVersion: 1,
                    hasUnpublishedChanges: true,
                    id: "id",
                    name: "name",
                    publishedAt: Nullable<String>.value("published_at"),
                    publishedByActor: Nullable<AutomationActor>.value(AutomationActor(
                        id: "id",
                        object: AutomationActorObject.user
                    )),
                    publishedVersion: Nullable<Int>.value(1),
                    secretNames: [
                        "secret_names",
                        "secret_names"
                    ],
                    status: AutomationStatus.active,
                    totalEnrollmentsCount: 1,
                    triggerEvent: Nullable<AutomationTriggerEvent>.value(AutomationTriggerEvent.paymentSucceeded),
                    updatedAt: "updated_at"
                ),
                Automation(
                    accountId: "account_id",
                    activeEnrollmentsCount: 1,
                    createdAt: "created_at",
                    createdByActor: AutomationActor(
                        id: "id",
                        object: AutomationActorObject.user
                    ),
                    draftVersion: 1,
                    hasUnpublishedChanges: true,
                    id: "id",
                    name: "name",
                    publishedAt: Nullable<String>.value("published_at"),
                    publishedByActor: Nullable<AutomationActor>.value(AutomationActor(
                        id: "id",
                        object: AutomationActorObject.user
                    )),
                    publishedVersion: Nullable<Int>.value(1),
                    secretNames: [
                        "secret_names",
                        "secret_names"
                    ],
                    status: AutomationStatus.active,
                    totalEnrollmentsCount: 1,
                    triggerEvent: Nullable<AutomationTriggerEvent>.value(AutomationTriggerEvent.paymentSucceeded),
                    updatedAt: "updated_at"
                )
            ],
            pageInfo: ListAutomationsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
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

    @Test func create2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "active_enrollments_count": 1,
                  "created_at": "created_at",
                  "created_by_actor": {
                    "id": "id",
                    "object": "user"
                  },
                  "draft_version": 1,
                  "has_unpublished_changes": true,
                  "id": "id",
                  "name": "name",
                  "published_at": "published_at",
                  "published_by_actor": {
                    "id": "id",
                    "object": "user"
                  },
                  "published_version": 1,
                  "secret_names": [
                    "secret_names",
                    "secret_names"
                  ],
                  "status": "active",
                  "total_enrollments_count": 1,
                  "trigger_event": "payment.succeeded",
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
        let expectedResponse = Automation(
            accountId: "account_id",
            activeEnrollmentsCount: 1,
            createdAt: "created_at",
            createdByActor: AutomationActor(
                id: "id",
                object: AutomationActorObject.user
            ),
            draftVersion: 1,
            hasUnpublishedChanges: true,
            id: "id",
            name: "name",
            publishedAt: Nullable<String>.value("published_at"),
            publishedByActor: Nullable<AutomationActor>.value(AutomationActor(
                id: "id",
                object: AutomationActorObject.user
            )),
            publishedVersion: Nullable<Int>.value(1),
            secretNames: [
                "secret_names",
                "secret_names"
            ],
            status: AutomationStatus.active,
            totalEnrollmentsCount: 1,
            triggerEvent: Nullable<AutomationTriggerEvent>.value(AutomationTriggerEvent.paymentSucceeded),
            updatedAt: "updated_at"
        )
        let response = try await client.automations.create(
            request: .init(name: "name"),
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

    @Test func retrieve2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "active_enrollments_count": 1,
                  "created_at": "created_at",
                  "created_by_actor": {
                    "id": "id",
                    "object": "user"
                  },
                  "draft_version": 1,
                  "has_unpublished_changes": true,
                  "id": "id",
                  "name": "name",
                  "published_at": "published_at",
                  "published_by_actor": {
                    "id": "id",
                    "object": "user"
                  },
                  "published_version": 1,
                  "secret_names": [
                    "secret_names",
                    "secret_names"
                  ],
                  "status": "active",
                  "total_enrollments_count": 1,
                  "trigger_event": "payment.succeeded",
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
        let expectedResponse = Automation(
            accountId: "account_id",
            activeEnrollmentsCount: 1,
            createdAt: "created_at",
            createdByActor: AutomationActor(
                id: "id",
                object: AutomationActorObject.user
            ),
            draftVersion: 1,
            hasUnpublishedChanges: true,
            id: "id",
            name: "name",
            publishedAt: Nullable<String>.value("published_at"),
            publishedByActor: Nullable<AutomationActor>.value(AutomationActor(
                id: "id",
                object: AutomationActorObject.user
            )),
            publishedVersion: Nullable<Int>.value(1),
            secretNames: [
                "secret_names",
                "secret_names"
            ],
            status: AutomationStatus.active,
            totalEnrollmentsCount: 1,
            triggerEvent: Nullable<AutomationTriggerEvent>.value(AutomationTriggerEvent.paymentSucceeded),
            updatedAt: "updated_at"
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

    @Test func delete2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "active_enrollments_count": 1,
                  "created_at": "created_at",
                  "created_by_actor": {
                    "id": "id",
                    "object": "user"
                  },
                  "draft_version": 1,
                  "has_unpublished_changes": true,
                  "id": "id",
                  "name": "name",
                  "published_at": "published_at",
                  "published_by_actor": {
                    "id": "id",
                    "object": "user"
                  },
                  "published_version": 1,
                  "secret_names": [
                    "secret_names",
                    "secret_names"
                  ],
                  "status": "active",
                  "total_enrollments_count": 1,
                  "trigger_event": "payment.succeeded",
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
        let expectedResponse = Automation(
            accountId: "account_id",
            activeEnrollmentsCount: 1,
            createdAt: "created_at",
            createdByActor: AutomationActor(
                id: "id",
                object: AutomationActorObject.user
            ),
            draftVersion: 1,
            hasUnpublishedChanges: true,
            id: "id",
            name: "name",
            publishedAt: Nullable<String>.value("published_at"),
            publishedByActor: Nullable<AutomationActor>.value(AutomationActor(
                id: "id",
                object: AutomationActorObject.user
            )),
            publishedVersion: Nullable<Int>.value(1),
            secretNames: [
                "secret_names",
                "secret_names"
            ],
            status: AutomationStatus.active,
            totalEnrollmentsCount: 1,
            triggerEvent: Nullable<AutomationTriggerEvent>.value(AutomationTriggerEvent.paymentSucceeded),
            updatedAt: "updated_at"
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

    @Test func update2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "active_enrollments_count": 1,
                  "created_at": "created_at",
                  "created_by_actor": {
                    "id": "id",
                    "object": "user"
                  },
                  "draft_version": 1,
                  "has_unpublished_changes": true,
                  "id": "id",
                  "name": "name",
                  "published_at": "published_at",
                  "published_by_actor": {
                    "id": "id",
                    "object": "user"
                  },
                  "published_version": 1,
                  "secret_names": [
                    "secret_names",
                    "secret_names"
                  ],
                  "status": "active",
                  "total_enrollments_count": 1,
                  "trigger_event": "payment.succeeded",
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
        let expectedResponse = Automation(
            accountId: "account_id",
            activeEnrollmentsCount: 1,
            createdAt: "created_at",
            createdByActor: AutomationActor(
                id: "id",
                object: AutomationActorObject.user
            ),
            draftVersion: 1,
            hasUnpublishedChanges: true,
            id: "id",
            name: "name",
            publishedAt: Nullable<String>.value("published_at"),
            publishedByActor: Nullable<AutomationActor>.value(AutomationActor(
                id: "id",
                object: AutomationActorObject.user
            )),
            publishedVersion: Nullable<Int>.value(1),
            secretNames: [
                "secret_names",
                "secret_names"
            ],
            status: AutomationStatus.active,
            totalEnrollmentsCount: 1,
            triggerEvent: Nullable<AutomationTriggerEvent>.value(AutomationTriggerEvent.paymentSucceeded),
            updatedAt: "updated_at"
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

    @Test func publish2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "active_enrollments_count": 1,
                  "created_at": "created_at",
                  "created_by_actor": {
                    "id": "id",
                    "object": "user"
                  },
                  "draft_version": 1,
                  "has_unpublished_changes": true,
                  "id": "id",
                  "name": "name",
                  "published_at": "published_at",
                  "published_by_actor": {
                    "id": "id",
                    "object": "user"
                  },
                  "published_version": 1,
                  "secret_names": [
                    "secret_names",
                    "secret_names"
                  ],
                  "status": "active",
                  "total_enrollments_count": 1,
                  "trigger_event": "payment.succeeded",
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
        let expectedResponse = Automation(
            accountId: "account_id",
            activeEnrollmentsCount: 1,
            createdAt: "created_at",
            createdByActor: AutomationActor(
                id: "id",
                object: AutomationActorObject.user
            ),
            draftVersion: 1,
            hasUnpublishedChanges: true,
            id: "id",
            name: "name",
            publishedAt: Nullable<String>.value("published_at"),
            publishedByActor: Nullable<AutomationActor>.value(AutomationActor(
                id: "id",
                object: AutomationActorObject.user
            )),
            publishedVersion: Nullable<Int>.value(1),
            secretNames: [
                "secret_names",
                "secret_names"
            ],
            status: AutomationStatus.active,
            totalEnrollmentsCount: 1,
            triggerEvent: Nullable<AutomationTriggerEvent>.value(AutomationTriggerEvent.paymentSucceeded),
            updatedAt: "updated_at"
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

    @Test func trigger2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "active_enrollments_count": 1,
                  "created_at": "created_at",
                  "created_by_actor": {
                    "id": "id",
                    "object": "user"
                  },
                  "draft_version": 1,
                  "has_unpublished_changes": true,
                  "id": "id",
                  "name": "name",
                  "published_at": "published_at",
                  "published_by_actor": {
                    "id": "id",
                    "object": "user"
                  },
                  "published_version": 1,
                  "secret_names": [
                    "secret_names",
                    "secret_names"
                  ],
                  "status": "active",
                  "total_enrollments_count": 1,
                  "trigger_event": "payment.succeeded",
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
        let expectedResponse = Automation(
            accountId: "account_id",
            activeEnrollmentsCount: 1,
            createdAt: "created_at",
            createdByActor: AutomationActor(
                id: "id",
                object: AutomationActorObject.user
            ),
            draftVersion: 1,
            hasUnpublishedChanges: true,
            id: "id",
            name: "name",
            publishedAt: Nullable<String>.value("published_at"),
            publishedByActor: Nullable<AutomationActor>.value(AutomationActor(
                id: "id",
                object: AutomationActorObject.user
            )),
            publishedVersion: Nullable<Int>.value(1),
            secretNames: [
                "secret_names",
                "secret_names"
            ],
            status: AutomationStatus.active,
            totalEnrollmentsCount: 1,
            triggerEvent: Nullable<AutomationTriggerEvent>.value(AutomationTriggerEvent.paymentSucceeded),
            updatedAt: "updated_at"
        )
        let response = try await client.automations.trigger(
            id: "id",
            request: .init(members: TriggerAutomationsRequestMembers.stringArray(
                [
                    "members",
                    "members"
                ]
            )),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}