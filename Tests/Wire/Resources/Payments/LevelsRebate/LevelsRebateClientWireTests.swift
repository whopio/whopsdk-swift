import Foundation
import Testing
import WhopSDK

@Suite("LevelsRebateClient Wire Tests") struct LevelsRebateClientWireTests {
    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "covered_share": 1,
                  "effective_rate_percentage": 2.7,
                  "ineligible_reason": "not_card_payment",
                  "level": 3,
                  "month_started_at": "2026-10-01T00:00:00.000Z",
                  "payment_id": "pay_xxxxxxxxxxxxxx",
                  "processing_rate_percentage": 2.1,
                  "region": "us_and_canada",
                  "status": "rebated"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentLevelsRebate(
            amount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            coveredShare: Nullable<Double>.value(1),
            effectiveRatePercentage: Nullable<Double>.value(2.7),
            ineligibleReason: Nullable<PaymentLevelsRebateIneligibleReason>.value(PaymentLevelsRebateIneligibleReason.notCardPayment),
            level: Nullable<Int>.value(3),
            monthStartedAt: Nullable<String>.value("2026-10-01T00:00:00.000Z"),
            paymentId: "pay_xxxxxxxxxxxxxx",
            processingRatePercentage: Nullable<Double>.value(2.1),
            region: Nullable<PaymentLevelsRebateRegion>.value(PaymentLevelsRebateRegion.usAndCanada),
            status: PaymentLevelsRebateStatus.rebated
        )
        let response = try await client.payments.levelsRebate.retrieve(
            paymentId: "payment_id",
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
                  "amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "covered_share": 1.1,
                  "effective_rate_percentage": 1.1,
                  "ineligible_reason": "not_card_payment",
                  "level": 1,
                  "month_started_at": "month_started_at",
                  "payment_id": "payment_id",
                  "processing_rate_percentage": 1.1,
                  "region": "us_and_canada",
                  "status": "rebated"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentLevelsRebate(
            amount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            coveredShare: Nullable<Double>.value(1.1),
            effectiveRatePercentage: Nullable<Double>.value(1.1),
            ineligibleReason: Nullable<PaymentLevelsRebateIneligibleReason>.value(PaymentLevelsRebateIneligibleReason.notCardPayment),
            level: Nullable<Int>.value(1),
            monthStartedAt: Nullable<String>.value("month_started_at"),
            paymentId: "payment_id",
            processingRatePercentage: Nullable<Double>.value(1.1),
            region: Nullable<PaymentLevelsRebateRegion>.value(PaymentLevelsRebateRegion.usAndCanada),
            status: PaymentLevelsRebateStatus.rebated
        )
        let response = try await client.payments.levelsRebate.retrieve(
            paymentId: "payment_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}