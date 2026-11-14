import Foundation
import Testing
import WhopSDK

@Suite("CategoriesClient Wire Tests") struct CategoriesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "id": "mcat_xxxxxxxxxxxxxx",
                      "name": "Business & Productivity",
                      "route": "business-productivity"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "Mg",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "MQ"
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
        let expectedResponse = ListCategoriesResponse(
            data: [
                AppCategory(
                    id: "mcat_xxxxxxxxxxxxxx",
                    name: "Business & Productivity",
                    route: "business-productivity"
                )
            ],
            pageInfo: ListCategoriesResponsePageInfo(
                endCursor: Nullable<String>.value("Mg"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("MQ")
            )
        )
        let response = try await client.apps.categories.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "id": "id",
                      "name": "name",
                      "route": "route"
                    },
                    {
                      "id": "id",
                      "name": "name",
                      "route": "route"
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
        let expectedResponse = ListCategoriesResponse(
            data: [
                AppCategory(
                    id: "id",
                    name: "name",
                    route: "route"
                ),
                AppCategory(
                    id: "id",
                    name: "name",
                    route: "route"
                )
            ],
            pageInfo: ListCategoriesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.apps.categories.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }
}