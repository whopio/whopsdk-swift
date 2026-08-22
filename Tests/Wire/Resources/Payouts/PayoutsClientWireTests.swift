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
                        }
                      },
                      "payout_request_id": "cofr_xxxxxxxxxxxxx",
                      "source": "api",
                      "speed": "standard",
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
                        ))
                    )),
                    payoutRequestId: Nullable<String>.value("cofr_xxxxxxxxxxxxx"),
                    source: Nullable<ListPayoutsResponseDataItemSource>.value(ListPayoutsResponseDataItemSource.api),
                    speed: ListPayoutsResponseDataItemSpeed.standard,
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
                  "amount": "amount",
                  "created_at": "2024-01-15T09:30:00Z",
                  "currency": "currency",
                  "destination_amount": "destination_amount",
                  "destination_currency": "destination_currency",
                  "estimated_arrival": "2024-01-15T09:30:00Z",
                  "exchange_rate": 1.1,
                  "failure": {
                    "code": "code",
                    "funds_returned_at": "2024-01-15T09:30:00Z",
                    "message": "message"
                  },
                  "fee_amount": "fee_amount",
                  "fee_paid_by": "self",
                  "id": "id",
                  "markup_fee": "markup_fee",
                  "metadata": {
                    "metadata": "metadata"
                  },
                  "net_amount": "net_amount",
                  "notes": "notes",
                  "object": "payout",
                  "payer_name": "payer_name",
                  "payout_method": {
                    "nickname": "nickname",
                    "supported_payout_method": {
                      "delivery_type": "cash_pickup",
                      "icon_url": "icon_url",
                      "payer_name": "payer_name"
                    }
                  },
                  "payout_request_id": "payout_request_id",
                  "source": "api",
                  "speed": "standard",
                  "status": "requested",
                  "status_detail": "status_detail",
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
            amount: "amount",
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            currency: "currency",
            destinationAmount: Nullable<String>.value("destination_amount"),
            destinationCurrency: Nullable<String>.value("destination_currency"),
            estimatedArrival: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            exchangeRate: Nullable<Float>.value(1.1),
            failure: Nullable<CreatePayoutsResponseFailure>.value(CreatePayoutsResponseFailure(
                code: Nullable<String>.value("code"),
                fundsReturnedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                message: Nullable<String>.value("message")
            )),
            feeAmount: "fee_amount",
            feePaidBy: CreatePayoutsResponseFeePaidBy.self,
            id: "id",
            markupFee: "markup_fee",
            metadata: [
                "metadata": "metadata"
            ],
            netAmount: "net_amount",
            notes: Nullable<String>.value("notes"),
            object: CreatePayoutsResponseObject.payout,
            payerName: Nullable<String>.value("payer_name"),
            payoutMethod: Nullable<CreatePayoutsResponsePayoutMethod>.value(CreatePayoutsResponsePayoutMethod(
                nickname: Nullable<String>.value("nickname"),
                supportedPayoutMethod: Nullable<CreatePayoutsResponsePayoutMethodSupportedPayoutMethod>.value(CreatePayoutsResponsePayoutMethodSupportedPayoutMethod(
                    deliveryType: CreatePayoutsResponsePayoutMethodSupportedPayoutMethodDeliveryType.cashPickup,
                    iconUrl: Nullable<String>.value("icon_url"),
                    payerName: Nullable<String>.value("payer_name")
                ))
            )),
            payoutRequestId: Nullable<String>.value("payout_request_id"),
            source: Nullable<CreatePayoutsResponseSource>.value(CreatePayoutsResponseSource.api),
            speed: CreatePayoutsResponseSpeed.standard,
            status: CreatePayoutsResponseStatus.requested,
            statusDetail: "status_detail",
            traceCode: Nullable<String>.value("trace_code")
        )
        let response = try await client.payouts.create(
            request: CreatePayoutsRequestBody.jsonValue(
                .object([
                    "key": .string("value")
                ])
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
                  "amount": "500.0",
                  "created_at": "2026-07-29T18:22:00Z",
                  "currency": "usd",
                  "destination_amount": "461.7",
                  "destination_currency": "eur",
                  "estimated_arrival": "2026-08-03T00:00:00Z",
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
                    }
                  },
                  "payout_request_id": "cofr_xxxxxxxxxxxxx",
                  "source": "api",
                  "speed": "standard",
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
        let expectedResponse = RetrievePayoutsResponse(
            amount: "500.0",
            createdAt: try! Date("2026-07-29T18:22:00Z", strategy: .iso8601),
            currency: "usd",
            destinationAmount: Nullable<String>.value("461.7"),
            destinationCurrency: Nullable<String>.value("eur"),
            estimatedArrival: Nullable<Date>.value(try! Date("2026-08-03T00:00:00Z", strategy: .iso8601)),
            exchangeRate: Nullable<Float>.value(0.9234),
            failure: Nullable<RetrievePayoutsResponseFailure>.value(RetrievePayoutsResponseFailure(
                code: Nullable<String>.value("beneficiary_name_mismatch"),
                fundsReturnedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                message: Nullable<String>.value("message")
            )),
            feeAmount: "0.25",
            feePaidBy: RetrievePayoutsResponseFeePaidBy.self,
            id: "wdrl_xxxxxxxxxxxxx",
            markupFee: "0.0",
            metadata: [
                "batch_id": "2026-08-18"
            ],
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
                ))
            )),
            payoutRequestId: Nullable<String>.value("cofr_xxxxxxxxxxxxx"),
            source: Nullable<RetrievePayoutsResponseSource>.value(RetrievePayoutsResponseSource.api),
            speed: RetrievePayoutsResponseSpeed.standard,
            status: RetrievePayoutsResponseStatus.requested,
            statusDetail: "awaiting_provider_acceptance",
            traceCode: Nullable<String>.value("021000021234567")
        )
        let response = try await client.payouts.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}