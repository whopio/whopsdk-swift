import Foundation
import Testing
import WhopSDK

@Suite("AuthorizedUsersClient Wire Tests") struct AuthorizedUsersClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "company": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "title": "Pickaxe"
                      },
                      "id": "ausr_xxxxxxxxxxxxx",
                      "role": "owner",
                      "user": {
                        "email": "john.doe@example.com",
                        "id": "user_xxxxxxxxxxxxx",
                        "name": "John Doe",
                        "username": "johndoe42"
                      }
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
        let expectedResponse = ListAuthorizedUsersResponse(
            data: [
                AuthorizedUserListItem(
                    company: AuthorizedUserListItemCompany(
                        id: "biz_xxxxxxxxxxxxxx",
                        title: "Pickaxe"
                    ),
                    id: "ausr_xxxxxxxxxxxxx",
                    role: AuthorizedUserRoles.owner,
                    user: AuthorizedUserListItemUser(
                        email: Nullable<String>.value("john.doe@example.com"),
                        id: "user_xxxxxxxxxxxxx",
                        name: Nullable<String>.value("John Doe"),
                        username: "johndoe42"
                    )
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.authorizedUsers.list(
            first: 42,
            last: 42,
            userId: "user_xxxxxxxxxxxxx",
            createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            accountId: "biz_xxxxxxxxxxxxxx",
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
                      "company": {
                        "id": "id",
                        "title": "title"
                      },
                      "id": "id",
                      "role": "owner",
                      "user": {
                        "email": "email",
                        "id": "id",
                        "name": "name",
                        "username": "username"
                      }
                    },
                    {
                      "company": {
                        "id": "id",
                        "title": "title"
                      },
                      "id": "id",
                      "role": "owner",
                      "user": {
                        "email": "email",
                        "id": "id",
                        "name": "name",
                        "username": "username"
                      }
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
        let expectedResponse = ListAuthorizedUsersResponse(
            data: [
                AuthorizedUserListItem(
                    company: AuthorizedUserListItemCompany(
                        id: "id",
                        title: "title"
                    ),
                    id: "id",
                    role: AuthorizedUserRoles.owner,
                    user: AuthorizedUserListItemUser(
                        email: Nullable<String>.value("email"),
                        id: "id",
                        name: Nullable<String>.value("name"),
                        username: "username"
                    )
                ),
                AuthorizedUserListItem(
                    company: AuthorizedUserListItemCompany(
                        id: "id",
                        title: "title"
                    ),
                    id: "id",
                    role: AuthorizedUserRoles.owner,
                    user: AuthorizedUserListItemUser(
                        email: Nullable<String>.value("email"),
                        id: "id",
                        name: Nullable<String>.value("name"),
                        username: "username"
                    )
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.authorizedUsers.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Pickaxe"
                  },
                  "id": "ausr_xxxxxxxxxxxxx",
                  "role": "owner",
                  "user": {
                    "email": "john.doe@example.com",
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
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
        let expectedResponse = AuthorizedUser(
            company: AuthorizedUserCompany(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Pickaxe"
            ),
            id: "ausr_xxxxxxxxxxxxx",
            role: AuthorizedUserRoles.owner,
            user: AuthorizedUserUser(
                email: Nullable<String>.value("john.doe@example.com"),
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )
        )
        let response = try await client.authorizedUsers.create(
            request: .init(
                accountId: "biz_xxxxxxxxxxxxxx",
                role: .owner,
                userId: "user_xxxxxxxxxxxxx"
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
                  "company": {
                    "id": "id",
                    "title": "title"
                  },
                  "id": "id",
                  "role": "owner",
                  "user": {
                    "email": "email",
                    "id": "id",
                    "name": "name",
                    "username": "username"
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
        let expectedResponse = AuthorizedUser(
            company: AuthorizedUserCompany(
                id: "id",
                title: "title"
            ),
            id: "id",
            role: AuthorizedUserRoles.owner,
            user: AuthorizedUserUser(
                email: Nullable<String>.value("email"),
                id: "id",
                name: Nullable<String>.value("name"),
                username: "username"
            )
        )
        let response = try await client.authorizedUsers.create(
            request: .init(
                accountId: "account_id",
                role: .owner,
                userId: "user_id"
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
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Pickaxe"
                  },
                  "id": "ausr_xxxxxxxxxxxxx",
                  "role": "owner",
                  "user": {
                    "email": "john.doe@example.com",
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
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
        let expectedResponse = AuthorizedUser(
            company: AuthorizedUserCompany(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Pickaxe"
            ),
            id: "ausr_xxxxxxxxxxxxx",
            role: AuthorizedUserRoles.owner,
            user: AuthorizedUserUser(
                email: Nullable<String>.value("john.doe@example.com"),
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )
        )
        let response = try await client.authorizedUsers.retrieve(
            id: "ausr_xxxxxxxxxxxxx",
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
                  "company": {
                    "id": "id",
                    "title": "title"
                  },
                  "id": "id",
                  "role": "owner",
                  "user": {
                    "email": "email",
                    "id": "id",
                    "name": "name",
                    "username": "username"
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
        let expectedResponse = AuthorizedUser(
            company: AuthorizedUserCompany(
                id: "id",
                title: "title"
            ),
            id: "id",
            role: AuthorizedUserRoles.owner,
            user: AuthorizedUserUser(
                email: Nullable<String>.value("email"),
                id: "id",
                name: Nullable<String>.value("name"),
                username: "username"
            )
        )
        let response = try await client.authorizedUsers.retrieve(
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
                true
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = true
        let response = try await client.authorizedUsers.delete(
            id: "ausr_xxxxxxxxxxxxx",
            accountId: "biz_xxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                true
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = true
        let response = try await client.authorizedUsers.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}