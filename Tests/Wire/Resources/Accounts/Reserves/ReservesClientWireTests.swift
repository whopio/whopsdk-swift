import Foundation
import Testing
import WhopSDK

@Suite("ReservesClient Wire Tests") struct ReservesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "amount": "125.5",
                      "by_type": [
                        {
                          "amount": "100.0",
                          "hold_period_days": 90,
                          "percentage": 25,
                          "type": "regular"
                        }
                      ],
                      "currency": "usd",
                      "unlocks_by_date": [
                        {
                          "amount": "100.0",
                          "by_type": [
                            {
                              "amount": "100.0",
                              "type": "regular"
                            }
                          ],
                          "date": "2026-01-01"
                        }
                      ]
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListReservesResponse(
            data: [
                AccountReserve(
                    amount: "125.5",
                    byType: [
                        AccountReserveType(
                            amount: "100.0",
                            holdPeriodDays: Nullable<Int>.value(90),
                            percentage: Nullable<Double>.value(25),
                            type: AccountReserveTypeType.regular
                        )
                    ],
                    currency: "usd",
                    unlocksByDate: [
                        AccountReserveUnlock(
                            amount: "100.0",
                            byType: [
                                AccountReserveUnlockType(
                                    amount: "100.0",
                                    type: AccountReserveUnlockTypeType.regular
                                )
                            ],
                            date: "2026-01-01"
                        )
                    ]
                )
            ]
        )
        let response = try await client.accounts.reserves.list(
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
                      "amount": "amount",
                      "by_type": [
                        {
                          "amount": "amount",
                          "hold_period_days": 1,
                          "percentage": 1.1,
                          "type": "regular"
                        },
                        {
                          "amount": "amount",
                          "hold_period_days": 1,
                          "percentage": 1.1,
                          "type": "regular"
                        }
                      ],
                      "currency": "currency",
                      "unlocks_by_date": [
                        {
                          "amount": "amount",
                          "by_type": [
                            {
                              "amount": "amount",
                              "type": "regular"
                            },
                            {
                              "amount": "amount",
                              "type": "regular"
                            }
                          ],
                          "date": "date"
                        },
                        {
                          "amount": "amount",
                          "by_type": [
                            {
                              "amount": "amount",
                              "type": "regular"
                            },
                            {
                              "amount": "amount",
                              "type": "regular"
                            }
                          ],
                          "date": "date"
                        }
                      ]
                    },
                    {
                      "amount": "amount",
                      "by_type": [
                        {
                          "amount": "amount",
                          "hold_period_days": 1,
                          "percentage": 1.1,
                          "type": "regular"
                        },
                        {
                          "amount": "amount",
                          "hold_period_days": 1,
                          "percentage": 1.1,
                          "type": "regular"
                        }
                      ],
                      "currency": "currency",
                      "unlocks_by_date": [
                        {
                          "amount": "amount",
                          "by_type": [
                            {
                              "amount": "amount",
                              "type": "regular"
                            },
                            {
                              "amount": "amount",
                              "type": "regular"
                            }
                          ],
                          "date": "date"
                        },
                        {
                          "amount": "amount",
                          "by_type": [
                            {
                              "amount": "amount",
                              "type": "regular"
                            },
                            {
                              "amount": "amount",
                              "type": "regular"
                            }
                          ],
                          "date": "date"
                        }
                      ]
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListReservesResponse(
            data: [
                AccountReserve(
                    amount: "amount",
                    byType: [
                        AccountReserveType(
                            amount: "amount",
                            holdPeriodDays: Nullable<Int>.value(1),
                            percentage: Nullable<Double>.value(1.1),
                            type: AccountReserveTypeType.regular
                        ),
                        AccountReserveType(
                            amount: "amount",
                            holdPeriodDays: Nullable<Int>.value(1),
                            percentage: Nullable<Double>.value(1.1),
                            type: AccountReserveTypeType.regular
                        )
                    ],
                    currency: "currency",
                    unlocksByDate: [
                        AccountReserveUnlock(
                            amount: "amount",
                            byType: [
                                AccountReserveUnlockType(
                                    amount: "amount",
                                    type: AccountReserveUnlockTypeType.regular
                                ),
                                AccountReserveUnlockType(
                                    amount: "amount",
                                    type: AccountReserveUnlockTypeType.regular
                                )
                            ],
                            date: "date"
                        ),
                        AccountReserveUnlock(
                            amount: "amount",
                            byType: [
                                AccountReserveUnlockType(
                                    amount: "amount",
                                    type: AccountReserveUnlockTypeType.regular
                                ),
                                AccountReserveUnlockType(
                                    amount: "amount",
                                    type: AccountReserveUnlockTypeType.regular
                                )
                            ],
                            date: "date"
                        )
                    ]
                ),
                AccountReserve(
                    amount: "amount",
                    byType: [
                        AccountReserveType(
                            amount: "amount",
                            holdPeriodDays: Nullable<Int>.value(1),
                            percentage: Nullable<Double>.value(1.1),
                            type: AccountReserveTypeType.regular
                        ),
                        AccountReserveType(
                            amount: "amount",
                            holdPeriodDays: Nullable<Int>.value(1),
                            percentage: Nullable<Double>.value(1.1),
                            type: AccountReserveTypeType.regular
                        )
                    ],
                    currency: "currency",
                    unlocksByDate: [
                        AccountReserveUnlock(
                            amount: "amount",
                            byType: [
                                AccountReserveUnlockType(
                                    amount: "amount",
                                    type: AccountReserveUnlockTypeType.regular
                                ),
                                AccountReserveUnlockType(
                                    amount: "amount",
                                    type: AccountReserveUnlockTypeType.regular
                                )
                            ],
                            date: "date"
                        ),
                        AccountReserveUnlock(
                            amount: "amount",
                            byType: [
                                AccountReserveUnlockType(
                                    amount: "amount",
                                    type: AccountReserveUnlockTypeType.regular
                                ),
                                AccountReserveUnlockType(
                                    amount: "amount",
                                    type: AccountReserveUnlockTypeType.regular
                                )
                            ],
                            date: "date"
                        )
                    ]
                )
            ]
        )
        let response = try await client.accounts.reserves.list(
            accountId: "account_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}