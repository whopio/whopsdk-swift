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
                      "amount": 25,
                      "created_at": "2026-01-01T12:00:00Z",
                      "created_by_user": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Marcus Webb",
                        "username": "marcuswebb"
                      },
                      "currency": "usd",
                      "destination_ledger_account_id": "ldgr_xxxxxxxxxxxxxx",
                      "failed_at": "2024-01-15T09:30:00Z",
                      "failure_code": "failure_code",
                      "failure_reason": "failure_reason",
                      "fee_amount": 0.5,
                      "id": "ctt_xxxxxxxxxxxxxx",
                      "metadata": {
                        "order_id": "SHINE-1042"
                      },
                      "notes": "Refund for the rescheduled interior detail",
                      "object": "transfer",
                      "origin_ledger_account_id": "ldgr_xxxxxxxxxxxxxx",
                      "status": "processing"
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
        let expectedResponse = ListTransfersResponse(
            data: [
                ListTransfersResponseDataItem(
                    amount: 25,
                    createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                    createdByUser: Nullable<ListTransfersResponseDataItemCreatedByUser>.value(ListTransfersResponseDataItemCreatedByUser(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Optional(Nullable<String>.value("Marcus Webb")),
                        username: "marcuswebb"
                    )),
                    currency: "usd",
                    destinationLedgerAccountId: "ldgr_xxxxxxxxxxxxxx",
                    failedAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                    failureCode: Optional(Nullable<String>.value("failure_code")),
                    failureReason: Optional(Nullable<String>.value("failure_reason")),
                    feeAmount: Optional(Nullable<Double>.value(0.5)),
                    id: "ctt_xxxxxxxxxxxxxx",
                    metadata: Optional(Nullable<[String: JSONValue]>.value([
                        "order_id": JSONValue.string("SHINE-1042")
                    ])),
                    notes: Optional(Nullable<String>.value("Refund for the rescheduled interior detail")),
                    object: ListTransfersResponseDataItemObject.transfer,
                    originLedgerAccountId: "ldgr_xxxxxxxxxxxxxx",
                    status: ListTransfersResponseDataItemStatus.processing
                )
            ],
            pageInfo: ListTransfersResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
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
                  "amount": 25,
                  "created_at": "2026-01-01T12:00:00Z",
                  "created_by_user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Marcus Webb",
                    "username": "marcuswebb"
                  },
                  "currency": "usd",
                  "destination": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing",
                    "typename": "Company"
                  },
                  "destination_ledger_account_id": "ldgr_xxxxxxxxxxxxxx",
                  "failed_at": "2024-01-15T09:30:00Z",
                  "failure_code": "failure_code",
                  "failure_reason": "failure_reason",
                  "fee_amount": 0.5,
                  "id": "ctt_xxxxxxxxxxxxxx",
                  "metadata": {
                    "order_id": "SHINE-1042"
                  },
                  "notes": "Refund for the rescheduled interior detail",
                  "origin": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing",
                    "typename": "Company"
                  },
                  "origin_ledger_account_id": "ldgr_xxxxxxxxxxxxxx",
                  "status": "processing",
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
                amount: 25,
                createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                createdByUser: Nullable<CreateTransfersResponseTransferCreatedByUser>.value(CreateTransfersResponseTransferCreatedByUser(
                    id: "user_xxxxxxxxxxxxxx",
                    name: Optional(Nullable<String>.value("Marcus Webb")),
                    username: "marcuswebb"
                )),
                currency: "usd",
                destination: CreateTransfersResponseTransferDestination.company(
                    .init(
                        id: "biz_xxxxxxxxxxxxxx",
                        route: Optional(Nullable<String>.value("biz_xxxxxxxxxxxxxx")),
                        title: Optional(Nullable<String>.value("Shine Time Auto Detailing")),
                        additionalProperties: [
                            "typename": JSONValue.string("Company")
                        ]
                    )
                ),
                destinationLedgerAccountId: "ldgr_xxxxxxxxxxxxxx",
                failedAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                failureCode: Optional(Nullable<String>.value("failure_code")),
                failureReason: Optional(Nullable<String>.value("failure_reason")),
                feeAmount: Optional(Nullable<Double>.value(0.5)),
                id: "ctt_xxxxxxxxxxxxxx",
                metadata: Optional(Nullable<[String: JSONValue]>.value([
                    "order_id": JSONValue.string("SHINE-1042")
                ])),
                notes: Optional(Nullable<String>.value("Refund for the rescheduled interior detail")),
                origin: CreateTransfersResponseTransferOrigin.company(
                    .init(
                        id: "biz_xxxxxxxxxxxxxx",
                        route: Optional(Nullable<String>.value("biz_xxxxxxxxxxxxxx")),
                        title: Optional(Nullable<String>.value("Shine Time Auto Detailing")),
                        additionalProperties: [
                            "typename": JSONValue.string("Company")
                        ]
                    )
                ),
                originLedgerAccountId: "ldgr_xxxxxxxxxxxxxx",
                status: CreateTransfersResponseTransferStatus.processing,
                additionalProperties: [
                    "object": JSONValue.string("transfer")
                ]
            )
        )
        let response = try await client.transfers.create(
            request: .init(
                amount: 25,
                originId: "biz_xxxxxxxxxxxxxx"
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
                    "end_cursor": "Mg",
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
                endCursor: Nullable<String>.value("Mg"),
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

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "amount": 25,
                  "created_at": "2026-01-01T12:00:00Z",
                  "created_by_user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Marcus Webb",
                    "username": "marcuswebb"
                  },
                  "currency": "usd",
                  "destination": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing",
                    "typename": "Company"
                  },
                  "destination_ledger_account_id": "ldgr_xxxxxxxxxxxxxx",
                  "failed_at": "2024-01-15T09:30:00Z",
                  "failure_code": "failure_code",
                  "failure_reason": "failure_reason",
                  "fee_amount": 0.5,
                  "id": "ctt_xxxxxxxxxxxxxx",
                  "metadata": {
                    "order_id": "SHINE-1042"
                  },
                  "notes": "Refund for the rescheduled interior detail",
                  "object": "transfer",
                  "origin": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing",
                    "typename": "Company"
                  },
                  "origin_ledger_account_id": "ldgr_xxxxxxxxxxxxxx",
                  "status": "processing"
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
            amount: 25,
            createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
            createdByUser: Nullable<RetrieveTransfersResponseCreatedByUser>.value(RetrieveTransfersResponseCreatedByUser(
                id: "user_xxxxxxxxxxxxxx",
                name: Optional(Nullable<String>.value("Marcus Webb")),
                username: "marcuswebb"
            )),
            currency: "usd",
            destination: RetrieveTransfersResponseDestination.company(
                .init(
                    id: "biz_xxxxxxxxxxxxxx",
                    route: Optional(Nullable<String>.value("biz_xxxxxxxxxxxxxx")),
                    title: Optional(Nullable<String>.value("Shine Time Auto Detailing")),
                    additionalProperties: [
                        "typename": JSONValue.string("Company")
                    ]
                )
            ),
            destinationLedgerAccountId: "ldgr_xxxxxxxxxxxxxx",
            failedAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
            failureCode: Optional(Nullable<String>.value("failure_code")),
            failureReason: Optional(Nullable<String>.value("failure_reason")),
            feeAmount: Optional(Nullable<Double>.value(0.5)),
            id: "ctt_xxxxxxxxxxxxxx",
            metadata: Optional(Nullable<[String: JSONValue]>.value([
                "order_id": JSONValue.string("SHINE-1042")
            ])),
            notes: Optional(Nullable<String>.value("Refund for the rescheduled interior detail")),
            object: RetrieveTransfersResponseObject.transfer,
            origin: RetrieveTransfersResponseOrigin.company(
                .init(
                    id: "biz_xxxxxxxxxxxxxx",
                    route: Optional(Nullable<String>.value("biz_xxxxxxxxxxxxxx")),
                    title: Optional(Nullable<String>.value("Shine Time Auto Detailing")),
                    additionalProperties: [
                        "typename": JSONValue.string("Company")
                    ]
                )
            ),
            originLedgerAccountId: "ldgr_xxxxxxxxxxxxxx",
            status: RetrieveTransfersResponseStatus.processing
        )
        let response = try await client.transfers.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}