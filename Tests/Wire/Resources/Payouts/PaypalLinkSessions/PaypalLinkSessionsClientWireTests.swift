import Foundation
import Testing
import WhopSDK

@Suite("PaypalLinkSessionsClient Wire Tests") struct PaypalLinkSessionsClientWireTests {
    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "authorize_url": "https://www.paypal.com/connect",
                  "expires_at": "2026-01-01T12:00:00Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreatePaypalLinkSessionsResponse(
            authorizeUrl: "https://www.paypal.com/connect",
            expiresAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)
        )
        let response = try await client.payouts.paypalLinkSessions.create(
            request: .init(
                returnUrl: "https://example.com/settings/payouts",
                supportedPayoutMethodId: "podst_xxxxxxxxxxxxxx"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "authorize_url": "authorize_url",
                  "expires_at": "2024-01-15T09:30:00Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreatePaypalLinkSessionsResponse(
            authorizeUrl: "authorize_url",
            expiresAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
        )
        let response = try await client.payouts.paypalLinkSessions.create(
            request: .init(
                returnUrl: "return_url",
                supportedPayoutMethodId: "supported_payout_method_id"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}