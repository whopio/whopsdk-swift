import Foundation
import Testing
import WhopSDK

@Suite("ReportsClient Wire Tests") struct ReportsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "breakdowns": [
                        "breakdowns"
                      ],
                      "columns": [
                        {
                          "key": "key",
                          "name": "name",
                          "type": "property"
                        }
                      ],
                      "description": "description",
                      "key": "key",
                      "path": "path",
                      "window_field": "window_field",
                      "window_kind": "range"
                    }
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
        let expectedResponse = ListReportsResponse(
            data: [
                ListReportsResponseDataItem(
                    breakdowns: [
                        "breakdowns"
                    ],
                    columns: [
                        ListReportsResponseDataItemColumnsItem(
                            key: "key",
                            name: "name",
                            type: ListReportsResponseDataItemColumnsItemType.property
                        )
                    ],
                    description: "description",
                    key: "key",
                    path: "path",
                    windowField: Nullable<String>.value("window_field"),
                    windowKind: ListReportsResponseDataItemWindowKind.range
                )
            ]
        )
        let response = try await client.stats.reports.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }
}