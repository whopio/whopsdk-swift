import Foundation
import Testing
import WhopSDK

@Suite("OauthGrantsClient Wire Tests") struct OauthGrantsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "app_id": "app_xxxxxxxxxxxxxx",
                      "authorized_at": "2026-01-01T12:00:00.000Z",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "id": "oag_xxxxxxxxxxxxxx",
                      "redirect_url": "https://Booking.Shinetime.example:8443/oauth/Callback/",
                      "revoked_at": "2026-01-01T12:00:00.000Z",
                      "scopes": [
                        "email"
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
        let expectedResponse = ListOauthGrantsResponse(
            data: [
                OauthGrant(
                    accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    appId: "app_xxxxxxxxxxxxxx",
                    authorizedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    id: "oag_xxxxxxxxxxxxxx",
                    redirectUrl: Optional("https://Booking.Shinetime.example:8443/oauth/Callback/"),
                    revokedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    scopes: [
                        "email"
                    ]
                )
            ],
            pageInfo: ListOauthGrantsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.users.oauthGrants.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "app_id": "app_xxxxxxxxxxxxxx",
                  "authorized_at": "2026-01-01T12:00:00.000Z",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "oag_xxxxxxxxxxxxxx",
                  "redirect_url": "https://Booking.Shinetime.example:8443/oauth/Callback/",
                  "revoked_at": "2026-01-01T12:00:00.000Z",
                  "scopes": [
                    "email"
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
        let expectedResponse = OauthGrant(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            appId: "app_xxxxxxxxxxxxxx",
            authorizedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            createdAt: "2026-01-01T12:00:00.000Z",
            id: "oag_xxxxxxxxxxxxxx",
            redirectUrl: Optional("https://Booking.Shinetime.example:8443/oauth/Callback/"),
            revokedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            scopes: [
                "email"
            ]
        )
        let response = try await client.users.oauthGrants.create(
            request: .init(
                clientId: "app_xxxxxxxxxxxxxx",
                redirectUri: "https://Booking.Shinetime.example:8443/oauth/Callback/",
                requestedScopes: [
                    "openid"
                ]
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}