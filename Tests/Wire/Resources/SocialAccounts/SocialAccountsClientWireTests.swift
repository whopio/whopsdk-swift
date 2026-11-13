import Foundation
import Testing
import WhopSDK

@Suite("SocialAccountsClient Wire Tests") struct SocialAccountsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "error": "error",
                      "external_id": "17841479809129315",
                      "id": "sacc_xxxxxxxxxxxxxx",
                      "name": "Shine Time Detail",
                      "parent_social_account": {
                        "external_id": "page_1",
                        "id": "sacc_xxxxxxxxxxxxxx",
                        "name": "Shine Time Auto Detailing",
                        "platform": "x",
                        "profile_picture_url": "https://shinetime.example/logo.png",
                        "username": "shinetimedetailing",
                        "verified": true
                      },
                      "partnership_status": "partnership_status",
                      "platform": "x",
                      "profile_picture_url": "https://shinetime.example/instagram.png",
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
        let expectedResponse = ListSocialAccountsResponse(
            data: [
                SocialAccount(
                    error: Nullable<String>.value("error"),
                    externalId: Nullable<String>.value("17841479809129315"),
                    id: "sacc_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Shine Time Detail"),
                    parentSocialAccount: Nullable<SocialAccountParent>.value(SocialAccountParent(
                        externalId: Nullable<String>.value("page_1"),
                        id: "sacc_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Shine Time Auto Detailing"),
                        platform: SocialAccountParentPlatform.x,
                        profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                        username: Nullable<String>.value("shinetimedetailing"),
                        verified: true
                    )),
                    partnershipStatus: Nullable<String>.value("partnership_status"),
                    platform: SocialAccountPlatform.x,
                    profilePictureUrl: Nullable<String>.value("https://shinetime.example/instagram.png"),
                    scopes: [
                        "advertise"
                    ],
                    url: Nullable<String>.value("https://instagram.com/shinetimedetail"),
                    username: Nullable<String>.value("shinetimedetail"),
                    verified: true
                )
            ],
            pageInfo: ListSocialAccountsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.socialAccounts.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "error": "error",
                  "external_id": "17841479809129315",
                  "id": "sacc_xxxxxxxxxxxxxx",
                  "name": "Shine Time Detail",
                  "parent_social_account": {
                    "external_id": "page_1",
                    "id": "sacc_xxxxxxxxxxxxxx",
                    "name": "Shine Time Auto Detailing",
                    "platform": "x",
                    "profile_picture_url": "https://shinetime.example/logo.png",
                    "username": "shinetimedetailing",
                    "verified": true
                  },
                  "partnership_status": "partnership_status",
                  "platform": "x",
                  "profile_picture_url": "https://shinetime.example/instagram.png",
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
        let expectedResponse = SocialAccount(
            error: Nullable<String>.value("error"),
            externalId: Nullable<String>.value("17841479809129315"),
            id: "sacc_xxxxxxxxxxxxxx",
            name: Nullable<String>.value("Shine Time Detail"),
            parentSocialAccount: Nullable<SocialAccountParent>.value(SocialAccountParent(
                externalId: Nullable<String>.value("page_1"),
                id: "sacc_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Shine Time Auto Detailing"),
                platform: SocialAccountParentPlatform.x,
                profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                username: Nullable<String>.value("shinetimedetailing"),
                verified: true
            )),
            partnershipStatus: Nullable<String>.value("partnership_status"),
            platform: SocialAccountPlatform.x,
            profilePictureUrl: Nullable<String>.value("https://shinetime.example/instagram.png"),
            scopes: [
                "advertise"
            ],
            url: Nullable<String>.value("https://instagram.com/shinetimedetail"),
            username: Nullable<String>.value("shinetimedetail"),
            verified: true
        )
        let response = try await client.socialAccounts.create(
            request: CreateSocialAccountsRequestBody.facebook(
                CreateSocialAccountsRequestBodyFacebook(

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
        let expectedResponse = ConnectSocialAccountsResponse(
            authorizeUrl: "https://appcenter.intuit.com/connect/oauth2"
        )
        let response = try await client.socialAccounts.connect(
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
        let expectedResponse = DeleteSocialAccountsResponse(
            deleted: true,
            id: "sacc_xxxxxxxxxxxxxx"
        )
        let response = try await client.socialAccounts.delete(
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
                  "error": "error",
                  "external_id": "17841479809129315",
                  "id": "sacc_xxxxxxxxxxxxxx",
                  "name": "Shine Time Detail",
                  "parent_social_account": {
                    "external_id": "page_1",
                    "id": "sacc_xxxxxxxxxxxxxx",
                    "name": "Shine Time Auto Detailing",
                    "platform": "x",
                    "profile_picture_url": "https://shinetime.example/logo.png",
                    "username": "shinetimedetailing",
                    "verified": true
                  },
                  "partnership_status": "partnership_status",
                  "platform": "x",
                  "profile_picture_url": "https://shinetime.example/instagram.png",
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
        let expectedResponse = SocialAccount(
            error: Nullable<String>.value("error"),
            externalId: Nullable<String>.value("17841479809129315"),
            id: "sacc_xxxxxxxxxxxxxx",
            name: Nullable<String>.value("Shine Time Detail"),
            parentSocialAccount: Nullable<SocialAccountParent>.value(SocialAccountParent(
                externalId: Nullable<String>.value("page_1"),
                id: "sacc_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Shine Time Auto Detailing"),
                platform: SocialAccountParentPlatform.x,
                profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                username: Nullable<String>.value("shinetimedetailing"),
                verified: true
            )),
            partnershipStatus: Nullable<String>.value("partnership_status"),
            platform: SocialAccountPlatform.x,
            profilePictureUrl: Nullable<String>.value("https://shinetime.example/instagram.png"),
            scopes: [
                "advertise"
            ],
            url: Nullable<String>.value("https://instagram.com/shinetimedetail"),
            username: Nullable<String>.value("shinetimedetail"),
            verified: true
        )
        let response = try await client.socialAccounts.refresh(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}