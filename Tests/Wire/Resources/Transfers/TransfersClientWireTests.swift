import Foundation
import Testing
import WhopSDK

@Suite("TransfersClient Wire Tests") struct TransfersClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "created_at": "2026-01-01T12:00:00Z",
                      "destination": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo",
                        "name": "Dana Whitfield",
                        "object": "account"
                      },
                      "failed_at": "2024-01-15T09:30:00Z",
                      "failure_code": "failure_code",
                      "failure_reason": "failure_reason",
                      "fee": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "id": "ctt_xxxxxxxxxxxxxx",
                      "metadata": {
                        "order_id": "SHINE-1042"
                      },
                      "notes": "Refund for the rescheduled interior detail",
                      "object": "transfer",
                      "origin": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo",
                        "name": "Shine Time Auto Detailing",
                        "object": "account"
                      },
                      "status": "processing",
                      "status_changed_at": "2024-01-15T09:30:00Z",
                      "succeeded_at": "2024-01-15T09:30:00Z",
                      "tracking_url": "https://whop.com/ctt_xxxxxxxxxxxxxx/"
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
        let expectedResponse = ListTransfersResponse(
            data: [
                ListTransfersResponseDataItem(
                    amount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                    destination: Nullable<ListTransfersResponseDataItemDestination>.value(ListTransfersResponseDataItemDestination(
                        id: "user_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo"),
                        name: Nullable<String>.value("Dana Whitfield"),
                        object: ListTransfersResponseDataItemDestinationObject.account
                    )),
                    failedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    failureCode: Nullable<String>.value("failure_code"),
                    failureReason: Nullable<String>.value("failure_reason"),
                    fee: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    id: "ctt_xxxxxxxxxxxxxx",
                    metadata: [
                        "order_id": JSONValue.string("SHINE-1042")
                    ],
                    notes: Nullable<String>.value("Refund for the rescheduled interior detail"),
                    object: ListTransfersResponseDataItemObject.transfer,
                    origin: Nullable<ListTransfersResponseDataItemOrigin>.value(ListTransfersResponseDataItemOrigin(
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo"),
                        name: Nullable<String>.value("Shine Time Auto Detailing"),
                        object: ListTransfersResponseDataItemOriginObject.account
                    )),
                    status: ListTransfersResponseDataItemStatus.processing,
                    statusChangedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    succeededAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    trackingUrl: "https://whop.com/ctt_xxxxxxxxxxxxxx/"
                )
            ],
            pageInfo: ListTransfersResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.transfers.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "created_at": "2024-01-15T09:30:00Z",
                      "destination": {
                        "id": "id",
                        "logo_url": "logo_url",
                        "name": "name",
                        "object": "account"
                      },
                      "failed_at": "2024-01-15T09:30:00Z",
                      "failure_code": "failure_code",
                      "failure_reason": "failure_reason",
                      "fee": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "id": "id",
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "notes": "notes",
                      "object": "transfer",
                      "origin": {
                        "id": "id",
                        "logo_url": "logo_url",
                        "name": "name",
                        "object": "account"
                      },
                      "status": "processing",
                      "status_changed_at": "2024-01-15T09:30:00Z",
                      "succeeded_at": "2024-01-15T09:30:00Z",
                      "tracking_url": "tracking_url"
                    },
                    {
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "created_at": "2024-01-15T09:30:00Z",
                      "destination": {
                        "id": "id",
                        "logo_url": "logo_url",
                        "name": "name",
                        "object": "account"
                      },
                      "failed_at": "2024-01-15T09:30:00Z",
                      "failure_code": "failure_code",
                      "failure_reason": "failure_reason",
                      "fee": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "id": "id",
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "notes": "notes",
                      "object": "transfer",
                      "origin": {
                        "id": "id",
                        "logo_url": "logo_url",
                        "name": "name",
                        "object": "account"
                      },
                      "status": "processing",
                      "status_changed_at": "2024-01-15T09:30:00Z",
                      "succeeded_at": "2024-01-15T09:30:00Z",
                      "tracking_url": "tracking_url"
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
        let expectedResponse = ListTransfersResponse(
            data: [
                ListTransfersResponseDataItem(
                    amount: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    destination: Nullable<ListTransfersResponseDataItemDestination>.value(ListTransfersResponseDataItemDestination(
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        name: Nullable<String>.value("name"),
                        object: ListTransfersResponseDataItemDestinationObject.account
                    )),
                    failedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    failureCode: Nullable<String>.value("failure_code"),
                    failureReason: Nullable<String>.value("failure_reason"),
                    fee: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    id: "id",
                    metadata: [
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    notes: Nullable<String>.value("notes"),
                    object: ListTransfersResponseDataItemObject.transfer,
                    origin: Nullable<ListTransfersResponseDataItemOrigin>.value(ListTransfersResponseDataItemOrigin(
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        name: Nullable<String>.value("name"),
                        object: ListTransfersResponseDataItemOriginObject.account
                    )),
                    status: ListTransfersResponseDataItemStatus.processing,
                    statusChangedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    succeededAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    trackingUrl: "tracking_url"
                ),
                ListTransfersResponseDataItem(
                    amount: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    destination: Nullable<ListTransfersResponseDataItemDestination>.value(ListTransfersResponseDataItemDestination(
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        name: Nullable<String>.value("name"),
                        object: ListTransfersResponseDataItemDestinationObject.account
                    )),
                    failedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    failureCode: Nullable<String>.value("failure_code"),
                    failureReason: Nullable<String>.value("failure_reason"),
                    fee: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    id: "id",
                    metadata: [
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    notes: Nullable<String>.value("notes"),
                    object: ListTransfersResponseDataItemObject.transfer,
                    origin: Nullable<ListTransfersResponseDataItemOrigin>.value(ListTransfersResponseDataItemOrigin(
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        name: Nullable<String>.value("name"),
                        object: ListTransfersResponseDataItemOriginObject.account
                    )),
                    status: ListTransfersResponseDataItemStatus.processing,
                    statusChangedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    succeededAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    trackingUrl: "tracking_url"
                )
            ],
            pageInfo: ListTransfersResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.transfers.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "created_at": "2026-01-01T12:00:00Z",
                  "destination": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo",
                    "name": "Shine Time Auto Detailing",
                    "object": "account"
                  },
                  "failed_at": "2024-01-15T09:30:00Z",
                  "failure_code": "failure_code",
                  "failure_reason": "failure_reason",
                  "fee": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "id": "ctt_xxxxxxxxxxxxxx",
                  "metadata": {
                    "order_id": "SHINE-1042"
                  },
                  "notes": "Refund for the rescheduled interior detail",
                  "origin": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo",
                    "name": "Shine Time Auto Detailing",
                    "object": "account"
                  },
                  "status": "processing",
                  "status_changed_at": "2024-01-15T09:30:00Z",
                  "succeeded_at": "2024-01-15T09:30:00Z",
                  "tracking_url": "https://whop.com/ctt_xxxxxxxxxxxxxx/",
                  "object": "transfer"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateTransfersResponse.transfer(
            .init(
                amount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                destination: Nullable<CreateTransfersResponseTransferDestination>.value(CreateTransfersResponseTransferDestination(
                    id: "biz_xxxxxxxxxxxxxx",
                    logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo"),
                    name: Nullable<String>.value("Shine Time Auto Detailing"),
                    object: CreateTransfersResponseTransferDestinationObject.account
                )),
                failedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                failureCode: Nullable<String>.value("failure_code"),
                failureReason: Nullable<String>.value("failure_reason"),
                fee: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                id: "ctt_xxxxxxxxxxxxxx",
                metadata: [
                    "order_id": JSONValue.string("SHINE-1042")
                ],
                notes: Nullable<String>.value("Refund for the rescheduled interior detail"),
                origin: Nullable<CreateTransfersResponseTransferOrigin>.value(CreateTransfersResponseTransferOrigin(
                    id: "biz_xxxxxxxxxxxxxx",
                    logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo"),
                    name: Nullable<String>.value("Shine Time Auto Detailing"),
                    object: CreateTransfersResponseTransferOriginObject.account
                )),
                status: CreateTransfersResponseTransferStatus.processing,
                statusChangedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                succeededAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                trackingUrl: "https://whop.com/ctt_xxxxxxxxxxxxxx/",
                additionalProperties: [
                    "object": JSONValue.string("transfer")
                ]
            )
        )
        let response = try await client.transfers.create(
            request: CreateTransfersRequestBody.balance(
                CreateTransfersRequestBodyBalance(
                    amount: 25,
                    currency: "usd",
                    destinationId: "user_xxxxxxxxxxxxxx",
                    originId: "biz_xxxxxxxxxxxxxx"
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
                  "object": "transfer",
                  "amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "created_at": "2024-01-15T09:30:00Z",
                  "destination": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "name": "name",
                    "object": "account"
                  },
                  "failed_at": "2024-01-15T09:30:00Z",
                  "failure_code": "failure_code",
                  "failure_reason": "failure_reason",
                  "fee": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "id": "id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "notes": "notes",
                  "origin": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "name": "name",
                    "object": "account"
                  },
                  "status": "processing",
                  "status_changed_at": "2024-01-15T09:30:00Z",
                  "succeeded_at": "2024-01-15T09:30:00Z",
                  "tracking_url": "tracking_url"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateTransfersResponse.transfer(
            .init(
                amount: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                destination: Nullable<CreateTransfersResponseTransferDestination>.value(CreateTransfersResponseTransferDestination(
                    id: "id",
                    logoUrl: Nullable<String>.value("logo_url"),
                    name: Nullable<String>.value("name"),
                    object: CreateTransfersResponseTransferDestinationObject.account
                )),
                failedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                failureCode: Nullable<String>.value("failure_code"),
                failureReason: Nullable<String>.value("failure_reason"),
                fee: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                id: "id",
                metadata: [
                    "metadata": JSONValue.object(
                        [
                            "key": JSONValue.string("value")
                        ]
                    )
                ],
                notes: Nullable<String>.value("notes"),
                origin: Nullable<CreateTransfersResponseTransferOrigin>.value(CreateTransfersResponseTransferOrigin(
                    id: "id",
                    logoUrl: Nullable<String>.value("logo_url"),
                    name: Nullable<String>.value("name"),
                    object: CreateTransfersResponseTransferOriginObject.account
                )),
                status: CreateTransfersResponseTransferStatus.processing,
                statusChangedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                succeededAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                trackingUrl: "tracking_url",
                additionalProperties: [
                    "object": JSONValue.string("transfer")
                ]
            )
        )
        let response = try await client.transfers.create(
            request: CreateTransfersRequestBody.balance(
                CreateTransfersRequestBodyBalance(
                    amount: 1.1,
                    currency: "currency",
                    destinationId: "destination_id",
                    originId: "origin_id"
                )
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func listRecipients1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "id": "user_xxxxxxxxxxxxxx",
                      "name": "Dana Whitfield",
                      "profile_picture_url": "https://ui-avatars.com/api/",
                      "username": "danawhitfield",
                      "object": "user"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "MQ"
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
        let expectedResponse = ListRecipientsTransfersResponse(
            data: [
                ListRecipientsTransfersResponseDataItem.user(
                    .init(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePictureUrl: Nullable<String>.value("https://ui-avatars.com/api/"),
                        username: Nullable<String>.value("danawhitfield"),
                        additionalProperties: [
                            "object": JSONValue.string("user")
                        ]
                    )
                )
            ],
            pageInfo: ListRecipientsTransfersResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("MQ")
            )
        )
        let response = try await client.transfers.listRecipients(
            originId: "origin_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func listRecipients2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "object": "user",
                      "id": "id",
                      "name": "name",
                      "profile_picture_url": "profile_picture_url",
                      "username": "username"
                    },
                    {
                      "object": "user",
                      "id": "id",
                      "name": "name",
                      "profile_picture_url": "profile_picture_url",
                      "username": "username"
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
        let expectedResponse = ListRecipientsTransfersResponse(
            data: [
                ListRecipientsTransfersResponseDataItem.user(
                    .init(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePictureUrl: Nullable<String>.value("profile_picture_url"),
                        username: Nullable<String>.value("username"),
                        additionalProperties: [
                            "object": JSONValue.string("user")
                        ]
                    )
                ),
                ListRecipientsTransfersResponseDataItem.user(
                    .init(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePictureUrl: Nullable<String>.value("profile_picture_url"),
                        username: Nullable<String>.value("username"),
                        additionalProperties: [
                            "object": JSONValue.string("user")
                        ]
                    )
                )
            ],
            pageInfo: ListRecipientsTransfersResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.transfers.listRecipients(
            originId: "origin_id",
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
                  "amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "created_at": "2026-01-01T12:00:00Z",
                  "destination": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo",
                    "name": "Shine Time Auto Detailing",
                    "object": "account"
                  },
                  "failed_at": "2024-01-15T09:30:00Z",
                  "failure_code": "failure_code",
                  "failure_reason": "failure_reason",
                  "fee": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "id": "ctt_xxxxxxxxxxxxxx",
                  "metadata": {
                    "order_id": "SHINE-1042"
                  },
                  "notes": "Refund for the rescheduled interior detail",
                  "object": "transfer",
                  "origin": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo",
                    "name": "Shine Time Auto Detailing",
                    "object": "account"
                  },
                  "status": "processing",
                  "status_changed_at": "2024-01-15T09:30:00Z",
                  "succeeded_at": "2024-01-15T09:30:00Z",
                  "tracking_url": "https://whop.com/ctt_xxxxxxxxxxxxxx/"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RetrieveTransfersResponse(
            amount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
            destination: Nullable<RetrieveTransfersResponseDestination>.value(RetrieveTransfersResponseDestination(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo"),
                name: Nullable<String>.value("Shine Time Auto Detailing"),
                object: RetrieveTransfersResponseDestinationObject.account
            )),
            failedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            failureCode: Nullable<String>.value("failure_code"),
            failureReason: Nullable<String>.value("failure_reason"),
            fee: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            id: "ctt_xxxxxxxxxxxxxx",
            metadata: [
                "order_id": JSONValue.string("SHINE-1042")
            ],
            notes: Nullable<String>.value("Refund for the rescheduled interior detail"),
            object: RetrieveTransfersResponseObject.transfer,
            origin: Nullable<RetrieveTransfersResponseOrigin>.value(RetrieveTransfersResponseOrigin(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo"),
                name: Nullable<String>.value("Shine Time Auto Detailing"),
                object: RetrieveTransfersResponseOriginObject.account
            )),
            status: RetrieveTransfersResponseStatus.processing,
            statusChangedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            succeededAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            trackingUrl: "https://whop.com/ctt_xxxxxxxxxxxxxx/"
        )
        let response = try await client.transfers.retrieve(
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
                  "amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "created_at": "2024-01-15T09:30:00Z",
                  "destination": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "name": "name",
                    "object": "account"
                  },
                  "failed_at": "2024-01-15T09:30:00Z",
                  "failure_code": "failure_code",
                  "failure_reason": "failure_reason",
                  "fee": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "id": "id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "notes": "notes",
                  "object": "transfer",
                  "origin": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "name": "name",
                    "object": "account"
                  },
                  "status": "processing",
                  "status_changed_at": "2024-01-15T09:30:00Z",
                  "succeeded_at": "2024-01-15T09:30:00Z",
                  "tracking_url": "tracking_url"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RetrieveTransfersResponse(
            amount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            destination: Nullable<RetrieveTransfersResponseDestination>.value(RetrieveTransfersResponseDestination(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                name: Nullable<String>.value("name"),
                object: RetrieveTransfersResponseDestinationObject.account
            )),
            failedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            failureCode: Nullable<String>.value("failure_code"),
            failureReason: Nullable<String>.value("failure_reason"),
            fee: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            id: "id",
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            notes: Nullable<String>.value("notes"),
            object: RetrieveTransfersResponseObject.transfer,
            origin: Nullable<RetrieveTransfersResponseOrigin>.value(RetrieveTransfersResponseOrigin(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                name: Nullable<String>.value("name"),
                object: RetrieveTransfersResponseOriginObject.account
            )),
            status: RetrieveTransfersResponseStatus.processing,
            statusChangedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            succeededAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            trackingUrl: "tracking_url"
        )
        let response = try await client.transfers.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}