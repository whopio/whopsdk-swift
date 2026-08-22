import Foundation
import Testing
import WhopSDK

@Suite("AccessTokensClient Wire Tests") struct AccessTokensClientWireTests {
    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "expires_at": "2023-12-01T05:00:00Z",
                  "token": "token"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AccessToken(
            expiresAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            token: "token"
        )
        let response = try await client.accessTokens.create(
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}