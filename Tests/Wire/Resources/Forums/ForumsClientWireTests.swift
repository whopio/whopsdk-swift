import Foundation
import Testing
import WhopSDK

@Suite("ForumsClient Wire Tests") struct ForumsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "email_notification_preference": "all_admin_posts",
                      "experience": {
                        "id": "exp_xxxxxxxxxxxxxx",
                        "is_public": true,
                        "name": "Trading Signals Chat"
                      },
                      "id": "id",
                      "who_can_comment": "everyone",
                      "who_can_post": "everyone"
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
        let expectedResponse = ListForumsResponse(
            data: [
                ForumListItem(
                    emailNotificationPreference: ForumEmailNotificationPreferences.allAdminPosts,
                    experience: ForumListItemExperience(
                        id: "exp_xxxxxxxxxxxxxx",
                        isPublic: true,
                        name: "Trading Signals Chat"
                    ),
                    id: "id",
                    whoCanComment: ForumWhoCanCommentTypes.everyone,
                    whoCanPost: ForumWhoCanPostTypes.everyone
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.forums.list(
            first: 42,
            last: 42,
            productId: "prod_xxxxxxxxxxxxx",
            accountId: "biz_xxxxxxxxxxxxxx",
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
                      "email_notification_preference": "all_admin_posts",
                      "experience": {
                        "id": "id",
                        "is_public": true,
                        "name": "name"
                      },
                      "id": "id",
                      "who_can_comment": "everyone",
                      "who_can_post": "everyone"
                    },
                    {
                      "email_notification_preference": "all_admin_posts",
                      "experience": {
                        "id": "id",
                        "is_public": true,
                        "name": "name"
                      },
                      "id": "id",
                      "who_can_comment": "everyone",
                      "who_can_post": "everyone"
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
        let expectedResponse = ListForumsResponse(
            data: [
                ForumListItem(
                    emailNotificationPreference: ForumEmailNotificationPreferences.allAdminPosts,
                    experience: ForumListItemExperience(
                        id: "id",
                        isPublic: true,
                        name: "name"
                    ),
                    id: "id",
                    whoCanComment: ForumWhoCanCommentTypes.everyone,
                    whoCanPost: ForumWhoCanPostTypes.everyone
                ),
                ForumListItem(
                    emailNotificationPreference: ForumEmailNotificationPreferences.allAdminPosts,
                    experience: ForumListItemExperience(
                        id: "id",
                        isPublic: true,
                        name: "name"
                    ),
                    id: "id",
                    whoCanComment: ForumWhoCanCommentTypes.everyone,
                    whoCanPost: ForumWhoCanPostTypes.everyone
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.forums.list(
            accountId: "account_id",
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
                  "banned_words": [
                    "banned_words"
                  ],
                  "banner_image": {
                    "content_type": "image/jpeg",
                    "filename": "document.pdf",
                    "id": "id",
                    "url": "https://media.whop.com/abc123/optimized.jpg"
                  },
                  "email_notification_preference": "all_admin_posts",
                  "experience": {
                    "id": "exp_xxxxxxxxxxxxxx",
                    "is_public": true,
                    "name": "Trading Signals Chat"
                  },
                  "id": "id",
                  "who_can_comment": "everyone",
                  "who_can_post": "everyone"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Forum(
            bannedWords: [
                "banned_words"
            ],
            bannerImage: Nullable<ForumBannerImage>.value(ForumBannerImage(
                contentType: Nullable<String>.value("image/jpeg"),
                filename: Nullable<String>.value("document.pdf"),
                id: "id",
                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
            )),
            emailNotificationPreference: ForumEmailNotificationPreferences.allAdminPosts,
            experience: ForumExperience(
                id: "exp_xxxxxxxxxxxxxx",
                isPublic: true,
                name: "Trading Signals Chat"
            ),
            id: "id",
            whoCanComment: ForumWhoCanCommentTypes.everyone,
            whoCanPost: ForumWhoCanPostTypes.everyone
        )
        let response = try await client.forums.retrieve(
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
                  "banned_words": [
                    "banned_words",
                    "banned_words"
                  ],
                  "banner_image": {
                    "content_type": "content_type",
                    "filename": "filename",
                    "id": "id",
                    "url": "url"
                  },
                  "email_notification_preference": "all_admin_posts",
                  "experience": {
                    "id": "id",
                    "is_public": true,
                    "name": "name"
                  },
                  "id": "id",
                  "who_can_comment": "everyone",
                  "who_can_post": "everyone"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Forum(
            bannedWords: [
                "banned_words",
                "banned_words"
            ],
            bannerImage: Nullable<ForumBannerImage>.value(ForumBannerImage(
                contentType: Nullable<String>.value("content_type"),
                filename: Nullable<String>.value("filename"),
                id: "id",
                url: Nullable<String>.value("url")
            )),
            emailNotificationPreference: ForumEmailNotificationPreferences.allAdminPosts,
            experience: ForumExperience(
                id: "id",
                isPublic: true,
                name: "name"
            ),
            id: "id",
            whoCanComment: ForumWhoCanCommentTypes.everyone,
            whoCanPost: ForumWhoCanPostTypes.everyone
        )
        let response = try await client.forums.retrieve(
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
                  "banned_words": [
                    "banned_words"
                  ],
                  "banner_image": {
                    "content_type": "image/jpeg",
                    "filename": "document.pdf",
                    "id": "id",
                    "url": "https://media.whop.com/abc123/optimized.jpg"
                  },
                  "email_notification_preference": "all_admin_posts",
                  "experience": {
                    "id": "exp_xxxxxxxxxxxxxx",
                    "is_public": true,
                    "name": "Trading Signals Chat"
                  },
                  "id": "id",
                  "who_can_comment": "everyone",
                  "who_can_post": "everyone"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Forum(
            bannedWords: [
                "banned_words"
            ],
            bannerImage: Nullable<ForumBannerImage>.value(ForumBannerImage(
                contentType: Nullable<String>.value("image/jpeg"),
                filename: Nullable<String>.value("document.pdf"),
                id: "id",
                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
            )),
            emailNotificationPreference: ForumEmailNotificationPreferences.allAdminPosts,
            experience: ForumExperience(
                id: "exp_xxxxxxxxxxxxxx",
                isPublic: true,
                name: "Trading Signals Chat"
            ),
            id: "id",
            whoCanComment: ForumWhoCanCommentTypes.everyone,
            whoCanPost: ForumWhoCanPostTypes.everyone
        )
        let response = try await client.forums.update(
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
                  "banned_words": [
                    "banned_words",
                    "banned_words"
                  ],
                  "banner_image": {
                    "content_type": "content_type",
                    "filename": "filename",
                    "id": "id",
                    "url": "url"
                  },
                  "email_notification_preference": "all_admin_posts",
                  "experience": {
                    "id": "id",
                    "is_public": true,
                    "name": "name"
                  },
                  "id": "id",
                  "who_can_comment": "everyone",
                  "who_can_post": "everyone"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Forum(
            bannedWords: [
                "banned_words",
                "banned_words"
            ],
            bannerImage: Nullable<ForumBannerImage>.value(ForumBannerImage(
                contentType: Nullable<String>.value("content_type"),
                filename: Nullable<String>.value("filename"),
                id: "id",
                url: Nullable<String>.value("url")
            )),
            emailNotificationPreference: ForumEmailNotificationPreferences.allAdminPosts,
            experience: ForumExperience(
                id: "id",
                isPublic: true,
                name: "name"
            ),
            id: "id",
            whoCanComment: ForumWhoCanCommentTypes.everyone,
            whoCanPost: ForumWhoCanPostTypes.everyone
        )
        let response = try await client.forums.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}