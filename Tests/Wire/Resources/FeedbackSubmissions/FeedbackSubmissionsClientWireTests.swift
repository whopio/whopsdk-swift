import Foundation
import Testing
import WhopSDK

@Suite("FeedbackSubmissionsClient Wire Tests") struct FeedbackSubmissionsClientWireTests {
    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "created_at": "2026-01-01T12:00:00Z",
                  "id": "fbk_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateFeedbackSubmissionsResponse(
            createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
            id: "fbk_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
        )
        let response = try await client.feedbackSubmissions.create(
            request: .init(
                content: "The docs omit the required permission",
                source: .mcpReportFeedback
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}