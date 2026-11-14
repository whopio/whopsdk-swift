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

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account": {
                        "id": "id",
                        "title": "title"
                      },
                      "app": {
                        "developer": {
                          "id": "id",
                          "title": "title"
                        },
                        "icon": {
                          "url": "url"
                        },
                        "id": "id",
                        "name": "name"
                      },
                      "created_at": "created_at",
                      "external_id": "external_id",
                      "id": "id",
                      "metadata": {
                        "metadata": "metadata"
                      },
                      "requesting_reauthorization": true,
                      "updated_at": "updated_at"
                    },
                    {
                      "account": {
                        "id": "id",
                        "title": "title"
                      },
                      "app": {
                        "developer": {
                          "id": "id",
                          "title": "title"
                        },
                        "icon": {
                          "url": "url"
                        },
                        "id": "id",
                        "name": "name"
                      },
                      "created_at": "created_at",
                      "external_id": "external_id",
                      "id": "id",
                      "metadata": {
                        "metadata": "metadata"
                      },
                      "requesting_reauthorization": true,
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
        let expectedResponse = ListAppInstallationsResponse(
            data: [
                AppInstallation(
                    account: AccountSummary(
                        id: "id",
                        title: "title"
                    ),
                    app: AppSummary(
                        developer: AccountSummary(
                            id: "id",
                            title: "title"
                        ),
                        icon: AppIcon(
                            url: "url"
                        ),
                        id: "id",
                        name: "name"
                    ),
                    createdAt: "created_at",
                    externalId: Nullable<String>.value("external_id"),
                    id: "id",
                    metadata: Nullable<[String: Nullable<String>]>.value([
                        "metadata": Nullable<String>.value("metadata")
                    ]),
                    requestingReauthorization: true,
                    updatedAt: "updated_at"
                ),
                AppInstallation(
                    account: AccountSummary(
                        id: "id",
                        title: "title"
                    ),
                    app: AppSummary(
                        developer: AccountSummary(
                            id: "id",
                            title: "title"
                        ),
                        icon: AppIcon(
                            url: "url"
                        ),
                        id: "id",
                        name: "name"
                    ),
                    createdAt: "created_at",
                    externalId: Nullable<String>.value("external_id"),
                    id: "id",
                    metadata: Nullable<[String: Nullable<String>]>.value([
                        "metadata": Nullable<String>.value("metadata")
                    ]),
                    requestingReauthorization: true,
                    updatedAt: "updated_at"
                )
            ],
            pageInfo: ListAppInstallationsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
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

    @Test func retrieve2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "app": {
                    "developer": {
                      "id": "id",
                      "title": "title"
                    },
                    "icon": {
                      "url": "url"
                    },
                    "id": "id",
                    "name": "name"
                  },
                  "created_at": "created_at",
                  "external_id": "external_id",
                  "id": "id",
                  "metadata": {
                    "metadata": "metadata"
                  },
                  "requesting_reauthorization": true,
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
        let expectedResponse = AppInstallation(
            account: AccountSummary(
                id: "id",
                title: "title"
            ),
            app: AppSummary(
                developer: AccountSummary(
                    id: "id",
                    title: "title"
                ),
                icon: AppIcon(
                    url: "url"
                ),
                id: "id",
                name: "name"
            ),
            createdAt: "created_at",
            externalId: Nullable<String>.value("external_id"),
            id: "id",
            metadata: Nullable<[String: Nullable<String>]>.value([
                "metadata": Nullable<String>.value("metadata")
            ]),
            requestingReauthorization: true,
            updatedAt: "updated_at"
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

    @Test func update2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "id",
                    "title": "title"
                  },
                  "app": {
                    "developer": {
                      "id": "id",
                      "title": "title"
                    },
                    "icon": {
                      "url": "url"
                    },
                    "id": "id",
                    "name": "name"
                  },
                  "created_at": "created_at",
                  "external_id": "external_id",
                  "id": "id",
                  "metadata": {
                    "metadata": "metadata"
                  },
                  "requesting_reauthorization": true,
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
        let expectedResponse = AppInstallation(
            account: AccountSummary(
                id: "id",
                title: "title"
            ),
            app: AppSummary(
                developer: AccountSummary(
                    id: "id",
                    title: "title"
                ),
                icon: AppIcon(
                    url: "url"
                ),
                id: "id",
                name: "name"
            ),
            createdAt: "created_at",
            externalId: Nullable<String>.value("external_id"),
            id: "id",
            metadata: Nullable<[String: Nullable<String>]>.value([
                "metadata": Nullable<String>.value("metadata")
            ]),
            requestingReauthorization: true,
            updatedAt: "updated_at"
        )
        let response = try await client.appInstallations.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}