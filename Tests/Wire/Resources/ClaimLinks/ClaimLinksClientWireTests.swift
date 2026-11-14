import Foundation
import Testing
import WhopSDK

@Suite("ClaimLinksClient Wire Tests") struct ClaimLinksClientWireTests {
    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "amount": "25.00",
                  "claim_url": "https://whop.com/claim",
                  "claimable": true,
                  "code": "demoClaim123",
                  "created_at": "2026-01-01T12:00:00Z",
                  "currency": "usd",
                  "expires_at": "2026-01-01T12:00:00Z",
                  "id": "airdrp_xxxxxxxxxxxxxx",
                  "object": "claim_link",
                  "redeemable_count": 1,
                  "redeemed_count": 0,
                  "remaining_claims": 1,
                  "sender": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing",
                    "object": "account"
                  },
                  "source": {
                    "account_id": "biz_xxxxxxxxxxxxxx"
                  },
                  "status": "pending"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RetrieveClaimLinksResponse(
            amount: "25.00",
            claimUrl: Nullable<String>.value("https://whop.com/claim"),
            claimable: true,
            code: Nullable<String>.value("demoClaim123"),
            createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
            currency: "usd",
            expiresAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
            id: "airdrp_xxxxxxxxxxxxxx",
            object: RetrieveClaimLinksResponseObject.claimLink,
            redeemableCount: 1,
            redeemedCount: 0,
            remainingClaims: 1,
            sender: RetrieveClaimLinksResponseSender.account(
                .init(
                    id: "biz_xxxxxxxxxxxxxx",
                    logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo"),
                    route: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    title: Nullable<String>.value("Shine Time Auto Detailing"),
                    additionalProperties: [
                        "object": JSONValue.string("account")
                    ]
                )
            ),
            source: RetrieveClaimLinksResponseSource(
                accountId: "biz_xxxxxxxxxxxxxx"
            ),
            status: RetrieveClaimLinksResponseStatus.pending
        )
        let response = try await client.claimLinks.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retrieve2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "amount": "amount",
                  "claim_url": "claim_url",
                  "claimable": true,
                  "code": "code",
                  "created_at": "2024-01-15T09:30:00Z",
                  "currency": "currency",
                  "expires_at": "2024-01-15T09:30:00Z",
                  "id": "id",
                  "object": "claim_link",
                  "redeemable_count": 1,
                  "redeemed_count": 1,
                  "remaining_claims": 1,
                  "sender": {
                    "object": "account",
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "source": {
                    "account_id": "account_id"
                  },
                  "status": "pending"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RetrieveClaimLinksResponse(
            amount: "amount",
            claimUrl: Nullable<String>.value("claim_url"),
            claimable: true,
            code: Nullable<String>.value("code"),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            currency: "currency",
            expiresAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            id: "id",
            object: RetrieveClaimLinksResponseObject.claimLink,
            redeemableCount: 1,
            redeemedCount: 1,
            remainingClaims: 1,
            sender: RetrieveClaimLinksResponseSender.account(
                .init(
                    id: "id",
                    logoUrl: Nullable<String>.value("logo_url"),
                    route: Nullable<String>.value("route"),
                    title: Nullable<String>.value("title"),
                    additionalProperties: [
                        "object": JSONValue.string("account")
                    ]
                )
            ),
            source: RetrieveClaimLinksResponseSource(
                accountId: "account_id"
            ),
            status: RetrieveClaimLinksResponseStatus.pending
        )
        let response = try await client.claimLinks.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func claim1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "amount": "25.00",
                  "claim_url": "https://whop.com/claim",
                  "claimable": false,
                  "code": "demoClaim123",
                  "created_at": "2026-01-01T12:00:00Z",
                  "currency": "usd",
                  "expires_at": "2024-01-15T09:30:00Z",
                  "id": "airdrp_xxxxxxxxxxxxxx",
                  "object": "claim_link",
                  "redeemable_count": 1,
                  "redeemed_count": 1,
                  "remaining_claims": 0,
                  "sender": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "logo_url",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing",
                    "object": "account"
                  },
                  "source": {
                    "account_id": "biz_xxxxxxxxxxxxxx"
                  },
                  "status": "pending"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ClaimClaimLinksResponse(
            amount: "25.00",
            claimUrl: Nullable<String>.value("https://whop.com/claim"),
            claimable: false,
            code: Nullable<String>.value("demoClaim123"),
            createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
            currency: "usd",
            expiresAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            id: "airdrp_xxxxxxxxxxxxxx",
            object: ClaimClaimLinksResponseObject.claimLink,
            redeemableCount: 1,
            redeemedCount: 1,
            remainingClaims: 0,
            sender: ClaimClaimLinksResponseSender.account(
                .init(
                    id: "biz_xxxxxxxxxxxxxx",
                    logoUrl: Nullable<String>.value("logo_url"),
                    route: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    title: Nullable<String>.value("Shine Time Auto Detailing"),
                    additionalProperties: [
                        "object": JSONValue.string("account")
                    ]
                )
            ),
            source: ClaimClaimLinksResponseSource(
                accountId: "biz_xxxxxxxxxxxxxx"
            ),
            status: ClaimClaimLinksResponseStatus.pending
        )
        let response = try await client.claimLinks.claim(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func claim2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "amount": "amount",
                  "claim_url": "claim_url",
                  "claimable": true,
                  "code": "code",
                  "created_at": "2024-01-15T09:30:00Z",
                  "currency": "currency",
                  "expires_at": "2024-01-15T09:30:00Z",
                  "id": "id",
                  "object": "claim_link",
                  "redeemable_count": 1,
                  "redeemed_count": 1,
                  "remaining_claims": 1,
                  "sender": {
                    "object": "account",
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "source": {
                    "account_id": "account_id"
                  },
                  "status": "pending"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ClaimClaimLinksResponse(
            amount: "amount",
            claimUrl: Nullable<String>.value("claim_url"),
            claimable: true,
            code: Nullable<String>.value("code"),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            currency: "currency",
            expiresAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            id: "id",
            object: ClaimClaimLinksResponseObject.claimLink,
            redeemableCount: 1,
            redeemedCount: 1,
            remainingClaims: 1,
            sender: ClaimClaimLinksResponseSender.account(
                .init(
                    id: "id",
                    logoUrl: Nullable<String>.value("logo_url"),
                    route: Nullable<String>.value("route"),
                    title: Nullable<String>.value("title"),
                    additionalProperties: [
                        "object": JSONValue.string("account")
                    ]
                )
            ),
            source: ClaimClaimLinksResponseSource(
                accountId: "account_id"
            ),
            status: ClaimClaimLinksResponseStatus.pending
        )
        let response = try await client.claimLinks.claim(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}