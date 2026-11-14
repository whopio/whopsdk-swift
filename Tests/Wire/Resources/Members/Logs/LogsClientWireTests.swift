import Foundation
import Testing
import WhopSDK

@Suite("LogsClient Wire Tests") struct LogsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "action": "Membership activated",
                      "actor": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "username": "danawhitfield"
                      },
                      "created_at": "2026-01-01T12:00:00Z"
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
        let expectedResponse = ListLogsResponse(
            data: [
                ListLogsResponseDataItem(
                    action: Nullable<String>.value("Membership activated"),
                    actor: Nullable<ListLogsResponseDataItemActor>.value(ListLogsResponseDataItemActor(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Optional(Nullable<String>.value("Dana Whitfield")),
                        username: Optional(Nullable<String>.value("danawhitfield"))
                    )),
                    createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)
                )
            ],
            pageInfo: ListLogsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.members.logs.list(
            id: "id",
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
                      "action": "action",
                      "actor": {
                        "id": "id",
                        "name": "name",
                        "username": "username"
                      },
                      "created_at": "2024-01-15T09:30:00Z"
                    },
                    {
                      "action": "action",
                      "actor": {
                        "id": "id",
                        "name": "name",
                        "username": "username"
                      },
                      "created_at": "2024-01-15T09:30:00Z"
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
        let expectedResponse = ListLogsResponse(
            data: [
                ListLogsResponseDataItem(
                    action: Nullable<String>.value("action"),
                    actor: Nullable<ListLogsResponseDataItemActor>.value(ListLogsResponseDataItemActor(
                        id: "id",
                        name: Optional(Nullable<String>.value("name")),
                        username: Optional(Nullable<String>.value("username"))
                    )),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                ),
                ListLogsResponseDataItem(
                    action: Nullable<String>.value("action"),
                    actor: Nullable<ListLogsResponseDataItemActor>.value(ListLogsResponseDataItemActor(
                        id: "id",
                        name: Optional(Nullable<String>.value("name")),
                        username: Optional(Nullable<String>.value("username"))
                    )),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
                )
            ],
            pageInfo: ListLogsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.members.logs.list(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}