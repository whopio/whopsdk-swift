import Foundation
import Testing
import WhopSDK

@Suite("SearchClient Wire Tests") struct SearchClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "match_reason": "id",
                      "record": {
                        "banner_image_url": null,
                        "description": null,
                        "id": "id",
                        "image_url": null,
                        "parent_account_id": null,
                        "subtitle": null,
                        "title": null,
                        "object": "account"
                      }
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
        let expectedResponse = ListSearchResponse(
            data: [
                SearchResult(
                    matchReason: Nullable<SearchResultMatchReason>.value(SearchResultMatchReason.id),
                    record: SearchRecord.account(
                        .init(
                            bannerImageUrl: .null,
                            description: .null,
                            id: "id",
                            imageUrl: .null,
                            parentAccountId: .null,
                            subtitle: .null,
                            title: .null,
                            additionalProperties: [
                                "object": JSONValue.string("account")
                            ]
                        )
                    )
                )
            ],
            pageInfo: ListSearchResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.search.list(
            query: "query",
            accountId: "account_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}