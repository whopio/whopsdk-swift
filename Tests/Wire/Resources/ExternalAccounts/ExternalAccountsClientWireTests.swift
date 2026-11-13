import Foundation
import Testing
import WhopSDK

@Suite("ExternalAccountsClient Wire Tests") struct ExternalAccountsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "error": "You don't have permission to share this account with Whop. Contact Whop support for help.",
                      "external_id": "1234567891",
                      "id": "sacc_xxxxxxxxxxxxxx",
                      "name": "Shine Time Auto Detailing",
                      "parent_external_account": {
                        "external_id": "555111",
                        "id": "sacc_xxxxxxxxxxxxxx",
                        "name": "Shine Time Auto Detailing",
                        "platform": "x",
                        "profile_picture_url": "https://shinetime.example/logo.png",
                        "username": "shinetimedetailing",
                        "verified": true
                      },
                      "partnership_status": "partnership_status",
                      "platform": "x",
                      "profile_picture_url": "https://shinetime.example/logo.png",
                      "scopes": [
                        "advertise"
                      ],
                      "url": "https://instagram.com/shinetimedetail",
                      "username": "shinetimedetail",
                      "verified": true
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
        let expectedResponse = ListExternalAccountsResponse(
            data: [
                ExternalAccount(
                    error: Nullable<String>.value("You don't have permission to share this account with Whop. Contact Whop support for help."),
                    externalId: Nullable<String>.value("1234567891"),
                    id: "sacc_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Shine Time Auto Detailing"),
                    parentExternalAccount: Nullable<ExternalAccountParent>.value(ExternalAccountParent(
                        externalId: Nullable<String>.value("555111"),
                        id: "sacc_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Shine Time Auto Detailing"),
                        platform: ExternalAccountParentPlatform.x,
                        profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                        username: Nullable<String>.value("shinetimedetailing"),
                        verified: true
                    )),
                    partnershipStatus: Nullable<String>.value("partnership_status"),
                    platform: ExternalAccountPlatform.x,
                    profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                    scopes: [
                        "advertise"
                    ],
                    url: Nullable<String>.value("https://instagram.com/shinetimedetail"),
                    username: Nullable<String>.value("shinetimedetail"),
                    verified: true
                )
            ],
            pageInfo: ListExternalAccountsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.externalAccounts.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "error": "You don't have permission to share this account with Whop. Contact Whop support for help.",
                  "external_id": "1234567891",
                  "id": "sacc_xxxxxxxxxxxxxx",
                  "name": "Shine Time Auto Detailing",
                  "parent_external_account": {
                    "external_id": "555111",
                    "id": "sacc_xxxxxxxxxxxxxx",
                    "name": "Shine Time Auto Detailing",
                    "platform": "x",
                    "profile_picture_url": "https://shinetime.example/logo.png",
                    "username": "shinetimedetailing",
                    "verified": true
                  },
                  "partnership_status": "partnership_status",
                  "platform": "x",
                  "profile_picture_url": "https://shinetime.example/logo.png",
                  "scopes": [
                    "advertise"
                  ],
                  "url": "https://instagram.com/shinetimedetail",
                  "username": "shinetimedetail",
                  "verified": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ExternalAccount(
            error: Nullable<String>.value("You don't have permission to share this account with Whop. Contact Whop support for help."),
            externalId: Nullable<String>.value("1234567891"),
            id: "sacc_xxxxxxxxxxxxxx",
            name: Nullable<String>.value("Shine Time Auto Detailing"),
            parentExternalAccount: Nullable<ExternalAccountParent>.value(ExternalAccountParent(
                externalId: Nullable<String>.value("555111"),
                id: "sacc_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Shine Time Auto Detailing"),
                platform: ExternalAccountParentPlatform.x,
                profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                username: Nullable<String>.value("shinetimedetailing"),
                verified: true
            )),
            partnershipStatus: Nullable<String>.value("partnership_status"),
            platform: ExternalAccountPlatform.x,
            profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
            scopes: [
                "advertise"
            ],
            url: Nullable<String>.value("https://instagram.com/shinetimedetail"),
            username: Nullable<String>.value("shinetimedetail"),
            verified: true
        )
        let response = try await client.externalAccounts.create(
            request: CreateExternalAccountsRequestBody.facebook(
                CreateExternalAccountsRequestBodyFacebook(

                )
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func connect1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "authorize_url": "https://appcenter.intuit.com/connect/oauth2"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ConnectExternalAccountsResponse(
            authorizeUrl: "https://appcenter.intuit.com/connect/oauth2"
        )
        let response = try await client.externalAccounts.connect(
            request: .init(
                platform: .tiktok,
                redirectUrl: "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/settings"
            ),
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
                  "id": "sacc_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteExternalAccountsResponse(
            deleted: true,
            id: "sacc_xxxxxxxxxxxxxx"
        )
        let response = try await client.externalAccounts.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func refresh1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "error": "You don't have permission to share this account with Whop. Contact Whop support for help.",
                  "external_id": "1234567891",
                  "id": "sacc_xxxxxxxxxxxxxx",
                  "name": "Shine Time Auto Detailing",
                  "parent_external_account": {
                    "external_id": "555111",
                    "id": "sacc_xxxxxxxxxxxxxx",
                    "name": "Shine Time Auto Detailing",
                    "platform": "x",
                    "profile_picture_url": "https://shinetime.example/logo.png",
                    "username": "shinetimedetailing",
                    "verified": true
                  },
                  "partnership_status": "partnership_status",
                  "platform": "x",
                  "profile_picture_url": "https://shinetime.example/logo.png",
                  "scopes": [
                    "advertise"
                  ],
                  "url": "https://instagram.com/shinetimedetail",
                  "username": "shinetimedetail",
                  "verified": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ExternalAccount(
            error: Nullable<String>.value("You don't have permission to share this account with Whop. Contact Whop support for help."),
            externalId: Nullable<String>.value("1234567891"),
            id: "sacc_xxxxxxxxxxxxxx",
            name: Nullable<String>.value("Shine Time Auto Detailing"),
            parentExternalAccount: Nullable<ExternalAccountParent>.value(ExternalAccountParent(
                externalId: Nullable<String>.value("555111"),
                id: "sacc_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Shine Time Auto Detailing"),
                platform: ExternalAccountParentPlatform.x,
                profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                username: Nullable<String>.value("shinetimedetailing"),
                verified: true
            )),
            partnershipStatus: Nullable<String>.value("partnership_status"),
            platform: ExternalAccountPlatform.x,
            profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
            scopes: [
                "advertise"
            ],
            url: Nullable<String>.value("https://instagram.com/shinetimedetail"),
            username: Nullable<String>.value("shinetimedetail"),
            verified: true
        )
        let response = try await client.externalAccounts.refresh(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}