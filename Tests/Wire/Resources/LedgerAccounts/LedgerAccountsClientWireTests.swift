import Foundation
import Testing
import WhopSDK

@Suite("LedgerAccountsClient Wire Tests") struct LedgerAccountsClientWireTests {
    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "balances": [
                    {
                      "balance": 6.9,
                      "currency": "usd",
                      "pending_balance": 6.9,
                      "reserve_balance": 6.9
                    }
                  ],
                  "id": "ldgr_xxxxxxxxxxxxx",
                  "ledger_type": "primary",
                  "owner": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42",
                    "typename": "User"
                  },
                  "payments_approval_status": "pending",
                  "payout_account_details": {
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
                  },
                  "payout_quote_required": true,
                  "settlement_time_at": "2023-12-01T05:00:00Z",
                  "transfer_fee": 6.9,
                  "treasury_balance": {
                    "balance": 6.9,
                    "balance_usd": 6.9,
                    "currency": "usd",
                    "pending_balance": 6.9,
                    "reserve_balance": 6.9,
                    "total_withdrawable_balance": 6.9
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
        let expectedResponse = LedgerAccount(
            balances: [
                LedgerAccountBalancesItem(
                    balance: 6.9,
                    currency: Currencies.usd,
                    pendingBalance: 6.9,
                    reserveBalance: 6.9
                )
            ],
            id: "ldgr_xxxxxxxxxxxxx",
            ledgerType: LedgerTypes.primary,
            owner: LedgerAccountOwner.user(
                .init(
                    id: "user_xxxxxxxxxxxxx",
                    name: Nullable<String>.value("John Doe"),
                    username: "johndoe42",
                    additionalProperties: [
                        "typename": JSONValue.string("User")
                    ]
                )
            ),
            paymentsApprovalStatus: Nullable<PaymentsApprovalStatuses>.value(PaymentsApprovalStatuses.pending),
            payoutAccountDetails: Nullable<LedgerAccountPayoutAccountDetails>.value(LedgerAccountPayoutAccountDetails(
                address: Nullable<LedgerAccountPayoutAccountDetailsAddress>.value(LedgerAccountPayoutAccountDetailsAddress(
                    city: Nullable<String>.value("city"),
                    country: Nullable<String>.value("country"),
                    line1: Nullable<String>.value("line1"),
                    line2: Nullable<String>.value("line2"),
                    postalCode: Nullable<String>.value("postal_code"),
                    state: Nullable<String>.value("state")
                )),
                businessName: Nullable<String>.value("business_name"),
                businessRepresentative: Nullable<LedgerAccountPayoutAccountDetailsBusinessRepresentative>.value(LedgerAccountPayoutAccountDetailsBusinessRepresentative(
                    dateOfBirth: Nullable<String>.value("date_of_birth"),
                    firstName: Nullable<String>.value("first_name"),
                    lastName: Nullable<String>.value("last_name"),
                    middleName: Nullable<String>.value("middle_name")
                )),
                email: Nullable<String>.value("email"),
                id: "poact_xxxxxxxxxxxx",
                latestVerification: Nullable<LedgerAccountPayoutAccountDetailsLatestVerification>.value(LedgerAccountPayoutAccountDetailsLatestVerification(
                    id: "verf_xxxxxxxxxxxxx",
                    lastErrorCode: Nullable<VerificationErrorCodes>.value(VerificationErrorCodes.abandoned),
                    lastErrorReason: Nullable<String>.value("Document image was too blurry to read."),
                    status: VerificationStatuses.requiresInput
                )),
                phone: Nullable<String>.value("phone"),
                status: Nullable<PayoutAccountCalculatedStatuses>.value(PayoutAccountCalculatedStatuses.connected)
            )),
            payoutQuoteRequired: true,
            settlementTimeAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            transferFee: Nullable<Double>.value(6.9),
            treasuryBalance: Nullable<LedgerAccountTreasuryBalance>.value(LedgerAccountTreasuryBalance(
                balance: 6.9,
                balanceUsd: 6.9,
                currency: Currencies.usd,
                pendingBalance: 6.9,
                reserveBalance: 6.9,
                totalWithdrawableBalance: 6.9
            ))
        )
        let response = try await client.ledgerAccounts.retrieve(
            id: "ldgr_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}