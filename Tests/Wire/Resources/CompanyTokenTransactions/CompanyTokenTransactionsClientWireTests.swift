import Foundation
import Testing
import WhopSDK

@Suite("CompanyTokenTransactionsClient Wire Tests") struct CompanyTokenTransactionsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "amount": 6.9,
                      "company": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "route": "route",
                        "title": "title"
                      },
                      "created_at": "2023-12-01T05:00:00Z",
                      "description": "Reward for completing onboarding",
                      "id": "id",
                      "idempotency_key": "txn_reward_usr_123_2024",
                      "linked_transaction_id": "linked_transaction_id",
                      "member": {
                        "id": "id"
                      },
                      "transaction_type": "add",
                      "user": {
                        "id": "user_xxxxxxxxxxxxx",
                        "name": "John Doe",
                        "username": "johndoe42"
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
        let expectedResponse = ListCompanyTokenTransactionsResponse(
            data: [
                CompanyTokenTransactionListItem(
                    amount: 6.9,
                    company: CompanyTokenTransactionListItemCompany(
                        id: "biz_xxxxxxxxxxxxxx",
                        route: "route",
                        title: "title"
                    ),
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    description: Nullable<String>.value("Reward for completing onboarding"),
                    id: "id",
                    idempotencyKey: Nullable<String>.value("txn_reward_usr_123_2024"),
                    linkedTransactionId: Nullable<String>.value("linked_transaction_id"),
                    member: CompanyTokenTransactionListItemMember(
                        id: "id"
                    ),
                    transactionType: CompanyTokenTransactionTypes.add,
                    user: CompanyTokenTransactionListItemUser(
                        id: "user_xxxxxxxxxxxxx",
                        name: Nullable<String>.value("John Doe"),
                        username: "johndoe42"
                    )
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.companyTokenTransactions.list(
            first: 42,
            last: 42,
            userId: "user_xxxxxxxxxxxxx",
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
                      "amount": 1.1,
                      "company": {
                        "id": "id",
                        "route": "route",
                        "title": "title"
                      },
                      "created_at": "2024-01-15T09:30:00Z",
                      "description": "description",
                      "id": "id",
                      "idempotency_key": "idempotency_key",
                      "linked_transaction_id": "linked_transaction_id",
                      "member": {
                        "id": "id"
                      },
                      "transaction_type": "add",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "username": "username"
                      }
                    },
                    {
                      "amount": 1.1,
                      "company": {
                        "id": "id",
                        "route": "route",
                        "title": "title"
                      },
                      "created_at": "2024-01-15T09:30:00Z",
                      "description": "description",
                      "id": "id",
                      "idempotency_key": "idempotency_key",
                      "linked_transaction_id": "linked_transaction_id",
                      "member": {
                        "id": "id"
                      },
                      "transaction_type": "add",
                      "user": {
                        "id": "id",
                        "name": "name",
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
        let expectedResponse = ListCompanyTokenTransactionsResponse(
            data: [
                CompanyTokenTransactionListItem(
                    amount: 1.1,
                    company: CompanyTokenTransactionListItemCompany(
                        id: "id",
                        route: "route",
                        title: "title"
                    ),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    description: Nullable<String>.value("description"),
                    id: "id",
                    idempotencyKey: Nullable<String>.value("idempotency_key"),
                    linkedTransactionId: Nullable<String>.value("linked_transaction_id"),
                    member: CompanyTokenTransactionListItemMember(
                        id: "id"
                    ),
                    transactionType: CompanyTokenTransactionTypes.add,
                    user: CompanyTokenTransactionListItemUser(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        username: "username"
                    )
                ),
                CompanyTokenTransactionListItem(
                    amount: 1.1,
                    company: CompanyTokenTransactionListItemCompany(
                        id: "id",
                        route: "route",
                        title: "title"
                    ),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    description: Nullable<String>.value("description"),
                    id: "id",
                    idempotencyKey: Nullable<String>.value("idempotency_key"),
                    linkedTransactionId: Nullable<String>.value("linked_transaction_id"),
                    member: CompanyTokenTransactionListItemMember(
                        id: "id"
                    ),
                    transactionType: CompanyTokenTransactionTypes.add,
                    user: CompanyTokenTransactionListItemUser(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        username: "username"
                    )
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.companyTokenTransactions.list(
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
                  "amount": 6.9,
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "route",
                    "title": "title"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "description": "Reward for completing onboarding",
                  "id": "id",
                  "idempotency_key": "txn_reward_usr_123_2024",
                  "linked_transaction_id": "linked_transaction_id",
                  "member": {
                    "id": "id"
                  },
                  "transaction_type": "add",
                  "user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
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
        let expectedResponse = CompanyTokenTransaction(
            amount: 6.9,
            company: CompanyTokenTransactionCompany(
                id: "biz_xxxxxxxxxxxxxx",
                route: "route",
                title: "title"
            ),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            description: Nullable<String>.value("Reward for completing onboarding"),
            id: "id",
            idempotencyKey: Nullable<String>.value("txn_reward_usr_123_2024"),
            linkedTransactionId: Nullable<String>.value("linked_transaction_id"),
            member: CompanyTokenTransactionMember(
                id: "id"
            ),
            transactionType: CompanyTokenTransactionTypes.add,
            user: CompanyTokenTransactionUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )
        )
        let response = try await client.companyTokenTransactions.create(
            request: CreateCompanyTokenTransactionsRequest.transfer(
                CreateCompanyTokenTransactionsRequestTransfer(
                    accountId: "biz_xxxxxxxxxxxxxx",
                    amount: 6.9,
                    destinationUserId: "destination_user_id",
                    userId: "user_xxxxxxxxxxxxx"
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
                  "amount": 1.1,
                  "company": {
                    "id": "id",
                    "route": "route",
                    "title": "title"
                  },
                  "created_at": "2024-01-15T09:30:00Z",
                  "description": "description",
                  "id": "id",
                  "idempotency_key": "idempotency_key",
                  "linked_transaction_id": "linked_transaction_id",
                  "member": {
                    "id": "id"
                  },
                  "transaction_type": "add",
                  "user": {
                    "id": "id",
                    "name": "name",
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
        let expectedResponse = CompanyTokenTransaction(
            amount: 1.1,
            company: CompanyTokenTransactionCompany(
                id: "id",
                route: "route",
                title: "title"
            ),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            description: Nullable<String>.value("description"),
            id: "id",
            idempotencyKey: Nullable<String>.value("idempotency_key"),
            linkedTransactionId: Nullable<String>.value("linked_transaction_id"),
            member: CompanyTokenTransactionMember(
                id: "id"
            ),
            transactionType: CompanyTokenTransactionTypes.add,
            user: CompanyTokenTransactionUser(
                id: "id",
                name: Nullable<String>.value("name"),
                username: "username"
            )
        )
        let response = try await client.companyTokenTransactions.create(
            request: CreateCompanyTokenTransactionsRequest.transfer(
                CreateCompanyTokenTransactionsRequestTransfer(
                    accountId: "account_id",
                    amount: 1.1,
                    destinationUserId: "destination_user_id",
                    userId: "user_id"
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
                  "amount": 6.9,
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "route",
                    "title": "title"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "description": "Reward for completing onboarding",
                  "id": "id",
                  "idempotency_key": "txn_reward_usr_123_2024",
                  "linked_transaction_id": "linked_transaction_id",
                  "member": {
                    "id": "id"
                  },
                  "transaction_type": "add",
                  "user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
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
        let expectedResponse = CompanyTokenTransaction(
            amount: 6.9,
            company: CompanyTokenTransactionCompany(
                id: "biz_xxxxxxxxxxxxxx",
                route: "route",
                title: "title"
            ),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            description: Nullable<String>.value("Reward for completing onboarding"),
            id: "id",
            idempotencyKey: Nullable<String>.value("txn_reward_usr_123_2024"),
            linkedTransactionId: Nullable<String>.value("linked_transaction_id"),
            member: CompanyTokenTransactionMember(
                id: "id"
            ),
            transactionType: CompanyTokenTransactionTypes.add,
            user: CompanyTokenTransactionUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )
        )
        let response = try await client.companyTokenTransactions.retrieve(
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
                  "amount": 1.1,
                  "company": {
                    "id": "id",
                    "route": "route",
                    "title": "title"
                  },
                  "created_at": "2024-01-15T09:30:00Z",
                  "description": "description",
                  "id": "id",
                  "idempotency_key": "idempotency_key",
                  "linked_transaction_id": "linked_transaction_id",
                  "member": {
                    "id": "id"
                  },
                  "transaction_type": "add",
                  "user": {
                    "id": "id",
                    "name": "name",
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
        let expectedResponse = CompanyTokenTransaction(
            amount: 1.1,
            company: CompanyTokenTransactionCompany(
                id: "id",
                route: "route",
                title: "title"
            ),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            description: Nullable<String>.value("description"),
            id: "id",
            idempotencyKey: Nullable<String>.value("idempotency_key"),
            linkedTransactionId: Nullable<String>.value("linked_transaction_id"),
            member: CompanyTokenTransactionMember(
                id: "id"
            ),
            transactionType: CompanyTokenTransactionTypes.add,
            user: CompanyTokenTransactionUser(
                id: "id",
                name: Nullable<String>.value("name"),
                username: "username"
            )
        )
        let response = try await client.companyTokenTransactions.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}