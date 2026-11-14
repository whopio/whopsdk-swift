import Foundation
import Testing
import WhopSDK

@Suite("ChatChannelsClient Wire Tests") struct ChatChannelsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "ban_media": true,
                      "ban_urls": true,
                      "banned_words": [
                        "banned_words"
                      ],
                      "experience": {
                        "id": "exp_xxxxxxxxxxxxxx",
                        "name": "Trading Signals Chat"
                      },
                      "id": "id",
                      "user_posts_cooldown_seconds": 42,
                      "who_can_post": "everyone",
                      "who_can_react": "everyone"
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
        let expectedResponse = ListChatChannelsResponse(
            data: [
                ChatChannelListItem(
                    banMedia: true,
                    banUrls: true,
                    bannedWords: [
                        "banned_words"
                    ],
                    experience: ChatChannelListItemExperience(
                        id: "exp_xxxxxxxxxxxxxx",
                        name: "Trading Signals Chat"
                    ),
                    id: "id",
                    userPostsCooldownSeconds: Nullable<Int>.value(42),
                    whoCanPost: WhoCanPostTypes.everyone,
                    whoCanReact: WhoCanReactTypes.everyone
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.chatChannels.list(
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
                      "ban_media": true,
                      "ban_urls": true,
                      "banned_words": [
                        "banned_words",
                        "banned_words"
                      ],
                      "experience": {
                        "id": "id",
                        "name": "name"
                      },
                      "id": "id",
                      "user_posts_cooldown_seconds": 1,
                      "who_can_post": "everyone",
                      "who_can_react": "everyone"
                    },
                    {
                      "ban_media": true,
                      "ban_urls": true,
                      "banned_words": [
                        "banned_words",
                        "banned_words"
                      ],
                      "experience": {
                        "id": "id",
                        "name": "name"
                      },
                      "id": "id",
                      "user_posts_cooldown_seconds": 1,
                      "who_can_post": "everyone",
                      "who_can_react": "everyone"
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
        let expectedResponse = ListChatChannelsResponse(
            data: [
                ChatChannelListItem(
                    banMedia: true,
                    banUrls: true,
                    bannedWords: [
                        "banned_words",
                        "banned_words"
                    ],
                    experience: ChatChannelListItemExperience(
                        id: "id",
                        name: "name"
                    ),
                    id: "id",
                    userPostsCooldownSeconds: Nullable<Int>.value(1),
                    whoCanPost: WhoCanPostTypes.everyone,
                    whoCanReact: WhoCanReactTypes.everyone
                ),
                ChatChannelListItem(
                    banMedia: true,
                    banUrls: true,
                    bannedWords: [
                        "banned_words",
                        "banned_words"
                    ],
                    experience: ChatChannelListItemExperience(
                        id: "id",
                        name: "name"
                    ),
                    id: "id",
                    userPostsCooldownSeconds: Nullable<Int>.value(1),
                    whoCanPost: WhoCanPostTypes.everyone,
                    whoCanReact: WhoCanReactTypes.everyone
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.chatChannels.list(
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
                  "ban_media": true,
                  "ban_urls": true,
                  "banned_words": [
                    "banned_words"
                  ],
                  "experience": {
                    "id": "exp_xxxxxxxxxxxxxx",
                    "name": "Trading Signals Chat"
                  },
                  "id": "id",
                  "user_posts_cooldown_seconds": 42,
                  "who_can_post": "everyone",
                  "who_can_react": "everyone"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatChannel(
            banMedia: true,
            banUrls: true,
            bannedWords: [
                "banned_words"
            ],
            experience: ChatChannelExperience(
                id: "exp_xxxxxxxxxxxxxx",
                name: "Trading Signals Chat"
            ),
            id: "id",
            userPostsCooldownSeconds: Nullable<Int>.value(42),
            whoCanPost: WhoCanPostTypes.everyone,
            whoCanReact: WhoCanReactTypes.everyone
        )
        let response = try await client.chatChannels.retrieve(
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
                  "ban_media": true,
                  "ban_urls": true,
                  "banned_words": [
                    "banned_words",
                    "banned_words"
                  ],
                  "experience": {
                    "id": "id",
                    "name": "name"
                  },
                  "id": "id",
                  "user_posts_cooldown_seconds": 1,
                  "who_can_post": "everyone",
                  "who_can_react": "everyone"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatChannel(
            banMedia: true,
            banUrls: true,
            bannedWords: [
                "banned_words",
                "banned_words"
            ],
            experience: ChatChannelExperience(
                id: "id",
                name: "name"
            ),
            id: "id",
            userPostsCooldownSeconds: Nullable<Int>.value(1),
            whoCanPost: WhoCanPostTypes.everyone,
            whoCanReact: WhoCanReactTypes.everyone
        )
        let response = try await client.chatChannels.retrieve(
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
                  "ban_media": true,
                  "ban_urls": true,
                  "banned_words": [
                    "banned_words"
                  ],
                  "experience": {
                    "id": "exp_xxxxxxxxxxxxxx",
                    "name": "Trading Signals Chat"
                  },
                  "id": "id",
                  "user_posts_cooldown_seconds": 42,
                  "who_can_post": "everyone",
                  "who_can_react": "everyone"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatChannel(
            banMedia: true,
            banUrls: true,
            bannedWords: [
                "banned_words"
            ],
            experience: ChatChannelExperience(
                id: "exp_xxxxxxxxxxxxxx",
                name: "Trading Signals Chat"
            ),
            id: "id",
            userPostsCooldownSeconds: Nullable<Int>.value(42),
            whoCanPost: WhoCanPostTypes.everyone,
            whoCanReact: WhoCanReactTypes.everyone
        )
        let response = try await client.chatChannels.update(
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
                  "ban_media": true,
                  "ban_urls": true,
                  "banned_words": [
                    "banned_words",
                    "banned_words"
                  ],
                  "experience": {
                    "id": "id",
                    "name": "name"
                  },
                  "id": "id",
                  "user_posts_cooldown_seconds": 1,
                  "who_can_post": "everyone",
                  "who_can_react": "everyone"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatChannel(
            banMedia: true,
            banUrls: true,
            bannedWords: [
                "banned_words",
                "banned_words"
            ],
            experience: ChatChannelExperience(
                id: "id",
                name: "name"
            ),
            id: "id",
            userPostsCooldownSeconds: Nullable<Int>.value(1),
            whoCanPost: WhoCanPostTypes.everyone,
            whoCanReact: WhoCanReactTypes.everyone
        )
        let response = try await client.chatChannels.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}