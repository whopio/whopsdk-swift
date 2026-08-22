import Foundation
import Testing
import WhopSDK

@Suite("ApiKeysClient Wire Tests") struct ApiKeysClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "api_version_date": "2025-01-01",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "expires_at": "2026-01-01T12:00:00.000Z",
                      "grants": [
                        {
                          "actions": [
                            {
                              "action": "ai_prompt:create",
                              "granted": false
                            }
                          ],
                          "resource_id": "biz_xxxxxxxxxxxxxx",
                          "resource_type": "account"
                        }
                      ],
                      "id": "apik_xxxxxxxxxxxxxx",
                      "ip_allowlist": [
                        "203.0.113.0/24"
                      ],
                      "is_default_for_resource": false,
                      "name": "Shine Time Booking (admin role)",
                      "obfuscated_secret_key": "apik_xxxx....xxxx",
                      "secret_key": "apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                      "system_role": "owner",
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
        let expectedResponse = ListApiKeysResponse(
            data: [
                ApiKey(
                    apiVersionDate: ApiKeyApiVersionDate.twoThousandTwentyFive0101,
                    createdAt: "2026-01-01T12:00:00.000Z",
                    expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    grants: Optional([
                        ApiKeyGrant(
                            actions: [
                                ApiKeyGrantAction(
                                    action: "ai_prompt:create",
                                    granted: false
                                )
                            ],
                            resourceId: "biz_xxxxxxxxxxxxxx",
                            resourceType: "account"
                        )
                    ]),
                    id: "apik_xxxxxxxxxxxxxx",
                    ipAllowlist: Nullable<[String]>.value([
                        "203.0.113.0/24"
                    ]),
                    isDefaultForResource: false,
                    name: Nullable<String>.value("Shine Time Booking (admin role)"),
                    obfuscatedSecretKey: "apik_xxxx....xxxx",
                    secretKey: Optional("apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
                    systemRole: Nullable<ApiKeySystemRole>.value(ApiKeySystemRole.owner),
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListApiKeysResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.apiKeys.list(
            resourceId: "resource_id",
            resourceType: .account,
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
                  "api_version_date": "2025-01-01",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "grants": [
                    {
                      "actions": [
                        {
                          "action": "ai_prompt:create",
                          "granted": false
                        }
                      ],
                      "resource_id": "biz_xxxxxxxxxxxxxx",
                      "resource_type": "account"
                    }
                  ],
                  "id": "apik_xxxxxxxxxxxxxx",
                  "ip_allowlist": [
                    "203.0.113.0/24"
                  ],
                  "is_default_for_resource": false,
                  "name": "Shine Time Booking (admin role)",
                  "obfuscated_secret_key": "apik_xxxx....xxxx",
                  "secret_key": "apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "system_role": "owner",
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
        let expectedResponse = ApiKey(
            apiVersionDate: ApiKeyApiVersionDate.twoThousandTwentyFive0101,
            createdAt: "2026-01-01T12:00:00.000Z",
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            grants: Optional([
                ApiKeyGrant(
                    actions: [
                        ApiKeyGrantAction(
                            action: "ai_prompt:create",
                            granted: false
                        )
                    ],
                    resourceId: "biz_xxxxxxxxxxxxxx",
                    resourceType: "account"
                )
            ]),
            id: "apik_xxxxxxxxxxxxxx",
            ipAllowlist: Nullable<[String]>.value([
                "203.0.113.0/24"
            ]),
            isDefaultForResource: false,
            name: Nullable<String>.value("Shine Time Booking (admin role)"),
            obfuscatedSecretKey: "apik_xxxx....xxxx",
            secretKey: Optional("apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            systemRole: Nullable<ApiKeySystemRole>.value(ApiKeySystemRole.owner),
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.apiKeys.create(
            request: .init(
                name: "Shine Time Booking (production)",
                permissions: CreateApiKeysRequestPermissions(

                ),
                resourceId: "biz_xxxxxxxxxxxxxx",
                resourceType: .account
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func listPermissions1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "action": "access_pass:basic:export",
                      "allowed_on_api_key": true,
                      "allowed_on_app": true,
                      "allowed_on_user": false,
                      "category": "Products",
                      "description": "Download the account's product list as a CSV.",
                      "granted_to_system_roles": [
                        "owner"
                      ],
                      "name": "Export products"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
                    "has_previous_page": false,
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
        let expectedResponse = ListPermissionsApiKeysResponse(
            data: [
                Permission(
                    action: "access_pass:basic:export",
                    allowedOnApiKey: true,
                    allowedOnApp: true,
                    allowedOnUser: false,
                    category: Nullable<String>.value("Products"),
                    description: "Download the account's product list as a CSV.",
                    grantedToSystemRoles: [
                        PermissionGrantedToSystemRolesItem.owner
                    ],
                    name: "Export products"
                )
            ],
            pageInfo: ListPermissionsApiKeysResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.apiKeys.listPermissions(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "api_version_date": "2025-01-01",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "grants": [
                    {
                      "actions": [
                        {
                          "action": "ai_prompt:create",
                          "granted": false
                        }
                      ],
                      "resource_id": "biz_xxxxxxxxxxxxxx",
                      "resource_type": "account"
                    }
                  ],
                  "id": "apik_xxxxxxxxxxxxxx",
                  "ip_allowlist": [
                    "203.0.113.0/24"
                  ],
                  "is_default_for_resource": false,
                  "name": "Shine Time Booking (admin role)",
                  "obfuscated_secret_key": "apik_xxxx....xxxx",
                  "secret_key": "apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "system_role": "owner",
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
        let expectedResponse = ApiKey(
            apiVersionDate: ApiKeyApiVersionDate.twoThousandTwentyFive0101,
            createdAt: "2026-01-01T12:00:00.000Z",
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            grants: Optional([
                ApiKeyGrant(
                    actions: [
                        ApiKeyGrantAction(
                            action: "ai_prompt:create",
                            granted: false
                        )
                    ],
                    resourceId: "biz_xxxxxxxxxxxxxx",
                    resourceType: "account"
                )
            ]),
            id: "apik_xxxxxxxxxxxxxx",
            ipAllowlist: Nullable<[String]>.value([
                "203.0.113.0/24"
            ]),
            isDefaultForResource: false,
            name: Nullable<String>.value("Shine Time Booking (admin role)"),
            obfuscatedSecretKey: "apik_xxxx....xxxx",
            secretKey: Optional("apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            systemRole: Nullable<ApiKeySystemRole>.value(ApiKeySystemRole.owner),
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.apiKeys.retrieve(
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
                  "id": "apik_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteApiKeysResponse(
            deleted: true,
            id: "apik_xxxxxxxxxxxxxx"
        )
        let response = try await client.apiKeys.delete(
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
                  "api_version_date": "2025-01-01",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "grants": [
                    {
                      "actions": [
                        {
                          "action": "ai_prompt:create",
                          "granted": false
                        }
                      ],
                      "resource_id": "biz_xxxxxxxxxxxxxx",
                      "resource_type": "account"
                    }
                  ],
                  "id": "apik_xxxxxxxxxxxxxx",
                  "ip_allowlist": [
                    "203.0.113.0/24"
                  ],
                  "is_default_for_resource": false,
                  "name": "Shine Time Booking (admin role)",
                  "obfuscated_secret_key": "apik_xxxx....xxxx",
                  "secret_key": "apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "system_role": "owner",
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
        let expectedResponse = ApiKey(
            apiVersionDate: ApiKeyApiVersionDate.twoThousandTwentyFive0101,
            createdAt: "2026-01-01T12:00:00.000Z",
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            grants: Optional([
                ApiKeyGrant(
                    actions: [
                        ApiKeyGrantAction(
                            action: "ai_prompt:create",
                            granted: false
                        )
                    ],
                    resourceId: "biz_xxxxxxxxxxxxxx",
                    resourceType: "account"
                )
            ]),
            id: "apik_xxxxxxxxxxxxxx",
            ipAllowlist: Nullable<[String]>.value([
                "203.0.113.0/24"
            ]),
            isDefaultForResource: false,
            name: Nullable<String>.value("Shine Time Booking (admin role)"),
            obfuscatedSecretKey: "apik_xxxx....xxxx",
            secretKey: Optional("apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            systemRole: Nullable<ApiKeySystemRole>.value(ApiKeySystemRole.owner),
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.apiKeys.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func rotate1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "api_version_date": "2025-01-01",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "grants": [
                    {
                      "actions": [
                        {
                          "action": "ai_prompt:create",
                          "granted": false
                        }
                      ],
                      "resource_id": "biz_xxxxxxxxxxxxxx",
                      "resource_type": "account"
                    }
                  ],
                  "id": "apik_xxxxxxxxxxxxxx",
                  "ip_allowlist": [
                    "203.0.113.0/24"
                  ],
                  "is_default_for_resource": false,
                  "name": "Shine Time Booking (admin role)",
                  "obfuscated_secret_key": "apik_xxxx....xxxx",
                  "secret_key": "apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  "system_role": "owner",
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
        let expectedResponse = ApiKey(
            apiVersionDate: ApiKeyApiVersionDate.twoThousandTwentyFive0101,
            createdAt: "2026-01-01T12:00:00.000Z",
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            grants: Optional([
                ApiKeyGrant(
                    actions: [
                        ApiKeyGrantAction(
                            action: "ai_prompt:create",
                            granted: false
                        )
                    ],
                    resourceId: "biz_xxxxxxxxxxxxxx",
                    resourceType: "account"
                )
            ]),
            id: "apik_xxxxxxxxxxxxxx",
            ipAllowlist: Nullable<[String]>.value([
                "203.0.113.0/24"
            ]),
            isDefaultForResource: false,
            name: Nullable<String>.value("Shine Time Booking (admin role)"),
            obfuscatedSecretKey: "apik_xxxx....xxxx",
            secretKey: Optional("apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            systemRole: Nullable<ApiKeySystemRole>.value(ApiKeySystemRole.owner),
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.apiKeys.rotate(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}