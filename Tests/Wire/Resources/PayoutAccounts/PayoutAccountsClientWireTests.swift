import Foundation
import Testing
import WhopSDK

@Suite("PayoutAccountsClient Wire Tests") struct PayoutAccountsClientWireTests {
    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "business_name": "business_name",
                  "business_representative": {
                    "date_of_birth": "date_of_birth",
                    "first_name": "first_name",
                    "last_name": "last_name",
                    "middle_name": "middle_name"
                  },
                  "email": "email",
                  "id": "poact_xxxxxxxxxxxx",
                  "latest_verification": {
                    "id": "verf_xxxxxxxxxxxxx",
                    "last_error_code": "abandoned",
                    "last_error_reason": "Document image was too blurry to read.",
                    "status": "requires_input"
                  },
                  "phone": "phone",
                  "status": "connected"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PayoutAccount(
            address: Nullable<PayoutAccountAddress>.value(PayoutAccountAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            businessName: Nullable<String>.value("business_name"),
            businessRepresentative: Nullable<PayoutAccountBusinessRepresentative>.value(PayoutAccountBusinessRepresentative(
                dateOfBirth: Nullable<String>.value("date_of_birth"),
                firstName: Nullable<String>.value("first_name"),
                lastName: Nullable<String>.value("last_name"),
                middleName: Nullable<String>.value("middle_name")
            )),
            email: Nullable<String>.value("email"),
            id: "poact_xxxxxxxxxxxx",
            latestVerification: Nullable<PayoutAccountLatestVerification>.value(PayoutAccountLatestVerification(
                id: "verf_xxxxxxxxxxxxx",
                lastErrorCode: Nullable<VerificationErrorCodes>.value(VerificationErrorCodes.abandoned),
                lastErrorReason: Nullable<String>.value("Document image was too blurry to read."),
                status: VerificationStatuses.requiresInput
            )),
            phone: Nullable<String>.value("phone"),
            status: Nullable<PayoutAccountCalculatedStatuses>.value(PayoutAccountCalculatedStatuses.connected)
        )
        let response = try await client.payoutAccounts.retrieve(
            id: "poact_xxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}