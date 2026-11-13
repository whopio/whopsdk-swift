import Foundation
import Testing
import WhopSDK

@Suite("ApiLogsClient Wire Tests") struct ApiLogsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "api_key_id": "apik_xxxxxxxxxxxxxx",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "duration_ms": 12,
                      "http_method": "GET",
                      "http_path": "/api/v1/products/prod_abc",
                      "id": "evt_xxxxxxxxxxxxxx_1",
                      "ip_address": "87.106.27.99",
                      "operation_name": "api/v1/products#create",
                      "resource_id": "prod_abc",
                      "status": "success",
                      "status_code": 200,
                      "user_agent": "node"
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
        let expectedResponse = ListApiLogsResponse(
            data: [
                ListApiLogsResponseDataItem(
                    apiKeyId: Optional(Nullable<String>.value("apik_xxxxxxxxxxxxxx")),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    durationMs: Optional(Nullable<Int>.value(12)),
                    httpMethod: Optional(Nullable<ListApiLogsResponseDataItemHttpMethod>.value(ListApiLogsResponseDataItemHttpMethod.get)),
                    httpPath: Optional(Nullable<String>.value("/api/v1/products/prod_abc")),
                    id: "evt_xxxxxxxxxxxxxx_1",
                    ipAddress: Optional(Nullable<String>.value("87.106.27.99")),
                    operationName: Optional(Nullable<String>.value("api/v1/products#create")),
                    resourceId: Optional(Nullable<String>.value("prod_abc")),
                    status: Optional(Nullable<ListApiLogsResponseDataItemStatus>.value(ListApiLogsResponseDataItemStatus.success)),
                    statusCode: Optional(Nullable<Int>.value(200)),
                    userAgent: Optional(Nullable<String>.value("node"))
                )
            ],
            pageInfo: ListApiLogsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.apiLogs.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }
}