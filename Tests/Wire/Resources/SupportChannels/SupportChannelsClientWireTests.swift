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
                      "account_id": "account_id",
                      "company_id": "company_id",
                      "custom_name": "Project Alpha Team",
                      "customer_user": {
                        "id": "user_xxxxxxxxxxxxx",
                        "name": "John Doe",
                        "username": "johndoe42"
                      },
                      "id": "id",
                      "last_message": {
                        "attachments": [
                          {
                            "content_type": "image/jpeg",
                            "filename": "document.pdf"
                          }
                        ],
                        "content": "Hey, are you available for a **quick call**?",
                        "created_at": "2023-12-01T05:00:00Z",
                        "gifs": [
                          {
                            "slug": "slug"
                          }
                        ],
                        "id": "id",
                        "poll": null,
                        "user_id": "user_id"
                      },
                      "last_message_at": "2023-12-01T05:00:00Z",
                      "needs_reply": true,
                      "participated": true,
                      "resolved_at": "2023-12-01T05:00:00Z",
                      "unread": true
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
                    accountId: Nullable<String>.value("account_id"),
                    companyId: Nullable<String>.value("company_id"),
                    customName: Nullable<String>.value("Project Alpha Team"),
                    customerUser: Nullable<SupportChannelListItemCustomerUser>.value(SupportChannelListItemCustomerUser(
                        id: "user_xxxxxxxxxxxxx",
                        name: Nullable<String>.value("John Doe"),
                        username: "johndoe42"
                    )),
                    id: "id",
                    lastMessage: Nullable<SupportChannelListItemLastMessage>.value(SupportChannelListItemLastMessage(
                        attachments: [
                            SupportChannelListItemLastMessageAttachmentsItem(
                                contentType: Nullable<String>.value("image/jpeg"),
                                filename: Nullable<String>.value("document.pdf")
                            )
                        ],
                        content: Nullable<String>.value("Hey, are you available for a **quick call**?"),
                        createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                        gifs: [
                            SupportChannelListItemLastMessageGifsItem(
                                slug: "slug"
                            )
                        ],
                        id: "id",
                        poll: .null,
                        userId: "user_id"
                    )),
                    lastMessageAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    needsReply: Nullable<Bool>.value(true),
                    participated: Nullable<Bool>.value(true),
                    resolvedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    unread: Nullable<Bool>.value(true)
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
                      "account_id": "account_id",
                      "company_id": "company_id",
                      "custom_name": "custom_name",
                      "customer_user": {
                        "id": "id",
                        "name": "name",
                        "username": "username"
                      },
                      "id": "id",
                      "last_message": {
                        "attachments": [
                          {
                            "content_type": "content_type",
                            "filename": "filename"
                          },
                          {
                            "content_type": "content_type",
                            "filename": "filename"
                          }
                        ],
                        "content": "content",
                        "created_at": "2024-01-15T09:30:00Z",
                        "gifs": [
                          {
                            "slug": "slug"
                          },
                          {
                            "slug": "slug"
                          }
                        ],
                        "id": "id",
                        "poll": {
                          "options": [
                            {
                              "id": "id"
                            },
                            {
                              "id": "id"
                            }
                          ]
                        },
                        "user_id": "user_id"
                      },
                      "last_message_at": "2024-01-15T09:30:00Z",
                      "needs_reply": true,
                      "participated": true,
                      "resolved_at": "2024-01-15T09:30:00Z",
                      "unread": true
                    },
                    {
                      "account_id": "account_id",
                      "company_id": "company_id",
                      "custom_name": "custom_name",
                      "customer_user": {
                        "id": "id",
                        "name": "name",
                        "username": "username"
                      },
                      "id": "id",
                      "last_message": {
                        "attachments": [
                          {
                            "content_type": "content_type",
                            "filename": "filename"
                          },
                          {
                            "content_type": "content_type",
                            "filename": "filename"
                          }
                        ],
                        "content": "content",
                        "created_at": "2024-01-15T09:30:00Z",
                        "gifs": [
                          {
                            "slug": "slug"
                          },
                          {
                            "slug": "slug"
                          }
                        ],
                        "id": "id",
                        "poll": {
                          "options": [
                            {
                              "id": "id"
                            },
                            {
                              "id": "id"
                            }
                          ]
                        },
                        "user_id": "user_id"
                      },
                      "last_message_at": "2024-01-15T09:30:00Z",
                      "needs_reply": true,
                      "participated": true,
                      "resolved_at": "2024-01-15T09:30:00Z",
                      "unread": true
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
                    accountId: Nullable<String>.value("account_id"),
                    companyId: Nullable<String>.value("company_id"),
                    customName: Nullable<String>.value("custom_name"),
                    customerUser: Nullable<SupportChannelListItemCustomerUser>.value(SupportChannelListItemCustomerUser(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        username: "username"
                    )),
                    id: "id",
                    lastMessage: Nullable<SupportChannelListItemLastMessage>.value(SupportChannelListItemLastMessage(
                        attachments: [
                            SupportChannelListItemLastMessageAttachmentsItem(
                                contentType: Nullable<String>.value("content_type"),
                                filename: Nullable<String>.value("filename")
                            ),
                            SupportChannelListItemLastMessageAttachmentsItem(
                                contentType: Nullable<String>.value("content_type"),
                                filename: Nullable<String>.value("filename")
                            )
                        ],
                        content: Nullable<String>.value("content"),
                        createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                        gifs: [
                            SupportChannelListItemLastMessageGifsItem(
                                slug: "slug"
                            ),
                            SupportChannelListItemLastMessageGifsItem(
                                slug: "slug"
                            )
                        ],
                        id: "id",
                        poll: Nullable<SupportChannelListItemLastMessagePoll>.value(SupportChannelListItemLastMessagePoll(
                            options: Nullable<[SupportChannelListItemLastMessagePollOptionsItem]>.value([
                                SupportChannelListItemLastMessagePollOptionsItem(
                                    id: "id"
                                ),
                                SupportChannelListItemLastMessagePollOptionsItem(
                                    id: "id"
                                )
                            ])
                        )),
                        userId: "user_id"
                    )),
                    lastMessageAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    needsReply: Nullable<Bool>.value(true),
                    participated: Nullable<Bool>.value(true),
                    resolvedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    unread: Nullable<Bool>.value(true)
                ),
                SupportChannelListItem(
                    accountId: Nullable<String>.value("account_id"),
                    companyId: Nullable<String>.value("company_id"),
                    customName: Nullable<String>.value("custom_name"),
                    customerUser: Nullable<SupportChannelListItemCustomerUser>.value(SupportChannelListItemCustomerUser(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        username: "username"
                    )),
                    id: "id",
                    lastMessage: Nullable<SupportChannelListItemLastMessage>.value(SupportChannelListItemLastMessage(
                        attachments: [
                            SupportChannelListItemLastMessageAttachmentsItem(
                                contentType: Nullable<String>.value("content_type"),
                                filename: Nullable<String>.value("filename")
                            ),
                            SupportChannelListItemLastMessageAttachmentsItem(
                                contentType: Nullable<String>.value("content_type"),
                                filename: Nullable<String>.value("filename")
                            )
                        ],
                        content: Nullable<String>.value("content"),
                        createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                        gifs: [
                            SupportChannelListItemLastMessageGifsItem(
                                slug: "slug"
                            ),
                            SupportChannelListItemLastMessageGifsItem(
                                slug: "slug"
                            )
                        ],
                        id: "id",
                        poll: Nullable<SupportChannelListItemLastMessagePoll>.value(SupportChannelListItemLastMessagePoll(
                            options: Nullable<[SupportChannelListItemLastMessagePollOptionsItem]>.value([
                                SupportChannelListItemLastMessagePollOptionsItem(
                                    id: "id"
                                ),
                                SupportChannelListItemLastMessagePollOptionsItem(
                                    id: "id"
                                )
                            ])
                        )),
                        userId: "user_id"
                    )),
                    lastMessageAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    needsReply: Nullable<Bool>.value(true),
                    participated: Nullable<Bool>.value(true),
                    resolvedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    unread: Nullable<Bool>.value(true)
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.supportChannels.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "company_id": "company_id",
                  "custom_name": "Project Alpha Team",
                  "customer_user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "id": "id",
                  "last_message": {
                    "attachments": [
                      {
                        "content_type": "image/jpeg",
                        "filename": "document.pdf"
                      }
                    ],
                    "content": "Hey, are you available for a **quick call**?",
                    "created_at": "2023-12-01T05:00:00Z",
                    "gifs": [
                      {
                        "slug": "slug"
                      }
                    ],
                    "id": "id",
                    "poll": {
                      "options": [
                        {
                          "id": "id"
                        }
                      ]
                    },
                    "user_id": "user_id"
                  },
                  "last_message_at": "2023-12-01T05:00:00Z",
                  "needs_reply": true,
                  "participated": true,
                  "resolved_at": "2023-12-01T05:00:00Z",
                  "unread": true
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
            accountId: Nullable<String>.value("account_id"),
            companyId: Nullable<String>.value("company_id"),
            customName: Nullable<String>.value("Project Alpha Team"),
            customerUser: Nullable<SupportChannelCustomerUser>.value(SupportChannelCustomerUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )),
            id: "id",
            lastMessage: Nullable<SupportChannelLastMessage>.value(SupportChannelLastMessage(
                attachments: [
                    SupportChannelLastMessageAttachmentsItem(
                        contentType: Nullable<String>.value("image/jpeg"),
                        filename: Nullable<String>.value("document.pdf")
                    )
                ],
                content: Nullable<String>.value("Hey, are you available for a **quick call**?"),
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                gifs: [
                    SupportChannelLastMessageGifsItem(
                        slug: "slug"
                    )
                ],
                id: "id",
                poll: Nullable<SupportChannelLastMessagePoll>.value(SupportChannelLastMessagePoll(
                    options: Nullable<[SupportChannelLastMessagePollOptionsItem]>.value([
                        SupportChannelLastMessagePollOptionsItem(
                            id: "id"
                        )
                    ])
                )),
                userId: "user_id"
            )),
            lastMessageAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            needsReply: Nullable<Bool>.value(true),
            participated: Nullable<Bool>.value(true),
            resolvedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            unread: Nullable<Bool>.value(true)
        )
        let response = try await client.supportChannels.create(
            request: .init(
                accountId: "biz_xxxxxxxxxxxxxx",
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
                  "account_id": "account_id",
                  "company_id": "company_id",
                  "custom_name": "custom_name",
                  "customer_user": {
                    "id": "id",
                    "name": "name",
                    "username": "username"
                  },
                  "id": "id",
                  "last_message": {
                    "attachments": [
                      {
                        "content_type": "content_type",
                        "filename": "filename"
                      },
                      {
                        "content_type": "content_type",
                        "filename": "filename"
                      }
                    ],
                    "content": "content",
                    "created_at": "2024-01-15T09:30:00Z",
                    "gifs": [
                      {
                        "slug": "slug"
                      },
                      {
                        "slug": "slug"
                      }
                    ],
                    "id": "id",
                    "poll": {
                      "options": [
                        {
                          "id": "id"
                        },
                        {
                          "id": "id"
                        }
                      ]
                    },
                    "user_id": "user_id"
                  },
                  "last_message_at": "2024-01-15T09:30:00Z",
                  "needs_reply": true,
                  "participated": true,
                  "resolved_at": "2024-01-15T09:30:00Z",
                  "unread": true
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
            accountId: Nullable<String>.value("account_id"),
            companyId: Nullable<String>.value("company_id"),
            customName: Nullable<String>.value("custom_name"),
            customerUser: Nullable<SupportChannelCustomerUser>.value(SupportChannelCustomerUser(
                id: "id",
                name: Nullable<String>.value("name"),
                username: "username"
            )),
            id: "id",
            lastMessage: Nullable<SupportChannelLastMessage>.value(SupportChannelLastMessage(
                attachments: [
                    SupportChannelLastMessageAttachmentsItem(
                        contentType: Nullable<String>.value("content_type"),
                        filename: Nullable<String>.value("filename")
                    ),
                    SupportChannelLastMessageAttachmentsItem(
                        contentType: Nullable<String>.value("content_type"),
                        filename: Nullable<String>.value("filename")
                    )
                ],
                content: Nullable<String>.value("content"),
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                gifs: [
                    SupportChannelLastMessageGifsItem(
                        slug: "slug"
                    ),
                    SupportChannelLastMessageGifsItem(
                        slug: "slug"
                    )
                ],
                id: "id",
                poll: Nullable<SupportChannelLastMessagePoll>.value(SupportChannelLastMessagePoll(
                    options: Nullable<[SupportChannelLastMessagePollOptionsItem]>.value([
                        SupportChannelLastMessagePollOptionsItem(
                            id: "id"
                        ),
                        SupportChannelLastMessagePollOptionsItem(
                            id: "id"
                        )
                    ])
                )),
                userId: "user_id"
            )),
            lastMessageAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            needsReply: Nullable<Bool>.value(true),
            participated: Nullable<Bool>.value(true),
            resolvedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            unread: Nullable<Bool>.value(true)
        )
        let response = try await client.supportChannels.create(
            request: .init(
                accountId: "account_id",
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
                  "account_id": "account_id",
                  "company_id": "company_id",
                  "custom_name": "Project Alpha Team",
                  "customer_user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "id": "id",
                  "last_message": {
                    "attachments": [
                      {
                        "content_type": "image/jpeg",
                        "filename": "document.pdf"
                      }
                    ],
                    "content": "Hey, are you available for a **quick call**?",
                    "created_at": "2023-12-01T05:00:00Z",
                    "gifs": [
                      {
                        "slug": "slug"
                      }
                    ],
                    "id": "id",
                    "poll": {
                      "options": [
                        {
                          "id": "id"
                        }
                      ]
                    },
                    "user_id": "user_id"
                  },
                  "last_message_at": "2023-12-01T05:00:00Z",
                  "needs_reply": true,
                  "participated": true,
                  "resolved_at": "2023-12-01T05:00:00Z",
                  "unread": true
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
            accountId: Nullable<String>.value("account_id"),
            companyId: Nullable<String>.value("company_id"),
            customName: Nullable<String>.value("Project Alpha Team"),
            customerUser: Nullable<SupportChannelCustomerUser>.value(SupportChannelCustomerUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )),
            id: "id",
            lastMessage: Nullable<SupportChannelLastMessage>.value(SupportChannelLastMessage(
                attachments: [
                    SupportChannelLastMessageAttachmentsItem(
                        contentType: Nullable<String>.value("image/jpeg"),
                        filename: Nullable<String>.value("document.pdf")
                    )
                ],
                content: Nullable<String>.value("Hey, are you available for a **quick call**?"),
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                gifs: [
                    SupportChannelLastMessageGifsItem(
                        slug: "slug"
                    )
                ],
                id: "id",
                poll: Nullable<SupportChannelLastMessagePoll>.value(SupportChannelLastMessagePoll(
                    options: Nullable<[SupportChannelLastMessagePollOptionsItem]>.value([
                        SupportChannelLastMessagePollOptionsItem(
                            id: "id"
                        )
                    ])
                )),
                userId: "user_id"
            )),
            lastMessageAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            needsReply: Nullable<Bool>.value(true),
            participated: Nullable<Bool>.value(true),
            resolvedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            unread: Nullable<Bool>.value(true)
        )
        let response = try await client.supportChannels.retrieve(
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
                  "account_id": "account_id",
                  "company_id": "company_id",
                  "custom_name": "custom_name",
                  "customer_user": {
                    "id": "id",
                    "name": "name",
                    "username": "username"
                  },
                  "id": "id",
                  "last_message": {
                    "attachments": [
                      {
                        "content_type": "content_type",
                        "filename": "filename"
                      },
                      {
                        "content_type": "content_type",
                        "filename": "filename"
                      }
                    ],
                    "content": "content",
                    "created_at": "2024-01-15T09:30:00Z",
                    "gifs": [
                      {
                        "slug": "slug"
                      },
                      {
                        "slug": "slug"
                      }
                    ],
                    "id": "id",
                    "poll": {
                      "options": [
                        {
                          "id": "id"
                        },
                        {
                          "id": "id"
                        }
                      ]
                    },
                    "user_id": "user_id"
                  },
                  "last_message_at": "2024-01-15T09:30:00Z",
                  "needs_reply": true,
                  "participated": true,
                  "resolved_at": "2024-01-15T09:30:00Z",
                  "unread": true
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
            accountId: Nullable<String>.value("account_id"),
            companyId: Nullable<String>.value("company_id"),
            customName: Nullable<String>.value("custom_name"),
            customerUser: Nullable<SupportChannelCustomerUser>.value(SupportChannelCustomerUser(
                id: "id",
                name: Nullable<String>.value("name"),
                username: "username"
            )),
            id: "id",
            lastMessage: Nullable<SupportChannelLastMessage>.value(SupportChannelLastMessage(
                attachments: [
                    SupportChannelLastMessageAttachmentsItem(
                        contentType: Nullable<String>.value("content_type"),
                        filename: Nullable<String>.value("filename")
                    ),
                    SupportChannelLastMessageAttachmentsItem(
                        contentType: Nullable<String>.value("content_type"),
                        filename: Nullable<String>.value("filename")
                    )
                ],
                content: Nullable<String>.value("content"),
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                gifs: [
                    SupportChannelLastMessageGifsItem(
                        slug: "slug"
                    ),
                    SupportChannelLastMessageGifsItem(
                        slug: "slug"
                    )
                ],
                id: "id",
                poll: Nullable<SupportChannelLastMessagePoll>.value(SupportChannelLastMessagePoll(
                    options: Nullable<[SupportChannelLastMessagePollOptionsItem]>.value([
                        SupportChannelLastMessagePollOptionsItem(
                            id: "id"
                        ),
                        SupportChannelLastMessagePollOptionsItem(
                            id: "id"
                        )
                    ])
                )),
                userId: "user_id"
            )),
            lastMessageAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            needsReply: Nullable<Bool>.value(true),
            participated: Nullable<Bool>.value(true),
            resolvedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            unread: Nullable<Bool>.value(true)
        )
        let response = try await client.supportChannels.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}