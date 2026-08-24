import Foundation
import Testing
import WhopSDK

@Suite("DisputeAlertsClient Wire Tests") struct DisputeAlertsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "actionable": false,
                      "amount": 25,
                      "card_brand": "visa",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "currency": "usd",
                      "fee_charged": false,
                      "id": "dspa_xxxxxxxxxxxxxx",
                      "issuer": "issuer",
                      "not_actionable_reason": "network_resolved",
                      "payment_id": "pay_xxxxxxxxxxxxxx",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "reported_at": "2026-01-01T12:00:00.000Z",
                      "transaction_at": "2026-01-01T12:00:00.000Z",
                      "type": "early_fraud_warning",
                      "updated_at": "2026-01-01T12:00:00.000Z"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "WyJjdXJzb3IiLDFd",
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
        let expectedResponse = ListDisputeAlertsResponse(
            data: [
                DisputeAlert(
                    accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    actionable: false,
                    amount: 25,
                    cardBrand: Nullable<String>.value("visa"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currency: "usd",
                    feeCharged: false,
                    id: "dspa_xxxxxxxxxxxxxx",
                    issuer: Nullable<String>.value("issuer"),
                    notActionableReason: Nullable<DisputeAlertNotActionableReason>.value(DisputeAlertNotActionableReason.networkResolved),
                    paymentId: Nullable<String>.value("pay_xxxxxxxxxxxxxx"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    reportedAt: "2026-01-01T12:00:00.000Z",
                    transactionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    type: DisputeAlertType.earlyFraudWarning,
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListDisputeAlertsResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.disputeAlerts.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "actionable": false,
                  "amount": 25,
                  "card_brand": "visa",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "fee_charged": false,
                  "id": "dspa_xxxxxxxxxxxxxx",
                  "issuer": "issuer",
                  "not_actionable_reason": "network_resolved",
                  "payment_id": "pay_xxxxxxxxxxxxxx",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "reported_at": "2026-01-01T12:00:00.000Z",
                  "transaction_at": "2026-01-01T12:00:00.000Z",
                  "type": "early_fraud_warning",
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DisputeAlert(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            actionable: false,
            amount: 25,
            cardBrand: Nullable<String>.value("visa"),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: "usd",
            feeCharged: false,
            id: "dspa_xxxxxxxxxxxxxx",
            issuer: Nullable<String>.value("issuer"),
            notActionableReason: Nullable<DisputeAlertNotActionableReason>.value(DisputeAlertNotActionableReason.networkResolved),
            paymentId: Nullable<String>.value("pay_xxxxxxxxxxxxxx"),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            reportedAt: "2026-01-01T12:00:00.000Z",
            transactionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            type: DisputeAlertType.earlyFraudWarning,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.disputeAlerts.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}