import Foundation
import Testing
import WhopSDK

@Suite("UsersPreferencesClient Wire Tests") struct UsersPreferencesClientWireTests {
    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "bounty_worker_onboarding_dismissed": false,
                  "investigation_enabled": true,
                  "terms_accepted": true,
                  "terms_accepted_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = UserPreferences(
            bountyWorkerOnboardingDismissed: false,
            investigationEnabled: true,
            termsAccepted: true,
            termsAcceptedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
        )
        let response = try await client.users.preferences.retrieve(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func update1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "bounty_worker_onboarding_dismissed": false,
                  "investigation_enabled": true,
                  "terms_accepted": true,
                  "terms_accepted_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = UserPreferences(
            bountyWorkerOnboardingDismissed: false,
            investigationEnabled: true,
            termsAccepted: true,
            termsAcceptedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
        )
        let response = try await client.users.preferences.update(
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}