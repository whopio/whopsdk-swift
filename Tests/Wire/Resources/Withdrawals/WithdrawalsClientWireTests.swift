import Foundation
import Testing
import WhopSDK

@Suite("WithdrawalsClient Wire Tests") struct WithdrawalsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "amount": 6.9,
                      "created_at": "2023-12-01T05:00:00Z",
                      "currency": "usd",
                      "fee_amount": 6.9,
                      "fee_type": "exclusive",
                      "id": "wdrl_xxxxxxxxxxxxx",
                      "markup_fee": 6.9,
                      "payout_request_id": "cofr_xxxxxxxxxxxxxx",
                      "speed": "standard",
                      "status": "requested"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": true,
                    "has_previous_page": true,
                    "start_cursor": "start_cursor"
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
        let expectedResponse = ListWithdrawalsResponse(
            data: [
                WithdrawalListItem(
                    amount: 6.9,
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    currency: Currencies.usd,
                    feeAmount: 6.9,
                    feeType: Nullable<WithdrawalFeeTypes>.value(WithdrawalFeeTypes.exclusive),
                    id: "wdrl_xxxxxxxxxxxxx",
                    markupFee: 6.9,
                    payoutRequestId: Nullable<String>.value("cofr_xxxxxxxxxxxxxx"),
                    speed: WithdrawalSpeeds.standard,
                    status: WithdrawalStatus.requested
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.withdrawals.list(
            first: 42,
            last: 42,
            companyId: "biz_xxxxxxxxxxxxxx",
            createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "amount": 6.9,
                  "created_at": "2023-12-01T05:00:00Z",
                  "currency": "usd",
                  "error_code": "account_closed",
                  "error_message": "Destination bank account is invalid.",
                  "estimated_availability": "2023-12-01T05:00:00Z",
                  "fee_amount": 6.9,
                  "fee_type": "exclusive",
                  "id": "wdrl_xxxxxxxxxxxxx",
                  "ledger_account": {
                    "company_id": "company_id",
                    "id": "ldgr_xxxxxxxxxxxxx"
                  },
                  "markup_fee": 6.9,
                  "payout_request_id": "cofr_xxxxxxxxxxxxxx",
                  "payout_token": {
                    "created_at": "2023-12-01T05:00:00Z",
                    "destination_currency_code": "USD",
                    "id": "potk_xxxxxxxxxxxxx",
                    "nickname": "Ops checking",
                    "payer_name": "Shine Time Auto Detailing, LLC"
                  },
                  "speed": "standard",
                  "status": "requested",
                  "trace_code": "021000021234567"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Withdrawal(
            amount: 6.9,
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            currency: Currencies.usd,
            errorCode: Nullable<PayoutErrorCodes>.value(PayoutErrorCodes.accountClosed),
            errorMessage: Nullable<String>.value("Destination bank account is invalid."),
            estimatedAvailability: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            feeAmount: 6.9,
            feeType: Nullable<WithdrawalFeeTypes>.value(WithdrawalFeeTypes.exclusive),
            id: "wdrl_xxxxxxxxxxxxx",
            ledgerAccount: WithdrawalLedgerAccount(
                companyId: Nullable<String>.value("company_id"),
                id: "ldgr_xxxxxxxxxxxxx"
            ),
            markupFee: 6.9,
            payoutRequestId: Nullable<String>.value("cofr_xxxxxxxxxxxxxx"),
            payoutToken: Nullable<WithdrawalPayoutToken>.value(WithdrawalPayoutToken(
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                destinationCurrencyCode: "USD",
                id: "potk_xxxxxxxxxxxxx",
                nickname: Nullable<String>.value("Ops checking"),
                payerName: Nullable<String>.value("Shine Time Auto Detailing, LLC")
            )),
            speed: WithdrawalSpeeds.standard,
            status: WithdrawalStatus.requested,
            traceCode: Nullable<String>.value("021000021234567")
        )
        let response = try await client.withdrawals.create(
            request: .init(
                amount: 6.9,
                companyId: "biz_xxxxxxxxxxxxxx",
                currency: .usd
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "amount": 6.9,
                  "created_at": "2023-12-01T05:00:00Z",
                  "currency": "usd",
                  "error_code": "account_closed",
                  "error_message": "Destination bank account is invalid.",
                  "estimated_availability": "2023-12-01T05:00:00Z",
                  "fee_amount": 6.9,
                  "fee_type": "exclusive",
                  "id": "wdrl_xxxxxxxxxxxxx",
                  "ledger_account": {
                    "company_id": "company_id",
                    "id": "ldgr_xxxxxxxxxxxxx"
                  },
                  "markup_fee": 6.9,
                  "payout_request_id": "cofr_xxxxxxxxxxxxxx",
                  "payout_token": {
                    "created_at": "2023-12-01T05:00:00Z",
                    "destination_currency_code": "USD",
                    "id": "potk_xxxxxxxxxxxxx",
                    "nickname": "Ops checking",
                    "payer_name": "Shine Time Auto Detailing, LLC"
                  },
                  "speed": "standard",
                  "status": "requested",
                  "trace_code": "021000021234567"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Withdrawal(
            amount: 6.9,
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            currency: Currencies.usd,
            errorCode: Nullable<PayoutErrorCodes>.value(PayoutErrorCodes.accountClosed),
            errorMessage: Nullable<String>.value("Destination bank account is invalid."),
            estimatedAvailability: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            feeAmount: 6.9,
            feeType: Nullable<WithdrawalFeeTypes>.value(WithdrawalFeeTypes.exclusive),
            id: "wdrl_xxxxxxxxxxxxx",
            ledgerAccount: WithdrawalLedgerAccount(
                companyId: Nullable<String>.value("company_id"),
                id: "ldgr_xxxxxxxxxxxxx"
            ),
            markupFee: 6.9,
            payoutRequestId: Nullable<String>.value("cofr_xxxxxxxxxxxxxx"),
            payoutToken: Nullable<WithdrawalPayoutToken>.value(WithdrawalPayoutToken(
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                destinationCurrencyCode: "USD",
                id: "potk_xxxxxxxxxxxxx",
                nickname: Nullable<String>.value("Ops checking"),
                payerName: Nullable<String>.value("Shine Time Auto Detailing, LLC")
            )),
            speed: WithdrawalSpeeds.standard,
            status: WithdrawalStatus.requested,
            traceCode: Nullable<String>.value("021000021234567")
        )
        let response = try await client.withdrawals.retrieve(
            id: "wdrl_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func generatePdf1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "expires_at": "2023-12-01T05:00:00Z",
                  "url": "https://example.com/withdrawal_invoice.pdf"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = GeneratePdfWithdrawalsResponse(
            expiresAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            url: "https://example.com/withdrawal_invoice.pdf"
        )
        let response = try await client.withdrawals.generatePdf(
            id: "wdrl_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}