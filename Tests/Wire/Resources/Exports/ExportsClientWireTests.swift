import Foundation
import Testing
import WhopSDK

@Suite("ExportsClient Wire Tests") struct ExportsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "download_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "expires_at": "2026-01-01T12:00:00.000Z",
                      "id": "exprt_xxxxxxxxxxxxxx",
                      "progress_percent": 0,
                      "resource": "ad_campaigns",
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
        let expectedResponse = ListExportsResponse(
            data: [
                Export(
                    createdAt: "2026-01-01T12:00:00.000Z",
                    downloadUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    expiresAt: "2026-01-01T12:00:00.000Z",
                    id: "exprt_xxxxxxxxxxxxxx",
                    progressPercent: Nullable<Int>.value(0),
                    resource: ExportResource.adCampaigns,
                    status: ExportStatus.pending,
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListExportsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.exports.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "created_at": "created_at",
                      "download_url": "download_url",
                      "expires_at": "expires_at",
                      "id": "id",
                      "progress_percent": 1,
                      "resource": "ad_campaigns",
                      "status": "pending",
                      "updated_at": "updated_at"
                    },
                    {
                      "created_at": "created_at",
                      "download_url": "download_url",
                      "expires_at": "expires_at",
                      "id": "id",
                      "progress_percent": 1,
                      "resource": "ad_campaigns",
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
        let expectedResponse = ListExportsResponse(
            data: [
                Export(
                    createdAt: "created_at",
                    downloadUrl: Nullable<String>.value("download_url"),
                    expiresAt: "expires_at",
                    id: "id",
                    progressPercent: Nullable<Int>.value(1),
                    resource: ExportResource.adCampaigns,
                    status: ExportStatus.pending,
                    updatedAt: "updated_at"
                ),
                Export(
                    createdAt: "created_at",
                    downloadUrl: Nullable<String>.value("download_url"),
                    expiresAt: "expires_at",
                    id: "id",
                    progressPercent: Nullable<Int>.value(1),
                    resource: ExportResource.adCampaigns,
                    status: ExportStatus.pending,
                    updatedAt: "updated_at"
                )
            ],
            pageInfo: ListExportsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.exports.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "download_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "id": "exprt_xxxxxxxxxxxxxx",
                  "progress_percent": 0,
                  "resource": "ad_campaigns",
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
        let expectedResponse = Export(
            createdAt: "2026-01-01T12:00:00.000Z",
            downloadUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            expiresAt: "2026-01-01T12:00:00.000Z",
            id: "exprt_xxxxxxxxxxxxxx",
            progressPercent: Nullable<Int>.value(0),
            resource: ExportResource.adCampaigns,
            status: ExportStatus.pending,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.exports.create(
            request: .init(resource: .adCampaigns),
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
                  "created_at": "created_at",
                  "download_url": "download_url",
                  "expires_at": "expires_at",
                  "id": "id",
                  "progress_percent": 1,
                  "resource": "ad_campaigns",
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
        let expectedResponse = Export(
            createdAt: "created_at",
            downloadUrl: Nullable<String>.value("download_url"),
            expiresAt: "expires_at",
            id: "id",
            progressPercent: Nullable<Int>.value(1),
            resource: ExportResource.adCampaigns,
            status: ExportStatus.pending,
            updatedAt: "updated_at"
        )
        let response = try await client.exports.create(
            request: .init(resource: .adCampaigns),
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
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "download_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "id": "exprt_xxxxxxxxxxxxxx",
                  "progress_percent": 0,
                  "resource": "ad_campaigns",
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
        let expectedResponse = Export(
            createdAt: "2026-01-01T12:00:00.000Z",
            downloadUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            expiresAt: "2026-01-01T12:00:00.000Z",
            id: "exprt_xxxxxxxxxxxxxx",
            progressPercent: Nullable<Int>.value(0),
            resource: ExportResource.adCampaigns,
            status: ExportStatus.pending,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.exports.retrieve(
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
                  "created_at": "created_at",
                  "download_url": "download_url",
                  "expires_at": "expires_at",
                  "id": "id",
                  "progress_percent": 1,
                  "resource": "ad_campaigns",
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
        let expectedResponse = Export(
            createdAt: "created_at",
            downloadUrl: Nullable<String>.value("download_url"),
            expiresAt: "expires_at",
            id: "id",
            progressPercent: Nullable<Int>.value(1),
            resource: ExportResource.adCampaigns,
            status: ExportStatus.pending,
            updatedAt: "updated_at"
        )
        let response = try await client.exports.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}