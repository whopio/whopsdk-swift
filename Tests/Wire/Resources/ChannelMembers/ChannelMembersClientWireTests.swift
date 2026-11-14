import Foundation
import Testing
import WhopSDK

@Suite("ChannelMembersClient Wire Tests") struct ChannelMembersClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "channel_id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "id": "memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "inbox_status": "requested",
                      "last_viewed_at": "2026-01-01T12:00:00.000Z",
                      "notification_preference": "all",
                      "pinned_position": 1,
                      "unread": false,
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "user": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "danawhitfield"
                      },
                      "user_id": "user_xxxxxxxxxxxxxx"
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
        let expectedResponse = ListChannelMembersResponse(
            data: [
                ChannelMember(
                    channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
                    createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    id: Nullable<String>.value("memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
                    lastViewedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
                    pinnedPosition: Nullable<Int>.value(1),
                    unread: Nullable<Bool>.value(false),
                    updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    user: UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    ),
                    userId: "user_xxxxxxxxxxxxxx"
                )
            ],
            pageInfo: ListChannelMembersResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.channelMembers.list(
            channelId: "channel_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
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
                      "channel_id": "channel_id",
                      "created_at": "created_at",
                      "id": "id",
                      "inbox_status": "requested",
                      "last_viewed_at": "last_viewed_at",
                      "notification_preference": "all",
                      "pinned_position": 1,
                      "unread": true,
                      "updated_at": "updated_at",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "user_id": "user_id"
                    },
                    {
                      "channel_id": "channel_id",
                      "created_at": "created_at",
                      "id": "id",
                      "inbox_status": "requested",
                      "last_viewed_at": "last_viewed_at",
                      "notification_preference": "all",
                      "pinned_position": 1,
                      "unread": true,
                      "updated_at": "updated_at",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "user_id": "user_id"
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
        let expectedResponse = ListChannelMembersResponse(
            data: [
                ChannelMember(
                    channelId: "channel_id",
                    createdAt: Nullable<String>.value("created_at"),
                    id: Nullable<String>.value("id"),
                    inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
                    lastViewedAt: Nullable<String>.value("last_viewed_at"),
                    notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
                    pinnedPosition: Nullable<Int>.value(1),
                    unread: Nullable<Bool>.value(true),
                    updatedAt: Nullable<String>.value("updated_at"),
                    user: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    ),
                    userId: "user_id"
                ),
                ChannelMember(
                    channelId: "channel_id",
                    createdAt: Nullable<String>.value("created_at"),
                    id: Nullable<String>.value("id"),
                    inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
                    lastViewedAt: Nullable<String>.value("last_viewed_at"),
                    notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
                    pinnedPosition: Nullable<Int>.value(1),
                    unread: Nullable<Bool>.value(true),
                    updatedAt: Nullable<String>.value("updated_at"),
                    user: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    ),
                    userId: "user_id"
                )
            ],
            pageInfo: ListChannelMembersResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.channelMembers.list(
            channelId: "channel_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "channel_id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "inbox_status": "requested",
                  "last_viewed_at": "2026-01-01T12:00:00.000Z",
                  "notification_preference": "all",
                  "pinned_position": 1,
                  "unread": false,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChannelMember(
            channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
            createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: Nullable<String>.value("memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
            lastViewedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
            pinnedPosition: Nullable<Int>.value(1),
            unread: Nullable<Bool>.value(false),
            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            user: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            userId: "user_xxxxxxxxxxxxxx"
        )
        let response = try await client.channelMembers.create(
            request: .init(
                channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
                userId: "user_xxxxxxxxxxxxxx"
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
                  "channel_id": "channel_id",
                  "created_at": "created_at",
                  "id": "id",
                  "inbox_status": "requested",
                  "last_viewed_at": "last_viewed_at",
                  "notification_preference": "all",
                  "pinned_position": 1,
                  "unread": true,
                  "updated_at": "updated_at",
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChannelMember(
            channelId: "channel_id",
            createdAt: Nullable<String>.value("created_at"),
            id: Nullable<String>.value("id"),
            inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
            lastViewedAt: Nullable<String>.value("last_viewed_at"),
            notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
            pinnedPosition: Nullable<Int>.value(1),
            unread: Nullable<Bool>.value(true),
            updatedAt: Nullable<String>.value("updated_at"),
            user: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            userId: "user_id"
        )
        let response = try await client.channelMembers.create(
            request: .init(
                channelId: "channel_id",
                userId: "user_id"
            ),
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
                  "channel_id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "inbox_status": "requested",
                  "last_viewed_at": "2026-01-01T12:00:00.000Z",
                  "notification_preference": "all",
                  "pinned_position": 1,
                  "unread": false,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChannelMember(
            channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
            createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: Nullable<String>.value("memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
            lastViewedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
            pinnedPosition: Nullable<Int>.value(1),
            unread: Nullable<Bool>.value(false),
            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            user: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            userId: "user_xxxxxxxxxxxxxx"
        )
        let response = try await client.channelMembers.retrieve(
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
                  "channel_id": "channel_id",
                  "created_at": "created_at",
                  "id": "id",
                  "inbox_status": "requested",
                  "last_viewed_at": "last_viewed_at",
                  "notification_preference": "all",
                  "pinned_position": 1,
                  "unread": true,
                  "updated_at": "updated_at",
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChannelMember(
            channelId: "channel_id",
            createdAt: Nullable<String>.value("created_at"),
            id: Nullable<String>.value("id"),
            inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
            lastViewedAt: Nullable<String>.value("last_viewed_at"),
            notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
            pinnedPosition: Nullable<Int>.value(1),
            unread: Nullable<Bool>.value(true),
            updatedAt: Nullable<String>.value("updated_at"),
            user: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            userId: "user_id"
        )
        let response = try await client.channelMembers.retrieve(
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
                  "channel_id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "inbox_status": "requested",
                  "last_viewed_at": "2026-01-01T12:00:00.000Z",
                  "notification_preference": "all",
                  "pinned_position": 1,
                  "unread": false,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChannelMember(
            channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
            createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: Nullable<String>.value("memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
            lastViewedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
            pinnedPosition: Nullable<Int>.value(1),
            unread: Nullable<Bool>.value(false),
            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            user: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            userId: "user_xxxxxxxxxxxxxx"
        )
        let response = try await client.channelMembers.update(
            id: "id",
            request: .init(notificationPreference: .all),
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
                  "channel_id": "channel_id",
                  "created_at": "created_at",
                  "id": "id",
                  "inbox_status": "requested",
                  "last_viewed_at": "last_viewed_at",
                  "notification_preference": "all",
                  "pinned_position": 1,
                  "unread": true,
                  "updated_at": "updated_at",
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChannelMember(
            channelId: "channel_id",
            createdAt: Nullable<String>.value("created_at"),
            id: Nullable<String>.value("id"),
            inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
            lastViewedAt: Nullable<String>.value("last_viewed_at"),
            notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
            pinnedPosition: Nullable<Int>.value(1),
            unread: Nullable<Bool>.value(true),
            updatedAt: Nullable<String>.value("updated_at"),
            user: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            userId: "user_id"
        )
        let response = try await client.channelMembers.update(
            id: "id",
            request: .init(notificationPreference: .all),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}