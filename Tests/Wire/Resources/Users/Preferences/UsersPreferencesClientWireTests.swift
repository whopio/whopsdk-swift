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
                  "cards_auto_top_up": false,
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
            cardsAutoTopUp: false,
            termsAccepted: true,
            termsAcceptedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
        )
        let response = try await client.users.preferences.retrieve(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "bounty_worker_onboarding_dismissed": true,
                  "cards_auto_top_up": true,
                  "terms_accepted": true,
                  "terms_accepted_at": "terms_accepted_at"
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
            bountyWorkerOnboardingDismissed: true,
            cardsAutoTopUp: true,
            termsAccepted: true,
            termsAcceptedAt: Nullable<String>.value("terms_accepted_at")
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
                  "cards_auto_top_up": false,
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
            cardsAutoTopUp: false,
            termsAccepted: true,
            termsAcceptedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
        )
        let response = try await client.users.preferences.update(
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "bounty_worker_onboarding_dismissed": true,
                  "cards_auto_top_up": true,
                  "terms_accepted": true,
                  "terms_accepted_at": "terms_accepted_at"
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
            bountyWorkerOnboardingDismissed: true,
            cardsAutoTopUp: true,
            termsAccepted: true,
            termsAcceptedAt: Nullable<String>.value("terms_accepted_at")
        )
        let response = try await client.users.preferences.update(
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}