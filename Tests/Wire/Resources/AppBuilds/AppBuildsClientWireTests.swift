import Foundation
import Testing
import WhopSDK

@Suite("AppBuildsClient Wire Tests") struct AppBuildsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "checksum": "xxxxxxxxxxxxxxx",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "file_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "id": "apbu_xxxxxxxxxxxxxx",
                      "is_production": false,
                      "platform": "ios",
                      "review_message": "The hub view crashes on launch when the member has no active membership. Fix and resubmit.",
                      "source_url": "https://whop-assets-example.s3.amazonaws.com/uploads/zip/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "status": "draft",
                      "supported_app_view_types": [
                        "hub"
                      ]
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
        let expectedResponse = ListAppBuildsResponse(
            data: [
                AppBuild(
                    checksum: "xxxxxxxxxxxxxxx",
                    createdAt: "2026-01-01T12:00:00.000Z",
                    fileUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    id: "apbu_xxxxxxxxxxxxxx",
                    isProduction: false,
                    platform: AppBuildPlatform.ios,
                    reviewMessage: Nullable<String>.value("The hub view crashes on launch when the member has no active membership. Fix and resubmit."),
                    sourceUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/zip/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    status: AppBuildStatus.draft,
                    supportedAppViewTypes: [
                        AppBuildSupportedAppViewTypesItem.hub
                    ]
                )
            ],
            pageInfo: ListAppBuildsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.appBuilds.list(
            appId: "app_id",
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
                      "checksum": "checksum",
                      "created_at": "created_at",
                      "file_url": "file_url",
                      "id": "id",
                      "is_production": true,
                      "platform": "ios",
                      "review_message": "review_message",
                      "source_url": "source_url",
                      "status": "draft",
                      "supported_app_view_types": [
                        "hub",
                        "hub"
                      ]
                    },
                    {
                      "checksum": "checksum",
                      "created_at": "created_at",
                      "file_url": "file_url",
                      "id": "id",
                      "is_production": true,
                      "platform": "ios",
                      "review_message": "review_message",
                      "source_url": "source_url",
                      "status": "draft",
                      "supported_app_view_types": [
                        "hub",
                        "hub"
                      ]
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
        let expectedResponse = ListAppBuildsResponse(
            data: [
                AppBuild(
                    checksum: "checksum",
                    createdAt: "created_at",
                    fileUrl: Nullable<String>.value("file_url"),
                    id: "id",
                    isProduction: true,
                    platform: AppBuildPlatform.ios,
                    reviewMessage: Nullable<String>.value("review_message"),
                    sourceUrl: Nullable<String>.value("source_url"),
                    status: AppBuildStatus.draft,
                    supportedAppViewTypes: [
                        AppBuildSupportedAppViewTypesItem.hub,
                        AppBuildSupportedAppViewTypesItem.hub
                    ]
                ),
                AppBuild(
                    checksum: "checksum",
                    createdAt: "created_at",
                    fileUrl: Nullable<String>.value("file_url"),
                    id: "id",
                    isProduction: true,
                    platform: AppBuildPlatform.ios,
                    reviewMessage: Nullable<String>.value("review_message"),
                    sourceUrl: Nullable<String>.value("source_url"),
                    status: AppBuildStatus.draft,
                    supportedAppViewTypes: [
                        AppBuildSupportedAppViewTypesItem.hub,
                        AppBuildSupportedAppViewTypesItem.hub
                    ]
                )
            ],
            pageInfo: ListAppBuildsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.appBuilds.list(
            appId: "app_id",
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
                  "checksum": "xxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "file_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "id": "apbu_xxxxxxxxxxxxxx",
                  "is_production": false,
                  "platform": "ios",
                  "review_message": "The hub view crashes on launch when the member has no active membership. Fix and resubmit.",
                  "source_url": "https://whop-assets-example.s3.amazonaws.com/uploads/zip/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "status": "draft",
                  "supported_app_view_types": [
                    "hub"
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AppBuild(
            checksum: "xxxxxxxxxxxxxxx",
            createdAt: "2026-01-01T12:00:00.000Z",
            fileUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            id: "apbu_xxxxxxxxxxxxxx",
            isProduction: false,
            platform: AppBuildPlatform.ios,
            reviewMessage: Nullable<String>.value("The hub view crashes on launch when the member has no active membership. Fix and resubmit."),
            sourceUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/zip/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            status: AppBuildStatus.draft,
            supportedAppViewTypes: [
                AppBuildSupportedAppViewTypesItem.hub
            ]
        )
        let response = try await client.appBuilds.create(
            request: .init(
                attachment: CreateAppBuildsRequestAttachment(

                ),
                checksum: "xxxxxxxxxxxxxxx",
                platform: .ios
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
                  "checksum": "checksum",
                  "created_at": "created_at",
                  "file_url": "file_url",
                  "id": "id",
                  "is_production": true,
                  "platform": "ios",
                  "review_message": "review_message",
                  "source_url": "source_url",
                  "status": "draft",
                  "supported_app_view_types": [
                    "hub",
                    "hub"
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AppBuild(
            checksum: "checksum",
            createdAt: "created_at",
            fileUrl: Nullable<String>.value("file_url"),
            id: "id",
            isProduction: true,
            platform: AppBuildPlatform.ios,
            reviewMessage: Nullable<String>.value("review_message"),
            sourceUrl: Nullable<String>.value("source_url"),
            status: AppBuildStatus.draft,
            supportedAppViewTypes: [
                AppBuildSupportedAppViewTypesItem.hub,
                AppBuildSupportedAppViewTypesItem.hub
            ]
        )
        let response = try await client.appBuilds.create(
            request: .init(
                attachment: CreateAppBuildsRequestAttachment(

                ),
                checksum: "checksum",
                platform: .ios
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
                  "checksum": "xxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "file_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "id": "apbu_xxxxxxxxxxxxxx",
                  "is_production": false,
                  "platform": "ios",
                  "review_message": "The hub view crashes on launch when the member has no active membership. Fix and resubmit.",
                  "source_url": "https://whop-assets-example.s3.amazonaws.com/uploads/zip/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "status": "draft",
                  "supported_app_view_types": [
                    "hub"
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AppBuild(
            checksum: "xxxxxxxxxxxxxxx",
            createdAt: "2026-01-01T12:00:00.000Z",
            fileUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            id: "apbu_xxxxxxxxxxxxxx",
            isProduction: false,
            platform: AppBuildPlatform.ios,
            reviewMessage: Nullable<String>.value("The hub view crashes on launch when the member has no active membership. Fix and resubmit."),
            sourceUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/zip/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            status: AppBuildStatus.draft,
            supportedAppViewTypes: [
                AppBuildSupportedAppViewTypesItem.hub
            ]
        )
        let response = try await client.appBuilds.retrieve(
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
                  "checksum": "checksum",
                  "created_at": "created_at",
                  "file_url": "file_url",
                  "id": "id",
                  "is_production": true,
                  "platform": "ios",
                  "review_message": "review_message",
                  "source_url": "source_url",
                  "status": "draft",
                  "supported_app_view_types": [
                    "hub",
                    "hub"
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AppBuild(
            checksum: "checksum",
            createdAt: "created_at",
            fileUrl: Nullable<String>.value("file_url"),
            id: "id",
            isProduction: true,
            platform: AppBuildPlatform.ios,
            reviewMessage: Nullable<String>.value("review_message"),
            sourceUrl: Nullable<String>.value("source_url"),
            status: AppBuildStatus.draft,
            supportedAppViewTypes: [
                AppBuildSupportedAppViewTypesItem.hub,
                AppBuildSupportedAppViewTypesItem.hub
            ]
        )
        let response = try await client.appBuilds.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func promote1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "checksum": "xxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "file_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "id": "apbu_xxxxxxxxxxxxxx",
                  "is_production": false,
                  "platform": "ios",
                  "review_message": "The hub view crashes on launch when the member has no active membership. Fix and resubmit.",
                  "source_url": "https://whop-assets-example.s3.amazonaws.com/uploads/zip/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "status": "draft",
                  "supported_app_view_types": [
                    "hub"
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AppBuild(
            checksum: "xxxxxxxxxxxxxxx",
            createdAt: "2026-01-01T12:00:00.000Z",
            fileUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            id: "apbu_xxxxxxxxxxxxxx",
            isProduction: false,
            platform: AppBuildPlatform.ios,
            reviewMessage: Nullable<String>.value("The hub view crashes on launch when the member has no active membership. Fix and resubmit."),
            sourceUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/zip/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            status: AppBuildStatus.draft,
            supportedAppViewTypes: [
                AppBuildSupportedAppViewTypesItem.hub
            ]
        )
        let response = try await client.appBuilds.promote(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func promote2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "checksum": "checksum",
                  "created_at": "created_at",
                  "file_url": "file_url",
                  "id": "id",
                  "is_production": true,
                  "platform": "ios",
                  "review_message": "review_message",
                  "source_url": "source_url",
                  "status": "draft",
                  "supported_app_view_types": [
                    "hub",
                    "hub"
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AppBuild(
            checksum: "checksum",
            createdAt: "created_at",
            fileUrl: Nullable<String>.value("file_url"),
            id: "id",
            isProduction: true,
            platform: AppBuildPlatform.ios,
            reviewMessage: Nullable<String>.value("review_message"),
            sourceUrl: Nullable<String>.value("source_url"),
            status: AppBuildStatus.draft,
            supportedAppViewTypes: [
                AppBuildSupportedAppViewTypesItem.hub,
                AppBuildSupportedAppViewTypesItem.hub
            ]
        )
        let response = try await client.appBuilds.promote(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}