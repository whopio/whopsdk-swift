import Foundation
import Testing
import WhopSDK

@Suite("PaymentMethodDomainsClient Wire Tests") struct PaymentMethodDomainsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "hostname": "checkout.shinetime.com",
                      "id": "dom_xxxxxxxxxxxxxx",
                      "provider": "apple",
                      "status": "pending",
                      "updated_at": "2026-01-01T12:00:00.000Z"
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
        let expectedResponse = ListPaymentMethodDomainsResponse(
            data: [
                PaymentMethodDomain(
                    accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    hostname: "checkout.shinetime.com",
                    id: "dom_xxxxxxxxxxxxxx",
                    provider: PaymentMethodDomainProvider.apple,
                    status: PaymentMethodDomainStatus.pending,
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListPaymentMethodDomainsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.paymentMethodDomains.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "created_at": "created_at",
                      "hostname": "hostname",
                      "id": "id",
                      "provider": "apple",
                      "status": "pending",
                      "updated_at": "updated_at"
                    },
                    {
                      "account_id": "account_id",
                      "created_at": "created_at",
                      "hostname": "hostname",
                      "id": "id",
                      "provider": "apple",
                      "status": "pending",
                      "updated_at": "updated_at"
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
        let expectedResponse = ListPaymentMethodDomainsResponse(
            data: [
                PaymentMethodDomain(
                    accountId: Nullable<String>.value("account_id"),
                    createdAt: "created_at",
                    hostname: "hostname",
                    id: "id",
                    provider: PaymentMethodDomainProvider.apple,
                    status: PaymentMethodDomainStatus.pending,
                    updatedAt: "updated_at"
                ),
                PaymentMethodDomain(
                    accountId: Nullable<String>.value("account_id"),
                    createdAt: "created_at",
                    hostname: "hostname",
                    id: "id",
                    provider: PaymentMethodDomainProvider.apple,
                    status: PaymentMethodDomainStatus.pending,
                    updatedAt: "updated_at"
                )
            ],
            pageInfo: ListPaymentMethodDomainsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.paymentMethodDomains.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "hostname": "checkout.shinetime.com",
                  "id": "dom_xxxxxxxxxxxxxx",
                  "provider": "apple",
                  "status": "pending",
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentMethodDomain(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            hostname: "checkout.shinetime.com",
            id: "dom_xxxxxxxxxxxxxx",
            provider: PaymentMethodDomainProvider.apple,
            status: PaymentMethodDomainStatus.pending,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.paymentMethodDomains.create(
            request: .init(hostname: "pending.shinetime.com"),
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
                  "created_at": "created_at",
                  "hostname": "hostname",
                  "id": "id",
                  "provider": "apple",
                  "status": "pending",
                  "updated_at": "updated_at"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentMethodDomain(
            accountId: Nullable<String>.value("account_id"),
            createdAt: "created_at",
            hostname: "hostname",
            id: "id",
            provider: PaymentMethodDomainProvider.apple,
            status: PaymentMethodDomainStatus.pending,
            updatedAt: "updated_at"
        )
        let response = try await client.paymentMethodDomains.create(
            request: .init(hostname: "hostname"),
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
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "hostname": "checkout.shinetime.com",
                  "id": "dom_xxxxxxxxxxxxxx",
                  "provider": "apple",
                  "status": "pending",
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentMethodDomain(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            hostname: "checkout.shinetime.com",
            id: "dom_xxxxxxxxxxxxxx",
            provider: PaymentMethodDomainProvider.apple,
            status: PaymentMethodDomainStatus.pending,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.paymentMethodDomains.retrieve(
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
                  "created_at": "created_at",
                  "hostname": "hostname",
                  "id": "id",
                  "provider": "apple",
                  "status": "pending",
                  "updated_at": "updated_at"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentMethodDomain(
            accountId: Nullable<String>.value("account_id"),
            createdAt: "created_at",
            hostname: "hostname",
            id: "id",
            provider: PaymentMethodDomainProvider.apple,
            status: PaymentMethodDomainStatus.pending,
            updatedAt: "updated_at"
        )
        let response = try await client.paymentMethodDomains.retrieve(
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
                  "deleted": true,
                  "id": "dom_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeletePaymentMethodDomainsResponse(
            deleted: true,
            id: "dom_xxxxxxxxxxxxxx"
        )
        let response = try await client.paymentMethodDomains.delete(
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
                  "deleted": true,
                  "id": "id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeletePaymentMethodDomainsResponse(
            deleted: true,
            id: "id"
        )
        let response = try await client.paymentMethodDomains.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func verify1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "hostname": "checkout.shinetime.com",
                  "id": "dom_xxxxxxxxxxxxxx",
                  "provider": "apple",
                  "status": "pending",
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentMethodDomain(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            hostname: "checkout.shinetime.com",
            id: "dom_xxxxxxxxxxxxxx",
            provider: PaymentMethodDomainProvider.apple,
            status: PaymentMethodDomainStatus.pending,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.paymentMethodDomains.verify(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func verify2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "created_at": "created_at",
                  "hostname": "hostname",
                  "id": "id",
                  "provider": "apple",
                  "status": "pending",
                  "updated_at": "updated_at"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentMethodDomain(
            accountId: Nullable<String>.value("account_id"),
            createdAt: "created_at",
            hostname: "hostname",
            id: "id",
            provider: PaymentMethodDomainProvider.apple,
            status: PaymentMethodDomainStatus.pending,
            updatedAt: "updated_at"
        )
        let response = try await client.paymentMethodDomains.verify(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}