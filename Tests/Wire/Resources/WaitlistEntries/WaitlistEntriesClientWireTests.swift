import Foundation
import Testing
import WhopSDK

@Suite("WaitlistEntriesClient Wire Tests") struct WaitlistEntriesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "approval_failure_reason": "plan_unavailable",
                      "buyer_account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "route": "shine-time-auto-detailing",
                        "title": "Shine Time Auto Detailing"
                      },
                      "buyer_account_id": "buyer_account_id",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "custom_field_responses": [
                        {
                          "answer": "answer",
                          "id": "id",
                          "question": "question"
                        }
                      ],
                      "id": "entry_xxxxxxxxxxxxxx",
                      "membership_id": "membership_id",
                      "metadata": {
                        "key": "value"
                      },
                      "product": {
                        "id": "prod_xxxxxxxxxxxxxx",
                        "title": "Persevering actuating local..."
                      },
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "status": "pending",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "user": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "danawhitfield"
                      },
                      "user_id": "user_xxxxxxxxxxxxxx",
                      "variant": {
                        "billing_period": 30,
                        "billing_type": "renewal",
                        "description": null,
                        "id": "plan_xxxxxxxxxxxxxx",
                        "initial_price": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "renewal_price": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "title": null,
                        "trial_period_days": null
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx"
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
        let expectedResponse = ListWaitlistEntriesResponse(
            data: [
                WaitlistEntry(
                    accountId: "biz_xxxxxxxxxxxxxx",
                    approvalFailureReason: Nullable<WaitlistEntryApprovalFailureReason>.value(WaitlistEntryApprovalFailureReason.planUnavailable),
                    buyerAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        route: "shine-time-auto-detailing",
                        title: "Shine Time Auto Detailing"
                    )),
                    buyerAccountId: Nullable<String>.value("buyer_account_id"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    customFieldResponses: [
                        WaitlistEntryCustomFieldResponse(
                            answer: "answer",
                            id: "id",
                            question: "question"
                        )
                    ],
                    id: "entry_xxxxxxxxxxxxxx",
                    membershipId: Nullable<String>.value("membership_id"),
                    metadata: [
                        "key": JSONValue.string("value")
                    ],
                    product: Nullable<WaitlistEntryProduct>.value(WaitlistEntryProduct(
                        id: "prod_xxxxxxxxxxxxxx",
                        title: "Persevering actuating local..."
                    )),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    status: WaitlistEntryStatus.pending,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    user: UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    ),
                    userId: "user_xxxxxxxxxxxxxx",
                    variant: WaitlistEntryVariant(
                        billingPeriod: Nullable<Double>.value(30),
                        billingType: WaitlistEntryVariantBillingType.renewal,
                        description: .null,
                        id: "plan_xxxxxxxxxxxxxx",
                        initialPrice: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        renewalPrice: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        title: .null,
                        trialPeriodDays: .null
                    ),
                    variantId: "plan_xxxxxxxxxxxxxx"
                )
            ],
            pageInfo: ListWaitlistEntriesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.waitlistEntries.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "account_id": "account_id",
                      "approval_failure_reason": "plan_unavailable",
                      "buyer_account": {
                        "id": "id",
                        "logo_url": "logo_url",
                        "route": "route",
                        "title": "title"
                      },
                      "buyer_account_id": "buyer_account_id",
                      "created_at": "created_at",
                      "custom_field_responses": [
                        {
                          "answer": "answer",
                          "id": "id",
                          "question": "question"
                        },
                        {
                          "answer": "answer",
                          "id": "id",
                          "question": "question"
                        }
                      ],
                      "id": "id",
                      "membership_id": "membership_id",
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "product": {
                        "id": "id",
                        "title": "title"
                      },
                      "product_id": "product_id",
                      "status": "pending",
                      "updated_at": "updated_at",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "user_id": "user_id",
                      "variant": {
                        "billing_period": 1.1,
                        "billing_type": "renewal",
                        "description": "description",
                        "id": "id",
                        "initial_price": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "renewal_price": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "title": "title",
                        "trial_period_days": 1.1
                      },
                      "variant_id": "variant_id"
                    },
                    {
                      "account_id": "account_id",
                      "approval_failure_reason": "plan_unavailable",
                      "buyer_account": {
                        "id": "id",
                        "logo_url": "logo_url",
                        "route": "route",
                        "title": "title"
                      },
                      "buyer_account_id": "buyer_account_id",
                      "created_at": "created_at",
                      "custom_field_responses": [
                        {
                          "answer": "answer",
                          "id": "id",
                          "question": "question"
                        },
                        {
                          "answer": "answer",
                          "id": "id",
                          "question": "question"
                        }
                      ],
                      "id": "id",
                      "membership_id": "membership_id",
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "product": {
                        "id": "id",
                        "title": "title"
                      },
                      "product_id": "product_id",
                      "status": "pending",
                      "updated_at": "updated_at",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "user_id": "user_id",
                      "variant": {
                        "billing_period": 1.1,
                        "billing_type": "renewal",
                        "description": "description",
                        "id": "id",
                        "initial_price": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "renewal_price": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "title": "title",
                        "trial_period_days": 1.1
                      },
                      "variant_id": "variant_id"
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
        let expectedResponse = ListWaitlistEntriesResponse(
            data: [
                WaitlistEntry(
                    accountId: "account_id",
                    approvalFailureReason: Nullable<WaitlistEntryApprovalFailureReason>.value(WaitlistEntryApprovalFailureReason.planUnavailable),
                    buyerAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        route: "route",
                        title: "title"
                    )),
                    buyerAccountId: Nullable<String>.value("buyer_account_id"),
                    createdAt: "created_at",
                    customFieldResponses: [
                        WaitlistEntryCustomFieldResponse(
                            answer: "answer",
                            id: "id",
                            question: "question"
                        ),
                        WaitlistEntryCustomFieldResponse(
                            answer: "answer",
                            id: "id",
                            question: "question"
                        )
                    ],
                    id: "id",
                    membershipId: Nullable<String>.value("membership_id"),
                    metadata: [
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    product: Nullable<WaitlistEntryProduct>.value(WaitlistEntryProduct(
                        id: "id",
                        title: "title"
                    )),
                    productId: Nullable<String>.value("product_id"),
                    status: WaitlistEntryStatus.pending,
                    updatedAt: "updated_at",
                    user: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    ),
                    userId: "user_id",
                    variant: WaitlistEntryVariant(
                        billingPeriod: Nullable<Double>.value(1.1),
                        billingType: WaitlistEntryVariantBillingType.renewal,
                        description: Nullable<String>.value("description"),
                        id: "id",
                        initialPrice: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        renewalPrice: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        title: Nullable<String>.value("title"),
                        trialPeriodDays: Nullable<Double>.value(1.1)
                    ),
                    variantId: "variant_id"
                ),
                WaitlistEntry(
                    accountId: "account_id",
                    approvalFailureReason: Nullable<WaitlistEntryApprovalFailureReason>.value(WaitlistEntryApprovalFailureReason.planUnavailable),
                    buyerAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        route: "route",
                        title: "title"
                    )),
                    buyerAccountId: Nullable<String>.value("buyer_account_id"),
                    createdAt: "created_at",
                    customFieldResponses: [
                        WaitlistEntryCustomFieldResponse(
                            answer: "answer",
                            id: "id",
                            question: "question"
                        ),
                        WaitlistEntryCustomFieldResponse(
                            answer: "answer",
                            id: "id",
                            question: "question"
                        )
                    ],
                    id: "id",
                    membershipId: Nullable<String>.value("membership_id"),
                    metadata: [
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    product: Nullable<WaitlistEntryProduct>.value(WaitlistEntryProduct(
                        id: "id",
                        title: "title"
                    )),
                    productId: Nullable<String>.value("product_id"),
                    status: WaitlistEntryStatus.pending,
                    updatedAt: "updated_at",
                    user: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    ),
                    userId: "user_id",
                    variant: WaitlistEntryVariant(
                        billingPeriod: Nullable<Double>.value(1.1),
                        billingType: WaitlistEntryVariantBillingType.renewal,
                        description: Nullable<String>.value("description"),
                        id: "id",
                        initialPrice: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        renewalPrice: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        title: Nullable<String>.value("title"),
                        trialPeriodDays: Nullable<Double>.value(1.1)
                    ),
                    variantId: "variant_id"
                )
            ],
            pageInfo: ListWaitlistEntriesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.waitlistEntries.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "approval_failure_reason": "plan_unavailable",
                  "buyer_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "buyer_account_id": "buyer_account_id",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_field_responses": [
                    {
                      "answer": "answer",
                      "id": "id",
                      "question": "question"
                    }
                  ],
                  "id": "entry_xxxxxxxxxxxxxx",
                  "membership_id": "membership_id",
                  "metadata": {
                    "key": "value"
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "title": "Persevering actuating local..."
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "status": "pending",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_id": "user_xxxxxxxxxxxxxx",
                  "variant": {
                    "billing_period": 30,
                    "billing_type": "renewal",
                    "description": "description",
                    "id": "plan_xxxxxxxxxxxxxx",
                    "initial_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "renewal_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "title": "title",
                    "trial_period_days": 1.1
                  },
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = WaitlistEntry(
            accountId: "biz_xxxxxxxxxxxxxx",
            approvalFailureReason: Nullable<WaitlistEntryApprovalFailureReason>.value(WaitlistEntryApprovalFailureReason.planUnavailable),
            buyerAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            buyerAccountId: Nullable<String>.value("buyer_account_id"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customFieldResponses: [
                WaitlistEntryCustomFieldResponse(
                    answer: "answer",
                    id: "id",
                    question: "question"
                )
            ],
            id: "entry_xxxxxxxxxxxxxx",
            membershipId: Nullable<String>.value("membership_id"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            product: Nullable<WaitlistEntryProduct>.value(WaitlistEntryProduct(
                id: "prod_xxxxxxxxxxxxxx",
                title: "Persevering actuating local..."
            )),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            status: WaitlistEntryStatus.pending,
            updatedAt: "2026-01-01T12:00:00.000Z",
            user: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            userId: "user_xxxxxxxxxxxxxx",
            variant: WaitlistEntryVariant(
                billingPeriod: Nullable<Double>.value(30),
                billingType: WaitlistEntryVariantBillingType.renewal,
                description: Nullable<String>.value("description"),
                id: "plan_xxxxxxxxxxxxxx",
                initialPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                renewalPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1)
            ),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.waitlistEntries.create(
            request: .init(variantId: "plan_xxxxxxxxxxxxxx"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "approval_failure_reason": "plan_unavailable",
                  "buyer_account": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "buyer_account_id": "buyer_account_id",
                  "created_at": "created_at",
                  "custom_field_responses": [
                    {
                      "answer": "answer",
                      "id": "id",
                      "question": "question"
                    },
                    {
                      "answer": "answer",
                      "id": "id",
                      "question": "question"
                    }
                  ],
                  "id": "id",
                  "membership_id": "membership_id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "product": {
                    "id": "id",
                    "title": "title"
                  },
                  "product_id": "product_id",
                  "status": "pending",
                  "updated_at": "updated_at",
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "user_id": "user_id",
                  "variant": {
                    "billing_period": 1.1,
                    "billing_type": "renewal",
                    "description": "description",
                    "id": "id",
                    "initial_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "renewal_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "title": "title",
                    "trial_period_days": 1.1
                  },
                  "variant_id": "variant_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = WaitlistEntry(
            accountId: "account_id",
            approvalFailureReason: Nullable<WaitlistEntryApprovalFailureReason>.value(WaitlistEntryApprovalFailureReason.planUnavailable),
            buyerAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            )),
            buyerAccountId: Nullable<String>.value("buyer_account_id"),
            createdAt: "created_at",
            customFieldResponses: [
                WaitlistEntryCustomFieldResponse(
                    answer: "answer",
                    id: "id",
                    question: "question"
                ),
                WaitlistEntryCustomFieldResponse(
                    answer: "answer",
                    id: "id",
                    question: "question"
                )
            ],
            id: "id",
            membershipId: Nullable<String>.value("membership_id"),
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            product: Nullable<WaitlistEntryProduct>.value(WaitlistEntryProduct(
                id: "id",
                title: "title"
            )),
            productId: Nullable<String>.value("product_id"),
            status: WaitlistEntryStatus.pending,
            updatedAt: "updated_at",
            user: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            userId: "user_id",
            variant: WaitlistEntryVariant(
                billingPeriod: Nullable<Double>.value(1.1),
                billingType: WaitlistEntryVariantBillingType.renewal,
                description: Nullable<String>.value("description"),
                id: "id",
                initialPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                renewalPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1)
            ),
            variantId: "variant_id"
        )
        let response = try await client.waitlistEntries.create(
            request: .init(variantId: "variant_id"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func approveAll1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "queued": true,
                  "variant_id": "variant_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ApproveAllWaitlistEntriesResponse(
            accountId: "biz_xxxxxxxxxxxxxx",
            queued: true,
            variantId: Nullable<String>.value("variant_id")
        )
        let response = try await client.waitlistEntries.approveAll(
            request: .init(accountId: "biz_xxxxxxxxxxxxxx"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func approveAll2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "queued": true,
                  "variant_id": "variant_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ApproveAllWaitlistEntriesResponse(
            accountId: "account_id",
            queued: true,
            variantId: Nullable<String>.value("variant_id")
        )
        let response = try await client.waitlistEntries.approveAll(
            request: .init(accountId: "account_id"),
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
                  "approval_failure_reason": "plan_unavailable",
                  "buyer_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "buyer_account_id": "buyer_account_id",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_field_responses": [
                    {
                      "answer": "answer",
                      "id": "id",
                      "question": "question"
                    }
                  ],
                  "id": "entry_xxxxxxxxxxxxxx",
                  "membership_id": "membership_id",
                  "metadata": {
                    "key": "value"
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "title": "Persevering actuating local..."
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "status": "pending",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_id": "user_xxxxxxxxxxxxxx",
                  "variant": {
                    "billing_period": 30,
                    "billing_type": "renewal",
                    "description": "description",
                    "id": "plan_xxxxxxxxxxxxxx",
                    "initial_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "renewal_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "title": "title",
                    "trial_period_days": 1.1
                  },
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = WaitlistEntry(
            accountId: "biz_xxxxxxxxxxxxxx",
            approvalFailureReason: Nullable<WaitlistEntryApprovalFailureReason>.value(WaitlistEntryApprovalFailureReason.planUnavailable),
            buyerAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            buyerAccountId: Nullable<String>.value("buyer_account_id"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customFieldResponses: [
                WaitlistEntryCustomFieldResponse(
                    answer: "answer",
                    id: "id",
                    question: "question"
                )
            ],
            id: "entry_xxxxxxxxxxxxxx",
            membershipId: Nullable<String>.value("membership_id"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            product: Nullable<WaitlistEntryProduct>.value(WaitlistEntryProduct(
                id: "prod_xxxxxxxxxxxxxx",
                title: "Persevering actuating local..."
            )),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            status: WaitlistEntryStatus.pending,
            updatedAt: "2026-01-01T12:00:00.000Z",
            user: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            userId: "user_xxxxxxxxxxxxxx",
            variant: WaitlistEntryVariant(
                billingPeriod: Nullable<Double>.value(30),
                billingType: WaitlistEntryVariantBillingType.renewal,
                description: Nullable<String>.value("description"),
                id: "plan_xxxxxxxxxxxxxx",
                initialPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                renewalPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1)
            ),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.waitlistEntries.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retrieve2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "approval_failure_reason": "plan_unavailable",
                  "buyer_account": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "buyer_account_id": "buyer_account_id",
                  "created_at": "created_at",
                  "custom_field_responses": [
                    {
                      "answer": "answer",
                      "id": "id",
                      "question": "question"
                    },
                    {
                      "answer": "answer",
                      "id": "id",
                      "question": "question"
                    }
                  ],
                  "id": "id",
                  "membership_id": "membership_id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "product": {
                    "id": "id",
                    "title": "title"
                  },
                  "product_id": "product_id",
                  "status": "pending",
                  "updated_at": "updated_at",
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "user_id": "user_id",
                  "variant": {
                    "billing_period": 1.1,
                    "billing_type": "renewal",
                    "description": "description",
                    "id": "id",
                    "initial_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "renewal_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "title": "title",
                    "trial_period_days": 1.1
                  },
                  "variant_id": "variant_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = WaitlistEntry(
            accountId: "account_id",
            approvalFailureReason: Nullable<WaitlistEntryApprovalFailureReason>.value(WaitlistEntryApprovalFailureReason.planUnavailable),
            buyerAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            )),
            buyerAccountId: Nullable<String>.value("buyer_account_id"),
            createdAt: "created_at",
            customFieldResponses: [
                WaitlistEntryCustomFieldResponse(
                    answer: "answer",
                    id: "id",
                    question: "question"
                ),
                WaitlistEntryCustomFieldResponse(
                    answer: "answer",
                    id: "id",
                    question: "question"
                )
            ],
            id: "id",
            membershipId: Nullable<String>.value("membership_id"),
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            product: Nullable<WaitlistEntryProduct>.value(WaitlistEntryProduct(
                id: "id",
                title: "title"
            )),
            productId: Nullable<String>.value("product_id"),
            status: WaitlistEntryStatus.pending,
            updatedAt: "updated_at",
            user: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            userId: "user_id",
            variant: WaitlistEntryVariant(
                billingPeriod: Nullable<Double>.value(1.1),
                billingType: WaitlistEntryVariantBillingType.renewal,
                description: Nullable<String>.value("description"),
                id: "id",
                initialPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                renewalPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1)
            ),
            variantId: "variant_id"
        )
        let response = try await client.waitlistEntries.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func approve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "approval_failure_reason": "plan_unavailable",
                  "buyer_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "buyer_account_id": "buyer_account_id",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_field_responses": [
                    {
                      "answer": "answer",
                      "id": "id",
                      "question": "question"
                    }
                  ],
                  "id": "entry_xxxxxxxxxxxxxx",
                  "membership_id": "membership_id",
                  "metadata": {
                    "key": "value"
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "title": "Persevering actuating local..."
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "status": "pending",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_id": "user_xxxxxxxxxxxxxx",
                  "variant": {
                    "billing_period": 30,
                    "billing_type": "renewal",
                    "description": "description",
                    "id": "plan_xxxxxxxxxxxxxx",
                    "initial_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "renewal_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "title": "title",
                    "trial_period_days": 1.1
                  },
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = WaitlistEntry(
            accountId: "biz_xxxxxxxxxxxxxx",
            approvalFailureReason: Nullable<WaitlistEntryApprovalFailureReason>.value(WaitlistEntryApprovalFailureReason.planUnavailable),
            buyerAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            buyerAccountId: Nullable<String>.value("buyer_account_id"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customFieldResponses: [
                WaitlistEntryCustomFieldResponse(
                    answer: "answer",
                    id: "id",
                    question: "question"
                )
            ],
            id: "entry_xxxxxxxxxxxxxx",
            membershipId: Nullable<String>.value("membership_id"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            product: Nullable<WaitlistEntryProduct>.value(WaitlistEntryProduct(
                id: "prod_xxxxxxxxxxxxxx",
                title: "Persevering actuating local..."
            )),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            status: WaitlistEntryStatus.pending,
            updatedAt: "2026-01-01T12:00:00.000Z",
            user: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            userId: "user_xxxxxxxxxxxxxx",
            variant: WaitlistEntryVariant(
                billingPeriod: Nullable<Double>.value(30),
                billingType: WaitlistEntryVariantBillingType.renewal,
                description: Nullable<String>.value("description"),
                id: "plan_xxxxxxxxxxxxxx",
                initialPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                renewalPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1)
            ),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.waitlistEntries.approve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func approve2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "approval_failure_reason": "plan_unavailable",
                  "buyer_account": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "buyer_account_id": "buyer_account_id",
                  "created_at": "created_at",
                  "custom_field_responses": [
                    {
                      "answer": "answer",
                      "id": "id",
                      "question": "question"
                    },
                    {
                      "answer": "answer",
                      "id": "id",
                      "question": "question"
                    }
                  ],
                  "id": "id",
                  "membership_id": "membership_id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "product": {
                    "id": "id",
                    "title": "title"
                  },
                  "product_id": "product_id",
                  "status": "pending",
                  "updated_at": "updated_at",
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "user_id": "user_id",
                  "variant": {
                    "billing_period": 1.1,
                    "billing_type": "renewal",
                    "description": "description",
                    "id": "id",
                    "initial_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "renewal_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "title": "title",
                    "trial_period_days": 1.1
                  },
                  "variant_id": "variant_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = WaitlistEntry(
            accountId: "account_id",
            approvalFailureReason: Nullable<WaitlistEntryApprovalFailureReason>.value(WaitlistEntryApprovalFailureReason.planUnavailable),
            buyerAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            )),
            buyerAccountId: Nullable<String>.value("buyer_account_id"),
            createdAt: "created_at",
            customFieldResponses: [
                WaitlistEntryCustomFieldResponse(
                    answer: "answer",
                    id: "id",
                    question: "question"
                ),
                WaitlistEntryCustomFieldResponse(
                    answer: "answer",
                    id: "id",
                    question: "question"
                )
            ],
            id: "id",
            membershipId: Nullable<String>.value("membership_id"),
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            product: Nullable<WaitlistEntryProduct>.value(WaitlistEntryProduct(
                id: "id",
                title: "title"
            )),
            productId: Nullable<String>.value("product_id"),
            status: WaitlistEntryStatus.pending,
            updatedAt: "updated_at",
            user: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            userId: "user_id",
            variant: WaitlistEntryVariant(
                billingPeriod: Nullable<Double>.value(1.1),
                billingType: WaitlistEntryVariantBillingType.renewal,
                description: Nullable<String>.value("description"),
                id: "id",
                initialPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                renewalPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1)
            ),
            variantId: "variant_id"
        )
        let response = try await client.waitlistEntries.approve(
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "approval_failure_reason": "plan_unavailable",
                  "buyer_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "buyer_account_id": "buyer_account_id",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_field_responses": [
                    {
                      "answer": "answer",
                      "id": "id",
                      "question": "question"
                    }
                  ],
                  "id": "entry_xxxxxxxxxxxxxx",
                  "membership_id": "membership_id",
                  "metadata": {
                    "key": "value"
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "title": "Persevering actuating local..."
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "status": "pending",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_id": "user_xxxxxxxxxxxxxx",
                  "variant": {
                    "billing_period": 30,
                    "billing_type": "renewal",
                    "description": "description",
                    "id": "plan_xxxxxxxxxxxxxx",
                    "initial_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "renewal_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "title": "title",
                    "trial_period_days": 1.1
                  },
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = WaitlistEntry(
            accountId: "biz_xxxxxxxxxxxxxx",
            approvalFailureReason: Nullable<WaitlistEntryApprovalFailureReason>.value(WaitlistEntryApprovalFailureReason.planUnavailable),
            buyerAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            buyerAccountId: Nullable<String>.value("buyer_account_id"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customFieldResponses: [
                WaitlistEntryCustomFieldResponse(
                    answer: "answer",
                    id: "id",
                    question: "question"
                )
            ],
            id: "entry_xxxxxxxxxxxxxx",
            membershipId: Nullable<String>.value("membership_id"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            product: Nullable<WaitlistEntryProduct>.value(WaitlistEntryProduct(
                id: "prod_xxxxxxxxxxxxxx",
                title: "Persevering actuating local..."
            )),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            status: WaitlistEntryStatus.pending,
            updatedAt: "2026-01-01T12:00:00.000Z",
            user: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            userId: "user_xxxxxxxxxxxxxx",
            variant: WaitlistEntryVariant(
                billingPeriod: Nullable<Double>.value(30),
                billingType: WaitlistEntryVariantBillingType.renewal,
                description: Nullable<String>.value("description"),
                id: "plan_xxxxxxxxxxxxxx",
                initialPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                renewalPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1)
            ),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.waitlistEntries.cancel(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func cancel2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "approval_failure_reason": "plan_unavailable",
                  "buyer_account": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "buyer_account_id": "buyer_account_id",
                  "created_at": "created_at",
                  "custom_field_responses": [
                    {
                      "answer": "answer",
                      "id": "id",
                      "question": "question"
                    },
                    {
                      "answer": "answer",
                      "id": "id",
                      "question": "question"
                    }
                  ],
                  "id": "id",
                  "membership_id": "membership_id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "product": {
                    "id": "id",
                    "title": "title"
                  },
                  "product_id": "product_id",
                  "status": "pending",
                  "updated_at": "updated_at",
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "user_id": "user_id",
                  "variant": {
                    "billing_period": 1.1,
                    "billing_type": "renewal",
                    "description": "description",
                    "id": "id",
                    "initial_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "renewal_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "title": "title",
                    "trial_period_days": 1.1
                  },
                  "variant_id": "variant_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = WaitlistEntry(
            accountId: "account_id",
            approvalFailureReason: Nullable<WaitlistEntryApprovalFailureReason>.value(WaitlistEntryApprovalFailureReason.planUnavailable),
            buyerAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            )),
            buyerAccountId: Nullable<String>.value("buyer_account_id"),
            createdAt: "created_at",
            customFieldResponses: [
                WaitlistEntryCustomFieldResponse(
                    answer: "answer",
                    id: "id",
                    question: "question"
                ),
                WaitlistEntryCustomFieldResponse(
                    answer: "answer",
                    id: "id",
                    question: "question"
                )
            ],
            id: "id",
            membershipId: Nullable<String>.value("membership_id"),
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            product: Nullable<WaitlistEntryProduct>.value(WaitlistEntryProduct(
                id: "id",
                title: "title"
            )),
            productId: Nullable<String>.value("product_id"),
            status: WaitlistEntryStatus.pending,
            updatedAt: "updated_at",
            user: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            userId: "user_id",
            variant: WaitlistEntryVariant(
                billingPeriod: Nullable<Double>.value(1.1),
                billingType: WaitlistEntryVariantBillingType.renewal,
                description: Nullable<String>.value("description"),
                id: "id",
                initialPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                renewalPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1)
            ),
            variantId: "variant_id"
        )
        let response = try await client.waitlistEntries.cancel(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func deny1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "approval_failure_reason": "plan_unavailable",
                  "buyer_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "buyer_account_id": "buyer_account_id",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_field_responses": [
                    {
                      "answer": "answer",
                      "id": "id",
                      "question": "question"
                    }
                  ],
                  "id": "entry_xxxxxxxxxxxxxx",
                  "membership_id": "membership_id",
                  "metadata": {
                    "key": "value"
                  },
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "title": "Persevering actuating local..."
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "status": "pending",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_id": "user_xxxxxxxxxxxxxx",
                  "variant": {
                    "billing_period": 30,
                    "billing_type": "renewal",
                    "description": "description",
                    "id": "plan_xxxxxxxxxxxxxx",
                    "initial_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "renewal_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "title": "title",
                    "trial_period_days": 1.1
                  },
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = WaitlistEntry(
            accountId: "biz_xxxxxxxxxxxxxx",
            approvalFailureReason: Nullable<WaitlistEntryApprovalFailureReason>.value(WaitlistEntryApprovalFailureReason.planUnavailable),
            buyerAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            buyerAccountId: Nullable<String>.value("buyer_account_id"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customFieldResponses: [
                WaitlistEntryCustomFieldResponse(
                    answer: "answer",
                    id: "id",
                    question: "question"
                )
            ],
            id: "entry_xxxxxxxxxxxxxx",
            membershipId: Nullable<String>.value("membership_id"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            product: Nullable<WaitlistEntryProduct>.value(WaitlistEntryProduct(
                id: "prod_xxxxxxxxxxxxxx",
                title: "Persevering actuating local..."
            )),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            status: WaitlistEntryStatus.pending,
            updatedAt: "2026-01-01T12:00:00.000Z",
            user: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            userId: "user_xxxxxxxxxxxxxx",
            variant: WaitlistEntryVariant(
                billingPeriod: Nullable<Double>.value(30),
                billingType: WaitlistEntryVariantBillingType.renewal,
                description: Nullable<String>.value("description"),
                id: "plan_xxxxxxxxxxxxxx",
                initialPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                renewalPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1)
            ),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.waitlistEntries.deny(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func deny2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "approval_failure_reason": "plan_unavailable",
                  "buyer_account": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "buyer_account_id": "buyer_account_id",
                  "created_at": "created_at",
                  "custom_field_responses": [
                    {
                      "answer": "answer",
                      "id": "id",
                      "question": "question"
                    },
                    {
                      "answer": "answer",
                      "id": "id",
                      "question": "question"
                    }
                  ],
                  "id": "id",
                  "membership_id": "membership_id",
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "product": {
                    "id": "id",
                    "title": "title"
                  },
                  "product_id": "product_id",
                  "status": "pending",
                  "updated_at": "updated_at",
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "user_id": "user_id",
                  "variant": {
                    "billing_period": 1.1,
                    "billing_type": "renewal",
                    "description": "description",
                    "id": "id",
                    "initial_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "renewal_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "title": "title",
                    "trial_period_days": 1.1
                  },
                  "variant_id": "variant_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = WaitlistEntry(
            accountId: "account_id",
            approvalFailureReason: Nullable<WaitlistEntryApprovalFailureReason>.value(WaitlistEntryApprovalFailureReason.planUnavailable),
            buyerAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            )),
            buyerAccountId: Nullable<String>.value("buyer_account_id"),
            createdAt: "created_at",
            customFieldResponses: [
                WaitlistEntryCustomFieldResponse(
                    answer: "answer",
                    id: "id",
                    question: "question"
                ),
                WaitlistEntryCustomFieldResponse(
                    answer: "answer",
                    id: "id",
                    question: "question"
                )
            ],
            id: "id",
            membershipId: Nullable<String>.value("membership_id"),
            metadata: [
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            product: Nullable<WaitlistEntryProduct>.value(WaitlistEntryProduct(
                id: "id",
                title: "title"
            )),
            productId: Nullable<String>.value("product_id"),
            status: WaitlistEntryStatus.pending,
            updatedAt: "updated_at",
            user: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            userId: "user_id",
            variant: WaitlistEntryVariant(
                billingPeriod: Nullable<Double>.value(1.1),
                billingType: WaitlistEntryVariantBillingType.renewal,
                description: Nullable<String>.value("description"),
                id: "id",
                initialPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                renewalPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1)
            ),
            variantId: "variant_id"
        )
        let response = try await client.waitlistEntries.deny(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}