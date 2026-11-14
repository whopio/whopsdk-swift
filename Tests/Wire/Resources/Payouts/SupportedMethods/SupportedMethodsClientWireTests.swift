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

    @Test func list2() async throws -> Void {
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
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "percentage": 1.1
                      },
                      "icon_url": "icon_url",
                      "id": "id",
                      "name": "name",
                      "object": "supported_payout_method",
                      "parent_id": "parent_id",
                      "quotes": [
                        {
                          "amount": 1.1,
                          "currency": "currency",
                          "destination_currency": "destination_currency",
                          "exchange_rate": 1.1,
                          "instant": {
                            "estimated_arrival": "2024-01-15T09:30:00Z",
                            "fee": 1.1,
                            "total_received": 1.1
                          },
                          "max_limit": 1.1,
                          "min_limit": 1.1,
                          "standard": {
                            "estimated_arrival": "2024-01-15T09:30:00Z",
                            "fee": 1.1,
                            "total_received": 1.1
                          }
                        },
                        {
                          "amount": 1.1,
                          "currency": "currency",
                          "destination_currency": "destination_currency",
                          "exchange_rate": 1.1,
                          "instant": {
                            "estimated_arrival": "2024-01-15T09:30:00Z",
                            "fee": 1.1,
                            "total_received": 1.1
                          },
                          "max_limit": 1.1,
                          "min_limit": 1.1,
                          "standard": {
                            "estimated_arrival": "2024-01-15T09:30:00Z",
                            "fee": 1.1,
                            "total_received": 1.1
                          }
                        }
                      ],
                      "required_fields": [
                        {
                          "id": "id",
                          "input_type": "input_type",
                          "label": "label",
                          "object": "required_field",
                          "options": [
                            "options",
                            "options"
                          ],
                          "placeholder": "placeholder",
                          "required": true,
                          "sensitive": true,
                          "type": "type",
                          "validation": "validation"
                        },
                        {
                          "id": "id",
                          "input_type": "input_type",
                          "label": "label",
                          "object": "required_field",
                          "options": [
                            "options",
                            "options"
                          ],
                          "placeholder": "placeholder",
                          "required": true,
                          "sensitive": true,
                          "type": "type",
                          "validation": "validation"
                        }
                      ],
                      "supports_instant_delivery": true,
                      "supports_paypal_login": true,
                      "supports_standard_delivery": true
                    },
                    {
                      "delivery_type": "cash_pickup",
                      "fee_structure": {
                        "fixed": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "percentage": 1.1
                      },
                      "icon_url": "icon_url",
                      "id": "id",
                      "name": "name",
                      "object": "supported_payout_method",
                      "parent_id": "parent_id",
                      "quotes": [
                        {
                          "amount": 1.1,
                          "currency": "currency",
                          "destination_currency": "destination_currency",
                          "exchange_rate": 1.1,
                          "instant": {
                            "estimated_arrival": "2024-01-15T09:30:00Z",
                            "fee": 1.1,
                            "total_received": 1.1
                          },
                          "max_limit": 1.1,
                          "min_limit": 1.1,
                          "standard": {
                            "estimated_arrival": "2024-01-15T09:30:00Z",
                            "fee": 1.1,
                            "total_received": 1.1
                          }
                        },
                        {
                          "amount": 1.1,
                          "currency": "currency",
                          "destination_currency": "destination_currency",
                          "exchange_rate": 1.1,
                          "instant": {
                            "estimated_arrival": "2024-01-15T09:30:00Z",
                            "fee": 1.1,
                            "total_received": 1.1
                          },
                          "max_limit": 1.1,
                          "min_limit": 1.1,
                          "standard": {
                            "estimated_arrival": "2024-01-15T09:30:00Z",
                            "fee": 1.1,
                            "total_received": 1.1
                          }
                        }
                      ],
                      "required_fields": [
                        {
                          "id": "id",
                          "input_type": "input_type",
                          "label": "label",
                          "object": "required_field",
                          "options": [
                            "options",
                            "options"
                          ],
                          "placeholder": "placeholder",
                          "required": true,
                          "sensitive": true,
                          "type": "type",
                          "validation": "validation"
                        },
                        {
                          "id": "id",
                          "input_type": "input_type",
                          "label": "label",
                          "object": "required_field",
                          "options": [
                            "options",
                            "options"
                          ],
                          "placeholder": "placeholder",
                          "required": true,
                          "sensitive": true,
                          "type": "type",
                          "validation": "validation"
                        }
                      ],
                      "supports_instant_delivery": true,
                      "supports_paypal_login": true,
                      "supports_standard_delivery": true
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
        let expectedResponse = ListSupportedMethodsResponse(
            data: [
                ListSupportedMethodsResponseDataItem(
                    deliveryType: ListSupportedMethodsResponseDataItemDeliveryType.cashPickup,
                    feeStructure: ListSupportedMethodsResponseDataItemFeeStructure(
                        fixed: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        percentage: 1.1
                    ),
                    iconUrl: Nullable<String>.value("icon_url"),
                    id: "id",
                    name: Nullable<String>.value("name"),
                    object: ListSupportedMethodsResponseDataItemObject.supportedPayoutMethod,
                    parentId: Nullable<String>.value("parent_id"),
                    quotes: Nullable<[ListSupportedMethodsResponseDataItemQuotesItem]>.value([
                        ListSupportedMethodsResponseDataItemQuotesItem(
                            amount: 1.1,
                            currency: "currency",
                            destinationCurrency: "destination_currency",
                            exchangeRate: 1.1,
                            instant: Nullable<ListSupportedMethodsResponseDataItemQuotesItemInstant>.value(ListSupportedMethodsResponseDataItemQuotesItemInstant(
                                estimatedArrival: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                                fee: 1.1,
                                totalReceived: 1.1
                            )),
                            maxLimit: Nullable<Float>.value(1.1),
                            minLimit: 1.1,
                            standard: Nullable<ListSupportedMethodsResponseDataItemQuotesItemStandard>.value(ListSupportedMethodsResponseDataItemQuotesItemStandard(
                                estimatedArrival: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                                fee: 1.1,
                                totalReceived: 1.1
                            ))
                        ),
                        ListSupportedMethodsResponseDataItemQuotesItem(
                            amount: 1.1,
                            currency: "currency",
                            destinationCurrency: "destination_currency",
                            exchangeRate: 1.1,
                            instant: Nullable<ListSupportedMethodsResponseDataItemQuotesItemInstant>.value(ListSupportedMethodsResponseDataItemQuotesItemInstant(
                                estimatedArrival: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                                fee: 1.1,
                                totalReceived: 1.1
                            )),
                            maxLimit: Nullable<Float>.value(1.1),
                            minLimit: 1.1,
                            standard: Nullable<ListSupportedMethodsResponseDataItemQuotesItemStandard>.value(ListSupportedMethodsResponseDataItemQuotesItemStandard(
                                estimatedArrival: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                                fee: 1.1,
                                totalReceived: 1.1
                            ))
                        )
                    ]),
                    requiredFields: Nullable<[ListSupportedMethodsResponseDataItemRequiredFieldsItem]>.value([
                        ListSupportedMethodsResponseDataItemRequiredFieldsItem(
                            id: "id",
                            inputType: "input_type",
                            label: "label",
                            object: ListSupportedMethodsResponseDataItemRequiredFieldsItemObject.requiredField,
                            options: Nullable<[String]>.value([
                                "options",
                                "options"
                            ]),
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true,
                            sensitive: true,
                            type: "type",
                            validation: Nullable<String>.value("validation")
                        ),
                        ListSupportedMethodsResponseDataItemRequiredFieldsItem(
                            id: "id",
                            inputType: "input_type",
                            label: "label",
                            object: ListSupportedMethodsResponseDataItemRequiredFieldsItemObject.requiredField,
                            options: Nullable<[String]>.value([
                                "options",
                                "options"
                            ]),
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true,
                            sensitive: true,
                            type: "type",
                            validation: Nullable<String>.value("validation")
                        )
                    ]),
                    supportsInstantDelivery: true,
                    supportsPaypalLogin: Optional(true),
                    supportsStandardDelivery: true
                ),
                ListSupportedMethodsResponseDataItem(
                    deliveryType: ListSupportedMethodsResponseDataItemDeliveryType.cashPickup,
                    feeStructure: ListSupportedMethodsResponseDataItemFeeStructure(
                        fixed: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        percentage: 1.1
                    ),
                    iconUrl: Nullable<String>.value("icon_url"),
                    id: "id",
                    name: Nullable<String>.value("name"),
                    object: ListSupportedMethodsResponseDataItemObject.supportedPayoutMethod,
                    parentId: Nullable<String>.value("parent_id"),
                    quotes: Nullable<[ListSupportedMethodsResponseDataItemQuotesItem]>.value([
                        ListSupportedMethodsResponseDataItemQuotesItem(
                            amount: 1.1,
                            currency: "currency",
                            destinationCurrency: "destination_currency",
                            exchangeRate: 1.1,
                            instant: Nullable<ListSupportedMethodsResponseDataItemQuotesItemInstant>.value(ListSupportedMethodsResponseDataItemQuotesItemInstant(
                                estimatedArrival: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                                fee: 1.1,
                                totalReceived: 1.1
                            )),
                            maxLimit: Nullable<Float>.value(1.1),
                            minLimit: 1.1,
                            standard: Nullable<ListSupportedMethodsResponseDataItemQuotesItemStandard>.value(ListSupportedMethodsResponseDataItemQuotesItemStandard(
                                estimatedArrival: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                                fee: 1.1,
                                totalReceived: 1.1
                            ))
                        ),
                        ListSupportedMethodsResponseDataItemQuotesItem(
                            amount: 1.1,
                            currency: "currency",
                            destinationCurrency: "destination_currency",
                            exchangeRate: 1.1,
                            instant: Nullable<ListSupportedMethodsResponseDataItemQuotesItemInstant>.value(ListSupportedMethodsResponseDataItemQuotesItemInstant(
                                estimatedArrival: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                                fee: 1.1,
                                totalReceived: 1.1
                            )),
                            maxLimit: Nullable<Float>.value(1.1),
                            minLimit: 1.1,
                            standard: Nullable<ListSupportedMethodsResponseDataItemQuotesItemStandard>.value(ListSupportedMethodsResponseDataItemQuotesItemStandard(
                                estimatedArrival: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                                fee: 1.1,
                                totalReceived: 1.1
                            ))
                        )
                    ]),
                    requiredFields: Nullable<[ListSupportedMethodsResponseDataItemRequiredFieldsItem]>.value([
                        ListSupportedMethodsResponseDataItemRequiredFieldsItem(
                            id: "id",
                            inputType: "input_type",
                            label: "label",
                            object: ListSupportedMethodsResponseDataItemRequiredFieldsItemObject.requiredField,
                            options: Nullable<[String]>.value([
                                "options",
                                "options"
                            ]),
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true,
                            sensitive: true,
                            type: "type",
                            validation: Nullable<String>.value("validation")
                        ),
                        ListSupportedMethodsResponseDataItemRequiredFieldsItem(
                            id: "id",
                            inputType: "input_type",
                            label: "label",
                            object: ListSupportedMethodsResponseDataItemRequiredFieldsItemObject.requiredField,
                            options: Nullable<[String]>.value([
                                "options",
                                "options"
                            ]),
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true,
                            sensitive: true,
                            type: "type",
                            validation: Nullable<String>.value("validation")
                        )
                    ]),
                    supportsInstantDelivery: true,
                    supportsPaypalLogin: Optional(true),
                    supportsStandardDelivery: true
                )
            ],
            pageInfo: ListSupportedMethodsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.payouts.supportedMethods.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }
}