import Foundation
import Testing
import WhopSDK

@Suite("EmailAddressesClient Wire Tests") struct EmailAddressesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "address": "marcus@shinetime.example",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "domain_id": "whopappdomain0000001",
                      "id": "emaddr_xxxxxxxxxxxxxx",
                      "password": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "user_id": "user_xxxxxxxxxxxxxx"
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
        let expectedResponse = ListEmailAddressesResponse(
            data: [
                EmailAddress(
                    accountId: "biz_xxxxxxxxxxxxxx",
                    address: "marcus@shinetime.example",
                    createdAt: "2026-01-01T12:00:00.000Z",
                    domainId: "whopappdomain0000001",
                    id: "emaddr_xxxxxxxxxxxxxx",
                    password: Nullable<String>.value("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
                )
            ],
            pageInfo: ListEmailAddressesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.emailAddresses.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "address": "address",
                      "created_at": "created_at",
                      "domain_id": "domain_id",
                      "id": "id",
                      "password": "password",
                      "updated_at": "updated_at",
                      "user_id": "user_id"
                    },
                    {
                      "account_id": "account_id",
                      "address": "address",
                      "created_at": "created_at",
                      "domain_id": "domain_id",
                      "id": "id",
                      "password": "password",
                      "updated_at": "updated_at",
                      "user_id": "user_id"
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
        let expectedResponse = ListEmailAddressesResponse(
            data: [
                EmailAddress(
                    accountId: "account_id",
                    address: "address",
                    createdAt: "created_at",
                    domainId: "domain_id",
                    id: "id",
                    password: Nullable<String>.value("password"),
                    updatedAt: "updated_at",
                    userId: Nullable<String>.value("user_id")
                ),
                EmailAddress(
                    accountId: "account_id",
                    address: "address",
                    createdAt: "created_at",
                    domainId: "domain_id",
                    id: "id",
                    password: Nullable<String>.value("password"),
                    updatedAt: "updated_at",
                    userId: Nullable<String>.value("user_id")
                )
            ],
            pageInfo: ListEmailAddressesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.emailAddresses.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "address": "marcus@shinetime.example",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "domain_id": "whopappdomain0000001",
                  "id": "emaddr_xxxxxxxxxxxxxx",
                  "password": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "updated_at": "2026-01-01T12:00:00.000Z",
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
        let expectedResponse = EmailAddress(
            accountId: "biz_xxxxxxxxxxxxxx",
            address: "marcus@shinetime.example",
            createdAt: "2026-01-01T12:00:00.000Z",
            domainId: "whopappdomain0000001",
            id: "emaddr_xxxxxxxxxxxxxx",
            password: Nullable<String>.value("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
        )
        let response = try await client.emailAddresses.create(
            request: .init(address: "marcus@shinetime.example"),
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
                  "address": "address",
                  "created_at": "created_at",
                  "domain_id": "domain_id",
                  "id": "id",
                  "password": "password",
                  "updated_at": "updated_at",
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = EmailAddress(
            accountId: "account_id",
            address: "address",
            createdAt: "created_at",
            domainId: "domain_id",
            id: "id",
            password: Nullable<String>.value("password"),
            updatedAt: "updated_at",
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.emailAddresses.create(
            request: .init(address: "address"),
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
                  "address": "marcus@shinetime.example",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "domain_id": "whopappdomain0000001",
                  "id": "emaddr_xxxxxxxxxxxxxx",
                  "password": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "updated_at": "2026-01-01T12:00:00.000Z",
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
        let expectedResponse = EmailAddress(
            accountId: "biz_xxxxxxxxxxxxxx",
            address: "marcus@shinetime.example",
            createdAt: "2026-01-01T12:00:00.000Z",
            domainId: "whopappdomain0000001",
            id: "emaddr_xxxxxxxxxxxxxx",
            password: Nullable<String>.value("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
        )
        let response = try await client.emailAddresses.retrieve(
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
                  "address": "address",
                  "created_at": "created_at",
                  "domain_id": "domain_id",
                  "id": "id",
                  "password": "password",
                  "updated_at": "updated_at",
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = EmailAddress(
            accountId: "account_id",
            address: "address",
            createdAt: "created_at",
            domainId: "domain_id",
            id: "id",
            password: Nullable<String>.value("password"),
            updatedAt: "updated_at",
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.emailAddresses.retrieve(
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "address": "marcus@shinetime.example",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "domain_id": "whopappdomain0000001",
                  "id": "emaddr_xxxxxxxxxxxxxx",
                  "password": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "updated_at": "2026-01-01T12:00:00.000Z",
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
        let expectedResponse = EmailAddress(
            accountId: "biz_xxxxxxxxxxxxxx",
            address: "marcus@shinetime.example",
            createdAt: "2026-01-01T12:00:00.000Z",
            domainId: "whopappdomain0000001",
            id: "emaddr_xxxxxxxxxxxxxx",
            password: Nullable<String>.value("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
        )
        let response = try await client.emailAddresses.delete(
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
                  "account_id": "account_id",
                  "address": "address",
                  "created_at": "created_at",
                  "domain_id": "domain_id",
                  "id": "id",
                  "password": "password",
                  "updated_at": "updated_at",
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = EmailAddress(
            accountId: "account_id",
            address: "address",
            createdAt: "created_at",
            domainId: "domain_id",
            id: "id",
            password: Nullable<String>.value("password"),
            updatedAt: "updated_at",
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.emailAddresses.delete(
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
                  "address": "marcus@shinetime.example",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "domain_id": "whopappdomain0000001",
                  "id": "emaddr_xxxxxxxxxxxxxx",
                  "password": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "updated_at": "2026-01-01T12:00:00.000Z",
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
        let expectedResponse = EmailAddress(
            accountId: "biz_xxxxxxxxxxxxxx",
            address: "marcus@shinetime.example",
            createdAt: "2026-01-01T12:00:00.000Z",
            domainId: "whopappdomain0000001",
            id: "emaddr_xxxxxxxxxxxxxx",
            password: Nullable<String>.value("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
        )
        let response = try await client.emailAddresses.update(
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
                  "account_id": "account_id",
                  "address": "address",
                  "created_at": "created_at",
                  "domain_id": "domain_id",
                  "id": "id",
                  "password": "password",
                  "updated_at": "updated_at",
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = EmailAddress(
            accountId: "account_id",
            address: "address",
            createdAt: "created_at",
            domainId: "domain_id",
            id: "id",
            password: Nullable<String>.value("password"),
            updatedAt: "updated_at",
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.emailAddresses.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func resetPassword1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "address": "marcus@shinetime.example",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "domain_id": "whopappdomain0000001",
                  "id": "emaddr_xxxxxxxxxxxxxx",
                  "password": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "updated_at": "2026-01-01T12:00:00.000Z",
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
        let expectedResponse = EmailAddress(
            accountId: "biz_xxxxxxxxxxxxxx",
            address: "marcus@shinetime.example",
            createdAt: "2026-01-01T12:00:00.000Z",
            domainId: "whopappdomain0000001",
            id: "emaddr_xxxxxxxxxxxxxx",
            password: Nullable<String>.value("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
        )
        let response = try await client.emailAddresses.resetPassword(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func resetPassword2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "address": "address",
                  "created_at": "created_at",
                  "domain_id": "domain_id",
                  "id": "id",
                  "password": "password",
                  "updated_at": "updated_at",
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = EmailAddress(
            accountId: "account_id",
            address: "address",
            createdAt: "created_at",
            domainId: "domain_id",
            id: "id",
            password: Nullable<String>.value("password"),
            updatedAt: "updated_at",
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.emailAddresses.resetPassword(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}