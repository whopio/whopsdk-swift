import Foundation
import Testing
import WhopSDK

@Suite("TeamMembersClient Wire Tests") struct TeamMembersClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "authorized_role": {
                        "id": "aurl_xxxxxxxxxxxxxx",
                        "name": "community-moderators"
                      },
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "direct_reports_count": 0,
                      "email": "marcus@shinetime.example",
                      "id": "ausr_xxxxxxxxxxxxxx",
                      "is_agent": false,
                      "reports_to_chain": [
                        {
                          "id": "ausr_xxxxxxxxxxxxxx",
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
                      "reports_to_id": "ausr_xxxxxxxxxxxxxx",
                      "role": "owner",
                      "status": "joined",
                      "updated_at": "2026-01-01T12:00:00.000Z",
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
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "a:WyJjdXJzb3IiLDFd"
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
        let expectedResponse = ListTeamMembersResponse(
            data: [
                TeamMember(
                    accountId: "biz_xxxxxxxxxxxxxx",
                    authorizedRole: Nullable<TeamMemberAuthorizedRole>.value(TeamMemberAuthorizedRole(
                        id: "aurl_xxxxxxxxxxxxxx",
                        name: "community-moderators"
                    )),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    directReportsCount: Nullable<Int>.value(0),
                    email: Nullable<String>.value("marcus@shinetime.example"),
                    id: "ausr_xxxxxxxxxxxxxx",
                    isAgent: false,
                    reportsToChain: Nullable<[TeamMemberManager]>.value([
                        TeamMemberManager(
                            id: "ausr_xxxxxxxxxxxxxx",
                            user: UserSummary(
                                id: "user_xxxxxxxxxxxxxx",
                                name: Nullable<String>.value("Dana Whitfield"),
                                profilePicture: UserProfilePicture(
                                    url: "https://ui-avatars.com/api/"
                                ),
                                username: "danawhitfield"
                            )
                        )
                    ]),
                    reportsToId: Nullable<String>.value("ausr_xxxxxxxxxxxxxx"),
                    role: TeamMemberRole.owner,
                    status: TeamMemberStatus.joined,
                    updatedAt: "2026-01-01T12:00:00.000Z",
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
            pageInfo: ListTeamMembersResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("a:WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.teamMembers.list(
            accountId: "account_id",
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "authorized_role": {
                    "id": "aurl_xxxxxxxxxxxxxx",
                    "name": "community-moderators"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "direct_reports_count": 0,
                  "email": "marcus@shinetime.example",
                  "id": "ausr_xxxxxxxxxxxxxx",
                  "is_agent": false,
                  "reports_to_chain": [
                    {
                      "id": "ausr_xxxxxxxxxxxxxx",
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
                  "reports_to_id": "ausr_xxxxxxxxxxxxxx",
                  "role": "owner",
                  "status": "joined",
                  "updated_at": "2026-01-01T12:00:00.000Z",
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
        let expectedResponse = TeamMember(
            accountId: "biz_xxxxxxxxxxxxxx",
            authorizedRole: Nullable<TeamMemberAuthorizedRole>.value(TeamMemberAuthorizedRole(
                id: "aurl_xxxxxxxxxxxxxx",
                name: "community-moderators"
            )),
            createdAt: "2026-01-01T12:00:00.000Z",
            directReportsCount: Nullable<Int>.value(0),
            email: Nullable<String>.value("marcus@shinetime.example"),
            id: "ausr_xxxxxxxxxxxxxx",
            isAgent: false,
            reportsToChain: Nullable<[TeamMemberManager]>.value([
                TeamMemberManager(
                    id: "ausr_xxxxxxxxxxxxxx",
                    user: UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    )
                )
            ]),
            reportsToId: Nullable<String>.value("ausr_xxxxxxxxxxxxxx"),
            role: TeamMemberRole.owner,
            status: TeamMemberStatus.joined,
            updatedAt: "2026-01-01T12:00:00.000Z",
            user: Nullable<UserSummary>.value(UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ))
        )
        let response = try await client.teamMembers.create(
            request: .init(
                accountId: "biz_xxxxxxxxxxxxxx",
                role: .salesManager,
                userId: "user_xxxxxxxxxxxxxx"
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "authorized_role": {
                    "id": "aurl_xxxxxxxxxxxxxx",
                    "name": "community-moderators"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "direct_reports_count": 0,
                  "email": "marcus@shinetime.example",
                  "id": "ausr_xxxxxxxxxxxxxx",
                  "is_agent": false,
                  "reports_to_chain": [
                    {
                      "id": "ausr_xxxxxxxxxxxxxx",
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
                  "reports_to_id": "ausr_xxxxxxxxxxxxxx",
                  "role": "owner",
                  "status": "joined",
                  "updated_at": "2026-01-01T12:00:00.000Z",
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
        let expectedResponse = TeamMember(
            accountId: "biz_xxxxxxxxxxxxxx",
            authorizedRole: Nullable<TeamMemberAuthorizedRole>.value(TeamMemberAuthorizedRole(
                id: "aurl_xxxxxxxxxxxxxx",
                name: "community-moderators"
            )),
            createdAt: "2026-01-01T12:00:00.000Z",
            directReportsCount: Nullable<Int>.value(0),
            email: Nullable<String>.value("marcus@shinetime.example"),
            id: "ausr_xxxxxxxxxxxxxx",
            isAgent: false,
            reportsToChain: Nullable<[TeamMemberManager]>.value([
                TeamMemberManager(
                    id: "ausr_xxxxxxxxxxxxxx",
                    user: UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    )
                )
            ]),
            reportsToId: Nullable<String>.value("ausr_xxxxxxxxxxxxxx"),
            role: TeamMemberRole.owner,
            status: TeamMemberStatus.joined,
            updatedAt: "2026-01-01T12:00:00.000Z",
            user: Nullable<UserSummary>.value(UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ))
        )
        let response = try await client.teamMembers.retrieve(
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
                {
                  "success": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteTeamMembersResponse(
            success: true
        )
        let response = try await client.teamMembers.delete(
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "authorized_role": {
                    "id": "aurl_xxxxxxxxxxxxxx",
                    "name": "community-moderators"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "direct_reports_count": 0,
                  "email": "marcus@shinetime.example",
                  "id": "ausr_xxxxxxxxxxxxxx",
                  "is_agent": false,
                  "reports_to_chain": [
                    {
                      "id": "ausr_xxxxxxxxxxxxxx",
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
                  "reports_to_id": "ausr_xxxxxxxxxxxxxx",
                  "role": "owner",
                  "status": "joined",
                  "updated_at": "2026-01-01T12:00:00.000Z",
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
        let expectedResponse = TeamMember(
            accountId: "biz_xxxxxxxxxxxxxx",
            authorizedRole: Nullable<TeamMemberAuthorizedRole>.value(TeamMemberAuthorizedRole(
                id: "aurl_xxxxxxxxxxxxxx",
                name: "community-moderators"
            )),
            createdAt: "2026-01-01T12:00:00.000Z",
            directReportsCount: Nullable<Int>.value(0),
            email: Nullable<String>.value("marcus@shinetime.example"),
            id: "ausr_xxxxxxxxxxxxxx",
            isAgent: false,
            reportsToChain: Nullable<[TeamMemberManager]>.value([
                TeamMemberManager(
                    id: "ausr_xxxxxxxxxxxxxx",
                    user: UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    )
                )
            ]),
            reportsToId: Nullable<String>.value("ausr_xxxxxxxxxxxxxx"),
            role: TeamMemberRole.owner,
            status: TeamMemberStatus.joined,
            updatedAt: "2026-01-01T12:00:00.000Z",
            user: Nullable<UserSummary>.value(UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ))
        )
        let response = try await client.teamMembers.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}