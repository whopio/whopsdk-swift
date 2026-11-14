import Foundation
import Testing
import WhopSDK

@Suite("FinancingProvidersClient Wire Tests") struct FinancingProvidersClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "action": "verify_business",
                      "currencies": [
                        {
                          "currency": "usd",
                          "max_amount": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          }
                        }
                      ],
                      "details": {
                        "dispute_rate": null,
                        "dispute_rate_limit": null,
                        "source_provider": null
                      },
                      "provider": "afterpay_clearpay",
                      "provider_reviewed_at": "provider_reviewed_at",
                      "reason": "account_not_supported",
                      "status": "eligible"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
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
        let expectedResponse = ListFinancingProvidersResponse(
            data: [
                FinancingProvider(
                    action: Nullable<FinancingProviderAction>.value(FinancingProviderAction.verifyBusiness),
                    currencies: [
                        FinancingProviderCurrency(
                            currency: FinancingProviderCurrencyCurrency.usd,
                            maxAmount: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ))
                        )
                    ],
                    details: Nullable<FinancingProviderDetails>.value(FinancingProviderDetails(
                        disputeRate: .null,
                        disputeRateLimit: .null,
                        sourceProvider: .null
                    )),
                    provider: FinancingProviderProvider.afterpayClearpay,
                    providerReviewedAt: Nullable<String>.value("provider_reviewed_at"),
                    reason: Nullable<FinancingProviderReason>.value(FinancingProviderReason.accountNotSupported),
                    status: FinancingProviderStatus.eligible
                )
            ],
            pageInfo: ListFinancingProvidersResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("MQ")
            )
        )
        let response = try await client.accounts.financingProviders.list(
            accountId: "account_id",
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
                      "action": "verify_business",
                      "currencies": [
                        {
                          "currency": "usd",
                          "max_amount": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          }
                        },
                        {
                          "currency": "usd",
                          "max_amount": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          }
                        }
                      ],
                      "details": {
                        "dispute_rate": 1.1,
                        "dispute_rate_limit": 1.1,
                        "source_provider": "klarna"
                      },
                      "provider": "afterpay_clearpay",
                      "provider_reviewed_at": "provider_reviewed_at",
                      "reason": "account_not_supported",
                      "status": "eligible"
                    },
                    {
                      "action": "verify_business",
                      "currencies": [
                        {
                          "currency": "usd",
                          "max_amount": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          }
                        },
                        {
                          "currency": "usd",
                          "max_amount": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          }
                        }
                      ],
                      "details": {
                        "dispute_rate": 1.1,
                        "dispute_rate_limit": 1.1,
                        "source_provider": "klarna"
                      },
                      "provider": "afterpay_clearpay",
                      "provider_reviewed_at": "provider_reviewed_at",
                      "reason": "account_not_supported",
                      "status": "eligible"
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
        let expectedResponse = ListFinancingProvidersResponse(
            data: [
                FinancingProvider(
                    action: Nullable<FinancingProviderAction>.value(FinancingProviderAction.verifyBusiness),
                    currencies: [
                        FinancingProviderCurrency(
                            currency: FinancingProviderCurrencyCurrency.usd,
                            maxAmount: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ))
                        ),
                        FinancingProviderCurrency(
                            currency: FinancingProviderCurrencyCurrency.usd,
                            maxAmount: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ))
                        )
                    ],
                    details: Nullable<FinancingProviderDetails>.value(FinancingProviderDetails(
                        disputeRate: Nullable<Double>.value(1.1),
                        disputeRateLimit: Nullable<Double>.value(1.1),
                        sourceProvider: Nullable<FinancingProviderDetailsSourceProvider>.value(FinancingProviderDetailsSourceProvider.klarna)
                    )),
                    provider: FinancingProviderProvider.afterpayClearpay,
                    providerReviewedAt: Nullable<String>.value("provider_reviewed_at"),
                    reason: Nullable<FinancingProviderReason>.value(FinancingProviderReason.accountNotSupported),
                    status: FinancingProviderStatus.eligible
                ),
                FinancingProvider(
                    action: Nullable<FinancingProviderAction>.value(FinancingProviderAction.verifyBusiness),
                    currencies: [
                        FinancingProviderCurrency(
                            currency: FinancingProviderCurrencyCurrency.usd,
                            maxAmount: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ))
                        ),
                        FinancingProviderCurrency(
                            currency: FinancingProviderCurrencyCurrency.usd,
                            maxAmount: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            ))
                        )
                    ],
                    details: Nullable<FinancingProviderDetails>.value(FinancingProviderDetails(
                        disputeRate: Nullable<Double>.value(1.1),
                        disputeRateLimit: Nullable<Double>.value(1.1),
                        sourceProvider: Nullable<FinancingProviderDetailsSourceProvider>.value(FinancingProviderDetailsSourceProvider.klarna)
                    )),
                    provider: FinancingProviderProvider.afterpayClearpay,
                    providerReviewedAt: Nullable<String>.value("provider_reviewed_at"),
                    reason: Nullable<FinancingProviderReason>.value(FinancingProviderReason.accountNotSupported),
                    status: FinancingProviderStatus.eligible
                )
            ],
            pageInfo: ListFinancingProvidersResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.accounts.financingProviders.list(
            accountId: "account_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}