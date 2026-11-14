import Foundation
import Testing
import WhopSDK

@Suite("NotificationsExperiencesClient Wire Tests") struct NotificationsExperiencesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "level": "all",
                      "object": "experience_notification_preference",
                      "scope": {
                        "account_id": "biz_xxxxxxxxxxxxxx",
                        "channel": null,
                        "experience_id": "exp_xxxxxxxxxxxxxx",
                        "team_account_id": "biz_xxxxxxxxxxxxxx",
                        "topic_id": "topic_xxxxxxxxxxxxxx"
                      }
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
        let expectedResponse = ListExperiencesResponseType(
            data: [
                ExperienceNotificationPreference(
                    level: ExperienceNotificationPreferenceLevel.all,
                    object: ExperienceNotificationPreferenceObject.experienceNotificationPreference,
                    scope: NotificationPreferenceScope(
                        accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                        channel: .null,
                        experienceId: Nullable<String>.value("exp_xxxxxxxxxxxxxx"),
                        teamAccountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                        topicId: Nullable<String>.value("topic_xxxxxxxxxxxxxx")
                    )
                )
            ],
            pageInfo: ListExperiencesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.users.preferences.notifications.experiences.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "level": "all",
                      "object": "experience_notification_preference",
                      "scope": {
                        "account_id": "account_id",
                        "channel": "in_app",
                        "experience_id": "experience_id",
                        "team_account_id": "team_account_id",
                        "topic_id": "topic_id"
                      }
                    },
                    {
                      "level": "all",
                      "object": "experience_notification_preference",
                      "scope": {
                        "account_id": "account_id",
                        "channel": "in_app",
                        "experience_id": "experience_id",
                        "team_account_id": "team_account_id",
                        "topic_id": "topic_id"
                      }
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
        let expectedResponse = ListExperiencesResponseType(
            data: [
                ExperienceNotificationPreference(
                    level: ExperienceNotificationPreferenceLevel.all,
                    object: ExperienceNotificationPreferenceObject.experienceNotificationPreference,
                    scope: NotificationPreferenceScope(
                        accountId: Nullable<String>.value("account_id"),
                        channel: Nullable<NotificationPreferenceScopeChannel>.value(NotificationPreferenceScopeChannel.inApp),
                        experienceId: Nullable<String>.value("experience_id"),
                        teamAccountId: Nullable<String>.value("team_account_id"),
                        topicId: Nullable<String>.value("topic_id")
                    )
                ),
                ExperienceNotificationPreference(
                    level: ExperienceNotificationPreferenceLevel.all,
                    object: ExperienceNotificationPreferenceObject.experienceNotificationPreference,
                    scope: NotificationPreferenceScope(
                        accountId: Nullable<String>.value("account_id"),
                        channel: Nullable<NotificationPreferenceScopeChannel>.value(NotificationPreferenceScopeChannel.inApp),
                        experienceId: Nullable<String>.value("experience_id"),
                        teamAccountId: Nullable<String>.value("team_account_id"),
                        topicId: Nullable<String>.value("topic_id")
                    )
                )
            ],
            pageInfo: ListExperiencesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.users.preferences.notifications.experiences.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }
}