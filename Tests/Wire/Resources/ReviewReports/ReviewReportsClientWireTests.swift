import Foundation
import Testing
import WhopSDK

@Suite("ReviewReportsClient Wire Tests") struct ReviewReportsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "id": "rrpt_xxxxxxxxxxxxxx",
                      "reason": "The reviewer bought a different product",
                      "review_id": "rev_xxxxxxxxxxxxxx",
                      "status": "pending",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "user_id": "user_xxxxxxxxxxxxxx"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
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
        let expectedResponse = ListReviewReportsResponse(
            data: [
                ReviewReport(
                    createdAt: "2026-01-01T12:00:00.000Z",
                    id: "rrpt_xxxxxxxxxxxxxx",
                    reason: "The reviewer bought a different product",
                    reviewId: "rev_xxxxxxxxxxxxxx",
                    status: ReviewReportStatus.pending,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
                )
            ],
            pageInfo: ListReviewReportsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.reviewReports.list(
            accountId: "biz_xxxxxxxxxxxxxx",
            reviewId: "rev_xxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}