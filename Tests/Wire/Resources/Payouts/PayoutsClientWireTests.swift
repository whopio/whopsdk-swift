import Foundation
import Testing
import WhopSDK

@Suite("PayoutsClient Wire Tests") struct PayoutsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "amount": "500.0",
                      "cancelable": true,
                      "created_at": "2026-07-29T18:22:00Z",
                      "currency": "usd",
                      "destination_amount": "461.7",
                      "destination_currency": "eur",
                      "estimated_arrival": "2026-08-03T00:00:00Z",
                      "exchange_rate": 0.9234,
                      "failure": {
                        "code": "beneficiary_name_mismatch",
                        "funds_returned_at": null,
                        "message": null
                      },
                      "fee_amount": "0.25",
                      "fee_paid_by": "self",
                      "id": "wdrl_xxxxxxxxxxxxx",
                      "markup_fee": "0.0",
                      "metadata": {
                        "batch_id": "2026-08-18"
                      },
                      "net_amount": "49.75",
                      "notes": "Detailing supplies restock",
                      "object": "payout",
                      "payer_name": "ACH Bank Deposit",
                      "payout_method": {
                        "nickname": "Business checking",
                        "supported_payout_method": {
                          "delivery_type": "cash_pickup",
                          "icon_url": "https://cdn.whop.com/payouts/ach.png",
                          "payer_name": "ACH Bank Deposit"
                        },
                        "type": "external"
                      },
                      "payout_request_id": "cofr_xxxxxxxxxxxxx",
                      "source": "api",
                      "speed": "standard",
                      "statement_descriptor": "MYCOMPANY",
                      "status": "requested",
                      "status_detail": "awaiting_provider_acceptance",
                      "trace_code": "021000021234567"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "WyJjdXJzb3IiLDFd",
                    "has_next_page": true,
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
        let expectedResponse = ListPayoutsResponse(
            data: [
                ListPayoutsResponseDataItem(
                    amount: "500.0",
                    cancelable: true,
                    createdAt: try! Date("2026-07-29T18:22:00Z", strategy: .iso8601),
                    currency: "usd",
                    destinationAmount: Nullable<String>.value("461.7"),
                    destinationCurrency: Nullable<String>.value("eur"),
                    estimatedArrival: Nullable<Date>.value(try! Date("2026-08-03T00:00:00Z", strategy: .iso8601)),
                    exchangeRate: Nullable<Float>.value(0.9234),
                    failure: Nullable<ListPayoutsResponseDataItemFailure>.value(ListPayoutsResponseDataItemFailure(
                        code: Nullable<String>.value("beneficiary_name_mismatch"),
                        fundsReturnedAt: .null,
                        message: .null
                    )),
                    feeAmount: "0.25",
                    feePaidBy: ListPayoutsResponseDataItemFeePaidBy.self,
                    id: "wdrl_xxxxxxxxxxxxx",
                    markupFee: "0.0",
                    metadata: [
                        "batch_id": "2026-08-18"
                    ],
                    netAmount: "49.75",
                    notes: Nullable<String>.value("Detailing supplies restock"),
                    object: ListPayoutsResponseDataItemObject.payout,
                    payerName: Nullable<String>.value("ACH Bank Deposit"),
                    payoutMethod: Nullable<ListPayoutsResponseDataItemPayoutMethod>.value(ListPayoutsResponseDataItemPayoutMethod(
                        nickname: Nullable<String>.value("Business checking"),
                        supportedPayoutMethod: Nullable<ListPayoutsResponseDataItemPayoutMethodSupportedPayoutMethod>.value(ListPayoutsResponseDataItemPayoutMethodSupportedPayoutMethod(
                            deliveryType: ListPayoutsResponseDataItemPayoutMethodSupportedPayoutMethodDeliveryType.cashPickup,
                            iconUrl: Nullable<String>.value("https://cdn.whop.com/payouts/ach.png"),
                            payerName: Nullable<String>.value("ACH Bank Deposit")
                        )),
                        type: ListPayoutsResponseDataItemPayoutMethodType.external
                    )),
                    payoutRequestId: Nullable<String>.value("cofr_xxxxxxxxxxxxx"),
                    source: Nullable<ListPayoutsResponseDataItemSource>.value(ListPayoutsResponseDataItemSource.api),
                    speed: ListPayoutsResponseDataItemSpeed.standard,
                    statementDescriptor: Nullable<String>.value("MYCOMPANY"),
                    status: ListPayoutsResponseDataItemStatus.requested,
                    statusDetail: "awaiting_provider_acceptance",
                    traceCode: Nullable<String>.value("021000021234567")
                )
            ],
            pageInfo: ListPayoutsResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: true,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.payouts.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "amount": "50.0",
                  "cancelable": true,
                  "created_at": "2026-01-01T12:00:00Z",
                  "currency": "usd",
                  "destination_amount": "destination_amount",
                  "destination_currency": "destination_currency",
                  "estimated_arrival": "2026-01-01T12:00:00Z",
                  "exchange_rate": 1.1,
                  "failure": {
                    "code": "beneficiary_name_mismatch",
                    "funds_returned_at": "2024-01-15T09:30:00Z",
                    "message": "message"
                  },
                  "fee_amount": "2.5",
                  "fee_paid_by": "self",
                  "id": "wdrl_xxxxxxxxxxxxx",
                  "markup_fee": "0.0",
                  "metadata": {
                    "batch_id": "2026-08-18"
                  },
                  "net_amount": "49.75",
                  "notes": "Detailing supplies restock",
                  "object": "payout",
                  "payer_name": "MassPay",
                  "payout_method": {
                    "nickname": "Ops checking",
                    "supported_payout_method": {
                      "delivery_type": "cash_pickup",
                      "icon_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/ach-payout-icon",
                      "payer_name": "ACH Bank Deposit"
                    },
                    "type": "external"
                  },
                  "payout_request_id": "cofr_xxxxxxxxxxxxx",
                  "source": "api",
                  "speed": "standard",
                  "statement_descriptor": "MYCOMPANY",
                  "status": "requested",
                  "status_detail": "pending_debit",
                  "trace_code": "trace_code"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreatePayoutsResponse(
            amount: "50.0",
            cancelable: true,
            createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
            currency: "usd",
            destinationAmount: Nullable<String>.value("destination_amount"),
            destinationCurrency: Nullable<String>.value("destination_currency"),
            estimatedArrival: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
            exchangeRate: Nullable<Float>.value(1.1),
            failure: Nullable<CreatePayoutsResponseFailure>.value(CreatePayoutsResponseFailure(
                code: Nullable<String>.value("beneficiary_name_mismatch"),
                fundsReturnedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                message: Nullable<String>.value("message")
            )),
            feeAmount: "2.5",
            feePaidBy: CreatePayoutsResponseFeePaidBy.self,
            id: "wdrl_xxxxxxxxxxxxx",
            markupFee: "0.0",
            metadata: [
                "batch_id": "2026-08-18"
            ],
            netAmount: "49.75",
            notes: Nullable<String>.value("Detailing supplies restock"),
            object: CreatePayoutsResponseObject.payout,
            payerName: Nullable<String>.value("MassPay"),
            payoutMethod: Nullable<CreatePayoutsResponsePayoutMethod>.value(CreatePayoutsResponsePayoutMethod(
                nickname: Nullable<String>.value("Ops checking"),
                supportedPayoutMethod: Nullable<CreatePayoutsResponsePayoutMethodSupportedPayoutMethod>.value(CreatePayoutsResponsePayoutMethodSupportedPayoutMethod(
                    deliveryType: CreatePayoutsResponsePayoutMethodSupportedPayoutMethodDeliveryType.cashPickup,
                    iconUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/ach-payout-icon"),
                    payerName: Nullable<String>.value("ACH Bank Deposit")
                )),
                type: CreatePayoutsResponsePayoutMethodType.external
            )),
            payoutRequestId: Nullable<String>.value("cofr_xxxxxxxxxxxxx"),
            source: Nullable<CreatePayoutsResponseSource>.value(CreatePayoutsResponseSource.api),
            speed: CreatePayoutsResponseSpeed.standard,
            statementDescriptor: Nullable<String>.value("MYCOMPANY"),
            status: CreatePayoutsResponseStatus.requested,
            statusDetail: "pending_debit",
            traceCode: Nullable<String>.value("trace_code")
        )
        let response = try await client.payouts.create(
            request: .init(
                amount: 50,
                payoutMethodId: "potk_xxxxxxxxxxxxxx",
                quoteToken: "signed-payout-quote"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func createQuote1() async throws -> Void {
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
                  "conversion": {
                    "converted_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "estimated_savings": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "payout_fee": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    }
                  },
                  "destination_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "exchange_rate": 4.13978443,
                  "expires_at": "2026-01-01T12:00:00Z",
                  "fee": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "id": "pout_aed_quote",
                  "market_exchange_rate": 4.14226979,
                  "market_exchange_rate_at": "2026-01-01T12:00:00Z",
                  "net_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "object": "payout_quote",
                  "quote_token": "signed-payout-quote",
                  "recommended_method": {
                    "country": "AE",
                    "destination_currency": "eur",
                    "estimated_arrival": "2026-01-01T12:00:00Z",
                    "estimated_fee": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "estimated_savings": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "name": "Bank Wire",
                    "supported_payout_method_id": "podst_xxxxxxxxxxxxxx"
                  },
                  "server_time": "2026-01-01T12:00:00Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateQuotePayoutsResponse(
            amount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            conversion: Nullable<CreateQuotePayoutsResponseConversion>.value(CreateQuotePayoutsResponseConversion(
                convertedAmount: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                estimatedSavings: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                payoutFee: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )
            )),
            destinationAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            exchangeRate: 4.13978443,
            expiresAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
            fee: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            id: "pout_aed_quote",
            marketExchangeRate: Nullable<Double>.value(4.14226979),
            marketExchangeRateAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
            netAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            object: CreateQuotePayoutsResponseObject.payoutQuote,
            quoteToken: "signed-payout-quote",
            recommendedMethod: Nullable<CreateQuotePayoutsResponseRecommendedMethod>.value(CreateQuotePayoutsResponseRecommendedMethod(
                country: "AE",
                destinationCurrency: "eur",
                estimatedArrival: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
                estimatedFee: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                estimatedSavings: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                name: "Bank Wire",
                supportedPayoutMethodId: "podst_xxxxxxxxxxxxxx"
            )),
            serverTime: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)
        )
        let response = try await client.payouts.createQuote(
            request: .init(payoutMethodId: "potk_xxxxxxxxxxxxxx"),
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
                  "amount": "500.0",
                  "cancelable": true,
                  "created_at": "2026-07-29T18:22:00Z",
                  "currency": "usd",
                  "delayed": false,
                  "destination_amount": "461.7",
                  "destination_currency": "eur",
                  "estimated_arrival": "2026-08-03T00:00:00Z",
                  "estimated_arrival_end": "2024-01-15T09:30:00Z",
                  "exchange_rate": 0.9234,
                  "failure": {
                    "code": "beneficiary_name_mismatch",
                    "funds_returned_at": "2024-01-15T09:30:00Z",
                    "message": "message"
                  },
                  "fee_amount": "0.25",
                  "fee_paid_by": "self",
                  "id": "wdrl_xxxxxxxxxxxxx",
                  "markup_fee": "0.0",
                  "metadata": {
                    "batch_id": "2026-08-18"
                  },
                  "net_amount": "49.75",
                  "notes": "Detailing supplies restock",
                  "object": "payout",
                  "payer_name": "ACH Bank Deposit",
                  "payout_method": {
                    "nickname": "Business checking",
                    "supported_payout_method": {
                      "delivery_type": "cash_pickup",
                      "icon_url": "https://cdn.whop.com/payouts/ach.png",
                      "payer_name": "ACH Bank Deposit"
                    },
                    "type": "external"
                  },
                  "payout_request_id": "cofr_xxxxxxxxxxxxx",
                  "recipient_name": "Rishabh J.",
                  "sender_name": "Whop Blueprints",
                  "source": "api",
                  "speed": "standard",
                  "statement_descriptor": "MYCOMPANY",
                  "status": "requested",
                  "status_detail": "awaiting_provider_acceptance",
                  "timeline": [
                    {
                      "error_message": "error_message",
                      "estimated_arrival": "2024-01-15T09:30:00Z",
                      "status": "requested",
                      "status_detail": "security_review",
                      "timestamp": "2026-01-01T12:00:00Z"
                    }
                  ],
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
        let expectedResponse = RetrievePayoutsResponse(
            amount: Optional("500.0"),
            cancelable: Optional(true),
            createdAt: try! Date("2026-07-29T18:22:00Z", strategy: .iso8601),
            currency: "usd",
            delayed: Optional(false),
            destinationAmount: Nullable<String>.value("461.7"),
            destinationCurrency: Nullable<String>.value("eur"),
            estimatedArrival: Nullable<Date>.value(try! Date("2026-08-03T00:00:00Z", strategy: .iso8601)),
            estimatedArrivalEnd: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
            exchangeRate: Nullable<Float>.value(0.9234),
            failure: Nullable<RetrievePayoutsResponseFailure>.value(RetrievePayoutsResponseFailure(
                code: Nullable<String>.value("beneficiary_name_mismatch"),
                fundsReturnedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                message: Nullable<String>.value("message")
            )),
            feeAmount: Optional("0.25"),
            feePaidBy: Optional(RetrievePayoutsResponseFeePaidBy.self),
            id: "wdrl_xxxxxxxxxxxxx",
            markupFee: Optional("0.0"),
            metadata: Optional([
                "batch_id": "2026-08-18"
            ]),
            netAmount: "49.75",
            notes: Nullable<String>.value("Detailing supplies restock"),
            object: RetrievePayoutsResponseObject.payout,
            payerName: Nullable<String>.value("ACH Bank Deposit"),
            payoutMethod: Nullable<RetrievePayoutsResponsePayoutMethod>.value(RetrievePayoutsResponsePayoutMethod(
                nickname: Nullable<String>.value("Business checking"),
                supportedPayoutMethod: Nullable<RetrievePayoutsResponsePayoutMethodSupportedPayoutMethod>.value(RetrievePayoutsResponsePayoutMethodSupportedPayoutMethod(
                    deliveryType: RetrievePayoutsResponsePayoutMethodSupportedPayoutMethodDeliveryType.cashPickup,
                    iconUrl: Nullable<String>.value("https://cdn.whop.com/payouts/ach.png"),
                    payerName: Nullable<String>.value("ACH Bank Deposit")
                )),
                type: RetrievePayoutsResponsePayoutMethodType.external
            )),
            payoutRequestId: Nullable<String>.value("cofr_xxxxxxxxxxxxx"),
            recipientName: Optional(Nullable<String>.value("Rishabh J.")),
            senderName: Optional(Nullable<String>.value("Whop Blueprints")),
            source: Optional(Nullable<RetrievePayoutsResponseSource>.value(RetrievePayoutsResponseSource.api)),
            speed: RetrievePayoutsResponseSpeed.standard,
            statementDescriptor: Optional(Nullable<String>.value("MYCOMPANY")),
            status: RetrievePayoutsResponseStatus.requested,
            statusDetail: "awaiting_provider_acceptance",
            timeline: Optional([
                RetrievePayoutsResponseTimelineItem(
                    errorMessage: Nullable<String>.value("error_message"),
                    estimatedArrival: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    status: RetrievePayoutsResponseTimelineItemStatus.requested,
                    statusDetail: Nullable<String>.value("security_review"),
                    timestamp: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601))
                )
            ]),
            traceCode: Nullable<String>.value("021000021234567")
        )
        let response = try await client.payouts.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func cancel1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "amount": "500.0",
                  "cancelable": false,
                  "created_at": "2026-07-29T18:22:00Z",
                  "currency": "usd",
                  "destination_amount": "461.7",
                  "destination_currency": "eur",
                  "estimated_arrival": "2026-08-03T00:00:00Z",
                  "exchange_rate": 0.9234,
                  "failure": {
                    "code": "beneficiary_name_mismatch",
                    "funds_returned_at": "2024-01-15T09:30:00Z",
                    "message": "Canceled by the account owner"
                  },
                  "fee_amount": "0.25",
                  "fee_paid_by": "self",
                  "id": "wdrl_xxxxxxxxxxxxx",
                  "markup_fee": "0.0",
                  "metadata": {
                    "batch_id": "2026-08-18"
                  },
                  "net_amount": "49.75",
                  "notes": "Detailing supplies restock",
                  "object": "payout",
                  "payer_name": "ACH Bank Deposit",
                  "payout_method": {
                    "nickname": "Business checking",
                    "supported_payout_method": {
                      "delivery_type": "cash_pickup",
                      "icon_url": "https://cdn.whop.com/payouts/ach.png",
                      "payer_name": "ACH Bank Deposit"
                    },
                    "type": "external"
                  },
                  "payout_request_id": "cofr_xxxxxxxxxxxxx",
                  "source": "api",
                  "speed": "standard",
                  "statement_descriptor": "MYCOMPANY",
                  "status": "requested",
                  "status_detail": "awaiting_provider_acceptance",
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
        let expectedResponse = CancelPayoutsResponse(
            amount: "500.0",
            cancelable: false,
            createdAt: try! Date("2026-07-29T18:22:00Z", strategy: .iso8601),
            currency: "usd",
            destinationAmount: Nullable<String>.value("461.7"),
            destinationCurrency: Nullable<String>.value("eur"),
            estimatedArrival: Nullable<Date>.value(try! Date("2026-08-03T00:00:00Z", strategy: .iso8601)),
            exchangeRate: Nullable<Float>.value(0.9234),
            failure: Nullable<CancelPayoutsResponseFailure>.value(CancelPayoutsResponseFailure(
                code: Nullable<String>.value("beneficiary_name_mismatch"),
                fundsReturnedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                message: Nullable<String>.value("Canceled by the account owner")
            )),
            feeAmount: "0.25",
            feePaidBy: CancelPayoutsResponseFeePaidBy.self,
            id: "wdrl_xxxxxxxxxxxxx",
            markupFee: "0.0",
            metadata: [
                "batch_id": "2026-08-18"
            ],
            netAmount: "49.75",
            notes: Nullable<String>.value("Detailing supplies restock"),
            object: CancelPayoutsResponseObject.payout,
            payerName: Nullable<String>.value("ACH Bank Deposit"),
            payoutMethod: Nullable<CancelPayoutsResponsePayoutMethod>.value(CancelPayoutsResponsePayoutMethod(
                nickname: Nullable<String>.value("Business checking"),
                supportedPayoutMethod: Nullable<CancelPayoutsResponsePayoutMethodSupportedPayoutMethod>.value(CancelPayoutsResponsePayoutMethodSupportedPayoutMethod(
                    deliveryType: CancelPayoutsResponsePayoutMethodSupportedPayoutMethodDeliveryType.cashPickup,
                    iconUrl: Nullable<String>.value("https://cdn.whop.com/payouts/ach.png"),
                    payerName: Nullable<String>.value("ACH Bank Deposit")
                )),
                type: CancelPayoutsResponsePayoutMethodType.external
            )),
            payoutRequestId: Nullable<String>.value("cofr_xxxxxxxxxxxxx"),
            source: Nullable<CancelPayoutsResponseSource>.value(CancelPayoutsResponseSource.api),
            speed: CancelPayoutsResponseSpeed.standard,
            statementDescriptor: Nullable<String>.value("MYCOMPANY"),
            status: CancelPayoutsResponseStatus.requested,
            statusDetail: "awaiting_provider_acceptance",
            traceCode: Nullable<String>.value("021000021234567")
        )
        let response = try await client.payouts.cancel(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}