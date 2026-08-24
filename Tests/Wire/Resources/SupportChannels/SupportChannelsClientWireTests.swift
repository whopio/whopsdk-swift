import Foundation
import Testing
import WhopSDK

@Suite("SupportChannelsClient Wire Tests") struct SupportChannelsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "company_id": "company_id",
                      "custom_name": "Project Alpha Team",
                      "customer_user": {
                        "id": "user_xxxxxxxxxxxxx",
                        "name": "John Doe",
                        "username": "johndoe42"
                      },
                      "id": "id",
                      "last_message_at": "2023-12-01T05:00:00Z",
                      "resolved_at": "2023-12-01T05:00:00Z"
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
        let expectedResponse = ListSupportChannelsResponse(
            data: [
                SupportChannelListItem(
                    companyId: Nullable<String>.value("company_id"),
                    customName: Nullable<String>.value("Project Alpha Team"),
                    customerUser: Nullable<SupportChannelListItemCustomerUser>.value(SupportChannelListItemCustomerUser(
                        id: "user_xxxxxxxxxxxxx",
                        name: Nullable<String>.value("John Doe"),
                        username: "johndoe42"
                    )),
                    id: "id",
                    lastMessageAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    resolvedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601))
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.supportChannels.list(
            first: 42,
            last: 42,
            companyId: "biz_xxxxxxxxxxxxxx",
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
                  "company_id": "company_id",
                  "custom_name": "Project Alpha Team",
                  "customer_user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "id": "id",
                  "last_message_at": "2023-12-01T05:00:00Z",
                  "resolved_at": "2023-12-01T05:00:00Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SupportChannel(
            companyId: Nullable<String>.value("company_id"),
            customName: Nullable<String>.value("Project Alpha Team"),
            customerUser: Nullable<SupportChannelCustomerUser>.value(SupportChannelCustomerUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )),
            id: "id",
            lastMessageAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            resolvedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601))
        )
        let response = try await client.supportChannels.create(
            request: .init(
                companyId: "biz_xxxxxxxxxxxxxx",
                userId: "user_xxxxxxxxxxxxx"
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
                  "company_id": "company_id",
                  "custom_name": "Project Alpha Team",
                  "customer_user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "id": "id",
                  "last_message_at": "2023-12-01T05:00:00Z",
                  "resolved_at": "2023-12-01T05:00:00Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SupportChannel(
            companyId: Nullable<String>.value("company_id"),
            customName: Nullable<String>.value("Project Alpha Team"),
            customerUser: Nullable<SupportChannelCustomerUser>.value(SupportChannelCustomerUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )),
            id: "id",
            lastMessageAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            resolvedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601))
        )
        let response = try await client.supportChannels.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}