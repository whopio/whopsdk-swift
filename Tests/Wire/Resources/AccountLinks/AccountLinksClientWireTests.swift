import Foundation
import Testing
import WhopSDK

@Suite("AccountLinksClient Wire Tests") struct AccountLinksClientWireTests {
    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "expires_at": "2023-12-01T05:00:00Z",
                  "url": "https://whop.com/verify-identity/biz_xxxxxxxxx/"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AccountLink(
            expiresAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            url: "https://whop.com/verify-identity/biz_xxxxxxxxx/"
        )
        let response = try await client.accountLinks.create(
            request: .init(
                accountId: "biz_xxxxxxxxxxxxxx",
                refreshUrl: "refresh_url",
                returnUrl: "return_url",
                useCase: .accountOnboarding
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}