import Foundation
import Testing
import WhopSDK

@Suite("TopupsClient Wire Tests") struct TopupsClientWireTests {
    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "created_at": "2023-12-01T05:00:00Z",
                  "currency": "usd",
                  "failure_message": "failure_message",
                  "id": "pay_xxxxxxxxxxxxxx",
                  "paid_at": "2023-12-01T05:00:00Z",
                  "status": "draft",
                  "total": 6.9
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Topup(
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            currency: Nullable<Currencies>.value(Currencies.usd),
            failureMessage: Nullable<String>.value("failure_message"),
            id: "pay_xxxxxxxxxxxxxx",
            paidAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            status: Nullable<ReceiptStatus>.value(ReceiptStatus.draft),
            total: Nullable<Double>.value(6.9)
        )
        let response = try await client.topups.create(
            request: .init(
                amount: 6.9,
                companyId: "biz_xxxxxxxxxxxxxx",
                currency: .usd,
                paymentMethodId: "pmt_xxxxxxxxxxxxxx"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}