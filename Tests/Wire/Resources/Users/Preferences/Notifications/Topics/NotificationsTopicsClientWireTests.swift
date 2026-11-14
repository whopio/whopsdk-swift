import Foundation
import Testing
import WhopSDK

@Suite("NotificationsTopicsClient Wire Tests") struct NotificationsTopicsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "id": "unpf_xxxxxxxxxxxxxx",
                      "level": "all",
                      "object": "notification_preference",
                      "scope": {
                        "account_id": "biz_xxxxxxxxxxxxxx",
                        "channel": null,
                        "experience_id": "exp_xxxxxxxxxxxxxx",
                        "team_account_id": "biz_xxxxxxxxxxxxxx",
                        "topic_id": "topic_xxxxxxxxxxxxxx"
                      },
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
        let expectedResponse = ListTopicsResponseType(
            data: [
                UserNotificationPreference(
                    createdAt: "2026-01-01T12:00:00.000Z",
                    id: "unpf_xxxxxxxxxxxxxx",
                    level: UserNotificationPreferenceLevel.all,
                    object: UserNotificationPreferenceObject.notificationPreference,
                    scope: NotificationPreferenceScope(
                        accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                        channel: .null,
                        experienceId: Nullable<String>.value("exp_xxxxxxxxxxxxxx"),
                        teamAccountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                        topicId: Nullable<String>.value("topic_xxxxxxxxxxxxxx")
                    ),
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListTopicsResponsePageInfoType(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.users.preferences.notifications.topics.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "created_at": "created_at",
                      "id": "id",
                      "level": "all",
                      "object": "notification_preference",
                      "scope": {
                        "account_id": "account_id",
                        "channel": "in_app",
                        "experience_id": "experience_id",
                        "team_account_id": "team_account_id",
                        "topic_id": "topic_id"
                      },
                      "updated_at": "updated_at"
                    },
                    {
                      "created_at": "created_at",
                      "id": "id",
                      "level": "all",
                      "object": "notification_preference",
                      "scope": {
                        "account_id": "account_id",
                        "channel": "in_app",
                        "experience_id": "experience_id",
                        "team_account_id": "team_account_id",
                        "topic_id": "topic_id"
                      },
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
        let expectedResponse = ListTopicsResponseType(
            data: [
                UserNotificationPreference(
                    createdAt: "created_at",
                    id: "id",
                    level: UserNotificationPreferenceLevel.all,
                    object: UserNotificationPreferenceObject.notificationPreference,
                    scope: NotificationPreferenceScope(
                        accountId: Nullable<String>.value("account_id"),
                        channel: Nullable<NotificationPreferenceScopeChannel>.value(NotificationPreferenceScopeChannel.inApp),
                        experienceId: Nullable<String>.value("experience_id"),
                        teamAccountId: Nullable<String>.value("team_account_id"),
                        topicId: Nullable<String>.value("topic_id")
                    ),
                    updatedAt: "updated_at"
                ),
                UserNotificationPreference(
                    createdAt: "created_at",
                    id: "id",
                    level: UserNotificationPreferenceLevel.all,
                    object: UserNotificationPreferenceObject.notificationPreference,
                    scope: NotificationPreferenceScope(
                        accountId: Nullable<String>.value("account_id"),
                        channel: Nullable<NotificationPreferenceScopeChannel>.value(NotificationPreferenceScopeChannel.inApp),
                        experienceId: Nullable<String>.value("experience_id"),
                        teamAccountId: Nullable<String>.value("team_account_id"),
                        topicId: Nullable<String>.value("topic_id")
                    ),
                    updatedAt: "updated_at"
                )
            ],
            pageInfo: ListTopicsResponsePageInfoType(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.users.preferences.notifications.topics.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }
}