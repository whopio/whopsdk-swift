import Foundation
import Testing
import WhopSDK

@Suite("CustomerTrackingClient Wire Tests") struct CustomerTrackingClientWireTests {
    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "accent_color": "#1d4ed8",
                  "business_name": "Shine Time Auto Detailing",
                  "button_text_color": "black",
                  "logo_url": "logo_url",
                  "show_business_name": true,
                  "show_logo": true,
                  "support_email": "support_email",
                  "support_url": "support_url"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AccountCustomerTracking(
            accentColor: "#1d4ed8",
            businessName: "Shine Time Auto Detailing",
            buttonTextColor: AccountCustomerTrackingButtonTextColor.black,
            logoUrl: Nullable<String>.value("logo_url"),
            showBusinessName: true,
            showLogo: true,
            supportEmail: Nullable<String>.value("support_email"),
            supportUrl: Nullable<String>.value("support_url")
        )
        let response = try await client.accounts.customerTracking.retrieve(
            accountId: "account_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}