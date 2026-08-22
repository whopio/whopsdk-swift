import Foundation
import Testing
import WhopSDK

@Suite("LedgersClient Wire Tests") struct LedgersClientWireTests {
    @Test func getFinancialReport1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "beginning_balance": 11480.02,
                  "ending_balance": 23750.55,
                  "fx_excluded_currencies": [
                    "ngn"
                  ],
                  "report_type": "balance_summary",
                  "rows": [
                    {
                      "account_ik_path": "assets/wallets/wallet/available",
                      "account_name": "Available balance",
                      "account_type": "asset",
                      "amount": 23750.55,
                      "grouping": "advertising",
                      "line_category": "account_settlement",
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
        let expectedResponse = GetFinancialReportResponse(
            beginningBalance: Optional(Nullable<Double>.value(11480.02)),
            endingBalance: Optional(Nullable<Double>.value(23750.55)),
            fxExcludedCurrencies: Optional([
                "ngn"
            ]),
            reportType: GetFinancialReportResponseReportType.balanceSummary,
            rows: [
                GetFinancialReportResponseRowsItem(
                    accountIkPath: Optional(Nullable<String>.value("assets/wallets/wallet/available")),
                    accountName: Optional(Nullable<String>.value("Available balance")),
                    accountType: Optional(Nullable<String>.value("asset")),
                    amount: 23750.55,
                    grouping: GetFinancialReportResponseRowsItemGrouping.advertising,
                    lineCategory: GetFinancialReportResponseRowsItemLineCategory.accountSettlement,
                    lineCount: Optional(Nullable<Int>.value(214)),
                    period: "2026-05",
                    profitAndLossSection: Optional(Nullable<GetFinancialReportResponseRowsItemProfitAndLossSection>.value(GetFinancialReportResponseRowsItemProfitAndLossSection.revenue))
                )
            ],
            total: 23750.55
        )
        let response = try await client.ledgers.getFinancialReport(
            accountId: "account_id",
            reportType: .balanceSummary,
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}