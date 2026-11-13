import Foundation
import Testing
import WhopSDK

@Suite("PaymentQuotesClient Wire Tests") struct PaymentQuotesClientWireTests {
    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "base_currency": "usd",
                  "base_total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "discount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "exchange_rate": "0.918",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "id": "pq_xxxxxxxxxxxxxx",
                  "line_items": [
                    {
                      "discount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "quantity": 1,
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "tax_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "total": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx"
                    }
                  ],
                  "located_by": "shipping_address",
                  "payment_id": "pay_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_code_id",
                  "recommended_currencies": [
                    "usd"
                  ],
                  "shipping_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "subtotal": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "tax_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "tax_behavior": "inclusive",
                  "tax_ids": [
                    {
                      "type": "ad_nrt",
                      "value": "12-3456789"
                    }
                  ],
                  "tax_status": "calculated",
                  "total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
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
        let expectedResponse = PaymentQuote(
            accountId: "biz_xxxxxxxxxxxxxx",
            address: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            baseCurrency: "usd",
            baseTotal: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: "usd",
            discount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            exchangeRate: Nullable<String>.value("0.918"),
            expiresAt: "2026-01-01T12:00:00.000Z",
            id: "pq_xxxxxxxxxxxxxx",
            lineItems: [
                PaymentQuoteLineItem(
                    discount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    quantity: 1,
                    subtotal: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    taxAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    total: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
                )
            ],
            locatedBy: Nullable<PaymentQuoteLocatedBy>.value(PaymentQuoteLocatedBy.shippingAddress),
            paymentId: Nullable<String>.value("pay_xxxxxxxxxxxxxx"),
            promoCodeId: Nullable<String>.value("promo_code_id"),
            recommendedCurrencies: [
                "usd"
            ],
            shippingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            subtotal: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            taxAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            taxBehavior: Nullable<PaymentQuoteTaxBehavior>.value(PaymentQuoteTaxBehavior.inclusive),
            taxIds: [
                TaxId(
                    type: TaxIdType.adNrt,
                    value: "12-3456789"
                )
            ],
            taxStatus: PaymentQuoteTaxStatus.calculated,
            total: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )
        )
        let response = try await client.paymentQuotes.create(
            request: .init(accountId: "biz_xxxxxxxxxxxxxx"),
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "base_currency": "usd",
                  "base_total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "discount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "exchange_rate": "0.918",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "id": "pq_xxxxxxxxxxxxxx",
                  "line_items": [
                    {
                      "discount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "quantity": 1,
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "tax_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "total": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx"
                    }
                  ],
                  "located_by": "shipping_address",
                  "payment_id": "pay_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_code_id",
                  "recommended_currencies": [
                    "usd"
                  ],
                  "shipping_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "1114 Bouldin Ave",
                    "line2": "Unit B",
                    "name": "Dana Whitfield",
                    "postal_code": "78704",
                    "state": "TX"
                  },
                  "subtotal": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "tax_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "tax_behavior": "inclusive",
                  "tax_ids": [
                    {
                      "type": "ad_nrt",
                      "value": "12-3456789"
                    }
                  ],
                  "tax_status": "calculated",
                  "total": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
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
        let expectedResponse = PaymentQuote(
            accountId: "biz_xxxxxxxxxxxxxx",
            address: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            baseCurrency: "usd",
            baseTotal: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: "usd",
            discount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            exchangeRate: Nullable<String>.value("0.918"),
            expiresAt: "2026-01-01T12:00:00.000Z",
            id: "pq_xxxxxxxxxxxxxx",
            lineItems: [
                PaymentQuoteLineItem(
                    discount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    quantity: 1,
                    subtotal: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    taxAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    total: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
                )
            ],
            locatedBy: Nullable<PaymentQuoteLocatedBy>.value(PaymentQuoteLocatedBy.shippingAddress),
            paymentId: Nullable<String>.value("pay_xxxxxxxxxxxxxx"),
            promoCodeId: Nullable<String>.value("promo_code_id"),
            recommendedCurrencies: [
                "usd"
            ],
            shippingAddress: Nullable<PaymentAddress>.value(PaymentAddress(
                city: Nullable<String>.value("Austin"),
                country: Nullable<String>.value("US"),
                line1: Nullable<String>.value("1114 Bouldin Ave"),
                line2: Nullable<String>.value("Unit B"),
                name: Nullable<String>.value("Dana Whitfield"),
                postalCode: Nullable<String>.value("78704"),
                state: Nullable<String>.value("TX")
            )),
            subtotal: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            taxAmount: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            taxBehavior: Nullable<PaymentQuoteTaxBehavior>.value(PaymentQuoteTaxBehavior.inclusive),
            taxIds: [
                TaxId(
                    type: TaxIdType.adNrt,
                    value: "12-3456789"
                )
            ],
            taxStatus: PaymentQuoteTaxStatus.calculated,
            total: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )
        )
        let response = try await client.paymentQuotes.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}