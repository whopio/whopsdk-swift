import Foundation
import Testing
import WhopSDK

@Suite("SupportedMethodsClient Wire Tests") struct SupportedMethodsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "delivery_type": "cash_pickup",
                      "fee_structure": {
                        "fixed": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "percentage": 4
                      },
                      "icon_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/ach-bank-deposit",
                      "id": "podst_xxxxxxxxxxxxxx",
                      "name": "SEPA Bank Transfer",
                      "object": "supported_payout_method",
                      "parent_id": "parent_id",
                      "quotes": [
                        {
                          "amount": 2500,
                          "currency": "usd",
                          "destination_currency": "usd",
                          "exchange_rate": 1,
                          "instant": {
                            "estimated_arrival": "2026-01-01T12:00:00Z",
                            "fee": 12.5,
                            "total_received": 2487.5
                          },
                          "max_limit": 50000,
                          "min_limit": 10,
                          "standard": {
                            "estimated_arrival": "2026-01-01T12:00:00Z",
                            "fee": 2.5,
                            "total_received": 2497.5
                          }
                        }
                      ],
                      "required_fields": [
                        {
                          "id": "fld_bank_account_number",
                          "input_type": "text",
                          "label": "Account Number",
                          "object": "required_field",
                          "options": [
                            "savings"
                          ],
                          "placeholder": "8825310472",
                          "required": true,
                          "sensitive": true,
                          "type": "bank_account_number",
                          "validation": "^[0-9]{4,17}$"
                        }
                      ],
                      "supports_instant_delivery": false,
                      "supports_paypal_login": false,
                      "supports_standard_delivery": true
                    }
                  ],
                  "page_info": {
                    "end_cursor": "MQ",
                    "has_next_page": true,
                    "has_previous_page": false,
                    "start_cursor": "MQ"
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
        let expectedResponse = ListSupportedMethodsResponse(
            data: [
                ListSupportedMethodsResponseDataItem(
                    deliveryType: ListSupportedMethodsResponseDataItemDeliveryType.cashPickup,
                    feeStructure: ListSupportedMethodsResponseDataItemFeeStructure(
                        fixed: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        percentage: 4
                    ),
                    iconUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/ach-bank-deposit"),
                    id: "podst_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("SEPA Bank Transfer"),
                    object: ListSupportedMethodsResponseDataItemObject.supportedPayoutMethod,
                    parentId: Nullable<String>.value("parent_id"),
                    quotes: Nullable<[ListSupportedMethodsResponseDataItemQuotesItem]>.value([
                        ListSupportedMethodsResponseDataItemQuotesItem(
                            amount: 2500,
                            currency: "usd",
                            destinationCurrency: "usd",
                            exchangeRate: 1,
                            instant: Nullable<ListSupportedMethodsResponseDataItemQuotesItemInstant>.value(ListSupportedMethodsResponseDataItemQuotesItemInstant(
                                estimatedArrival: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                                fee: 12.5,
                                totalReceived: 2487.5
                            )),
                            maxLimit: Nullable<Float>.value(50000),
                            minLimit: 10,
                            standard: Nullable<ListSupportedMethodsResponseDataItemQuotesItemStandard>.value(ListSupportedMethodsResponseDataItemQuotesItemStandard(
                                estimatedArrival: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                                fee: 2.5,
                                totalReceived: 2497.5
                            ))
                        )
                    ]),
                    requiredFields: Nullable<[ListSupportedMethodsResponseDataItemRequiredFieldsItem]>.value([
                        ListSupportedMethodsResponseDataItemRequiredFieldsItem(
                            id: "fld_bank_account_number",
                            inputType: "text",
                            label: "Account Number",
                            object: ListSupportedMethodsResponseDataItemRequiredFieldsItemObject.requiredField,
                            options: Nullable<[String]>.value([
                                "savings"
                            ]),
                            placeholder: Nullable<String>.value("8825310472"),
                            required: true,
                            sensitive: true,
                            type: "bank_account_number",
                            validation: Nullable<String>.value("^[0-9]{4,17}$")
                        )
                    ]),
                    supportsInstantDelivery: false,
                    supportsPaypalLogin: Optional(false),
                    supportsStandardDelivery: true
                )
            ],
            pageInfo: ListSupportedMethodsResponsePageInfo(
                endCursor: Nullable<String>.value("MQ"),
                hasNextPage: true,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("MQ")
            )
        )
        let response = try await client.payouts.supportedMethods.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }
}