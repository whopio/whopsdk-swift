import Foundation
import Testing
import WhopSDK

@Suite("PartnerReferralRequestsClient Wire Tests") struct PartnerReferralRequestsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "title": "Acme Bookkeeping"
                      },
                      "authorized_user_id": "authorized_user_id",
                      "code": "code",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "id": "prfr_xxxxxxxxxxxxxx",
                      "max_redemptions": 1,
                      "member_id": "member_id",
                      "partner": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "danawhitfield"
                      },
                      "referring_account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "title": "Acme Bookkeeping"
                      },
                      "request_type": "manual",
                      "rewards": [
                        {
                          "bot_qualification_type": null,
                          "id": "id",
                          "qualification_amount": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "recipient": null,
                          "recipient_id": null,
                          "reward_amount": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          }
                        }
                      ],
                      "status": "pending",
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
        let expectedResponse = ListPartnerReferralRequestsResponse(
            data: [
                PartnerReferralRequest(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "biz_xxxxxxxxxxxxxx",
                        title: "Acme Bookkeeping"
                    )),
                    authorizedUserId: Nullable<String>.value("authorized_user_id"),
                    code: Nullable<String>.value("code"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    id: "prfr_xxxxxxxxxxxxxx",
                    maxRedemptions: Nullable<Int>.value(1),
                    memberId: Nullable<String>.value("member_id"),
                    partner: UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    ),
                    referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                        id: "biz_xxxxxxxxxxxxxx",
                        title: "Acme Bookkeeping"
                    )),
                    requestType: PartnerReferralRequestRequestType.manual,
                    rewards: [
                        PartnerReferralReward(
                            botQualificationType: .null,
                            id: "id",
                            qualificationAmount: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            recipient: .null,
                            recipientId: .null,
                            rewardAmount: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )
                        )
                    ],
                    status: Nullable<PartnerReferralRequestStatus>.value(PartnerReferralRequestStatus.pending),
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
            pageInfo: ListPartnerReferralRequestsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.partnerReferralRequests.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                        "id": "id",
                        "title": "title"
                      },
                      "authorized_user_id": "authorized_user_id",
                      "code": "code",
                      "created_at": "created_at",
                      "id": "id",
                      "max_redemptions": 1,
                      "member_id": "member_id",
                      "partner": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "referring_account": {
                        "id": "id",
                        "title": "title"
                      },
                      "request_type": "manual",
                      "rewards": [
                        {
                          "bot_qualification_type": "sales",
                          "id": "id",
                          "qualification_amount": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "recipient": "business",
                          "recipient_id": "recipient_id",
                          "reward_amount": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          }
                        },
                        {
                          "bot_qualification_type": "sales",
                          "id": "id",
                          "qualification_amount": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "recipient": "business",
                          "recipient_id": "recipient_id",
                          "reward_amount": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          }
                        }
                      ],
                      "status": "pending",
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
                        "id": "id",
                        "title": "title"
                      },
                      "authorized_user_id": "authorized_user_id",
                      "code": "code",
                      "created_at": "created_at",
                      "id": "id",
                      "max_redemptions": 1,
                      "member_id": "member_id",
                      "partner": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "referring_account": {
                        "id": "id",
                        "title": "title"
                      },
                      "request_type": "manual",
                      "rewards": [
                        {
                          "bot_qualification_type": "sales",
                          "id": "id",
                          "qualification_amount": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "recipient": "business",
                          "recipient_id": "recipient_id",
                          "reward_amount": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          }
                        },
                        {
                          "bot_qualification_type": "sales",
                          "id": "id",
                          "qualification_amount": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "recipient": "business",
                          "recipient_id": "recipient_id",
                          "reward_amount": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          }
                        }
                      ],
                      "status": "pending",
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
        let expectedResponse = ListPartnerReferralRequestsResponse(
            data: [
                PartnerReferralRequest(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    authorizedUserId: Nullable<String>.value("authorized_user_id"),
                    code: Nullable<String>.value("code"),
                    createdAt: "created_at",
                    id: "id",
                    maxRedemptions: Nullable<Int>.value(1),
                    memberId: Nullable<String>.value("member_id"),
                    partner: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    ),
                    referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    requestType: PartnerReferralRequestRequestType.manual,
                    rewards: [
                        PartnerReferralReward(
                            botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                            id: "id",
                            qualificationAmount: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                            recipientId: Nullable<String>.value("recipient_id"),
                            rewardAmount: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )
                        ),
                        PartnerReferralReward(
                            botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                            id: "id",
                            qualificationAmount: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                            recipientId: Nullable<String>.value("recipient_id"),
                            rewardAmount: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )
                        )
                    ],
                    status: Nullable<PartnerReferralRequestStatus>.value(PartnerReferralRequestStatus.pending),
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
                PartnerReferralRequest(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    authorizedUserId: Nullable<String>.value("authorized_user_id"),
                    code: Nullable<String>.value("code"),
                    createdAt: "created_at",
                    id: "id",
                    maxRedemptions: Nullable<Int>.value(1),
                    memberId: Nullable<String>.value("member_id"),
                    partner: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    ),
                    referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    requestType: PartnerReferralRequestRequestType.manual,
                    rewards: [
                        PartnerReferralReward(
                            botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                            id: "id",
                            qualificationAmount: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                            recipientId: Nullable<String>.value("recipient_id"),
                            rewardAmount: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )
                        ),
                        PartnerReferralReward(
                            botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                            id: "id",
                            qualificationAmount: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ),
                            recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                            recipientId: Nullable<String>.value("recipient_id"),
                            rewardAmount: Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )
                        )
                    ],
                    status: Nullable<PartnerReferralRequestStatus>.value(PartnerReferralRequestStatus.pending),
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
            pageInfo: ListPartnerReferralRequestsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.partnerReferralRequests.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "authorized_user_id": "authorized_user_id",
                  "code": "code",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "prfr_xxxxxxxxxxxxxx",
                  "max_redemptions": 1,
                  "member_id": "member_id",
                  "partner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "referring_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "request_type": "manual",
                  "rewards": [
                    {
                      "bot_qualification_type": "sales",
                      "id": "id",
                      "qualification_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "recipient": "business",
                      "recipient_id": "recipient_id",
                      "reward_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      }
                    }
                  ],
                  "status": "pending",
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
        let expectedResponse = PartnerReferralRequest(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            authorizedUserId: Nullable<String>.value("authorized_user_id"),
            code: Nullable<String>.value("code"),
            createdAt: "2026-01-01T12:00:00.000Z",
            id: "prfr_xxxxxxxxxxxxxx",
            maxRedemptions: Nullable<Int>.value(1),
            memberId: Nullable<String>.value("member_id"),
            partner: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            requestType: PartnerReferralRequestRequestType.manual,
            rewards: [
                PartnerReferralReward(
                    botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                    id: "id",
                    qualificationAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                    recipientId: Nullable<String>.value("recipient_id"),
                    rewardAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )
                )
            ],
            status: Nullable<PartnerReferralRequestStatus>.value(PartnerReferralRequestStatus.pending),
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
        let response = try await client.partnerReferralRequests.create(
            request: CreatePartnerReferralRequestsRequestBody.createPartnerReferralRequestsRequestBodyAccountId(
                CreatePartnerReferralRequestsRequestBodyAccountId(
                    accountId: "biz_xxxxxxxxxxxxxx"
                )
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
                    "id": "id",
                    "title": "title"
                  },
                  "authorized_user_id": "authorized_user_id",
                  "code": "code",
                  "created_at": "created_at",
                  "id": "id",
                  "max_redemptions": 1,
                  "member_id": "member_id",
                  "partner": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "referring_account": {
                    "id": "id",
                    "title": "title"
                  },
                  "request_type": "manual",
                  "rewards": [
                    {
                      "bot_qualification_type": "sales",
                      "id": "id",
                      "qualification_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "recipient": "business",
                      "recipient_id": "recipient_id",
                      "reward_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      }
                    },
                    {
                      "bot_qualification_type": "sales",
                      "id": "id",
                      "qualification_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "recipient": "business",
                      "recipient_id": "recipient_id",
                      "reward_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      }
                    }
                  ],
                  "status": "pending",
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
        let expectedResponse = PartnerReferralRequest(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            authorizedUserId: Nullable<String>.value("authorized_user_id"),
            code: Nullable<String>.value("code"),
            createdAt: "created_at",
            id: "id",
            maxRedemptions: Nullable<Int>.value(1),
            memberId: Nullable<String>.value("member_id"),
            partner: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            requestType: PartnerReferralRequestRequestType.manual,
            rewards: [
                PartnerReferralReward(
                    botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                    id: "id",
                    qualificationAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                    recipientId: Nullable<String>.value("recipient_id"),
                    rewardAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )
                ),
                PartnerReferralReward(
                    botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                    id: "id",
                    qualificationAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                    recipientId: Nullable<String>.value("recipient_id"),
                    rewardAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )
                )
            ],
            status: Nullable<PartnerReferralRequestStatus>.value(PartnerReferralRequestStatus.pending),
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
        let response = try await client.partnerReferralRequests.create(
            request: CreatePartnerReferralRequestsRequestBody.createPartnerReferralRequestsRequestBodyAccountId(
                CreatePartnerReferralRequestsRequestBodyAccountId(
                    accountId: "account_id"
                )
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
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "authorized_user_id": "authorized_user_id",
                  "code": "code",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "prfr_xxxxxxxxxxxxxx",
                  "max_redemptions": 1,
                  "member_id": "member_id",
                  "partner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "referring_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "request_type": "manual",
                  "rewards": [
                    {
                      "bot_qualification_type": "sales",
                      "id": "id",
                      "qualification_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "recipient": "business",
                      "recipient_id": "recipient_id",
                      "reward_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      }
                    }
                  ],
                  "status": "pending",
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
        let expectedResponse = PartnerReferralRequest(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            authorizedUserId: Nullable<String>.value("authorized_user_id"),
            code: Nullable<String>.value("code"),
            createdAt: "2026-01-01T12:00:00.000Z",
            id: "prfr_xxxxxxxxxxxxxx",
            maxRedemptions: Nullable<Int>.value(1),
            memberId: Nullable<String>.value("member_id"),
            partner: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            requestType: PartnerReferralRequestRequestType.manual,
            rewards: [
                PartnerReferralReward(
                    botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                    id: "id",
                    qualificationAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                    recipientId: Nullable<String>.value("recipient_id"),
                    rewardAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )
                )
            ],
            status: Nullable<PartnerReferralRequestStatus>.value(PartnerReferralRequestStatus.pending),
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
        let response = try await client.partnerReferralRequests.retrieve(
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
                    "id": "id",
                    "title": "title"
                  },
                  "authorized_user_id": "authorized_user_id",
                  "code": "code",
                  "created_at": "created_at",
                  "id": "id",
                  "max_redemptions": 1,
                  "member_id": "member_id",
                  "partner": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "referring_account": {
                    "id": "id",
                    "title": "title"
                  },
                  "request_type": "manual",
                  "rewards": [
                    {
                      "bot_qualification_type": "sales",
                      "id": "id",
                      "qualification_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "recipient": "business",
                      "recipient_id": "recipient_id",
                      "reward_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      }
                    },
                    {
                      "bot_qualification_type": "sales",
                      "id": "id",
                      "qualification_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "recipient": "business",
                      "recipient_id": "recipient_id",
                      "reward_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      }
                    }
                  ],
                  "status": "pending",
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
        let expectedResponse = PartnerReferralRequest(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            authorizedUserId: Nullable<String>.value("authorized_user_id"),
            code: Nullable<String>.value("code"),
            createdAt: "created_at",
            id: "id",
            maxRedemptions: Nullable<Int>.value(1),
            memberId: Nullable<String>.value("member_id"),
            partner: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            requestType: PartnerReferralRequestRequestType.manual,
            rewards: [
                PartnerReferralReward(
                    botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                    id: "id",
                    qualificationAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                    recipientId: Nullable<String>.value("recipient_id"),
                    rewardAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )
                ),
                PartnerReferralReward(
                    botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                    id: "id",
                    qualificationAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                    recipientId: Nullable<String>.value("recipient_id"),
                    rewardAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )
                )
            ],
            status: Nullable<PartnerReferralRequestStatus>.value(PartnerReferralRequestStatus.pending),
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
        let response = try await client.partnerReferralRequests.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func accept1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "authorized_user_id": "authorized_user_id",
                  "code": "code",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "prfr_xxxxxxxxxxxxxx",
                  "max_redemptions": 1,
                  "member_id": "member_id",
                  "partner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "referring_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "request_type": "manual",
                  "rewards": [
                    {
                      "bot_qualification_type": "sales",
                      "id": "id",
                      "qualification_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "recipient": "business",
                      "recipient_id": "recipient_id",
                      "reward_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      }
                    }
                  ],
                  "status": "pending",
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
        let expectedResponse = PartnerReferralRequest(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            authorizedUserId: Nullable<String>.value("authorized_user_id"),
            code: Nullable<String>.value("code"),
            createdAt: "2026-01-01T12:00:00.000Z",
            id: "prfr_xxxxxxxxxxxxxx",
            maxRedemptions: Nullable<Int>.value(1),
            memberId: Nullable<String>.value("member_id"),
            partner: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            requestType: PartnerReferralRequestRequestType.manual,
            rewards: [
                PartnerReferralReward(
                    botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                    id: "id",
                    qualificationAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                    recipientId: Nullable<String>.value("recipient_id"),
                    rewardAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )
                )
            ],
            status: Nullable<PartnerReferralRequestStatus>.value(PartnerReferralRequestStatus.pending),
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
        let response = try await client.partnerReferralRequests.accept(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func accept2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "authorized_user_id": "authorized_user_id",
                  "code": "code",
                  "created_at": "created_at",
                  "id": "id",
                  "max_redemptions": 1,
                  "member_id": "member_id",
                  "partner": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "referring_account": {
                    "id": "id",
                    "title": "title"
                  },
                  "request_type": "manual",
                  "rewards": [
                    {
                      "bot_qualification_type": "sales",
                      "id": "id",
                      "qualification_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "recipient": "business",
                      "recipient_id": "recipient_id",
                      "reward_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      }
                    },
                    {
                      "bot_qualification_type": "sales",
                      "id": "id",
                      "qualification_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "recipient": "business",
                      "recipient_id": "recipient_id",
                      "reward_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      }
                    }
                  ],
                  "status": "pending",
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
        let expectedResponse = PartnerReferralRequest(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            authorizedUserId: Nullable<String>.value("authorized_user_id"),
            code: Nullable<String>.value("code"),
            createdAt: "created_at",
            id: "id",
            maxRedemptions: Nullable<Int>.value(1),
            memberId: Nullable<String>.value("member_id"),
            partner: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            requestType: PartnerReferralRequestRequestType.manual,
            rewards: [
                PartnerReferralReward(
                    botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                    id: "id",
                    qualificationAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                    recipientId: Nullable<String>.value("recipient_id"),
                    rewardAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )
                ),
                PartnerReferralReward(
                    botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                    id: "id",
                    qualificationAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                    recipientId: Nullable<String>.value("recipient_id"),
                    rewardAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )
                )
            ],
            status: Nullable<PartnerReferralRequestStatus>.value(PartnerReferralRequestStatus.pending),
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
        let response = try await client.partnerReferralRequests.accept(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func cancel1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "authorized_user_id": "authorized_user_id",
                  "code": "code",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "prfr_xxxxxxxxxxxxxx",
                  "max_redemptions": 1,
                  "member_id": "member_id",
                  "partner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "referring_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "request_type": "manual",
                  "rewards": [
                    {
                      "bot_qualification_type": "sales",
                      "id": "id",
                      "qualification_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "recipient": "business",
                      "recipient_id": "recipient_id",
                      "reward_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      }
                    }
                  ],
                  "status": "pending",
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
        let expectedResponse = PartnerReferralRequest(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            authorizedUserId: Nullable<String>.value("authorized_user_id"),
            code: Nullable<String>.value("code"),
            createdAt: "2026-01-01T12:00:00.000Z",
            id: "prfr_xxxxxxxxxxxxxx",
            maxRedemptions: Nullable<Int>.value(1),
            memberId: Nullable<String>.value("member_id"),
            partner: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            requestType: PartnerReferralRequestRequestType.manual,
            rewards: [
                PartnerReferralReward(
                    botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                    id: "id",
                    qualificationAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                    recipientId: Nullable<String>.value("recipient_id"),
                    rewardAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )
                )
            ],
            status: Nullable<PartnerReferralRequestStatus>.value(PartnerReferralRequestStatus.pending),
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
        let response = try await client.partnerReferralRequests.cancel(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func cancel2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "authorized_user_id": "authorized_user_id",
                  "code": "code",
                  "created_at": "created_at",
                  "id": "id",
                  "max_redemptions": 1,
                  "member_id": "member_id",
                  "partner": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "referring_account": {
                    "id": "id",
                    "title": "title"
                  },
                  "request_type": "manual",
                  "rewards": [
                    {
                      "bot_qualification_type": "sales",
                      "id": "id",
                      "qualification_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "recipient": "business",
                      "recipient_id": "recipient_id",
                      "reward_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      }
                    },
                    {
                      "bot_qualification_type": "sales",
                      "id": "id",
                      "qualification_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "recipient": "business",
                      "recipient_id": "recipient_id",
                      "reward_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      }
                    }
                  ],
                  "status": "pending",
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
        let expectedResponse = PartnerReferralRequest(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            authorizedUserId: Nullable<String>.value("authorized_user_id"),
            code: Nullable<String>.value("code"),
            createdAt: "created_at",
            id: "id",
            maxRedemptions: Nullable<Int>.value(1),
            memberId: Nullable<String>.value("member_id"),
            partner: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            requestType: PartnerReferralRequestRequestType.manual,
            rewards: [
                PartnerReferralReward(
                    botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                    id: "id",
                    qualificationAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                    recipientId: Nullable<String>.value("recipient_id"),
                    rewardAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )
                ),
                PartnerReferralReward(
                    botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                    id: "id",
                    qualificationAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                    recipientId: Nullable<String>.value("recipient_id"),
                    rewardAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )
                )
            ],
            status: Nullable<PartnerReferralRequestStatus>.value(PartnerReferralRequestStatus.pending),
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
        let response = try await client.partnerReferralRequests.cancel(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func decline1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "authorized_user_id": "authorized_user_id",
                  "code": "code",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "prfr_xxxxxxxxxxxxxx",
                  "max_redemptions": 1,
                  "member_id": "member_id",
                  "partner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "referring_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "request_type": "manual",
                  "rewards": [
                    {
                      "bot_qualification_type": "sales",
                      "id": "id",
                      "qualification_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "recipient": "business",
                      "recipient_id": "recipient_id",
                      "reward_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      }
                    }
                  ],
                  "status": "pending",
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
        let expectedResponse = PartnerReferralRequest(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            authorizedUserId: Nullable<String>.value("authorized_user_id"),
            code: Nullable<String>.value("code"),
            createdAt: "2026-01-01T12:00:00.000Z",
            id: "prfr_xxxxxxxxxxxxxx",
            maxRedemptions: Nullable<Int>.value(1),
            memberId: Nullable<String>.value("member_id"),
            partner: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            requestType: PartnerReferralRequestRequestType.manual,
            rewards: [
                PartnerReferralReward(
                    botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                    id: "id",
                    qualificationAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                    recipientId: Nullable<String>.value("recipient_id"),
                    rewardAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )
                )
            ],
            status: Nullable<PartnerReferralRequestStatus>.value(PartnerReferralRequestStatus.pending),
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
        let response = try await client.partnerReferralRequests.decline(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func decline2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "authorized_user_id": "authorized_user_id",
                  "code": "code",
                  "created_at": "created_at",
                  "id": "id",
                  "max_redemptions": 1,
                  "member_id": "member_id",
                  "partner": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "referring_account": {
                    "id": "id",
                    "title": "title"
                  },
                  "request_type": "manual",
                  "rewards": [
                    {
                      "bot_qualification_type": "sales",
                      "id": "id",
                      "qualification_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "recipient": "business",
                      "recipient_id": "recipient_id",
                      "reward_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      }
                    },
                    {
                      "bot_qualification_type": "sales",
                      "id": "id",
                      "qualification_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "recipient": "business",
                      "recipient_id": "recipient_id",
                      "reward_amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      }
                    }
                  ],
                  "status": "pending",
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
        let expectedResponse = PartnerReferralRequest(
            account: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            authorizedUserId: Nullable<String>.value("authorized_user_id"),
            code: Nullable<String>.value("code"),
            createdAt: "created_at",
            id: "id",
            maxRedemptions: Nullable<Int>.value(1),
            memberId: Nullable<String>.value("member_id"),
            partner: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            requestType: PartnerReferralRequestRequestType.manual,
            rewards: [
                PartnerReferralReward(
                    botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                    id: "id",
                    qualificationAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                    recipientId: Nullable<String>.value("recipient_id"),
                    rewardAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )
                ),
                PartnerReferralReward(
                    botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>.value(PartnerReferralRewardBotQualificationType.sales),
                    id: "id",
                    qualificationAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    recipient: Nullable<PartnerReferralRewardRecipient>.value(PartnerReferralRewardRecipient.business),
                    recipientId: Nullable<String>.value("recipient_id"),
                    rewardAmount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )
                )
            ],
            status: Nullable<PartnerReferralRequestStatus>.value(PartnerReferralRequestStatus.pending),
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
        let response = try await client.partnerReferralRequests.decline(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}