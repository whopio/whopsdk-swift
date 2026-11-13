import Foundation
import Testing
import WhopSDK

@Suite("NotesClient Wire Tests") struct NotesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "author": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "danawhitfield"
                      },
                      "content": "Asked about annual billing.",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "id": "note_xxxxxxxxxxxxxx",
                      "member_id": "mber_xxxxxxxxxxxxxx",
                      "user_id": "user_xxxxxxxxxxxxxx"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "WyJjdXJzb3IiLDFd",
                    "total_count": 1,
                    "total_count_capped": true
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
        let expectedResponse = ListNotesResponse(
            data: [
                MemberNote(
                    author: Nullable<UserSummary>.value(UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    )),
                    content: "Asked about annual billing.",
                    createdAt: "2026-01-01T12:00:00.000Z",
                    id: "note_xxxxxxxxxxxxxx",
                    memberId: "mber_xxxxxxxxxxxxxx",
                    userId: "user_xxxxxxxxxxxxxx"
                )
            ],
            pageInfo: ListNotesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                totalCount: Nullable<Int>.value(1),
                totalCountCapped: true
            )
        )
        let response = try await client.members.notes.list(
            memberId: "member_id",
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
                  "author": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "content": "Asked about annual billing.",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "note_xxxxxxxxxxxxxx",
                  "member_id": "mber_xxxxxxxxxxxxxx",
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
        let expectedResponse = MemberNote(
            author: Nullable<UserSummary>.value(UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            )),
            content: "Asked about annual billing.",
            createdAt: "2026-01-01T12:00:00.000Z",
            id: "note_xxxxxxxxxxxxxx",
            memberId: "mber_xxxxxxxxxxxxxx",
            userId: "user_xxxxxxxxxxxxxx"
        )
        let response = try await client.members.notes.create(
            memberId: "member_id",
            request: .init(content: "Wants a call next week."),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}