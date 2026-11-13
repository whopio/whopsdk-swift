import Foundation
import Testing
import WhopSDK

@Suite("RefundsClient Wire Tests") struct RefundsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "failure_message": "The customer's card is expired or was canceled.",
                      "failure_reason": "bank_declined",
                      "id": "rf_xxxxxxxxxxxxxx",
                      "metadata": {
                        "key": "value"
                      },
                      "original_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "payment_id": "pay_xxxxxxxxxxxxxx",
                      "provider": "stripe",
                      "provider_created_at": "2026-01-01T12:00:00.000Z",
                      "reason": "duplicate",
                      "reference_status": "available",
                      "reference_type": "acquirer_reference_number",
                      "reference_value": "reference_value",
                      "status": "pending",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "visa_rdr": false
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
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
        let expectedResponse = ListRefundsResponse(
            data: [
                Refund(
                    accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    amount: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    failureMessage: Nullable<String>.value("The customer's card is expired or was canceled."),
                    failureReason: Nullable<RefundFailureReason>.value(RefundFailureReason.bankDeclined),
                    id: "rf_xxxxxxxxxxxxxx",
                    metadata: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    originalAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    paymentId: "pay_xxxxxxxxxxxxxx",
                    provider: "stripe",
                    providerCreatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    reason: Nullable<RefundReason>.value(RefundReason.duplicate),
                    referenceStatus: Nullable<RefundReferenceStatus>.value(RefundReferenceStatus.available),
                    referenceType: Nullable<RefundReferenceType>.value(RefundReferenceType.acquirerReferenceNumber),
                    referenceValue: Nullable<String>.value("reference_value"),
                    status: RefundStatus.pending,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    visaRdr: false
                )
            ],
            pageInfo: ListRefundsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.refunds.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "failure_message": "The customer's card is expired or was canceled.",
                  "failure_reason": "bank_declined",
                  "id": "rf_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "original_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "payment_id": "pay_xxxxxxxxxxxxxx",
                  "provider": "stripe",
                  "provider_created_at": "2026-01-01T12:00:00.000Z",
                  "reason": "duplicate",
                  "reference_status": "available",
                  "reference_type": "acquirer_reference_number",
                  "reference_value": "reference_value",
                  "status": "pending",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "visa_rdr": false
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Refund(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            createdAt: "2026-01-01T12:00:00.000Z",
            failureMessage: Nullable<String>.value("The customer's card is expired or was canceled."),
            failureReason: Nullable<RefundFailureReason>.value(RefundFailureReason.bankDeclined),
            id: "rf_xxxxxxxxxxxxxx",
            metadata: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            originalAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            paymentId: "pay_xxxxxxxxxxxxxx",
            provider: "stripe",
            providerCreatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            reason: Nullable<RefundReason>.value(RefundReason.duplicate),
            referenceStatus: Nullable<RefundReferenceStatus>.value(RefundReferenceStatus.available),
            referenceType: Nullable<RefundReferenceType>.value(RefundReferenceType.acquirerReferenceNumber),
            referenceValue: Nullable<String>.value("reference_value"),
            status: RefundStatus.pending,
            updatedAt: "2026-01-01T12:00:00.000Z",
            visaRdr: false
        )
        let response = try await client.refunds.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}