import Foundation
import Testing
import WhopSDK

@Suite("PreferencesNotificationsClient Wire Tests") struct PreferencesNotificationsClientWireTests {
    @Test func set1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "level": "all",
                      "object": "notification_preference",
                      "scope": {
                        "account_id": "biz_xxxxxxxxxxxxxx",
                        "channel": null,
                        "experience_id": "exp_xxxxxxxxxxxxxx",
                        "team_account_id": "biz_xxxxxxxxxxxxxx",
                        "topic_id": "topic_xxxxxxxxxxxxxx"
                      }
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
        let expectedResponse = SetNotificationsResponse(
            data: [
                NotificationPreferenceState(
                    level: Nullable<NotificationPreferenceStateLevel>.value(NotificationPreferenceStateLevel.all),
                    object: NotificationPreferenceStateObject.notificationPreference,
                    scope: NotificationPreferenceScope(
                        accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                        channel: .null,
                        experienceId: Nullable<String>.value("exp_xxxxxxxxxxxxxx"),
                        teamAccountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                        topicId: Nullable<String>.value("topic_xxxxxxxxxxxxxx")
                    )
                )
            ]
        )
        let response = try await client.users.preferences.notifications.set(
            request: .init(preferences: [
                SetNotificationsRequestPreferencesItem(
                    level: .null,
                    scope: SetNotificationsRequestPreferencesItemScope(

                    )
                )
            ]),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func set2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "level": "all",
                      "object": "notification_preference",
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
                      "object": "notification_preference",
                      "scope": {
                        "account_id": "account_id",
                        "channel": "in_app",
                        "experience_id": "experience_id",
                        "team_account_id": "team_account_id",
                        "topic_id": "topic_id"
                      }
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
        let expectedResponse = SetNotificationsResponse(
            data: [
                NotificationPreferenceState(
                    level: Nullable<NotificationPreferenceStateLevel>.value(NotificationPreferenceStateLevel.all),
                    object: NotificationPreferenceStateObject.notificationPreference,
                    scope: NotificationPreferenceScope(
                        accountId: Nullable<String>.value("account_id"),
                        channel: Nullable<NotificationPreferenceScopeChannel>.value(NotificationPreferenceScopeChannel.inApp),
                        experienceId: Nullable<String>.value("experience_id"),
                        teamAccountId: Nullable<String>.value("team_account_id"),
                        topicId: Nullable<String>.value("topic_id")
                    )
                ),
                NotificationPreferenceState(
                    level: Nullable<NotificationPreferenceStateLevel>.value(NotificationPreferenceStateLevel.all),
                    object: NotificationPreferenceStateObject.notificationPreference,
                    scope: NotificationPreferenceScope(
                        accountId: Nullable<String>.value("account_id"),
                        channel: Nullable<NotificationPreferenceScopeChannel>.value(NotificationPreferenceScopeChannel.inApp),
                        experienceId: Nullable<String>.value("experience_id"),
                        teamAccountId: Nullable<String>.value("team_account_id"),
                        topicId: Nullable<String>.value("topic_id")
                    )
                )
            ]
        )
        let response = try await client.users.preferences.notifications.set(
            request: .init(preferences: [
                SetNotificationsRequestPreferencesItem(
                    level: .null,
                    scope: SetNotificationsRequestPreferencesItemScope(

                    )
                ),
                SetNotificationsRequestPreferencesItem(
                    level: .null,
                    scope: SetNotificationsRequestPreferencesItemScope(

                    )
                )
            ]),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}