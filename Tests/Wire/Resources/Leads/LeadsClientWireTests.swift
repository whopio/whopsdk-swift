import Foundation
import Testing
import WhopSDK

@Suite("LeadsClient Wire Tests") struct LeadsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "lead_xxxxxxxxxxxxx",
                      "member": {
                        "id": "id"
                      },
                      "metadata": {
                        "key": "value"
                      },
                      "product": {
                        "id": "prod_xxxxxxxxxxxxx",
                        "title": "Pickaxe Analytics"
                      },
                      "referrer": "https://twitter.com/whabormarket",
                      "updated_at": "2023-12-01T05:00:00Z",
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
        let expectedResponse = ListLeadsResponse(
            data: [
                LeadListItem(
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "lead_xxxxxxxxxxxxx",
                    member: Nullable<LeadListItemMember>.value(LeadListItemMember(
                        id: "id"
                    )),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    product: Nullable<LeadListItemProduct>.value(LeadListItemProduct(
                        id: "prod_xxxxxxxxxxxxx",
                        title: "Pickaxe Analytics"
                    )),
                    referrer: Nullable<String>.value("https://twitter.com/whabormarket"),
                    updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    user: LeadListItemUser(
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
        let response = try await client.leads.list(
            first: 42,
            last: 42,
            createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            accountId: "biz_xxxxxxxxxxxxxx",
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
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "lead_xxxxxxxxxxxxx",
                  "member": {
                    "id": "id"
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxx",
                    "title": "Pickaxe Analytics"
                  },
                  "referrer": "https://twitter.com/whabormarket",
                  "updated_at": "2023-12-01T05:00:00Z",
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
        let expectedResponse = Lead(
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "lead_xxxxxxxxxxxxx",
            member: Nullable<LeadMember>.value(LeadMember(
                id: "id"
            )),
            metadata: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            product: Nullable<LeadProduct>.value(LeadProduct(
                id: "prod_xxxxxxxxxxxxx",
                title: "Pickaxe Analytics"
            )),
            referrer: Nullable<String>.value("https://twitter.com/whabormarket"),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: LeadUser(
                email: Nullable<String>.value("john.doe@example.com"),
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )
        )
        let response = try await client.leads.create(
            request: .init(accountId: "biz_xxxxxxxxxxxxxx"),
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
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "lead_xxxxxxxxxxxxx",
                  "member": {
                    "id": "id"
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxx",
                    "title": "Pickaxe Analytics"
                  },
                  "referrer": "https://twitter.com/whabormarket",
                  "updated_at": "2023-12-01T05:00:00Z",
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
        let expectedResponse = Lead(
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "lead_xxxxxxxxxxxxx",
            member: Nullable<LeadMember>.value(LeadMember(
                id: "id"
            )),
            metadata: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            product: Nullable<LeadProduct>.value(LeadProduct(
                id: "prod_xxxxxxxxxxxxx",
                title: "Pickaxe Analytics"
            )),
            referrer: Nullable<String>.value("https://twitter.com/whabormarket"),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: LeadUser(
                email: Nullable<String>.value("john.doe@example.com"),
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )
        )
        let response = try await client.leads.retrieve(
            id: "lead_xxxxxxxxxxxxx",
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
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "lead_xxxxxxxxxxxxx",
                  "member": {
                    "id": "id"
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxx",
                    "title": "Pickaxe Analytics"
                  },
                  "referrer": "https://twitter.com/whabormarket",
                  "updated_at": "2023-12-01T05:00:00Z",
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
        let expectedResponse = Lead(
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "lead_xxxxxxxxxxxxx",
            member: Nullable<LeadMember>.value(LeadMember(
                id: "id"
            )),
            metadata: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            product: Nullable<LeadProduct>.value(LeadProduct(
                id: "prod_xxxxxxxxxxxxx",
                title: "Pickaxe Analytics"
            )),
            referrer: Nullable<String>.value("https://twitter.com/whabormarket"),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: LeadUser(
                email: Nullable<String>.value("john.doe@example.com"),
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )
        )
        let response = try await client.leads.update(
            id: "lead_xxxxxxxxxxxxx",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}