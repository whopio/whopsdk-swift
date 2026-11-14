import Foundation
import Testing
import WhopSDK

@Suite("NotificationsClient Wire Tests") struct NotificationsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "route": "shine-time-auto-detailing",
                        "title": "Shine Time Auto Detailing"
                      },
                      "attachment_url": "https://ui-avatars.com/api/",
                      "content": "Tuesday 9:00 AM, Bay 2",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "experience": {
                        "app": {
                          "icon_url": "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg",
                          "id": "app_xxxxxxxxxxxxxx"
                        },
                        "id": "exp_xxxxxxxxxxxxxx",
                        "name": "Bookings"
                      },
                      "id": "ntfr_xxxxxxxxxxxxxx:xxxxxxxxxxxxx",
                      "iframe_link": "https://whopappdomain0000001.apps.whop.com/experiences/exp_xxxxxxxxxxxxxx/bookings/upcoming",
                      "link": "https://whop.com/joined/shine-time-auto-detailing/bookings-xxxxxxxxxxxxxx/app/bookings/upcoming/",
                      "mentions_me": false,
                      "rest_path": "/bookings/upcoming",
                      "sender": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Tanya Cole",
                        "username": "tanyacole"
                      },
                      "subject": "Your ceramic coating is booked",
                      "topic": {
                        "default_preference_value": true,
                        "id": "topic_xxxxxxxxxxxxxx",
                        "is_mention": false,
                        "topic_type": "account"
                      }
                    }
                  ],
                  "page_info": {
                    "end_cursor": "ntfr_xxxxxxxxxxxxxx:xxxxxxxxxxxxx",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "ntfr_xxxxxxxxxxxxxx:xxxxxxxxxxxxx"
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
        let expectedResponse = ListNotificationsResponse(
            data: [
                Notification(
                    account: Nullable<NotificationAccount>.value(NotificationAccount(
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        route: Nullable<String>.value("shine-time-auto-detailing"),
                        title: "Shine Time Auto Detailing"
                    )),
                    attachmentUrl: "https://ui-avatars.com/api/",
                    content: "Tuesday 9:00 AM, Bay 2",
                    createdAt: "2026-01-01T12:00:00.000Z",
                    experience: Nullable<NotificationExperience>.value(NotificationExperience(
                        app: Nullable<NotificationExperienceApp>.value(NotificationExperienceApp(
                            iconUrl: "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg",
                            id: "app_xxxxxxxxxxxxxx"
                        )),
                        id: "exp_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Bookings")
                    )),
                    id: "ntfr_xxxxxxxxxxxxxx:xxxxxxxxxxxxx",
                    iframeLink: Nullable<String>.value("https://whopappdomain0000001.apps.whop.com/experiences/exp_xxxxxxxxxxxxxx/bookings/upcoming"),
                    link: Nullable<String>.value("https://whop.com/joined/shine-time-auto-detailing/bookings-xxxxxxxxxxxxxx/app/bookings/upcoming/"),
                    mentionsMe: false,
                    restPath: Nullable<String>.value("/bookings/upcoming"),
                    sender: Nullable<NotificationSender>.value(NotificationSender(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Tanya Cole"),
                        username: "tanyacole"
                    )),
                    subject: "Your ceramic coating is booked",
                    topic: Nullable<NotificationTopicSummary>.value(NotificationTopicSummary(
                        defaultPreferenceValue: true,
                        id: "topic_xxxxxxxxxxxxxx",
                        isMention: false,
                        topicType: NotificationTopicSummaryTopicType.account
                    ))
                )
            ],
            pageInfo: ListNotificationsResponsePageInfo(
                endCursor: Nullable<String>.value("ntfr_xxxxxxxxxxxxxx:xxxxxxxxxxxxx"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("ntfr_xxxxxxxxxxxxxx:xxxxxxxxxxxxx")
            )
        )
        let response = try await client.notifications.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "account": {
                        "id": "id",
                        "logo_url": "logo_url",
                        "route": "route",
                        "title": "title"
                      },
                      "attachment_url": "attachment_url",
                      "content": "content",
                      "created_at": "created_at",
                      "experience": {
                        "app": {
                          "icon_url": "icon_url",
                          "id": "id"
                        },
                        "id": "id",
                        "name": "name"
                      },
                      "id": "id",
                      "iframe_link": "iframe_link",
                      "link": "link",
                      "mentions_me": true,
                      "rest_path": "rest_path",
                      "sender": {
                        "id": "id",
                        "name": "name",
                        "username": "username"
                      },
                      "subject": "subject",
                      "topic": {
                        "default_preference_value": true,
                        "id": "id",
                        "is_mention": true,
                        "topic_type": "account"
                      }
                    },
                    {
                      "account": {
                        "id": "id",
                        "logo_url": "logo_url",
                        "route": "route",
                        "title": "title"
                      },
                      "attachment_url": "attachment_url",
                      "content": "content",
                      "created_at": "created_at",
                      "experience": {
                        "app": {
                          "icon_url": "icon_url",
                          "id": "id"
                        },
                        "id": "id",
                        "name": "name"
                      },
                      "id": "id",
                      "iframe_link": "iframe_link",
                      "link": "link",
                      "mentions_me": true,
                      "rest_path": "rest_path",
                      "sender": {
                        "id": "id",
                        "name": "name",
                        "username": "username"
                      },
                      "subject": "subject",
                      "topic": {
                        "default_preference_value": true,
                        "id": "id",
                        "is_mention": true,
                        "topic_type": "account"
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
        let expectedResponse = ListNotificationsResponse(
            data: [
                Notification(
                    account: Nullable<NotificationAccount>.value(NotificationAccount(
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        route: Nullable<String>.value("route"),
                        title: "title"
                    )),
                    attachmentUrl: "attachment_url",
                    content: "content",
                    createdAt: "created_at",
                    experience: Nullable<NotificationExperience>.value(NotificationExperience(
                        app: Nullable<NotificationExperienceApp>.value(NotificationExperienceApp(
                            iconUrl: "icon_url",
                            id: "id"
                        )),
                        id: "id",
                        name: Nullable<String>.value("name")
                    )),
                    id: "id",
                    iframeLink: Nullable<String>.value("iframe_link"),
                    link: Nullable<String>.value("link"),
                    mentionsMe: true,
                    restPath: Nullable<String>.value("rest_path"),
                    sender: Nullable<NotificationSender>.value(NotificationSender(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        username: "username"
                    )),
                    subject: "subject",
                    topic: Nullable<NotificationTopicSummary>.value(NotificationTopicSummary(
                        defaultPreferenceValue: true,
                        id: "id",
                        isMention: true,
                        topicType: NotificationTopicSummaryTopicType.account
                    ))
                ),
                Notification(
                    account: Nullable<NotificationAccount>.value(NotificationAccount(
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        route: Nullable<String>.value("route"),
                        title: "title"
                    )),
                    attachmentUrl: "attachment_url",
                    content: "content",
                    createdAt: "created_at",
                    experience: Nullable<NotificationExperience>.value(NotificationExperience(
                        app: Nullable<NotificationExperienceApp>.value(NotificationExperienceApp(
                            iconUrl: "icon_url",
                            id: "id"
                        )),
                        id: "id",
                        name: Nullable<String>.value("name")
                    )),
                    id: "id",
                    iframeLink: Nullable<String>.value("iframe_link"),
                    link: Nullable<String>.value("link"),
                    mentionsMe: true,
                    restPath: Nullable<String>.value("rest_path"),
                    sender: Nullable<NotificationSender>.value(NotificationSender(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        username: "username"
                    )),
                    subject: "subject",
                    topic: Nullable<NotificationTopicSummary>.value(NotificationTopicSummary(
                        defaultPreferenceValue: true,
                        id: "id",
                        isMention: true,
                        topicType: NotificationTopicSummaryTopicType.account
                    ))
                )
            ],
            pageInfo: ListNotificationsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.notifications.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
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
        let expectedResponse = CreateNotificationsResponse(
            success: true
        )
        let response = try await client.notifications.create(
            request: .init(
                content: "Drop off at 4180 Burnet Rd. Plan on two days for the full coating.",
                title: "Your ceramic coating is booked"
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
        let expectedResponse = CreateNotificationsResponse(
            success: true
        )
        let response = try await client.notifications.create(
            request: .init(
                content: "content",
                title: "title"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func badges1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "experience_id": "exp_xxxxxxxxxxxxxx",
                      "has_unread": false,
                      "important_count": 0,
                      "last_viewed_at": "2026-01-01T12:00:00.000Z"
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
        let expectedResponse = BadgesNotificationsResponse(
            data: [
                NotificationBadge(
                    accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    experienceId: "exp_xxxxxxxxxxxxxx",
                    hasUnread: false,
                    importantCount: 0,
                    lastViewedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
                )
            ]
        )
        let response = try await client.notifications.badges(
            experienceIds: [
                "exp_xxxxxxxxxxxxxx"
            ],
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func badges2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "account_id",
                      "experience_id": "experience_id",
                      "has_unread": true,
                      "important_count": 1,
                      "last_viewed_at": "last_viewed_at"
                    },
                    {
                      "account_id": "account_id",
                      "experience_id": "experience_id",
                      "has_unread": true,
                      "important_count": 1,
                      "last_viewed_at": "last_viewed_at"
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
        let expectedResponse = BadgesNotificationsResponse(
            data: [
                NotificationBadge(
                    accountId: Nullable<String>.value("account_id"),
                    experienceId: "experience_id",
                    hasUnread: true,
                    importantCount: 1,
                    lastViewedAt: Nullable<String>.value("last_viewed_at")
                ),
                NotificationBadge(
                    accountId: Nullable<String>.value("account_id"),
                    experienceId: "experience_id",
                    hasUnread: true,
                    importantCount: 1,
                    lastViewedAt: Nullable<String>.value("last_viewed_at")
                )
            ]
        )
        let response = try await client.notifications.badges(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func markRead1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "experience_id": "exp_xxxxxxxxxxxxxx",
                      "has_unread": false,
                      "important_count": 0,
                      "last_viewed_at": "2026-01-01T12:00:00.000Z"
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
        let expectedResponse = MarkReadNotificationsResponse(
            data: [
                NotificationBadge(
                    accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    experienceId: "exp_xxxxxxxxxxxxxx",
                    hasUnread: false,
                    importantCount: 0,
                    lastViewedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
                )
            ]
        )
        let response = try await client.notifications.markRead(
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func markRead2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "account_id",
                      "experience_id": "experience_id",
                      "has_unread": true,
                      "important_count": 1,
                      "last_viewed_at": "last_viewed_at"
                    },
                    {
                      "account_id": "account_id",
                      "experience_id": "experience_id",
                      "has_unread": true,
                      "important_count": 1,
                      "last_viewed_at": "last_viewed_at"
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
        let expectedResponse = MarkReadNotificationsResponse(
            data: [
                NotificationBadge(
                    accountId: Nullable<String>.value("account_id"),
                    experienceId: "experience_id",
                    hasUnread: true,
                    importantCount: 1,
                    lastViewedAt: Nullable<String>.value("last_viewed_at")
                ),
                NotificationBadge(
                    accountId: Nullable<String>.value("account_id"),
                    experienceId: "experience_id",
                    hasUnread: true,
                    importantCount: 1,
                    lastViewedAt: Nullable<String>.value("last_viewed_at")
                )
            ]
        )
        let response = try await client.notifications.markRead(
            request: .init(),
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "attachment_url": "https://ui-avatars.com/api/",
                  "content": "Tuesday 9:00 AM, Bay 2",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "experience": {
                    "app": {
                      "icon_url": "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg",
                      "id": "app_xxxxxxxxxxxxxx"
                    },
                    "id": "exp_xxxxxxxxxxxxxx",
                    "name": "Bookings"
                  },
                  "id": "ntfr_xxxxxxxxxxxxxx:xxxxxxxxxxxxx",
                  "iframe_link": "https://whopappdomain0000001.apps.whop.com/experiences/exp_xxxxxxxxxxxxxx/bookings/upcoming",
                  "link": "https://whop.com/joined/shine-time-auto-detailing/bookings-xxxxxxxxxxxxxx/app/bookings/upcoming/",
                  "mentions_me": false,
                  "rest_path": "/bookings/upcoming",
                  "sender": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Tanya Cole",
                    "username": "tanyacole"
                  },
                  "subject": "Your ceramic coating is booked",
                  "topic": {
                    "default_preference_value": true,
                    "id": "topic_xxxxxxxxxxxxxx",
                    "is_mention": false,
                    "topic_type": "account"
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
        let expectedResponse = Notification(
            account: Nullable<NotificationAccount>.value(NotificationAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: Nullable<String>.value("shine-time-auto-detailing"),
                title: "Shine Time Auto Detailing"
            )),
            attachmentUrl: "https://ui-avatars.com/api/",
            content: "Tuesday 9:00 AM, Bay 2",
            createdAt: "2026-01-01T12:00:00.000Z",
            experience: Nullable<NotificationExperience>.value(NotificationExperience(
                app: Nullable<NotificationExperienceApp>.value(NotificationExperienceApp(
                    iconUrl: "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg",
                    id: "app_xxxxxxxxxxxxxx"
                )),
                id: "exp_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Bookings")
            )),
            id: "ntfr_xxxxxxxxxxxxxx:xxxxxxxxxxxxx",
            iframeLink: Nullable<String>.value("https://whopappdomain0000001.apps.whop.com/experiences/exp_xxxxxxxxxxxxxx/bookings/upcoming"),
            link: Nullable<String>.value("https://whop.com/joined/shine-time-auto-detailing/bookings-xxxxxxxxxxxxxx/app/bookings/upcoming/"),
            mentionsMe: false,
            restPath: Nullable<String>.value("/bookings/upcoming"),
            sender: Nullable<NotificationSender>.value(NotificationSender(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Tanya Cole"),
                username: "tanyacole"
            )),
            subject: "Your ceramic coating is booked",
            topic: Nullable<NotificationTopicSummary>.value(NotificationTopicSummary(
                defaultPreferenceValue: true,
                id: "topic_xxxxxxxxxxxxxx",
                isMention: false,
                topicType: NotificationTopicSummaryTopicType.account
            ))
        )
        let response = try await client.notifications.retrieve(
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
                  "account": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "attachment_url": "attachment_url",
                  "content": "content",
                  "created_at": "created_at",
                  "experience": {
                    "app": {
                      "icon_url": "icon_url",
                      "id": "id"
                    },
                    "id": "id",
                    "name": "name"
                  },
                  "id": "id",
                  "iframe_link": "iframe_link",
                  "link": "link",
                  "mentions_me": true,
                  "rest_path": "rest_path",
                  "sender": {
                    "id": "id",
                    "name": "name",
                    "username": "username"
                  },
                  "subject": "subject",
                  "topic": {
                    "default_preference_value": true,
                    "id": "id",
                    "is_mention": true,
                    "topic_type": "account"
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
        let expectedResponse = Notification(
            account: Nullable<NotificationAccount>.value(NotificationAccount(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: Nullable<String>.value("route"),
                title: "title"
            )),
            attachmentUrl: "attachment_url",
            content: "content",
            createdAt: "created_at",
            experience: Nullable<NotificationExperience>.value(NotificationExperience(
                app: Nullable<NotificationExperienceApp>.value(NotificationExperienceApp(
                    iconUrl: "icon_url",
                    id: "id"
                )),
                id: "id",
                name: Nullable<String>.value("name")
            )),
            id: "id",
            iframeLink: Nullable<String>.value("iframe_link"),
            link: Nullable<String>.value("link"),
            mentionsMe: true,
            restPath: Nullable<String>.value("rest_path"),
            sender: Nullable<NotificationSender>.value(NotificationSender(
                id: "id",
                name: Nullable<String>.value("name"),
                username: "username"
            )),
            subject: "subject",
            topic: Nullable<NotificationTopicSummary>.value(NotificationTopicSummary(
                defaultPreferenceValue: true,
                id: "id",
                isMention: true,
                topicType: NotificationTopicSummaryTopicType.account
            ))
        )
        let response = try await client.notifications.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}