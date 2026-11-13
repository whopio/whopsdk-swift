import Foundation
import Testing
import WhopSDK

@Suite("FinancialReportsClient Wire Tests") struct FinancialReportsClientWireTests {
    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "beginning_balance": 11480.02,
                  "currencies": [
                    "usd"
                  ],
                  "ending_balance": 23750.55,
                  "fx_excluded_currencies": [
                    "ngn"
                  ],
                  "payment_fee_breakdown": [
                    {
                      "amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "category": "app_store_payments",
                      "payment_method": "payment_method",
                      "period": "period"
                    }
                  ],
                  "report_type": "balance_summary",
                  "rows": [
                    {
                      "account_ik_path": "assets/wallets/wallet/available",
                      "account_name": "Available balance",
                      "account_type": "asset",
                      "amount": 23750.55,
                      "grouping": "advertising",
                      "line_category": "accelerated_settlement_fee",
                      "line_count": 214,
                      "period": "2026-05",
                      "profit_and_loss_section": "revenue"
                    }
                  ],
                  "total": 23750.55
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RetrieveFinancialReportsResponse(
            beginningBalance: Optional(Nullable<Double>.value(11480.02)),
            currencies: Optional([
                "usd"
            ]),
            endingBalance: Optional(Nullable<Double>.value(23750.55)),
            fxExcludedCurrencies: Optional([
                "ngn"
            ]),
            paymentFeeBreakdown: Optional([
                RetrieveFinancialReportsResponsePaymentFeeBreakdownItem(
                    amount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    category: RetrieveFinancialReportsResponsePaymentFeeBreakdownItemCategory.appStorePayments,
                    paymentMethod: "payment_method",
                    period: "period"
                )
            ]),
            reportType: RetrieveFinancialReportsResponseReportType.balanceSummary,
            rows: [
                RetrieveFinancialReportsResponseRowsItem(
                    accountIkPath: Optional(Nullable<String>.value("assets/wallets/wallet/available")),
                    accountName: Optional(Nullable<String>.value("Available balance")),
                    accountType: Optional(Nullable<String>.value("asset")),
                    amount: 23750.55,
                    grouping: RetrieveFinancialReportsResponseRowsItemGrouping.advertising,
                    lineCategory: RetrieveFinancialReportsResponseRowsItemLineCategory.acceleratedSettlementFee,
                    lineCount: Optional(Nullable<Int>.value(214)),
                    period: "2026-05",
                    profitAndLossSection: Optional(Nullable<RetrieveFinancialReportsResponseRowsItemProfitAndLossSection>.value(RetrieveFinancialReportsResponseRowsItemProfitAndLossSection.revenue))
                )
            ],
            total: 23750.55
        )
        let response = try await client.financialReports.retrieve(
            accountId: "account_id",
            reportType: .balanceSummary,
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}