import Foundation
import Testing
import WhopSDK

@Suite("MethodsClient Wire Tests") struct MethodsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_reference": "••••6789",
                      "bank_verification_state": "checking",
                      "created_at": "2026-06-15T09:00:00Z",
                      "destination_currency": "usd",
                      "estimated_arrival": {
                        "instant": "2026-07-30T12:30:00Z",
                        "standard": "2026-08-03T00:00:00Z"
                      },
                      "fee_structure": {
                        "currency": "usd",
                        "fixed_amount": 0.25,
                        "percentage": 0
                      },
                      "id": "pyot_xxxxxxxxxxxxx",
                      "institution_name": "Frost Bank",
                      "is_clone": false,
                      "is_default": true,
                      "last_paid_out_at": "2026-08-02T15:30:00Z",
                      "linked_via_plaid": false,
                      "needs_plaid_reconnect": false,
                      "nickname": "Business checking",
                      "object": "payout_method",
                      "payer_name": "ACH Bank Deposit",
                      "quote": {
                        "amount": 500,
                        "currency": "usd",
                        "exchange_rate": 1,
                        "instant": {
                          "fee": 5.25,
                          "total_received": 494.75
                        },
                        "max_limit": 25000,
                        "min_limit": 1,
                        "standard": {
                          "fee": 0.25,
                          "total_received": 499.75
                        }
                      },
                      "status": "created",
                      "status_reason": "status_reason",
                      "supported_payout_method": {
                        "country_code": "USA",
                        "delivery_type": "cash_pickup",
                        "icon_url": "https://cdn.whop.com/payouts/ach.png",
                        "name": "ACH Bank Deposit",
                        "supports_instant_delivery": false,
                        "supports_plaid": true,
                        "supports_standard_delivery": true
                      },
                      "unavailable_reason": "destination_retired"
                    }
                  ],
                  "limits": {
                    "currency": "usd",
                    "instant": {
                      "daily_amount_remaining": 9999,
                      "error_code": "amount_too_high",
                      "error_message": "Instant payouts are not available for your account at this time.",
                      "max_amount": 0,
                      "resets_at": "2026-01-01T12:00:00Z"
                    },
                    "object": "payout_limit",
                    "standard": {
                      "max_amount": 500
                    }
                  },
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
        let expectedResponse = ListMethodsResponse(
            data: [
                ListMethodsResponseDataItem(
                    accountReference: Nullable<String>.value("••••6789"),
                    bankVerificationState: Nullable<ListMethodsResponseDataItemBankVerificationState>.value(ListMethodsResponseDataItemBankVerificationState.checking),
                    createdAt: try! Date("2026-06-15T09:00:00Z", strategy: .iso8601),
                    destinationCurrency: "usd",
                    estimatedArrival: Nullable<ListMethodsResponseDataItemEstimatedArrival>.value(ListMethodsResponseDataItemEstimatedArrival(
                        instant: Nullable<Date>.value(try! Date("2026-07-30T12:30:00Z", strategy: .iso8601)),
                        standard: Nullable<Date>.value(try! Date("2026-08-03T00:00:00Z", strategy: .iso8601))
                    )),
                    feeStructure: Nullable<ListMethodsResponseDataItemFeeStructure>.value(ListMethodsResponseDataItemFeeStructure(
                        currency: "usd",
                        fixedAmount: 0.25,
                        percentage: 0
                    )),
                    id: "pyot_xxxxxxxxxxxxx",
                    institutionName: Nullable<String>.value("Frost Bank"),
                    isClone: false,
                    isDefault: true,
                    lastPaidOutAt: Nullable<Date>.value(try! Date("2026-08-02T15:30:00Z", strategy: .iso8601)),
                    linkedViaPlaid: false,
                    needsPlaidReconnect: false,
                    nickname: Nullable<String>.value("Business checking"),
                    object: ListMethodsResponseDataItemObject.payoutMethod,
                    payerName: Nullable<String>.value("ACH Bank Deposit"),
                    quote: Nullable<ListMethodsResponseDataItemQuote>.value(ListMethodsResponseDataItemQuote(
                        amount: 500,
                        currency: "usd",
                        exchangeRate: 1,
                        instant: Nullable<ListMethodsResponseDataItemQuoteInstant>.value(ListMethodsResponseDataItemQuoteInstant(
                            fee: 5.25,
                            totalReceived: 494.75
                        )),
                        maxLimit: Nullable<Float>.value(25000),
                        minLimit: 1,
                        standard: Nullable<ListMethodsResponseDataItemQuoteStandard>.value(ListMethodsResponseDataItemQuoteStandard(
                            fee: 0.25,
                            totalReceived: 499.75
                        ))
                    )),
                    status: ListMethodsResponseDataItemStatus.created,
                    statusReason: Nullable<String>.value("status_reason"),
                    supportedPayoutMethod: Nullable<ListMethodsResponseDataItemSupportedPayoutMethod>.value(ListMethodsResponseDataItemSupportedPayoutMethod(
                        countryCode: Nullable<String>.value("USA"),
                        deliveryType: ListMethodsResponseDataItemSupportedPayoutMethodDeliveryType.cashPickup,
                        iconUrl: Nullable<String>.value("https://cdn.whop.com/payouts/ach.png"),
                        name: Nullable<String>.value("ACH Bank Deposit"),
                        supportsInstantDelivery: false,
                        supportsPlaid: true,
                        supportsStandardDelivery: true
                    )),
                    unavailableReason: Nullable<ListMethodsResponseDataItemUnavailableReason>.value(ListMethodsResponseDataItemUnavailableReason.destinationRetired)
                )
            ],
            limits: Optional(ListMethodsResponseLimits(
                currency: "usd",
                instant: ListMethodsResponseLimitsInstant(
                    dailyAmountRemaining: Nullable<Float>.value(9999),
                    errorCode: Nullable<ListMethodsResponseLimitsInstantErrorCode>.value(ListMethodsResponseLimitsInstantErrorCode.amountTooHigh),
                    errorMessage: Nullable<String>.value("Instant payouts are not available for your account at this time."),
                    maxAmount: 0,
                    resetsAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601))
                ),
                object: ListMethodsResponseLimitsObject.payoutLimit,
                standard: ListMethodsResponseLimitsStandard(
                    maxAmount: 500
                )
            )),
            pageInfo: ListMethodsResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.payouts.methods.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_reference": "••••0472",
                  "bank_verification_state": "checking",
                  "created_at": "2026-01-01T12:00:00Z",
                  "destination_currency": "usd",
                  "estimated_arrival": {
                    "key": "value"
                  },
                  "fee_structure": {
                    "key": "value"
                  },
                  "id": "potk_xxxxxxxxxxxxxx",
                  "institution_name": "Frost Bank",
                  "is_clone": false,
                  "is_default": false,
                  "last_paid_out_at": "2024-01-15T09:30:00Z",
                  "linked_via_plaid": false,
                  "needs_plaid_reconnect": false,
                  "nickname": "Ops checking",
                  "object": "payout_method",
                  "payer_name": "ACH Bank Deposit",
                  "quote": {
                    "key": "value"
                  },
                  "status": "created",
                  "status_reason": "status_reason",
                  "supported_payout_method": {
                    "country_code": "USA",
                    "delivery_type": "cash_pickup",
                    "icon_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/ach-bank-deposit-icon",
                    "name": "ACH Bank Deposit",
                    "supports_instant_delivery": false,
                    "supports_plaid": true,
                    "supports_standard_delivery": true
                  },
                  "unavailable_reason": "destination_retired"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateMethodsResponse(
            accountReference: Nullable<String>.value("••••0472"),
            bankVerificationState: Optional(Nullable<CreateMethodsResponseBankVerificationState>.value(CreateMethodsResponseBankVerificationState.checking)),
            createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
            destinationCurrency: "usd",
            estimatedArrival: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            feeStructure: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            id: "potk_xxxxxxxxxxxxxx",
            institutionName: Nullable<String>.value("Frost Bank"),
            isClone: Optional(false),
            isDefault: false,
            lastPaidOutAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            linkedViaPlaid: Optional(false),
            needsPlaidReconnect: Optional(false),
            nickname: Nullable<String>.value("Ops checking"),
            object: CreateMethodsResponseObject.payoutMethod,
            payerName: Nullable<String>.value("ACH Bank Deposit"),
            quote: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            status: CreateMethodsResponseStatus.created,
            statusReason: Nullable<String>.value("status_reason"),
            supportedPayoutMethod: Nullable<CreateMethodsResponseSupportedPayoutMethod>.value(CreateMethodsResponseSupportedPayoutMethod(
                countryCode: Optional(Nullable<String>.value("USA")),
                deliveryType: CreateMethodsResponseSupportedPayoutMethodDeliveryType.cashPickup,
                iconUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/ach-bank-deposit-icon"),
                name: Nullable<String>.value("ACH Bank Deposit"),
                supportsInstantDelivery: false,
                supportsPlaid: Optional(true),
                supportsStandardDelivery: true
            )),
            unavailableReason: Nullable<CreateMethodsResponseUnavailableReason>.value(CreateMethodsResponseUnavailableReason.destinationRetired)
        )
        let response = try await client.payouts.methods.create(
            request: .init(supportedPayoutMethodId: "podst_xxxxxxxxxxxxxx"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "deleted": true,
                  "id": "potk_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteMethodsResponse(
            deleted: true,
            id: "potk_xxxxxxxxxxxxxx"
        )
        let response = try await client.payouts.methods.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_reference": "••••0472",
                  "bank_verification_state": "checking",
                  "created_at": "2026-01-01T12:00:00Z",
                  "destination_currency": "usd",
                  "estimated_arrival": {
                    "key": "value"
                  },
                  "fee_structure": {
                    "key": "value"
                  },
                  "id": "potk_xxxxxxxxxxxxxx",
                  "institution_name": "Frost Bank",
                  "is_clone": false,
                  "is_default": false,
                  "last_paid_out_at": "2024-01-15T09:30:00Z",
                  "linked_via_plaid": false,
                  "needs_plaid_reconnect": false,
                  "nickname": "Primary checking",
                  "object": "payout_method",
                  "payer_name": "ACH Bank Deposit",
                  "quote": {
                    "key": "value"
                  },
                  "status": "created",
                  "status_reason": "status_reason",
                  "supported_payout_method": {
                    "country_code": "USA",
                    "delivery_type": "cash_pickup",
                    "icon_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/ach-bank-deposit-icon",
                    "name": "ACH Bank Deposit",
                    "supports_instant_delivery": false,
                    "supports_plaid": true,
                    "supports_standard_delivery": true
                  },
                  "unavailable_reason": "destination_retired"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = UpdateMethodsResponse(
            accountReference: Nullable<String>.value("••••0472"),
            bankVerificationState: Nullable<UpdateMethodsResponseBankVerificationState>.value(UpdateMethodsResponseBankVerificationState.checking),
            createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
            destinationCurrency: "usd",
            estimatedArrival: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            feeStructure: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            id: "potk_xxxxxxxxxxxxxx",
            institutionName: Nullable<String>.value("Frost Bank"),
            isClone: false,
            isDefault: false,
            lastPaidOutAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            linkedViaPlaid: false,
            needsPlaidReconnect: false,
            nickname: Nullable<String>.value("Primary checking"),
            object: UpdateMethodsResponseObject.payoutMethod,
            payerName: Nullable<String>.value("ACH Bank Deposit"),
            quote: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            status: UpdateMethodsResponseStatus.created,
            statusReason: Nullable<String>.value("status_reason"),
            supportedPayoutMethod: Nullable<UpdateMethodsResponseSupportedPayoutMethod>.value(UpdateMethodsResponseSupportedPayoutMethod(
                countryCode: Nullable<String>.value("USA"),
                deliveryType: UpdateMethodsResponseSupportedPayoutMethodDeliveryType.cashPickup,
                iconUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/ach-bank-deposit-icon"),
                name: Nullable<String>.value("ACH Bank Deposit"),
                supportsInstantDelivery: false,
                supportsPlaid: true,
                supportsStandardDelivery: true
            )),
            unavailableReason: Nullable<UpdateMethodsResponseUnavailableReason>.value(UpdateMethodsResponseUnavailableReason.destinationRetired)
        )
        let response = try await client.payouts.methods.update(
            id: "id",
            request: .init(nickname: "Primary checking"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}