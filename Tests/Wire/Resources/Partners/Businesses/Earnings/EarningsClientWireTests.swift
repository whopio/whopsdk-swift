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
                      "commission_amount_usd": "1.00",
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
                      "transaction_amount_usd": "10.00"
                    }
                  ],
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
                    commissionAmountUsd: Nullable<String>.value("1.00"),
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
                    transactionAmountUsd: "10.00"
                )
            ],
            pageInfo: ListEarningsResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
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
}