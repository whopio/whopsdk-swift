import Foundation
import Testing
import WhopSDK

@Suite("PasskeysClient Wire Tests") struct PasskeysClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "credential_id": "bGFwdG9wLWNyZWRlbnRpYWw",
                      "id": "wcred_xxxxxxxxxxxxxx",
                      "last_used_at": "2026-01-01T12:00:00.000Z",
                      "nickname": "MacBook Pro"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "WyJjdXJzb3IiLDFd",
                    "has_next_page": true,
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
        let expectedResponse = ListPasskeysResponse(
            data: [
                Passkey(
                    createdAt: "2026-01-01T12:00:00.000Z",
                    credentialId: "bGFwdG9wLWNyZWRlbnRpYWw",
                    id: "wcred_xxxxxxxxxxxxxx",
                    lastUsedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    nickname: "MacBook Pro"
                )
            ],
            pageInfo: ListPasskeysResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: true,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.users.passkeys.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "credential_id": "bGFwdG9wLWNyZWRlbnRpYWw",
                  "id": "wcred_xxxxxxxxxxxxxx",
                  "last_used_at": "2026-01-01T12:00:00.000Z",
                  "nickname": "MacBook Pro"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Passkey(
            createdAt: "2026-01-01T12:00:00.000Z",
            credentialId: "bGFwdG9wLWNyZWRlbnRpYWw",
            id: "wcred_xxxxxxxxxxxxxx",
            lastUsedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            nickname: "MacBook Pro"
        )
        let response = try await client.users.passkeys.create(
            request: .init(
                attestationObject: "YXR0ZXN0YXRpb24",
                clientDataJson: "Y2xpZW50LWRhdGE",
                credentialId: "bmV3LWNyZWRlbnRpYWw",
                nickname: "Work laptop"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func challenge1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "challenge": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChallengePasskeysResponse(
            challenge: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        )
        let response = try await client.users.passkeys.challenge(
            request: .init(challengeType: .registration),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "deleted": true,
                  "id": "wcred_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeletePasskeysResponse(
            deleted: true,
            id: "wcred_xxxxxxxxxxxxxx"
        )
        let response = try await client.users.passkeys.delete(
            id: "id",
            request: .init(
                authenticatorData: "YXV0aGVudGljYXRvci1kYXRh",
                clientDataJson: "Y2xpZW50LWRhdGE",
                signature: "c2lnbmF0dXJl"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}