import Foundation
import Testing
import WhopSDK

@Suite("EntriesClient Wire Tests") struct EntriesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "entry_xxxxxxxxxxxx",
                      "plan": {
                        "id": "plan_xxxxxxxxxxxxx"
                      },
                      "product": {
                        "id": "prod_xxxxxxxxxxxxx",
                        "title": "Pickaxe Analytics"
                      },
                      "status": "drafted",
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
        let expectedResponse = ListEntriesResponse(
            data: [
                EntryListItem(
                    createdAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    id: "entry_xxxxxxxxxxxx",
                    plan: Nullable<EntryListItemPlan>.value(EntryListItemPlan(
                        id: "plan_xxxxxxxxxxxxx"
                    )),
                    product: Nullable<EntryListItemProduct>.value(EntryListItemProduct(
                        id: "prod_xxxxxxxxxxxxx",
                        title: "Pickaxe Analytics"
                    )),
                    status: EntryStatus.drafted,
                    user: EntryListItemUser(
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
        let response = try await client.entries.list(
            first: 42,
            last: 42,
            companyId: "biz_xxxxxxxxxxxxxx",
            createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
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
                  "custom_field_responses": [
                    {
                      "answer": "answer",
                      "id": "cfrp_xxxxxxxxxxxxx",
                      "question": "question"
                    }
                  ],
                  "id": "entry_xxxxxxxxxxxx",
                  "plan": {
                    "id": "plan_xxxxxxxxxxxxx"
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxx",
                    "title": "Pickaxe Analytics"
                  },
                  "status": "drafted",
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
        let expectedResponse = Entry(
            createdAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            customFieldResponses: Nullable<[EntryCustomFieldResponsesItem]>.value([
                EntryCustomFieldResponsesItem(
                    answer: "answer",
                    id: "cfrp_xxxxxxxxxxxxx",
                    question: "question"
                )
            ]),
            id: "entry_xxxxxxxxxxxx",
            plan: Nullable<EntryPlan>.value(EntryPlan(
                id: "plan_xxxxxxxxxxxxx"
            )),
            product: Nullable<EntryProduct>.value(EntryProduct(
                id: "prod_xxxxxxxxxxxxx",
                title: "Pickaxe Analytics"
            )),
            status: EntryStatus.drafted,
            user: EntryUser(
                email: Nullable<String>.value("john.doe@example.com"),
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )
        )
        let response = try await client.entries.retrieve(
            id: "entry_xxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func approve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "job_id": "job_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ApproveEntriesResponse(
            jobId: "job_id"
        )
        let response = try await client.entries.approve(
            id: "entry_xxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func deny1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "created_at": "2023-12-01T05:00:00Z",
                  "custom_field_responses": [
                    {
                      "answer": "answer",
                      "id": "cfrp_xxxxxxxxxxxxx",
                      "question": "question"
                    }
                  ],
                  "id": "entry_xxxxxxxxxxxx",
                  "plan": {
                    "id": "plan_xxxxxxxxxxxxx"
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxx",
                    "title": "Pickaxe Analytics"
                  },
                  "status": "drafted",
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
        let expectedResponse = Entry(
            createdAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            customFieldResponses: Nullable<[EntryCustomFieldResponsesItem]>.value([
                EntryCustomFieldResponsesItem(
                    answer: "answer",
                    id: "cfrp_xxxxxxxxxxxxx",
                    question: "question"
                )
            ]),
            id: "entry_xxxxxxxxxxxx",
            plan: Nullable<EntryPlan>.value(EntryPlan(
                id: "plan_xxxxxxxxxxxxx"
            )),
            product: Nullable<EntryProduct>.value(EntryProduct(
                id: "prod_xxxxxxxxxxxxx",
                title: "Pickaxe Analytics"
            )),
            status: EntryStatus.drafted,
            user: EntryUser(
                email: Nullable<String>.value("john.doe@example.com"),
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )
        )
        let response = try await client.entries.deny(
            id: "entry_xxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}