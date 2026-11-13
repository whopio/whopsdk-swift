import Foundation
import Testing
import WhopSDK

@Suite("AppInstallationsClient Wire Tests") struct AppInstallationsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "title": "Acme Bookkeeping"
                      },
                      "app": {
                        "developer": {
                          "id": "biz_xxxxxxxxxxxxxx",
                          "title": "Acme Bookkeeping"
                        },
                        "icon": {
                          "url": "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                        },
                        "id": "app_xxxxxxxxxxxxxx",
                        "name": "Other App"
                      },
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "external_id": "acme-books",
                      "id": "aag_xxxxxxxxxxxxxx",
                      "metadata": {
                        "last_synced_at": "2026-01-01T12:00:00.000Z",
                        "quickbooks_realm_id": "9341452712"
                      },
                      "requesting_reauthorization": false,
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
        let expectedResponse = ListAppInstallationsResponse(
            data: [
                AppInstallation(
                    account: AccountSummary(
                        id: "biz_xxxxxxxxxxxxxx",
                        title: "Acme Bookkeeping"
                    ),
                    app: AppSummary(
                        developer: AccountSummary(
                            id: "biz_xxxxxxxxxxxxxx",
                            title: "Acme Bookkeeping"
                        ),
                        icon: AppIcon(
                            url: "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                        ),
                        id: "app_xxxxxxxxxxxxxx",
                        name: "Other App"
                    ),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    externalId: Nullable<String>.value("acme-books"),
                    id: "aag_xxxxxxxxxxxxxx",
                    metadata: Nullable<[String: Nullable<String>]>.value([
                        "last_synced_at": Nullable<String>.value("2026-01-01T12:00:00.000Z"), 
                        "quickbooks_realm_id": Nullable<String>.value("9341452712")
                    ]),
                    requestingReauthorization: false,
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListAppInstallationsResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.appInstallations.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "app": {
                    "developer": {
                      "id": "biz_xxxxxxxxxxxxxx",
                      "title": "Acme Bookkeeping"
                    },
                    "icon": {
                      "url": "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                    },
                    "id": "app_xxxxxxxxxxxxxx",
                    "name": "Other App"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "external_id": "acme-books",
                  "id": "aag_xxxxxxxxxxxxxx",
                  "metadata": {
                    "last_synced_at": "2026-01-01T12:00:00.000Z",
                    "quickbooks_realm_id": "9341452712"
                  },
                  "requesting_reauthorization": false,
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
        let expectedResponse = AppInstallation(
            account: AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            ),
            app: AppSummary(
                developer: AccountSummary(
                    id: "biz_xxxxxxxxxxxxxx",
                    title: "Acme Bookkeeping"
                ),
                icon: AppIcon(
                    url: "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                ),
                id: "app_xxxxxxxxxxxxxx",
                name: "Other App"
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            externalId: Nullable<String>.value("acme-books"),
            id: "aag_xxxxxxxxxxxxxx",
            metadata: Nullable<[String: Nullable<String>]>.value([
                "last_synced_at": Nullable<String>.value("2026-01-01T12:00:00.000Z"), 
                "quickbooks_realm_id": Nullable<String>.value("9341452712")
            ]),
            requestingReauthorization: false,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.appInstallations.retrieve(
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "app": {
                    "developer": {
                      "id": "biz_xxxxxxxxxxxxxx",
                      "title": "Acme Bookkeeping"
                    },
                    "icon": {
                      "url": "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                    },
                    "id": "app_xxxxxxxxxxxxxx",
                    "name": "Other App"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "external_id": "acme-books",
                  "id": "aag_xxxxxxxxxxxxxx",
                  "metadata": {
                    "last_synced_at": "2026-01-01T12:00:00.000Z",
                    "quickbooks_realm_id": "9341452712"
                  },
                  "requesting_reauthorization": false,
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
        let expectedResponse = AppInstallation(
            account: AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            ),
            app: AppSummary(
                developer: AccountSummary(
                    id: "biz_xxxxxxxxxxxxxx",
                    title: "Acme Bookkeeping"
                ),
                icon: AppIcon(
                    url: "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                ),
                id: "app_xxxxxxxxxxxxxx",
                name: "Other App"
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            externalId: Nullable<String>.value("acme-books"),
            id: "aag_xxxxxxxxxxxxxx",
            metadata: Nullable<[String: Nullable<String>]>.value([
                "last_synced_at": Nullable<String>.value("2026-01-01T12:00:00.000Z"), 
                "quickbooks_realm_id": Nullable<String>.value("9341452712")
            ]),
            requestingReauthorization: false,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.appInstallations.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}