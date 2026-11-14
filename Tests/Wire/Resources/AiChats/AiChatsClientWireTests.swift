import Foundation
import Testing
import WhopSDK

@Suite("AiChatsClient Wire Tests") struct AiChatsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "agent_identifier": "general",
                      "blended_token_usage": "123.45",
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "aich_xxxxxxxxxxxxx",
                      "last_message_at": "2023-12-01T05:00:00Z",
                      "message_count": 42,
                      "notification_preference": "all",
                      "title": "Weekly Revenue Analysis",
                      "updated_at": "2023-12-01T05:00:00Z",
                      "user": {
                        "id": "user_xxxxxxxxxxxxx"
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
        let expectedResponse = ListAiChatsResponse(
            data: [
                AiChatListItem(
                    agentIdentifier: AiChatAgentIdentifiers.general,
                    blendedTokenUsage: "123.45",
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "aich_xxxxxxxxxxxxx",
                    lastMessageAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    messageCount: 42,
                    notificationPreference: AiChatNotificationPreferences.all,
                    title: Nullable<String>.value("Weekly Revenue Analysis"),
                    updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    user: AiChatListItemUser(
                        id: "user_xxxxxxxxxxxxx"
                    )
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.aiChats.list(
            first: 42,
            last: 42,
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
                      "agent_identifier": "general",
                      "blended_token_usage": "blended_token_usage",
                      "created_at": "2024-01-15T09:30:00Z",
                      "id": "id",
                      "last_message_at": "2024-01-15T09:30:00Z",
                      "message_count": 1,
                      "notification_preference": "all",
                      "title": "title",
                      "updated_at": "2024-01-15T09:30:00Z",
                      "user": {
                        "id": "id"
                      }
                    },
                    {
                      "agent_identifier": "general",
                      "blended_token_usage": "blended_token_usage",
                      "created_at": "2024-01-15T09:30:00Z",
                      "id": "id",
                      "last_message_at": "2024-01-15T09:30:00Z",
                      "message_count": 1,
                      "notification_preference": "all",
                      "title": "title",
                      "updated_at": "2024-01-15T09:30:00Z",
                      "user": {
                        "id": "id"
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
        let expectedResponse = ListAiChatsResponse(
            data: [
                AiChatListItem(
                    agentIdentifier: AiChatAgentIdentifiers.general,
                    blendedTokenUsage: "blended_token_usage",
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    id: "id",
                    lastMessageAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    messageCount: 1,
                    notificationPreference: AiChatNotificationPreferences.all,
                    title: Nullable<String>.value("title"),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    user: AiChatListItemUser(
                        id: "id"
                    )
                ),
                AiChatListItem(
                    agentIdentifier: AiChatAgentIdentifiers.general,
                    blendedTokenUsage: "blended_token_usage",
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    id: "id",
                    lastMessageAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    messageCount: 1,
                    notificationPreference: AiChatNotificationPreferences.all,
                    title: Nullable<String>.value("title"),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    user: AiChatListItemUser(
                        id: "id"
                    )
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.aiChats.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "agent_identifier": "general",
                  "blended_token_usage": "123.45",
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "aich_xxxxxxxxxxxxx",
                  "last_message_at": "2023-12-01T05:00:00Z",
                  "message_count": 42,
                  "notification_preference": "all",
                  "title": "Weekly Revenue Analysis",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxx"
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
        let expectedResponse = AiChat(
            agentIdentifier: AiChatAgentIdentifiers.general,
            blendedTokenUsage: "123.45",
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "aich_xxxxxxxxxxxxx",
            lastMessageAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            messageCount: 42,
            notificationPreference: AiChatNotificationPreferences.all,
            title: Nullable<String>.value("Weekly Revenue Analysis"),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: AiChatUser(
                id: "user_xxxxxxxxxxxxx"
            )
        )
        let response = try await client.aiChats.create(
            request: .init(messageText: "message_text"),
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
                  "agent_identifier": "general",
                  "blended_token_usage": "blended_token_usage",
                  "created_at": "2024-01-15T09:30:00Z",
                  "id": "id",
                  "last_message_at": "2024-01-15T09:30:00Z",
                  "message_count": 1,
                  "notification_preference": "all",
                  "title": "title",
                  "updated_at": "2024-01-15T09:30:00Z",
                  "user": {
                    "id": "id"
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
        let expectedResponse = AiChat(
            agentIdentifier: AiChatAgentIdentifiers.general,
            blendedTokenUsage: "blended_token_usage",
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            id: "id",
            lastMessageAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            messageCount: 1,
            notificationPreference: AiChatNotificationPreferences.all,
            title: Nullable<String>.value("title"),
            updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            user: AiChatUser(
                id: "id"
            )
        )
        let response = try await client.aiChats.create(
            request: .init(messageText: "message_text"),
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
                  "agent_identifier": "general",
                  "blended_token_usage": "123.45",
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "aich_xxxxxxxxxxxxx",
                  "last_message_at": "2023-12-01T05:00:00Z",
                  "message_count": 42,
                  "notification_preference": "all",
                  "title": "Weekly Revenue Analysis",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxx"
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
        let expectedResponse = AiChat(
            agentIdentifier: AiChatAgentIdentifiers.general,
            blendedTokenUsage: "123.45",
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "aich_xxxxxxxxxxxxx",
            lastMessageAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            messageCount: 42,
            notificationPreference: AiChatNotificationPreferences.all,
            title: Nullable<String>.value("Weekly Revenue Analysis"),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: AiChatUser(
                id: "user_xxxxxxxxxxxxx"
            )
        )
        let response = try await client.aiChats.retrieve(
            id: "aich_xxxxxxxxxxxxx",
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
                  "agent_identifier": "general",
                  "blended_token_usage": "blended_token_usage",
                  "created_at": "2024-01-15T09:30:00Z",
                  "id": "id",
                  "last_message_at": "2024-01-15T09:30:00Z",
                  "message_count": 1,
                  "notification_preference": "all",
                  "title": "title",
                  "updated_at": "2024-01-15T09:30:00Z",
                  "user": {
                    "id": "id"
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
        let expectedResponse = AiChat(
            agentIdentifier: AiChatAgentIdentifiers.general,
            blendedTokenUsage: "blended_token_usage",
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            id: "id",
            lastMessageAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            messageCount: 1,
            notificationPreference: AiChatNotificationPreferences.all,
            title: Nullable<String>.value("title"),
            updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            user: AiChatUser(
                id: "id"
            )
        )
        let response = try await client.aiChats.retrieve(
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
        let response = try await client.aiChats.delete(
            id: "aich_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete2() async throws -> Void {
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
        let response = try await client.aiChats.delete(
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
                  "agent_identifier": "general",
                  "blended_token_usage": "123.45",
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "aich_xxxxxxxxxxxxx",
                  "last_message_at": "2023-12-01T05:00:00Z",
                  "message_count": 42,
                  "notification_preference": "all",
                  "title": "Weekly Revenue Analysis",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxx"
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
        let expectedResponse = AiChat(
            agentIdentifier: AiChatAgentIdentifiers.general,
            blendedTokenUsage: "123.45",
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "aich_xxxxxxxxxxxxx",
            lastMessageAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            messageCount: 42,
            notificationPreference: AiChatNotificationPreferences.all,
            title: Nullable<String>.value("Weekly Revenue Analysis"),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: AiChatUser(
                id: "user_xxxxxxxxxxxxx"
            )
        )
        let response = try await client.aiChats.update(
            id: "aich_xxxxxxxxxxxxx",
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
                  "agent_identifier": "general",
                  "blended_token_usage": "blended_token_usage",
                  "created_at": "2024-01-15T09:30:00Z",
                  "id": "id",
                  "last_message_at": "2024-01-15T09:30:00Z",
                  "message_count": 1,
                  "notification_preference": "all",
                  "title": "title",
                  "updated_at": "2024-01-15T09:30:00Z",
                  "user": {
                    "id": "id"
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
        let expectedResponse = AiChat(
            agentIdentifier: AiChatAgentIdentifiers.general,
            blendedTokenUsage: "blended_token_usage",
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            id: "id",
            lastMessageAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            messageCount: 1,
            notificationPreference: AiChatNotificationPreferences.all,
            title: Nullable<String>.value("title"),
            updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            user: AiChatUser(
                id: "id"
            )
        )
        let response = try await client.aiChats.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}