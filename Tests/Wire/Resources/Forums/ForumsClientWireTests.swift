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
            companyId: "biz_xxxxxxxxxxxxxx",
            productId: "prod_xxxxxxxxxxxxx",
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
                  "email_notification_preference": "all_admin_posts",
                  "experience": {
                    "id": "exp_xxxxxxxxxxxxxx",
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
            emailNotificationPreference: ForumEmailNotificationPreferences.allAdminPosts,
            experience: ForumExperience(
                id: "exp_xxxxxxxxxxxxxx",
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

    @Test func update1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "email_notification_preference": "all_admin_posts",
                  "experience": {
                    "id": "exp_xxxxxxxxxxxxxx",
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
            emailNotificationPreference: ForumEmailNotificationPreferences.allAdminPosts,
            experience: ForumExperience(
                id: "exp_xxxxxxxxxxxxxx",
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
}