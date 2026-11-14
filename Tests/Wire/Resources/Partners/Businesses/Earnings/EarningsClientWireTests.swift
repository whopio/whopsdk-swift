import Foundation
import Testing
import WhopSDK

@Suite("EarningsClient Wire Tests") struct EarningsClientWireTests {
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
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "route": "biz_xxxxxxxxxxxxxx",
                        "title": "Gleam Mobile Detailing"
                      },
                      "cancelation_reason": "payment_refunded",
                      "commission_amount_usd": "3.00",
                      "covered_by_commission_advance": false,
                      "created_at": "2026-01-01T12:00:00Z",
                      "financial_activity": [
                        {
                          "amount": "3.00",
                          "amount_usd": "3.00",
                          "category": "whop_processing_fee",
                          "created_at": "2026-01-01T12:00:00Z",
                          "currency": "usd",
                          "type": "income"
                        }
                      ],
                      "id": "afpy_xxxxxxxxxxxxxx",
                      "income_source": "sales",
                      "object": "partner_business_earning",
                      "payout_at": "2026-01-01T12:00:00Z",
                      "payout_percentage": 0.04,
                      "product": {
                        "id": "prod_xxxxxxxxxxxxxx",
                        "route": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "title": "Ceramic Coating Package"
                      },
                      "projected_commission_amount_usd": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "resource": {
                        "alternative_payment_method": {
                          "image_url": "https://content.whop.com/core/pm_cashapp.svg",
                          "name": "Cash App"
                        },
                        "brand": "visa",
                        "created_at": "2026-01-01T12:00:00Z",
                        "currency": "usd",
                        "id": "pay_xxxxxxxxxxxxxx",
                        "last4": "4242",
                        "object": "receipt",
                        "payment_method_type": "card",
                        "processor": "stripe"
                      },
                      "second_tier": false,
                      "status": "awaiting_settlement",
                      "transaction_amount_usd": "30.00"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
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
        let expectedResponse = ListEarningsResponse(
            data: [
                ListEarningsResponseDataItem(
                    account: Nullable<ListEarningsResponseDataItemAccount>.value(ListEarningsResponseDataItemAccount(
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        route: "biz_xxxxxxxxxxxxxx",
                        title: "Gleam Mobile Detailing"
                    )),
                    cancelationReason: Nullable<String>.value("payment_refunded"),
                    commissionAmountUsd: Nullable<String>.value("3.00"),
                    coveredByCommissionAdvance: false,
                    createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                    financialActivity: Nullable<[ListEarningsResponseDataItemFinancialActivityItem]>.value([
                        ListEarningsResponseDataItemFinancialActivityItem(
                            amount: "3.00",
                            amountUsd: "3.00",
                            category: Nullable<String>.value("whop_processing_fee"),
                            createdAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
                            currency: "usd",
                            type: ListEarningsResponseDataItemFinancialActivityItemType.income
                        )
                    ]),
                    id: Nullable<String>.value("afpy_xxxxxxxxxxxxxx"),
                    incomeSource: ListEarningsResponseDataItemIncomeSource.sales,
                    object: ListEarningsResponseDataItemObject.partnerBusinessEarning,
                    payoutAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
                    payoutPercentage: Nullable<Float>.value(0.04),
                    product: Nullable<ListEarningsResponseDataItemProduct>.value(ListEarningsResponseDataItemProduct(
                        id: "prod_xxxxxxxxxxxxxx",
                        route: "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        title: "Ceramic Coating Package"
                    )),
                    projectedCommissionAmountUsd: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    resource: Nullable<ListEarningsResponseDataItemResource>.value(ListEarningsResponseDataItemResource.nullableListEarningsResponseDataItemResourceAlternativePaymentMethod(
                        Nullable<ListEarningsResponseDataItemResourceAlternativePaymentMethod>.value(ListEarningsResponseDataItemResourceAlternativePaymentMethod(
                            alternativePaymentMethod: Nullable<ListEarningsResponseDataItemResourceAlternativePaymentMethodAlternativePaymentMethod>.value(ListEarningsResponseDataItemResourceAlternativePaymentMethodAlternativePaymentMethod(
                                imageUrl: Nullable<String>.value("https://content.whop.com/core/pm_cashapp.svg"),
                                name: "Cash App"
                            )),
                            brand: Nullable<String>.value("visa"),
                            createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                            currency: "usd",
                            id: "pay_xxxxxxxxxxxxxx",
                            last4: Nullable<String>.value("4242"),
                            object: ListEarningsResponseDataItemResourceAlternativePaymentMethodObject.receipt,
                            paymentMethodType: Nullable<String>.value("card"),
                            processor: Nullable<String>.value("stripe")
                        ))
                    )),
                    secondTier: false,
                    status: ListEarningsResponseDataItemStatus.awaitingSettlement,
                    transactionAmountUsd: "30.00"
                )
            ],
            pageInfo: ListEarningsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.partners.businesses.earnings.list(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
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
                      "account": {
                        "id": "id",
                        "logo_url": "logo_url",
                        "route": "route",
                        "title": "title"
                      },
                      "cancelation_reason": "cancelation_reason",
                      "commission_amount_usd": "commission_amount_usd",
                      "covered_by_commission_advance": true,
                      "created_at": "2024-01-15T09:30:00Z",
                      "financial_activity": [
                        {
                          "amount": "amount",
                          "amount_usd": "amount_usd",
                          "category": "category",
                          "created_at": "2024-01-15T09:30:00Z",
                          "currency": "currency",
                          "type": "income"
                        },
                        {
                          "amount": "amount",
                          "amount_usd": "amount_usd",
                          "category": "category",
                          "created_at": "2024-01-15T09:30:00Z",
                          "currency": "currency",
                          "type": "income"
                        }
                      ],
                      "id": "id",
                      "income_source": "sales",
                      "object": "partner_business_earning",
                      "payout_at": "2024-01-15T09:30:00Z",
                      "payout_percentage": 1.1,
                      "product": {
                        "id": "id",
                        "route": "route",
                        "title": "title"
                      },
                      "projected_commission_amount_usd": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "resource": {
                        "alternative_payment_method": {
                          "image_url": "image_url",
                          "name": "name"
                        },
                        "brand": "brand",
                        "created_at": "2024-01-15T09:30:00Z",
                        "currency": "currency",
                        "id": "id",
                        "last4": "last4",
                        "object": "receipt",
                        "payment_method_type": "payment_method_type",
                        "processor": "processor"
                      },
                      "second_tier": true,
                      "status": "awaiting_settlement",
                      "transaction_amount_usd": "transaction_amount_usd"
                    },
                    {
                      "account": {
                        "id": "id",
                        "logo_url": "logo_url",
                        "route": "route",
                        "title": "title"
                      },
                      "cancelation_reason": "cancelation_reason",
                      "commission_amount_usd": "commission_amount_usd",
                      "covered_by_commission_advance": true,
                      "created_at": "2024-01-15T09:30:00Z",
                      "financial_activity": [
                        {
                          "amount": "amount",
                          "amount_usd": "amount_usd",
                          "category": "category",
                          "created_at": "2024-01-15T09:30:00Z",
                          "currency": "currency",
                          "type": "income"
                        },
                        {
                          "amount": "amount",
                          "amount_usd": "amount_usd",
                          "category": "category",
                          "created_at": "2024-01-15T09:30:00Z",
                          "currency": "currency",
                          "type": "income"
                        }
                      ],
                      "id": "id",
                      "income_source": "sales",
                      "object": "partner_business_earning",
                      "payout_at": "2024-01-15T09:30:00Z",
                      "payout_percentage": 1.1,
                      "product": {
                        "id": "id",
                        "route": "route",
                        "title": "title"
                      },
                      "projected_commission_amount_usd": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "resource": {
                        "alternative_payment_method": {
                          "image_url": "image_url",
                          "name": "name"
                        },
                        "brand": "brand",
                        "created_at": "2024-01-15T09:30:00Z",
                        "currency": "currency",
                        "id": "id",
                        "last4": "last4",
                        "object": "receipt",
                        "payment_method_type": "payment_method_type",
                        "processor": "processor"
                      },
                      "second_tier": true,
                      "status": "awaiting_settlement",
                      "transaction_amount_usd": "transaction_amount_usd"
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
        let expectedResponse = ListEarningsResponse(
            data: [
                ListEarningsResponseDataItem(
                    account: Nullable<ListEarningsResponseDataItemAccount>.value(ListEarningsResponseDataItemAccount(
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        route: "route",
                        title: "title"
                    )),
                    cancelationReason: Nullable<String>.value("cancelation_reason"),
                    commissionAmountUsd: Nullable<String>.value("commission_amount_usd"),
                    coveredByCommissionAdvance: true,
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    financialActivity: Nullable<[ListEarningsResponseDataItemFinancialActivityItem]>.value([
                        ListEarningsResponseDataItemFinancialActivityItem(
                            amount: "amount",
                            amountUsd: "amount_usd",
                            category: Nullable<String>.value("category"),
                            createdAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                            currency: "currency",
                            type: ListEarningsResponseDataItemFinancialActivityItemType.income
                        ),
                        ListEarningsResponseDataItemFinancialActivityItem(
                            amount: "amount",
                            amountUsd: "amount_usd",
                            category: Nullable<String>.value("category"),
                            createdAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                            currency: "currency",
                            type: ListEarningsResponseDataItemFinancialActivityItemType.income
                        )
                    ]),
                    id: Nullable<String>.value("id"),
                    incomeSource: ListEarningsResponseDataItemIncomeSource.sales,
                    object: ListEarningsResponseDataItemObject.partnerBusinessEarning,
                    payoutAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    payoutPercentage: Nullable<Float>.value(1.1),
                    product: Nullable<ListEarningsResponseDataItemProduct>.value(ListEarningsResponseDataItemProduct(
                        id: "id",
                        route: "route",
                        title: "title"
                    )),
                    projectedCommissionAmountUsd: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    resource: Nullable<ListEarningsResponseDataItemResource>.value(ListEarningsResponseDataItemResource.nullableListEarningsResponseDataItemResourceAlternativePaymentMethod(
                        Nullable<ListEarningsResponseDataItemResourceAlternativePaymentMethod>.value(ListEarningsResponseDataItemResourceAlternativePaymentMethod(
                            alternativePaymentMethod: Nullable<ListEarningsResponseDataItemResourceAlternativePaymentMethodAlternativePaymentMethod>.value(ListEarningsResponseDataItemResourceAlternativePaymentMethodAlternativePaymentMethod(
                                imageUrl: Nullable<String>.value("image_url"),
                                name: "name"
                            )),
                            brand: Nullable<String>.value("brand"),
                            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                            currency: "currency",
                            id: "id",
                            last4: Nullable<String>.value("last4"),
                            object: ListEarningsResponseDataItemResourceAlternativePaymentMethodObject.receipt,
                            paymentMethodType: Nullable<String>.value("payment_method_type"),
                            processor: Nullable<String>.value("processor")
                        ))
                    )),
                    secondTier: true,
                    status: ListEarningsResponseDataItemStatus.awaitingSettlement,
                    transactionAmountUsd: "transaction_amount_usd"
                ),
                ListEarningsResponseDataItem(
                    account: Nullable<ListEarningsResponseDataItemAccount>.value(ListEarningsResponseDataItemAccount(
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        route: "route",
                        title: "title"
                    )),
                    cancelationReason: Nullable<String>.value("cancelation_reason"),
                    commissionAmountUsd: Nullable<String>.value("commission_amount_usd"),
                    coveredByCommissionAdvance: true,
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    financialActivity: Nullable<[ListEarningsResponseDataItemFinancialActivityItem]>.value([
                        ListEarningsResponseDataItemFinancialActivityItem(
                            amount: "amount",
                            amountUsd: "amount_usd",
                            category: Nullable<String>.value("category"),
                            createdAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                            currency: "currency",
                            type: ListEarningsResponseDataItemFinancialActivityItemType.income
                        ),
                        ListEarningsResponseDataItemFinancialActivityItem(
                            amount: "amount",
                            amountUsd: "amount_usd",
                            category: Nullable<String>.value("category"),
                            createdAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                            currency: "currency",
                            type: ListEarningsResponseDataItemFinancialActivityItemType.income
                        )
                    ]),
                    id: Nullable<String>.value("id"),
                    incomeSource: ListEarningsResponseDataItemIncomeSource.sales,
                    object: ListEarningsResponseDataItemObject.partnerBusinessEarning,
                    payoutAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    payoutPercentage: Nullable<Float>.value(1.1),
                    product: Nullable<ListEarningsResponseDataItemProduct>.value(ListEarningsResponseDataItemProduct(
                        id: "id",
                        route: "route",
                        title: "title"
                    )),
                    projectedCommissionAmountUsd: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    resource: Nullable<ListEarningsResponseDataItemResource>.value(ListEarningsResponseDataItemResource.nullableListEarningsResponseDataItemResourceAlternativePaymentMethod(
                        Nullable<ListEarningsResponseDataItemResourceAlternativePaymentMethod>.value(ListEarningsResponseDataItemResourceAlternativePaymentMethod(
                            alternativePaymentMethod: Nullable<ListEarningsResponseDataItemResourceAlternativePaymentMethodAlternativePaymentMethod>.value(ListEarningsResponseDataItemResourceAlternativePaymentMethodAlternativePaymentMethod(
                                imageUrl: Nullable<String>.value("image_url"),
                                name: "name"
                            )),
                            brand: Nullable<String>.value("brand"),
                            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                            currency: "currency",
                            id: "id",
                            last4: Nullable<String>.value("last4"),
                            object: ListEarningsResponseDataItemResourceAlternativePaymentMethodObject.receipt,
                            paymentMethodType: Nullable<String>.value("payment_method_type"),
                            processor: Nullable<String>.value("processor")
                        ))
                    )),
                    secondTier: true,
                    status: ListEarningsResponseDataItemStatus.awaitingSettlement,
                    transactionAmountUsd: "transaction_amount_usd"
                )
            ],
            pageInfo: ListEarningsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.partners.businesses.earnings.list(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}