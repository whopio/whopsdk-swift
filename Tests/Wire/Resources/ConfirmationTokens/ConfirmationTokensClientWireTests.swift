import Foundation
import Testing
import WhopSDK

@Suite("ConfirmationTokensClient Wire Tests") struct ConfirmationTokensClientWireTests {
    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "billing_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "billing_details": {
                    "country": "AR",
                    "email": "marcus@shinetime.example",
                    "name": "Buyer Name",
                    "postal_code": "C1043"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "id": "ctok_xxxxxxxxxxxxxx",
                  "object": "confirmation_token",
                  "payment_method_preview": {
                    "bank_debit": {
                      "brand": "visa",
                      "fingerprint": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                      "last4": "4242"
                    },
                    "card": {
                      "brand": "visa",
                      "fingerprint": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                      "last4": "4242"
                    },
                    "category": "card",
                    "display_name": "Visa •••• 4242",
                    "id": "payt_xxxxxxxxxxxxxx",
                    "saved": {
                      "brand": "visa",
                      "fingerprint": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                      "last4": "4242"
                    },
                    "type": "card",
                    "wallet": {
                      "brand": "visa",
                      "fingerprint": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                      "last4": "4242"
                    }
                  },
                  "setup_future_usage": "off_session",
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
        let expectedResponse = ConfirmationToken(
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            billingDetails: Nullable<PaymentBillingDetailsPreview>.value(PaymentBillingDetailsPreview(
                country: Nullable<String>.value("AR"),
                email: Nullable<String>.value("marcus@shinetime.example"),
                name: Nullable<String>.value("Buyer Name"),
                postalCode: Nullable<String>.value("C1043")
            )),
            createdAt: "2026-01-01T12:00:00.000Z",
            expiresAt: "2026-01-01T12:00:00.000Z",
            id: "ctok_xxxxxxxxxxxxxx",
            object: "confirmation_token",
            paymentMethodPreview: PaymentMethodDisplay(
                bankDebit: Optional(PaymentMethodDisplayPreview(
                    brand: Optional("visa"),
                    fingerprint: Optional("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
                    last4: Optional("4242")
                )),
                card: Optional(PaymentMethodDisplayPreview(
                    brand: Optional("visa"),
                    fingerprint: Optional("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
                    last4: Optional("4242")
                )),
                category: PaymentMethodDisplayCategory.card,
                displayName: "Visa •••• 4242",
                id: Nullable<String>.value("payt_xxxxxxxxxxxxxx"),
                saved: Optional(PaymentMethodDisplayPreview(
                    brand: Optional("visa"),
                    fingerprint: Optional("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
                    last4: Optional("4242")
                )),
                type: "card",
                wallet: Optional(PaymentMethodDisplayPreview(
                    brand: Optional("visa"),
                    fingerprint: Optional("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
                    last4: Optional("4242")
                ))
            ),
            setupFutureUsage: Nullable<String>.value("off_session"),
            status: ConfirmationTokenStatus.pending
        )
        let response = try await client.confirmationTokens.retrieve(
            id: "id",
            accountId: "account_id",
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
                  "billing_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "name": "name",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "billing_details": {
                    "country": "country",
                    "email": "email",
                    "name": "name",
                    "postal_code": "postal_code"
                  },
                  "created_at": "created_at",
                  "expires_at": "expires_at",
                  "id": "id",
                  "object": "object",
                  "payment_method_preview": {
                    "bank_debit": {
                      "brand": "brand",
                      "fingerprint": "fingerprint",
                      "last4": "last4"
                    },
                    "card": {
                      "brand": "brand",
                      "fingerprint": "fingerprint",
                      "last4": "last4"
                    },
                    "category": "card",
                    "display_name": "display_name",
                    "id": "id",
                    "saved": {
                      "brand": "brand",
                      "fingerprint": "fingerprint",
                      "last4": "last4"
                    },
                    "type": "type",
                    "wallet": {
                      "brand": "brand",
                      "fingerprint": "fingerprint",
                      "last4": "last4"
                    }
                  },
                  "setup_future_usage": "setup_future_usage",
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
        let expectedResponse = ConfirmationToken(
            billingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            billingDetails: Nullable<PaymentBillingDetailsPreview>.value(PaymentBillingDetailsPreview(
                country: Nullable<String>.value("country"),
                email: Nullable<String>.value("email"),
                name: Nullable<String>.value("name"),
                postalCode: Nullable<String>.value("postal_code")
            )),
            createdAt: "created_at",
            expiresAt: "expires_at",
            id: "id",
            object: "object",
            paymentMethodPreview: PaymentMethodDisplay(
                bankDebit: Optional(PaymentMethodDisplayPreview(
                    brand: Optional("brand"),
                    fingerprint: Optional("fingerprint"),
                    last4: Optional("last4")
                )),
                card: Optional(PaymentMethodDisplayPreview(
                    brand: Optional("brand"),
                    fingerprint: Optional("fingerprint"),
                    last4: Optional("last4")
                )),
                category: PaymentMethodDisplayCategory.card,
                displayName: "display_name",
                id: Nullable<String>.value("id"),
                saved: Optional(PaymentMethodDisplayPreview(
                    brand: Optional("brand"),
                    fingerprint: Optional("fingerprint"),
                    last4: Optional("last4")
                )),
                type: "type",
                wallet: Optional(PaymentMethodDisplayPreview(
                    brand: Optional("brand"),
                    fingerprint: Optional("fingerprint"),
                    last4: Optional("last4")
                ))
            ),
            setupFutureUsage: Nullable<String>.value("setup_future_usage"),
            status: ConfirmationTokenStatus.pending
        )
        let response = try await client.confirmationTokens.retrieve(
            id: "id",
            accountId: "account_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}