import Foundation
import Testing
import WhopSDK

@Suite("FinancialActivityClient Wire Tests") struct FinancialActivityClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo",
                        "route": "biz_xxxxxxxxxxxxxx",
                        "title": "Shine Time Auto Detailing",
                        "object": "account"
                      },
                      "amount": "2375000000",
                      "available_at": "2026-01-01T12:00:00Z",
                      "created_at": "2026-01-01T12:00:00Z",
                      "currency": {
                        "code": "usd",
                        "precision": "100000000"
                      },
                      "id": "line_3",
                      "ledger_account_id": "ldgr_xxxxxxxxxxxxxx",
                      "line_type": "ad_budget_release",
                      "object": "ledger_activity",
                      "posted_at": "2026-01-01T12:00:00Z",
                      "resource": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo",
                        "object": "account",
                        "route": "biz_xxxxxxxxxxxxxx",
                        "title": "Shine Time Auto Detailing"
                      },
                      "source": {
                        "amount_float": 1500,
                        "chain": "plasma",
                        "claim_url": "https://whop.com/claim",
                        "created_at": "2026-01-01T12:00:00Z",
                        "estimated_arrival": "2026-01-01T12:00:00Z",
                        "from_amount": "502.51",
                        "from_currency": "usdt",
                        "id": "airdrp_xxxxxxxxxxxxxx",
                        "object": "airdrop_link",
                        "payer_name": "MassPay",
                        "payout_destination": {
                          "icon_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/ach-activity-icon",
                          "payer_name": "ACH Bank Deposit"
                        },
                        "payout_token_nickname": "Ops checking",
                        "reason": "bounty_payout",
                        "sender_address": "0x8a4de51b9c37f2e6a0d1b8c94e5f7a2d3c6b0e19",
                        "status": "fully_claimed",
                        "to_amount": "500.0",
                        "to_currency": "usd",
                        "tx_hash": "0x5d84a1c7e2f9b036d48c5a7e1b9f2d6c3a8e0b4f7c1d9e5a2b6f8c0d3e7a1b52"
                      }
                    }
                  ],
                  "page_info": {
                    "end_cursor": "cursor_2",
                    "has_next_page": true,
                    "has_previous_page": false,
                    "start_cursor": "cursor_1"
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
        let expectedResponse = ListFinancialActivityResponse(
            data: [
                LedgerActivity(
                    account: Optional(LedgerActivityAccount.account(
                        .init(
                            id: "biz_xxxxxxxxxxxxxx",
                            logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo"),
                            route: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                            title: Nullable<String>.value("Shine Time Auto Detailing"),
                            additionalProperties: [
                                "object": JSONValue.string("account")
                            ]
                        )
                    )),
                    amount: "2375000000",
                    availableAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
                    createdAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
                    currency: LedgerActivityCurrency(
                        code: "usd",
                        precision: "100000000"
                    ),
                    id: "line_3",
                    ledgerAccountId: Optional(Nullable<String>.value("ldgr_xxxxxxxxxxxxxx")),
                    lineType: LedgerActivityLineType.adBudgetRelease,
                    object: LedgerActivityObject.ledgerActivity,
                    postedAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                    resource: Nullable<LedgerActivityResource>.value(LedgerActivityResource.ledgerActivityResourceLogoUrl(
                        LedgerActivityResourceLogoUrl(
                            id: "biz_xxxxxxxxxxxxxx",
                            logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/shine-time-logo"),
                            object: LedgerActivityResourceLogoUrlObject.account,
                            route: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                            title: Nullable<String>.value("Shine Time Auto Detailing")
                        )
                    )),
                    source: Nullable<LedgerActivitySource>.value(LedgerActivitySource(
                        amountFloat: Optional(Nullable<Double>.value(1500)),
                        chain: Optional(Nullable<String>.value("plasma")),
                        claimUrl: Optional(Nullable<String>.value("https://whop.com/claim")),
                        createdAt: Optional(Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601))),
                        estimatedArrival: Optional(Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601))),
                        fromAmount: Optional(Nullable<String>.value("502.51")),
                        fromCurrency: Optional(Nullable<String>.value("usdt")),
                        id: "airdrp_xxxxxxxxxxxxxx",
                        object: "airdrop_link",
                        payerName: Optional(Nullable<String>.value("MassPay")),
                        payoutDestination: Optional(Nullable<LedgerActivitySourcePayoutDestination>.value(LedgerActivitySourcePayoutDestination(
                            iconUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/ach-activity-icon")),
                            payerName: Optional(Nullable<String>.value("ACH Bank Deposit"))
                        ))),
                        payoutTokenNickname: Optional(Nullable<String>.value("Ops checking")),
                        reason: Optional(Nullable<String>.value("bounty_payout")),
                        senderAddress: Optional(Nullable<String>.value("0x8a4de51b9c37f2e6a0d1b8c94e5f7a2d3c6b0e19")),
                        status: Optional(Nullable<String>.value("fully_claimed")),
                        toAmount: Optional(Nullable<String>.value("500.0")),
                        toCurrency: Optional(Nullable<String>.value("usd")),
                        txHash: Optional(Nullable<String>.value("0x5d84a1c7e2f9b036d48c5a7e1b9f2d6c3a8e0b4f7c1d9e5a2b6f8c0d3e7a1b52"))
                    ))
                )
            ],
            pageInfo: ListFinancialActivityResponsePageInfo(
                endCursor: Nullable<String>.value("cursor_2"),
                hasNextPage: true,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("cursor_1")
            )
        )
        let response = try await client.financialActivity.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }
}