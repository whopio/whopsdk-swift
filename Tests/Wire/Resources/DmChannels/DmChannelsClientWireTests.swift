import Foundation
import Testing
import WhopSDK

@Suite("DmChannelsClient Wire Tests") struct DmChannelsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "123.45",
                      "id": "id",
                      "last_message_at": "2023-12-01T05:00:00Z",
                      "name": "Project Alpha Team"
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
        let expectedResponse = ListDmChannelsResponse(
            data: [
                DmChannelListItem(
                    createdAt: "123.45",
                    id: "id",
                    lastMessageAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    name: Nullable<String>.value("Project Alpha Team")
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.dmChannels.list(
            first: 42,
            last: 42,
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
                      "created_at": "created_at",
                      "id": "id",
                      "last_message_at": "2024-01-15T09:30:00Z",
                      "name": "name"
                    },
                    {
                      "created_at": "created_at",
                      "id": "id",
                      "last_message_at": "2024-01-15T09:30:00Z",
                      "name": "name"
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
        let expectedResponse = ListDmChannelsResponse(
            data: [
                DmChannelListItem(
                    createdAt: "created_at",
                    id: "id",
                    lastMessageAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    name: Nullable<String>.value("name")
                ),
                DmChannelListItem(
                    createdAt: "created_at",
                    id: "id",
                    lastMessageAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    name: Nullable<String>.value("name")
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.dmChannels.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "created_at": "123.45",
                  "id": "id",
                  "last_message_at": "2023-12-01T05:00:00Z",
                  "name": "Project Alpha Team"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DmChannel(
            createdAt: "123.45",
            id: "id",
            lastMessageAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            name: Nullable<String>.value("Project Alpha Team")
        )
        let response = try await client.dmChannels.create(
            request: .init(withUserIds: [
                "with_user_ids"
            ]),
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
                  "created_at": "created_at",
                  "id": "id",
                  "last_message_at": "2024-01-15T09:30:00Z",
                  "name": "name"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DmChannel(
            createdAt: "created_at",
            id: "id",
            lastMessageAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            name: Nullable<String>.value("name")
        )
        let response = try await client.dmChannels.create(
            request: .init(withUserIds: [
                "with_user_ids",
                "with_user_ids"
            ]),
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
                  "created_at": "123.45",
                  "id": "id",
                  "last_message_at": "2023-12-01T05:00:00Z",
                  "name": "Project Alpha Team"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DmChannel(
            createdAt: "123.45",
            id: "id",
            lastMessageAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            name: Nullable<String>.value("Project Alpha Team")
        )
        let response = try await client.dmChannels.retrieve(
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
                  "created_at": "created_at",
                  "id": "id",
                  "last_message_at": "2024-01-15T09:30:00Z",
                  "name": "name"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DmChannel(
            createdAt: "created_at",
            id: "id",
            lastMessageAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            name: Nullable<String>.value("name")
        )
        let response = try await client.dmChannels.retrieve(
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
        let response = try await client.dmChannels.delete(
            id: "id",
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
        let response = try await client.dmChannels.delete(
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
                  "created_at": "123.45",
                  "id": "id",
                  "last_message_at": "2023-12-01T05:00:00Z",
                  "name": "Project Alpha Team"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DmChannel(
            createdAt: "123.45",
            id: "id",
            lastMessageAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            name: Nullable<String>.value("Project Alpha Team")
        )
        let response = try await client.dmChannels.update(
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
                  "created_at": "created_at",
                  "id": "id",
                  "last_message_at": "2024-01-15T09:30:00Z",
                  "name": "name"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DmChannel(
            createdAt: "created_at",
            id: "id",
            lastMessageAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            name: Nullable<String>.value("name")
        )
        let response = try await client.dmChannels.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}