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
                      "account": {
                        "fees": {
                          "crypto_swap_markup": {
                            "fixed_fee_usd": 0,
                            "percentage_fee": 3
                          },
                          "transfer_markup": {
                            "fixed_fee_usd": 0,
                            "percentage_fee": 0
                          }
                        },
                        "id": "biz_xxxxxxxxxxxxxx",
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "route": "shine-time-holdings",
                        "title": "Shine Time Holdings"
                      },
                      "authorized_role": {
                        "id": "aurl_xxxxxxxxxxxxxx",
                        "name": "community-moderators"
                      },
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "direct_reports_count": 0,
                      "email": "marcus@shinetime.example",
                      "id": "ausr_xxxxxxxxxxxxxx",
                      "is_agent": false,
                      "is_partner": false,
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
                    account: AccountParent(
                        fees: Optional([
                            "crypto_swap_markup": AccountParentFeesValue(
                                fixedFeeUsd: 0,
                                percentageFee: 3
                            ), 
                            "transfer_markup": AccountParentFeesValue(
                                fixedFeeUsd: 0,
                                percentageFee: 0
                            )
                        ]),
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        route: "shine-time-holdings",
                        title: "Shine Time Holdings"
                    ),
                    authorizedRole: Nullable<TeamMemberAuthorizedRole>.value(TeamMemberAuthorizedRole(
                        id: "aurl_xxxxxxxxxxxxxx",
                        name: "community-moderators"
                    )),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    directReportsCount: Nullable<Int>.value(0),
                    email: Nullable<String>.value("marcus@shinetime.example"),
                    id: "ausr_xxxxxxxxxxxxxx",
                    isAgent: false,
                    isPartner: false,
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
        let response = try await client.teamMembers.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "account": {
                        "fees": {
                          "fees": {
                            "fixed_fee_usd": 1.1,
                            "percentage_fee": 1.1
                          }
                        },
                        "id": "id",
                        "logo_url": "logo_url",
                        "route": "route",
                        "title": "title"
                      },
                      "authorized_role": {
                        "id": "id",
                        "name": "name"
                      },
                      "created_at": "created_at",
                      "direct_reports_count": 1,
                      "email": "email",
                      "id": "id",
                      "is_agent": true,
                      "is_partner": true,
                      "reports_to_chain": [
                        {
                          "id": "id",
                          "user": {
                            "id": "id",
                            "name": "name",
                            "profile_picture": {
                              "url": "url"
                            },
                            "username": "username"
                          }
                        },
                        {
                          "id": "id",
                          "user": {
                            "id": "id",
                            "name": "name",
                            "profile_picture": {
                              "url": "url"
                            },
                            "username": "username"
                          }
                        }
                      ],
                      "reports_to_id": "reports_to_id",
                      "role": "owner",
                      "status": "joined",
                      "updated_at": "updated_at",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      }
                    },
                    {
                      "account": {
                        "fees": {
                          "fees": {
                            "fixed_fee_usd": 1.1,
                            "percentage_fee": 1.1
                          }
                        },
                        "id": "id",
                        "logo_url": "logo_url",
                        "route": "route",
                        "title": "title"
                      },
                      "authorized_role": {
                        "id": "id",
                        "name": "name"
                      },
                      "created_at": "created_at",
                      "direct_reports_count": 1,
                      "email": "email",
                      "id": "id",
                      "is_agent": true,
                      "is_partner": true,
                      "reports_to_chain": [
                        {
                          "id": "id",
                          "user": {
                            "id": "id",
                            "name": "name",
                            "profile_picture": {
                              "url": "url"
                            },
                            "username": "username"
                          }
                        },
                        {
                          "id": "id",
                          "user": {
                            "id": "id",
                            "name": "name",
                            "profile_picture": {
                              "url": "url"
                            },
                            "username": "username"
                          }
                        }
                      ],
                      "reports_to_id": "reports_to_id",
                      "role": "owner",
                      "status": "joined",
                      "updated_at": "updated_at",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
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
        let expectedResponse = ListTeamMembersResponse(
            data: [
                TeamMember(
                    account: AccountParent(
                        fees: Optional([
                            "fees": AccountParentFeesValue(
                                fixedFeeUsd: 1.1,
                                percentageFee: 1.1
                            )
                        ]),
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        route: "route",
                        title: "title"
                    ),
                    authorizedRole: Nullable<TeamMemberAuthorizedRole>.value(TeamMemberAuthorizedRole(
                        id: "id",
                        name: "name"
                    )),
                    createdAt: "created_at",
                    directReportsCount: Nullable<Int>.value(1),
                    email: Nullable<String>.value("email"),
                    id: "id",
                    isAgent: true,
                    isPartner: true,
                    reportsToChain: Nullable<[TeamMemberManager]>.value([
                        TeamMemberManager(
                            id: "id",
                            user: UserSummary(
                                id: "id",
                                name: Nullable<String>.value("name"),
                                profilePicture: UserProfilePicture(
                                    url: "url"
                                ),
                                username: "username"
                            )
                        ),
                        TeamMemberManager(
                            id: "id",
                            user: UserSummary(
                                id: "id",
                                name: Nullable<String>.value("name"),
                                profilePicture: UserProfilePicture(
                                    url: "url"
                                ),
                                username: "username"
                            )
                        )
                    ]),
                    reportsToId: Nullable<String>.value("reports_to_id"),
                    role: TeamMemberRole.owner,
                    status: TeamMemberStatus.joined,
                    updatedAt: "updated_at",
                    user: Nullable<UserSummary>.value(UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    ))
                ),
                TeamMember(
                    account: AccountParent(
                        fees: Optional([
                            "fees": AccountParentFeesValue(
                                fixedFeeUsd: 1.1,
                                percentageFee: 1.1
                            )
                        ]),
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        route: "route",
                        title: "title"
                    ),
                    authorizedRole: Nullable<TeamMemberAuthorizedRole>.value(TeamMemberAuthorizedRole(
                        id: "id",
                        name: "name"
                    )),
                    createdAt: "created_at",
                    directReportsCount: Nullable<Int>.value(1),
                    email: Nullable<String>.value("email"),
                    id: "id",
                    isAgent: true,
                    isPartner: true,
                    reportsToChain: Nullable<[TeamMemberManager]>.value([
                        TeamMemberManager(
                            id: "id",
                            user: UserSummary(
                                id: "id",
                                name: Nullable<String>.value("name"),
                                profilePicture: UserProfilePicture(
                                    url: "url"
                                ),
                                username: "username"
                            )
                        ),
                        TeamMemberManager(
                            id: "id",
                            user: UserSummary(
                                id: "id",
                                name: Nullable<String>.value("name"),
                                profilePicture: UserProfilePicture(
                                    url: "url"
                                ),
                                username: "username"
                            )
                        )
                    ]),
                    reportsToId: Nullable<String>.value("reports_to_id"),
                    role: TeamMemberRole.owner,
                    status: TeamMemberStatus.joined,
                    updatedAt: "updated_at",
                    user: Nullable<UserSummary>.value(UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    ))
                )
            ],
            pageInfo: ListTeamMembersResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.teamMembers.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "fees": {
                      "crypto_swap_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 3
                      },
                      "transfer_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 0
                      }
                    },
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-holdings",
                    "title": "Shine Time Holdings"
                  },
                  "authorized_role": {
                    "id": "aurl_xxxxxxxxxxxxxx",
                    "name": "community-moderators"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "direct_reports_count": 0,
                  "email": "marcus@shinetime.example",
                  "id": "ausr_xxxxxxxxxxxxxx",
                  "is_agent": false,
                  "is_partner": false,
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
            account: AccountParent(
                fees: Optional([
                    "crypto_swap_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 3
                    ), 
                    "transfer_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 0
                    )
                ]),
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-holdings",
                title: "Shine Time Holdings"
            ),
            authorizedRole: Nullable<TeamMemberAuthorizedRole>.value(TeamMemberAuthorizedRole(
                id: "aurl_xxxxxxxxxxxxxx",
                name: "community-moderators"
            )),
            createdAt: "2026-01-01T12:00:00.000Z",
            directReportsCount: Nullable<Int>.value(0),
            email: Nullable<String>.value("marcus@shinetime.example"),
            id: "ausr_xxxxxxxxxxxxxx",
            isAgent: false,
            isPartner: false,
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

    @Test func create2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "fees": {
                      "fees": {
                        "fixed_fee_usd": 1.1,
                        "percentage_fee": 1.1
                      }
                    },
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "authorized_role": {
                    "id": "id",
                    "name": "name"
                  },
                  "created_at": "created_at",
                  "direct_reports_count": 1,
                  "email": "email",
                  "id": "id",
                  "is_agent": true,
                  "is_partner": true,
                  "reports_to_chain": [
                    {
                      "id": "id",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      }
                    },
                    {
                      "id": "id",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      }
                    }
                  ],
                  "reports_to_id": "reports_to_id",
                  "role": "owner",
                  "status": "joined",
                  "updated_at": "updated_at",
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
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
            account: AccountParent(
                fees: Optional([
                    "fees": AccountParentFeesValue(
                        fixedFeeUsd: 1.1,
                        percentageFee: 1.1
                    )
                ]),
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            ),
            authorizedRole: Nullable<TeamMemberAuthorizedRole>.value(TeamMemberAuthorizedRole(
                id: "id",
                name: "name"
            )),
            createdAt: "created_at",
            directReportsCount: Nullable<Int>.value(1),
            email: Nullable<String>.value("email"),
            id: "id",
            isAgent: true,
            isPartner: true,
            reportsToChain: Nullable<[TeamMemberManager]>.value([
                TeamMemberManager(
                    id: "id",
                    user: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )
                ),
                TeamMemberManager(
                    id: "id",
                    user: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )
                )
            ]),
            reportsToId: Nullable<String>.value("reports_to_id"),
            role: TeamMemberRole.owner,
            status: TeamMemberStatus.joined,
            updatedAt: "updated_at",
            user: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ))
        )
        let response = try await client.teamMembers.create(
            request: .init(
                accountId: "account_id",
                role: .owner
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
                  "account": {
                    "fees": {
                      "crypto_swap_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 3
                      },
                      "transfer_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 0
                      }
                    },
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-holdings",
                    "title": "Shine Time Holdings"
                  },
                  "authorized_role": {
                    "id": "aurl_xxxxxxxxxxxxxx",
                    "name": "community-moderators"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "direct_reports_count": 0,
                  "email": "marcus@shinetime.example",
                  "id": "ausr_xxxxxxxxxxxxxx",
                  "is_agent": false,
                  "is_partner": false,
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
            account: AccountParent(
                fees: Optional([
                    "crypto_swap_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 3
                    ), 
                    "transfer_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 0
                    )
                ]),
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-holdings",
                title: "Shine Time Holdings"
            ),
            authorizedRole: Nullable<TeamMemberAuthorizedRole>.value(TeamMemberAuthorizedRole(
                id: "aurl_xxxxxxxxxxxxxx",
                name: "community-moderators"
            )),
            createdAt: "2026-01-01T12:00:00.000Z",
            directReportsCount: Nullable<Int>.value(0),
            email: Nullable<String>.value("marcus@shinetime.example"),
            id: "ausr_xxxxxxxxxxxxxx",
            isAgent: false,
            isPartner: false,
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

    @Test func retrieve2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "fees": {
                      "fees": {
                        "fixed_fee_usd": 1.1,
                        "percentage_fee": 1.1
                      }
                    },
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "authorized_role": {
                    "id": "id",
                    "name": "name"
                  },
                  "created_at": "created_at",
                  "direct_reports_count": 1,
                  "email": "email",
                  "id": "id",
                  "is_agent": true,
                  "is_partner": true,
                  "reports_to_chain": [
                    {
                      "id": "id",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      }
                    },
                    {
                      "id": "id",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      }
                    }
                  ],
                  "reports_to_id": "reports_to_id",
                  "role": "owner",
                  "status": "joined",
                  "updated_at": "updated_at",
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
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
            account: AccountParent(
                fees: Optional([
                    "fees": AccountParentFeesValue(
                        fixedFeeUsd: 1.1,
                        percentageFee: 1.1
                    )
                ]),
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            ),
            authorizedRole: Nullable<TeamMemberAuthorizedRole>.value(TeamMemberAuthorizedRole(
                id: "id",
                name: "name"
            )),
            createdAt: "created_at",
            directReportsCount: Nullable<Int>.value(1),
            email: Nullable<String>.value("email"),
            id: "id",
            isAgent: true,
            isPartner: true,
            reportsToChain: Nullable<[TeamMemberManager]>.value([
                TeamMemberManager(
                    id: "id",
                    user: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )
                ),
                TeamMemberManager(
                    id: "id",
                    user: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )
                )
            ]),
            reportsToId: Nullable<String>.value("reports_to_id"),
            role: TeamMemberRole.owner,
            status: TeamMemberStatus.joined,
            updatedAt: "updated_at",
            user: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
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

    @Test func delete2() async throws -> Void {
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
                  "account": {
                    "fees": {
                      "crypto_swap_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 3
                      },
                      "transfer_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 0
                      }
                    },
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-holdings",
                    "title": "Shine Time Holdings"
                  },
                  "authorized_role": {
                    "id": "aurl_xxxxxxxxxxxxxx",
                    "name": "community-moderators"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "direct_reports_count": 0,
                  "email": "marcus@shinetime.example",
                  "id": "ausr_xxxxxxxxxxxxxx",
                  "is_agent": false,
                  "is_partner": false,
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
            account: AccountParent(
                fees: Optional([
                    "crypto_swap_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 3
                    ), 
                    "transfer_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 0
                    )
                ]),
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-holdings",
                title: "Shine Time Holdings"
            ),
            authorizedRole: Nullable<TeamMemberAuthorizedRole>.value(TeamMemberAuthorizedRole(
                id: "aurl_xxxxxxxxxxxxxx",
                name: "community-moderators"
            )),
            createdAt: "2026-01-01T12:00:00.000Z",
            directReportsCount: Nullable<Int>.value(0),
            email: Nullable<String>.value("marcus@shinetime.example"),
            id: "ausr_xxxxxxxxxxxxxx",
            isAgent: false,
            isPartner: false,
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

    @Test func update2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "fees": {
                      "fees": {
                        "fixed_fee_usd": 1.1,
                        "percentage_fee": 1.1
                      }
                    },
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "authorized_role": {
                    "id": "id",
                    "name": "name"
                  },
                  "created_at": "created_at",
                  "direct_reports_count": 1,
                  "email": "email",
                  "id": "id",
                  "is_agent": true,
                  "is_partner": true,
                  "reports_to_chain": [
                    {
                      "id": "id",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      }
                    },
                    {
                      "id": "id",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      }
                    }
                  ],
                  "reports_to_id": "reports_to_id",
                  "role": "owner",
                  "status": "joined",
                  "updated_at": "updated_at",
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
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
            account: AccountParent(
                fees: Optional([
                    "fees": AccountParentFeesValue(
                        fixedFeeUsd: 1.1,
                        percentageFee: 1.1
                    )
                ]),
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            ),
            authorizedRole: Nullable<TeamMemberAuthorizedRole>.value(TeamMemberAuthorizedRole(
                id: "id",
                name: "name"
            )),
            createdAt: "created_at",
            directReportsCount: Nullable<Int>.value(1),
            email: Nullable<String>.value("email"),
            id: "id",
            isAgent: true,
            isPartner: true,
            reportsToChain: Nullable<[TeamMemberManager]>.value([
                TeamMemberManager(
                    id: "id",
                    user: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )
                ),
                TeamMemberManager(
                    id: "id",
                    user: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )
                )
            ]),
            reportsToId: Nullable<String>.value("reports_to_id"),
            role: TeamMemberRole.owner,
            status: TeamMemberStatus.joined,
            updatedAt: "updated_at",
            user: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
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