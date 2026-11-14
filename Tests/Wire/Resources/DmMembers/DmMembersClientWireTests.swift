import Foundation
import Testing
import WhopSDK

@Suite("DmMembersClient Wire Tests") struct DmMembersClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "channel_id": "channel_id",
                      "id": "id",
                      "last_viewed_at": "123.45",
                      "status": "requested",
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
        let expectedResponse = ListDmMembersResponse(
            data: [
                DmMemberListItem(
                    channelId: "channel_id",
                    id: "id",
                    lastViewedAt: Nullable<String>.value("123.45"),
                    status: DmsFeedMemberStatuses.requested,
                    userId: "user_id"
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.dmMembers.list(
            first: 42,
            last: 42,
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
                      "id": "id",
                      "last_viewed_at": "last_viewed_at",
                      "status": "requested",
                      "user_id": "user_id"
                    },
                    {
                      "channel_id": "channel_id",
                      "id": "id",
                      "last_viewed_at": "last_viewed_at",
                      "status": "requested",
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
        let expectedResponse = ListDmMembersResponse(
            data: [
                DmMemberListItem(
                    channelId: "channel_id",
                    id: "id",
                    lastViewedAt: Nullable<String>.value("last_viewed_at"),
                    status: DmsFeedMemberStatuses.requested,
                    userId: "user_id"
                ),
                DmMemberListItem(
                    channelId: "channel_id",
                    id: "id",
                    lastViewedAt: Nullable<String>.value("last_viewed_at"),
                    status: DmsFeedMemberStatuses.requested,
                    userId: "user_id"
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.dmMembers.list(
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
                  "channel_id": "channel_id",
                  "id": "id",
                  "last_viewed_at": "123.45",
                  "notification_preference": "all",
                  "status": "requested",
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
        let expectedResponse = DmMember(
            channelId: "channel_id",
            id: "id",
            lastViewedAt: Nullable<String>.value("123.45"),
            notificationPreference: DmsFeedMemberNotificationPreferences.all,
            status: DmsFeedMemberStatuses.requested,
            userId: "user_id"
        )
        let response = try await client.dmMembers.create(
            request: .init(
                channelId: "channel_id",
                userId: "user_xxxxxxxxxxxxx"
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
                  "id": "id",
                  "last_viewed_at": "last_viewed_at",
                  "notification_preference": "all",
                  "status": "requested",
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
        let expectedResponse = DmMember(
            channelId: "channel_id",
            id: "id",
            lastViewedAt: Nullable<String>.value("last_viewed_at"),
            notificationPreference: DmsFeedMemberNotificationPreferences.all,
            status: DmsFeedMemberStatuses.requested,
            userId: "user_id"
        )
        let response = try await client.dmMembers.create(
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
                  "channel_id": "channel_id",
                  "id": "id",
                  "last_viewed_at": "123.45",
                  "notification_preference": "all",
                  "status": "requested",
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
        let expectedResponse = DmMember(
            channelId: "channel_id",
            id: "id",
            lastViewedAt: Nullable<String>.value("123.45"),
            notificationPreference: DmsFeedMemberNotificationPreferences.all,
            status: DmsFeedMemberStatuses.requested,
            userId: "user_id"
        )
        let response = try await client.dmMembers.retrieve(
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
                  "id": "id",
                  "last_viewed_at": "last_viewed_at",
                  "notification_preference": "all",
                  "status": "requested",
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
        let expectedResponse = DmMember(
            channelId: "channel_id",
            id: "id",
            lastViewedAt: Nullable<String>.value("last_viewed_at"),
            notificationPreference: DmsFeedMemberNotificationPreferences.all,
            status: DmsFeedMemberStatuses.requested,
            userId: "user_id"
        )
        let response = try await client.dmMembers.retrieve(
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
        let response = try await client.dmMembers.delete(
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
        let response = try await client.dmMembers.delete(
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
                  "channel_id": "channel_id",
                  "id": "id",
                  "last_viewed_at": "123.45",
                  "notification_preference": "all",
                  "status": "requested",
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
        let expectedResponse = DmMember(
            channelId: "channel_id",
            id: "id",
            lastViewedAt: Nullable<String>.value("123.45"),
            notificationPreference: DmsFeedMemberNotificationPreferences.all,
            status: DmsFeedMemberStatuses.requested,
            userId: "user_id"
        )
        let response = try await client.dmMembers.update(
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
                  "channel_id": "channel_id",
                  "id": "id",
                  "last_viewed_at": "last_viewed_at",
                  "notification_preference": "all",
                  "status": "requested",
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
        let expectedResponse = DmMember(
            channelId: "channel_id",
            id: "id",
            lastViewedAt: Nullable<String>.value("last_viewed_at"),
            notificationPreference: DmsFeedMemberNotificationPreferences.all,
            status: DmsFeedMemberStatuses.requested,
            userId: "user_id"
        )
        let response = try await client.dmMembers.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}