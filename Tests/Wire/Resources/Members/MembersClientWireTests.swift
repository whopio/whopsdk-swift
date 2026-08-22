import Foundation
import Testing
import WhopSDK

@Suite("MembersClient Wire Tests") struct MembersClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "access_level": "no_access",
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "id": "mber_xxxxxxxxxxxxxx",
                      "joined_at": "2026-01-01T12:00:00.000Z",
                      "last_accessed_at": "2026-01-01T12:00:00.000Z",
                      "status": "joined",
                      "user": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "danawhitfield"
                      }
                    }
                  ],
                  "page_info": {
                    "end_cursor": "WyJjdXJzb3IiLDFd",
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
        let expectedResponse = ListMembersResponse(
            data: [
                Member(
                    accessLevel: MemberAccessLevel.noAccess,
                    accountId: "biz_xxxxxxxxxxxxxx",
                    createdAt: "2026-01-01T12:00:00.000Z",
                    id: "mber_xxxxxxxxxxxxxx",
                    joinedAt: "2026-01-01T12:00:00.000Z",
                    lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    status: MemberStatus.joined,
                    user: Nullable<UserSummary>.value(UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    ))
                )
            ],
            pageInfo: ListMembersResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.members.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "access_level": "no_access",
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "mber_xxxxxxxxxxxxxx",
                  "joined_at": "2026-01-01T12:00:00.000Z",
                  "last_accessed_at": "2026-01-01T12:00:00.000Z",
                  "status": "joined",
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
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
        let expectedResponse = Member(
            accessLevel: MemberAccessLevel.noAccess,
            accountId: "biz_xxxxxxxxxxxxxx",
            createdAt: "2026-01-01T12:00:00.000Z",
            id: "mber_xxxxxxxxxxxxxx",
            joinedAt: "2026-01-01T12:00:00.000Z",
            lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: MemberStatus.joined,
            user: Nullable<UserSummary>.value(UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ))
        )
        let response = try await client.members.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}