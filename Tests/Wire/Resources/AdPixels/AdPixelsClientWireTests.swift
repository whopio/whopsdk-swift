import Foundation
import Testing
import WhopSDK

@Suite("AdPixelsClient Wire Tests") struct AdPixelsClientWireTests {
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
                      "error_message": "error_message",
                      "external_id": "111222001",
                      "id": "adpx_xxxxxxxxxxxxxx",
                      "name": "Supplier pixel",
                      "platform": "meta",
                      "status": "active",
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
        let expectedResponse = ListAdPixelsResponse(
            data: [
                AdPixel(
                    accountId: "biz_xxxxxxxxxxxxxx",
                    createdAt: "2026-01-01T12:00:00.000Z",
                    errorMessage: Nullable<String>.value("error_message"),
                    externalId: "111222001",
                    id: "adpx_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Supplier pixel"),
                    platform: AdPixelPlatform.meta,
                    status: AdPixelStatus.active,
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListAdPixelsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.adPixels.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                  "error_message": "error_message",
                  "external_id": "111222001",
                  "id": "adpx_xxxxxxxxxxxxxx",
                  "name": "Supplier pixel",
                  "platform": "meta",
                  "status": "active",
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
        let expectedResponse = AdPixel(
            accountId: "biz_xxxxxxxxxxxxxx",
            createdAt: "2026-01-01T12:00:00.000Z",
            errorMessage: Nullable<String>.value("error_message"),
            externalId: "111222001",
            id: "adpx_xxxxxxxxxxxxxx",
            name: Nullable<String>.value("Supplier pixel"),
            platform: AdPixelPlatform.meta,
            status: AdPixelStatus.active,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.adPixels.create(
            request: .init(
                accessToken: "new-token",
                accountId: "biz_xxxxxxxxxxxxxx",
                externalId: "998877665544",
                platform: .meta
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
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "error_message": "error_message",
                  "external_id": "111222001",
                  "id": "adpx_xxxxxxxxxxxxxx",
                  "name": "Supplier pixel",
                  "platform": "meta",
                  "status": "active",
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
        let expectedResponse = AdPixel(
            accountId: "biz_xxxxxxxxxxxxxx",
            createdAt: "2026-01-01T12:00:00.000Z",
            errorMessage: Nullable<String>.value("error_message"),
            externalId: "111222001",
            id: "adpx_xxxxxxxxxxxxxx",
            name: Nullable<String>.value("Supplier pixel"),
            platform: AdPixelPlatform.meta,
            status: AdPixelStatus.active,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.adPixels.retrieve(
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
                  "id": "adpx_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteAdPixelsResponse(
            deleted: true,
            id: "adpx_xxxxxxxxxxxxxx"
        )
        let response = try await client.adPixels.delete(
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
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "error_message": "error_message",
                  "external_id": "111222001",
                  "id": "adpx_xxxxxxxxxxxxxx",
                  "name": "Supplier pixel",
                  "platform": "meta",
                  "status": "active",
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
        let expectedResponse = AdPixel(
            accountId: "biz_xxxxxxxxxxxxxx",
            createdAt: "2026-01-01T12:00:00.000Z",
            errorMessage: Nullable<String>.value("error_message"),
            externalId: "111222001",
            id: "adpx_xxxxxxxxxxxxxx",
            name: Nullable<String>.value("Supplier pixel"),
            platform: AdPixelPlatform.meta,
            status: AdPixelStatus.active,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.adPixels.update(
            id: "id",
            request: .init(accessToken: "new-token"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}