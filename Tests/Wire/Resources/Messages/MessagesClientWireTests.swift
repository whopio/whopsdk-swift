import Foundation
import Testing
import WhopSDK

@Suite("MessagesClient Wire Tests") struct MessagesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "content": "Hey, are you available for a **quick call**?",
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "id",
                      "is_edited": true,
                      "is_pinned": true,
                      "mentions": [
                        "mentions"
                      ],
                      "mentions_everyone": true,
                      "message_type": "regular",
                      "poll": {
                        "options": null
                      },
                      "poll_votes": [
                        {
                          "count": 42,
                          "option_id": null
                        }
                      ],
                      "reaction_counts": [
                        {
                          "count": 42,
                          "emoji": null
                        }
                      ],
                      "replying_to_message_id": "replying_to_message_id",
                      "updated_at": "2023-12-01T05:00:00Z",
                      "user": {
                        "id": "user_xxxxxxxxxxxxx",
                        "name": "John Doe",
                        "username": "johndoe42"
                      },
                      "view_count": 42
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
        let expectedResponse = ListMessagesResponse(
            data: [
                MessageListItem(
                    content: Nullable<String>.value("Hey, are you available for a **quick call**?"),
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "id",
                    isEdited: true,
                    isPinned: true,
                    mentions: [
                        "mentions"
                    ],
                    mentionsEveryone: true,
                    messageType: DmsPostTypes.regular,
                    poll: Nullable<MessageListItemPoll>.value(MessageListItemPoll(
                        options: .null
                    )),
                    pollVotes: [
                        MessageListItemPollVotesItem(
                            count: 42,
                            optionId: .null
                        )
                    ],
                    reactionCounts: [
                        MessageListItemReactionCountsItem(
                            count: 42,
                            emoji: .null
                        )
                    ],
                    replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
                    updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    user: MessageListItemUser(
                        id: "user_xxxxxxxxxxxxx",
                        name: Nullable<String>.value("John Doe"),
                        username: "johndoe42"
                    ),
                    viewCount: Nullable<Int>.value(42)
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.messages.list(
            first: 42,
            last: 42,
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
                  "content": "Hey, are you available for a **quick call**?",
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "id",
                  "is_edited": true,
                  "is_pinned": true,
                  "mentions": [
                    "mentions"
                  ],
                  "mentions_everyone": true,
                  "message_type": "regular",
                  "poll": {
                    "options": [
                      {
                        "id": "id",
                        "text": "text"
                      }
                    ]
                  },
                  "poll_votes": [
                    {
                      "count": 42,
                      "option_id": "option_id"
                    }
                  ],
                  "reaction_counts": [
                    {
                      "count": 42,
                      "emoji": "emoji"
                    }
                  ],
                  "replying_to_message_id": "replying_to_message_id",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "view_count": 42
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Message(
            content: Nullable<String>.value("Hey, are you available for a **quick call**?"),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "id",
            isEdited: true,
            isPinned: true,
            mentions: [
                "mentions"
            ],
            mentionsEveryone: true,
            messageType: DmsPostTypes.regular,
            poll: Nullable<MessagePoll>.value(MessagePoll(
                options: Nullable<[MessagePollOptionsItem]>.value([
                    MessagePollOptionsItem(
                        id: "id",
                        text: "text"
                    )
                ])
            )),
            pollVotes: [
                MessagePollVotesItem(
                    count: 42,
                    optionId: Nullable<String>.value("option_id")
                )
            ],
            reactionCounts: [
                MessageReactionCountsItem(
                    count: 42,
                    emoji: Nullable<String>.value("emoji")
                )
            ],
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: MessageUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            ),
            viewCount: Nullable<Int>.value(42)
        )
        let response = try await client.messages.create(
            request: .init(
                channelId: "channel_id",
                content: "content"
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
                  "content": "Hey, are you available for a **quick call**?",
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "id",
                  "is_edited": true,
                  "is_pinned": true,
                  "mentions": [
                    "mentions"
                  ],
                  "mentions_everyone": true,
                  "message_type": "regular",
                  "poll": {
                    "options": [
                      {
                        "id": "id",
                        "text": "text"
                      }
                    ]
                  },
                  "poll_votes": [
                    {
                      "count": 42,
                      "option_id": "option_id"
                    }
                  ],
                  "reaction_counts": [
                    {
                      "count": 42,
                      "emoji": "emoji"
                    }
                  ],
                  "replying_to_message_id": "replying_to_message_id",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "view_count": 42
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Message(
            content: Nullable<String>.value("Hey, are you available for a **quick call**?"),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "id",
            isEdited: true,
            isPinned: true,
            mentions: [
                "mentions"
            ],
            mentionsEveryone: true,
            messageType: DmsPostTypes.regular,
            poll: Nullable<MessagePoll>.value(MessagePoll(
                options: Nullable<[MessagePollOptionsItem]>.value([
                    MessagePollOptionsItem(
                        id: "id",
                        text: "text"
                    )
                ])
            )),
            pollVotes: [
                MessagePollVotesItem(
                    count: 42,
                    optionId: Nullable<String>.value("option_id")
                )
            ],
            reactionCounts: [
                MessageReactionCountsItem(
                    count: 42,
                    emoji: Nullable<String>.value("emoji")
                )
            ],
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: MessageUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            ),
            viewCount: Nullable<Int>.value(42)
        )
        let response = try await client.messages.retrieve(
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
                true
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = true
        let response = try await client.messages.delete(
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
                  "content": "Hey, are you available for a **quick call**?",
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "id",
                  "is_edited": true,
                  "is_pinned": true,
                  "mentions": [
                    "mentions"
                  ],
                  "mentions_everyone": true,
                  "message_type": "regular",
                  "poll": {
                    "options": [
                      {
                        "id": "id",
                        "text": "text"
                      }
                    ]
                  },
                  "poll_votes": [
                    {
                      "count": 42,
                      "option_id": "option_id"
                    }
                  ],
                  "reaction_counts": [
                    {
                      "count": 42,
                      "emoji": "emoji"
                    }
                  ],
                  "replying_to_message_id": "replying_to_message_id",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "view_count": 42
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Message(
            content: Nullable<String>.value("Hey, are you available for a **quick call**?"),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "id",
            isEdited: true,
            isPinned: true,
            mentions: [
                "mentions"
            ],
            mentionsEveryone: true,
            messageType: DmsPostTypes.regular,
            poll: Nullable<MessagePoll>.value(MessagePoll(
                options: Nullable<[MessagePollOptionsItem]>.value([
                    MessagePollOptionsItem(
                        id: "id",
                        text: "text"
                    )
                ])
            )),
            pollVotes: [
                MessagePollVotesItem(
                    count: 42,
                    optionId: Nullable<String>.value("option_id")
                )
            ],
            reactionCounts: [
                MessageReactionCountsItem(
                    count: 42,
                    emoji: Nullable<String>.value("emoji")
                )
            ],
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: MessageUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            ),
            viewCount: Nullable<Int>.value(42)
        )
        let response = try await client.messages.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}