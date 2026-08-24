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
                      "hostname": "checkout.shinetime.example",
                      "id": "pmd_xxxxxxxxxxxxxx",
                      "provider": "apple",
                      "status": "pending",
                      "updated_at": "2026-01-01T12:00:00.000Z"
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
        let expectedResponse = ListPaymentMethodDomainsResponse(
            data: [
                PaymentMethodDomain(
                    accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    hostname: "checkout.shinetime.example",
                    id: "pmd_xxxxxxxxxxxxxx",
                    provider: PaymentMethodDomainProvider.apple,
                    status: PaymentMethodDomainStatus.pending,
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListPaymentMethodDomainsResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
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
                  "hostname": "checkout.shinetime.example",
                  "id": "pmd_xxxxxxxxxxxxxx",
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
            hostname: "checkout.shinetime.example",
            id: "pmd_xxxxxxxxxxxxxx",
            provider: PaymentMethodDomainProvider.apple,
            status: PaymentMethodDomainStatus.pending,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.paymentMethodDomains.create(
            request: .init(hostname: "pending.shinetime.example"),
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
                  "hostname": "checkout.shinetime.example",
                  "id": "pmd_xxxxxxxxxxxxxx",
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
            hostname: "checkout.shinetime.example",
            id: "pmd_xxxxxxxxxxxxxx",
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

    @Test func delete1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "deleted": true,
                  "id": "pmd_xxxxxxxxxxxxxx"
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
            id: "pmd_xxxxxxxxxxxxxx"
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
                  "hostname": "checkout.shinetime.example",
                  "id": "pmd_xxxxxxxxxxxxxx",
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
            hostname: "checkout.shinetime.example",
            id: "pmd_xxxxxxxxxxxxxx",
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
}