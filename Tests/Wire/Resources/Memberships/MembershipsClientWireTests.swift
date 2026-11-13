import Foundation
import Testing
import WhopSDK

@Suite("MembershipsClient Wire Tests") struct MembershipsClientWireTests {
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
                        "route": "shine-time-auto-detailing",
                        "title": "Shine Time Auto Detailing"
                      },
                      "affiliate": {
                        "applies_to_payments": "first_payment",
                        "commission_amount": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "commission_percentage": null,
                        "commission_source": "custom",
                        "commission_type": "flat_fee",
                        "enabled": true,
                        "id": "id",
                        "user_id": "user_id"
                      },
                      "billing_period_days": 30,
                      "cancel_at_period_end": true,
                      "cancel_option": "too_expensive",
                      "canceled_at": "2026-01-01T12:00:00.000Z",
                      "cancellation_reason": "Too expensive",
                      "collection_method": "charge_automatically",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "current_period_end": "2026-01-01T12:00:00.000Z",
                      "current_period_start": "2026-01-01T12:00:00.000Z",
                      "expires_at": "2026-01-01T12:00:00.000Z",
                      "external_accounts": [
                        {
                          "external_id": "7012345678",
                          "platform": "discord",
                          "username": "telegram_username1"
                        }
                      ],
                      "feedback_option": {
                        "label": "The wash club costs more than I can spend"
                      },
                      "id": "mem_xxxxxxxxxxxxxx",
                      "initial_price": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "license_key": "WHOP-XXXX-XXXX-XXXX",
                      "manage_url": "https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx",
                      "member": {
                        "access_level": "no_access",
                        "last_accessed_at": "2026-01-01T12:00:00.000Z",
                        "position": 1767268800000
                      },
                      "member_id": "mber_xxxxxxxxxxxxxx",
                      "metadata": {
                        "key": "value"
                      },
                      "most_recent_action": "canceled_on",
                      "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                      "phone_number": "+xxxxxxxxxxx",
                      "product": {
                        "id": "prod_xxxxxxxxxxxxxx",
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "title": "Ceramic Coating Package"
                      },
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "promo_code_id": "promo_xxxxxxxxxxxxxx",
                      "renewal_price": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "split_pay_current_payments": 1,
                      "split_pay_required_payments": 1,
                      "status": "trialing",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "user_id": "user_xxxxxxxxxxxxxx",
                      "variant_id": "plan_xxxxxxxxxxxxxx"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "WyJjdXJzb3IiLDFd",
                    "total_count": 1,
                    "total_count_capped": true
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
        let expectedResponse = ListMembershipsResponse(
            data: [
                Membership(
                    account: StorefrontAccount(
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        route: "shine-time-auto-detailing",
                        title: "Shine Time Auto Detailing"
                    ),
                    affiliate: Nullable<MembershipAffiliate>.value(MembershipAffiliate(
                        appliesToPayments: MembershipAffiliateAppliesToPayments.firstPayment,
                        commissionAmount: Nullable<Money>.value(Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        commissionPercentage: .null,
                        commissionSource: MembershipAffiliateCommissionSource.custom,
                        commissionType: MembershipAffiliateCommissionType.flatFee,
                        enabled: true,
                        id: "id",
                        userId: "user_id"
                    )),
                    billingPeriodDays: Nullable<Int>.value(30),
                    cancelAtPeriodEnd: true,
                    cancelOption: Nullable<MembershipCancelOption>.value(MembershipCancelOption.tooExpensive),
                    canceledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    cancellationReason: Nullable<String>.value("Too expensive"),
                    collectionMethod: Nullable<MembershipCollectionMethod>.value(MembershipCollectionMethod.chargeAutomatically),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    currentPeriodStart: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    externalAccounts: Nullable<[MembershipExternalAccount]>.value([
                        MembershipExternalAccount(
                            externalId: "7012345678",
                            platform: MembershipExternalAccountPlatform.discord,
                            username: Nullable<String>.value("telegram_username1")
                        )
                    ]),
                    feedbackOption: Nullable<MembershipFeedbackOption>.value(MembershipFeedbackOption(
                        label: "The wash club costs more than I can spend"
                    )),
                    id: "mem_xxxxxxxxxxxxxx",
                    initialPrice: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
                    manageUrl: Nullable<String>.value("https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx"),
                    member: Nullable<MembershipMember>.value(MembershipMember(
                        accessLevel: MembershipMemberAccessLevel.noAccess,
                        lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                        position: Nullable<Double>.value(1767268800000)
                    )),
                    memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                    metadata: [
                        "key": JSONValue.string("value")
                    ],
                    mostRecentAction: Nullable<MembershipMostRecentAction>.value(MembershipMostRecentAction.canceledOn),
                    mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
                    product: MembershipProduct(
                        id: "prod_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        title: "Ceramic Coating Package"
                    ),
                    productId: "prod_xxxxxxxxxxxxxx",
                    promoCodeId: Nullable<String>.value("promo_xxxxxxxxxxxxxx"),
                    renewalPrice: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    splitPayCurrentPayments: Nullable<Int>.value(1),
                    splitPayRequiredPayments: Nullable<Int>.value(1),
                    status: MembershipStatus.trialing,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                    variantId: "plan_xxxxxxxxxxxxxx"
                )
            ],
            pageInfo: ListMembershipsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                totalCount: Nullable<Int>.value(1),
                totalCountCapped: true
            )
        )
        let response = try await client.memberships.list(
            externalAccount: "discord_123456789012345678",
            productIds: [
                "prod_xxxxxxxxxxxxx"
            ],
            variantIds: [
                "plan_xxxxxxxxxxxxx"
            ],
            promoCodeIds: [
                "promo_xxxxxxxxxxxxxx"
            ],
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func invite1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "invitation_sent": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = InviteMembershipsResponse(
            invitationSent: true
        )
        let response = try await client.memberships.invite(
            request: .init(variantId: "plan_xxxxxxxxxxxxxx"),
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "affiliate": {
                    "applies_to_payments": "first_payment",
                    "commission_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "commission_percentage": 1.1,
                    "commission_source": "custom",
                    "commission_type": "flat_fee",
                    "enabled": true,
                    "id": "id",
                    "user_id": "user_id"
                  },
                  "billing_period_days": 30,
                  "cancel_at_period_end": true,
                  "cancel_option": "too_expensive",
                  "canceled_at": "2026-01-01T12:00:00.000Z",
                  "cancellation_reason": "Too expensive",
                  "collection_method": "charge_automatically",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "current_period_start": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "external_accounts": [
                    {
                      "external_id": "7012345678",
                      "platform": "discord",
                      "username": "telegram_username1"
                    }
                  ],
                  "feedback_option": {
                    "label": "The wash club costs more than I can spend"
                  },
                  "id": "mem_xxxxxxxxxxxxxx",
                  "initial_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "manage_url": "https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "most_recent_action": "canceled_on",
                  "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                  "phone_number": "+xxxxxxxxxxx",
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_xxxxxxxxxxxxxx",
                  "renewal_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "split_pay_current_payments": 1,
                  "split_pay_required_payments": 1,
                  "status": "trialing",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_xxxxxxxxxxxxxx",
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
        let expectedResponse = Membership(
            account: StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            affiliate: Nullable<MembershipAffiliate>.value(MembershipAffiliate(
                appliesToPayments: MembershipAffiliateAppliesToPayments.firstPayment,
                commissionAmount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                commissionPercentage: Nullable<Double>.value(1.1),
                commissionSource: MembershipAffiliateCommissionSource.custom,
                commissionType: MembershipAffiliateCommissionType.flatFee,
                enabled: true,
                id: "id",
                userId: "user_id"
            )),
            billingPeriodDays: Nullable<Int>.value(30),
            cancelAtPeriodEnd: true,
            cancelOption: Nullable<MembershipCancelOption>.value(MembershipCancelOption.tooExpensive),
            canceledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            cancellationReason: Nullable<String>.value("Too expensive"),
            collectionMethod: Nullable<MembershipCollectionMethod>.value(MembershipCollectionMethod.chargeAutomatically),
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            currentPeriodStart: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            externalAccounts: Nullable<[MembershipExternalAccount]>.value([
                MembershipExternalAccount(
                    externalId: "7012345678",
                    platform: MembershipExternalAccountPlatform.discord,
                    username: Nullable<String>.value("telegram_username1")
                )
            ]),
            feedbackOption: Nullable<MembershipFeedbackOption>.value(MembershipFeedbackOption(
                label: "The wash club costs more than I can spend"
            )),
            id: "mem_xxxxxxxxxxxxxx",
            initialPrice: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            manageUrl: Nullable<String>.value("https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            mostRecentAction: Nullable<MembershipMostRecentAction>.value(MembershipMostRecentAction.canceledOn),
            mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
            product: MembershipProduct(
                id: "prod_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                title: "Ceramic Coating Package"
            ),
            productId: "prod_xxxxxxxxxxxxxx",
            promoCodeId: Nullable<String>.value("promo_xxxxxxxxxxxxxx"),
            renewalPrice: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            splitPayCurrentPayments: Nullable<Int>.value(1),
            splitPayRequiredPayments: Nullable<Int>.value(1),
            status: MembershipStatus.trialing,
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.memberships.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "affiliate": {
                    "applies_to_payments": "first_payment",
                    "commission_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "commission_percentage": 1.1,
                    "commission_source": "custom",
                    "commission_type": "flat_fee",
                    "enabled": true,
                    "id": "id",
                    "user_id": "user_id"
                  },
                  "billing_period_days": 30,
                  "cancel_at_period_end": true,
                  "cancel_option": "too_expensive",
                  "canceled_at": "2026-01-01T12:00:00.000Z",
                  "cancellation_reason": "Too expensive",
                  "collection_method": "charge_automatically",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "current_period_start": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "external_accounts": [
                    {
                      "external_id": "7012345678",
                      "platform": "discord",
                      "username": "telegram_username1"
                    }
                  ],
                  "feedback_option": {
                    "label": "The wash club costs more than I can spend"
                  },
                  "id": "mem_xxxxxxxxxxxxxx",
                  "initial_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "manage_url": "https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "most_recent_action": "canceled_on",
                  "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                  "phone_number": "+xxxxxxxxxxx",
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_xxxxxxxxxxxxxx",
                  "renewal_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "split_pay_current_payments": 1,
                  "split_pay_required_payments": 1,
                  "status": "trialing",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_xxxxxxxxxxxxxx",
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
        let expectedResponse = Membership(
            account: StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            affiliate: Nullable<MembershipAffiliate>.value(MembershipAffiliate(
                appliesToPayments: MembershipAffiliateAppliesToPayments.firstPayment,
                commissionAmount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                commissionPercentage: Nullable<Double>.value(1.1),
                commissionSource: MembershipAffiliateCommissionSource.custom,
                commissionType: MembershipAffiliateCommissionType.flatFee,
                enabled: true,
                id: "id",
                userId: "user_id"
            )),
            billingPeriodDays: Nullable<Int>.value(30),
            cancelAtPeriodEnd: true,
            cancelOption: Nullable<MembershipCancelOption>.value(MembershipCancelOption.tooExpensive),
            canceledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            cancellationReason: Nullable<String>.value("Too expensive"),
            collectionMethod: Nullable<MembershipCollectionMethod>.value(MembershipCollectionMethod.chargeAutomatically),
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            currentPeriodStart: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            externalAccounts: Nullable<[MembershipExternalAccount]>.value([
                MembershipExternalAccount(
                    externalId: "7012345678",
                    platform: MembershipExternalAccountPlatform.discord,
                    username: Nullable<String>.value("telegram_username1")
                )
            ]),
            feedbackOption: Nullable<MembershipFeedbackOption>.value(MembershipFeedbackOption(
                label: "The wash club costs more than I can spend"
            )),
            id: "mem_xxxxxxxxxxxxxx",
            initialPrice: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            manageUrl: Nullable<String>.value("https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            mostRecentAction: Nullable<MembershipMostRecentAction>.value(MembershipMostRecentAction.canceledOn),
            mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
            product: MembershipProduct(
                id: "prod_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                title: "Ceramic Coating Package"
            ),
            productId: "prod_xxxxxxxxxxxxxx",
            promoCodeId: Nullable<String>.value("promo_xxxxxxxxxxxxxx"),
            renewalPrice: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            splitPayCurrentPayments: Nullable<Int>.value(1),
            splitPayRequiredPayments: Nullable<Int>.value(1),
            status: MembershipStatus.trialing,
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.memberships.update(
            id: "id",
            request: .init(billingPeriodDays: 45),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "affiliate": {
                    "applies_to_payments": "first_payment",
                    "commission_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "commission_percentage": 1.1,
                    "commission_source": "custom",
                    "commission_type": "flat_fee",
                    "enabled": true,
                    "id": "id",
                    "user_id": "user_id"
                  },
                  "billing_period_days": 30,
                  "cancel_at_period_end": true,
                  "cancel_option": "too_expensive",
                  "canceled_at": "2026-01-01T12:00:00.000Z",
                  "cancellation_reason": "Too expensive",
                  "collection_method": "charge_automatically",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "current_period_start": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "external_accounts": [
                    {
                      "external_id": "7012345678",
                      "platform": "discord",
                      "username": "telegram_username1"
                    }
                  ],
                  "feedback_option": {
                    "label": "The wash club costs more than I can spend"
                  },
                  "id": "mem_xxxxxxxxxxxxxx",
                  "initial_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "manage_url": "https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "most_recent_action": "canceled_on",
                  "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                  "phone_number": "+xxxxxxxxxxx",
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_xxxxxxxxxxxxxx",
                  "renewal_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "split_pay_current_payments": 1,
                  "split_pay_required_payments": 1,
                  "status": "trialing",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_xxxxxxxxxxxxxx",
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
        let expectedResponse = Membership(
            account: StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            affiliate: Nullable<MembershipAffiliate>.value(MembershipAffiliate(
                appliesToPayments: MembershipAffiliateAppliesToPayments.firstPayment,
                commissionAmount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                commissionPercentage: Nullable<Double>.value(1.1),
                commissionSource: MembershipAffiliateCommissionSource.custom,
                commissionType: MembershipAffiliateCommissionType.flatFee,
                enabled: true,
                id: "id",
                userId: "user_id"
            )),
            billingPeriodDays: Nullable<Int>.value(30),
            cancelAtPeriodEnd: true,
            cancelOption: Nullable<MembershipCancelOption>.value(MembershipCancelOption.tooExpensive),
            canceledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            cancellationReason: Nullable<String>.value("Too expensive"),
            collectionMethod: Nullable<MembershipCollectionMethod>.value(MembershipCollectionMethod.chargeAutomatically),
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            currentPeriodStart: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            externalAccounts: Nullable<[MembershipExternalAccount]>.value([
                MembershipExternalAccount(
                    externalId: "7012345678",
                    platform: MembershipExternalAccountPlatform.discord,
                    username: Nullable<String>.value("telegram_username1")
                )
            ]),
            feedbackOption: Nullable<MembershipFeedbackOption>.value(MembershipFeedbackOption(
                label: "The wash club costs more than I can spend"
            )),
            id: "mem_xxxxxxxxxxxxxx",
            initialPrice: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            manageUrl: Nullable<String>.value("https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            mostRecentAction: Nullable<MembershipMostRecentAction>.value(MembershipMostRecentAction.canceledOn),
            mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
            product: MembershipProduct(
                id: "prod_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                title: "Ceramic Coating Package"
            ),
            productId: "prod_xxxxxxxxxxxxxx",
            promoCodeId: Nullable<String>.value("promo_xxxxxxxxxxxxxx"),
            renewalPrice: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            splitPayCurrentPayments: Nullable<Int>.value(1),
            splitPayRequiredPayments: Nullable<Int>.value(1),
            status: MembershipStatus.trialing,
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.memberships.update(
            id: "id",
            request: .init(currentPeriodEnd: try! Date("2027-01-15T00:00:00Z", strategy: .iso8601)),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update3() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "affiliate": {
                    "applies_to_payments": "first_payment",
                    "commission_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "commission_percentage": 1.1,
                    "commission_source": "custom",
                    "commission_type": "flat_fee",
                    "enabled": true,
                    "id": "id",
                    "user_id": "user_id"
                  },
                  "billing_period_days": 30,
                  "cancel_at_period_end": true,
                  "cancel_option": "too_expensive",
                  "canceled_at": "2026-01-01T12:00:00.000Z",
                  "cancellation_reason": "Too expensive",
                  "collection_method": "charge_automatically",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "current_period_start": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "external_accounts": [
                    {
                      "external_id": "7012345678",
                      "platform": "discord",
                      "username": "telegram_username1"
                    }
                  ],
                  "feedback_option": {
                    "label": "The wash club costs more than I can spend"
                  },
                  "id": "mem_xxxxxxxxxxxxxx",
                  "initial_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "manage_url": "https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "most_recent_action": "canceled_on",
                  "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                  "phone_number": "+xxxxxxxxxxx",
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_xxxxxxxxxxxxxx",
                  "renewal_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "split_pay_current_payments": 1,
                  "split_pay_required_payments": 1,
                  "status": "trialing",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_xxxxxxxxxxxxxx",
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
        let expectedResponse = Membership(
            account: StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            affiliate: Nullable<MembershipAffiliate>.value(MembershipAffiliate(
                appliesToPayments: MembershipAffiliateAppliesToPayments.firstPayment,
                commissionAmount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                commissionPercentage: Nullable<Double>.value(1.1),
                commissionSource: MembershipAffiliateCommissionSource.custom,
                commissionType: MembershipAffiliateCommissionType.flatFee,
                enabled: true,
                id: "id",
                userId: "user_id"
            )),
            billingPeriodDays: Nullable<Int>.value(30),
            cancelAtPeriodEnd: true,
            cancelOption: Nullable<MembershipCancelOption>.value(MembershipCancelOption.tooExpensive),
            canceledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            cancellationReason: Nullable<String>.value("Too expensive"),
            collectionMethod: Nullable<MembershipCollectionMethod>.value(MembershipCollectionMethod.chargeAutomatically),
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            currentPeriodStart: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            externalAccounts: Nullable<[MembershipExternalAccount]>.value([
                MembershipExternalAccount(
                    externalId: "7012345678",
                    platform: MembershipExternalAccountPlatform.discord,
                    username: Nullable<String>.value("telegram_username1")
                )
            ]),
            feedbackOption: Nullable<MembershipFeedbackOption>.value(MembershipFeedbackOption(
                label: "The wash club costs more than I can spend"
            )),
            id: "mem_xxxxxxxxxxxxxx",
            initialPrice: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            manageUrl: Nullable<String>.value("https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            mostRecentAction: Nullable<MembershipMostRecentAction>.value(MembershipMostRecentAction.canceledOn),
            mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
            product: MembershipProduct(
                id: "prod_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                title: "Ceramic Coating Package"
            ),
            productId: "prod_xxxxxxxxxxxxxx",
            promoCodeId: Nullable<String>.value("promo_xxxxxxxxxxxxxx"),
            renewalPrice: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            splitPayCurrentPayments: Nullable<Int>.value(1),
            splitPayRequiredPayments: Nullable<Int>.value(1),
            status: MembershipStatus.trialing,
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.memberships.update(
            id: "id",
            request: .init(renewalPrice: 19.99),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func applyPromoCode1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "affiliate": {
                    "applies_to_payments": "first_payment",
                    "commission_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "commission_percentage": 1.1,
                    "commission_source": "custom",
                    "commission_type": "flat_fee",
                    "enabled": true,
                    "id": "id",
                    "user_id": "user_id"
                  },
                  "billing_period_days": 30,
                  "cancel_at_period_end": true,
                  "cancel_option": "too_expensive",
                  "canceled_at": "2026-01-01T12:00:00.000Z",
                  "cancellation_reason": "Too expensive",
                  "collection_method": "charge_automatically",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "current_period_start": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "external_accounts": [
                    {
                      "external_id": "7012345678",
                      "platform": "discord",
                      "username": "telegram_username1"
                    }
                  ],
                  "feedback_option": {
                    "label": "The wash club costs more than I can spend"
                  },
                  "id": "mem_xxxxxxxxxxxxxx",
                  "initial_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "manage_url": "https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "most_recent_action": "canceled_on",
                  "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                  "phone_number": "+xxxxxxxxxxx",
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_xxxxxxxxxxxxxx",
                  "renewal_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "split_pay_current_payments": 1,
                  "split_pay_required_payments": 1,
                  "status": "trialing",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_xxxxxxxxxxxxxx",
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
        let expectedResponse = Membership(
            account: StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            affiliate: Nullable<MembershipAffiliate>.value(MembershipAffiliate(
                appliesToPayments: MembershipAffiliateAppliesToPayments.firstPayment,
                commissionAmount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                commissionPercentage: Nullable<Double>.value(1.1),
                commissionSource: MembershipAffiliateCommissionSource.custom,
                commissionType: MembershipAffiliateCommissionType.flatFee,
                enabled: true,
                id: "id",
                userId: "user_id"
            )),
            billingPeriodDays: Nullable<Int>.value(30),
            cancelAtPeriodEnd: true,
            cancelOption: Nullable<MembershipCancelOption>.value(MembershipCancelOption.tooExpensive),
            canceledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            cancellationReason: Nullable<String>.value("Too expensive"),
            collectionMethod: Nullable<MembershipCollectionMethod>.value(MembershipCollectionMethod.chargeAutomatically),
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            currentPeriodStart: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            externalAccounts: Nullable<[MembershipExternalAccount]>.value([
                MembershipExternalAccount(
                    externalId: "7012345678",
                    platform: MembershipExternalAccountPlatform.discord,
                    username: Nullable<String>.value("telegram_username1")
                )
            ]),
            feedbackOption: Nullable<MembershipFeedbackOption>.value(MembershipFeedbackOption(
                label: "The wash club costs more than I can spend"
            )),
            id: "mem_xxxxxxxxxxxxxx",
            initialPrice: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            manageUrl: Nullable<String>.value("https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            mostRecentAction: Nullable<MembershipMostRecentAction>.value(MembershipMostRecentAction.canceledOn),
            mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
            product: MembershipProduct(
                id: "prod_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                title: "Ceramic Coating Package"
            ),
            productId: "prod_xxxxxxxxxxxxxx",
            promoCodeId: Nullable<String>.value("promo_xxxxxxxxxxxxxx"),
            renewalPrice: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            splitPayCurrentPayments: Nullable<Int>.value(1),
            splitPayRequiredPayments: Nullable<Int>.value(1),
            status: MembershipStatus.trialing,
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.memberships.applyPromoCode(
            id: "id",
            request: .init(promoCode: "SAVE20"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func assignAffiliate1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "affiliate": {
                    "applies_to_payments": "first_payment",
                    "commission_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "commission_percentage": 1.1,
                    "commission_source": "custom",
                    "commission_type": "flat_fee",
                    "enabled": true,
                    "id": "id",
                    "user_id": "user_id"
                  },
                  "billing_period_days": 30,
                  "cancel_at_period_end": true,
                  "cancel_option": "too_expensive",
                  "canceled_at": "2026-01-01T12:00:00.000Z",
                  "cancellation_reason": "Too expensive",
                  "collection_method": "charge_automatically",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "current_period_start": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "external_accounts": [
                    {
                      "external_id": "7012345678",
                      "platform": "discord",
                      "username": "telegram_username1"
                    }
                  ],
                  "feedback_option": {
                    "label": "The wash club costs more than I can spend"
                  },
                  "id": "mem_xxxxxxxxxxxxxx",
                  "initial_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "manage_url": "https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "most_recent_action": "canceled_on",
                  "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                  "phone_number": "+xxxxxxxxxxx",
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_xxxxxxxxxxxxxx",
                  "renewal_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "split_pay_current_payments": 1,
                  "split_pay_required_payments": 1,
                  "status": "trialing",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_xxxxxxxxxxxxxx",
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
        let expectedResponse = Membership(
            account: StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            affiliate: Nullable<MembershipAffiliate>.value(MembershipAffiliate(
                appliesToPayments: MembershipAffiliateAppliesToPayments.firstPayment,
                commissionAmount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                commissionPercentage: Nullable<Double>.value(1.1),
                commissionSource: MembershipAffiliateCommissionSource.custom,
                commissionType: MembershipAffiliateCommissionType.flatFee,
                enabled: true,
                id: "id",
                userId: "user_id"
            )),
            billingPeriodDays: Nullable<Int>.value(30),
            cancelAtPeriodEnd: true,
            cancelOption: Nullable<MembershipCancelOption>.value(MembershipCancelOption.tooExpensive),
            canceledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            cancellationReason: Nullable<String>.value("Too expensive"),
            collectionMethod: Nullable<MembershipCollectionMethod>.value(MembershipCollectionMethod.chargeAutomatically),
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            currentPeriodStart: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            externalAccounts: Nullable<[MembershipExternalAccount]>.value([
                MembershipExternalAccount(
                    externalId: "7012345678",
                    platform: MembershipExternalAccountPlatform.discord,
                    username: Nullable<String>.value("telegram_username1")
                )
            ]),
            feedbackOption: Nullable<MembershipFeedbackOption>.value(MembershipFeedbackOption(
                label: "The wash club costs more than I can spend"
            )),
            id: "mem_xxxxxxxxxxxxxx",
            initialPrice: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            manageUrl: Nullable<String>.value("https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            mostRecentAction: Nullable<MembershipMostRecentAction>.value(MembershipMostRecentAction.canceledOn),
            mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
            product: MembershipProduct(
                id: "prod_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                title: "Ceramic Coating Package"
            ),
            productId: "prod_xxxxxxxxxxxxxx",
            promoCodeId: Nullable<String>.value("promo_xxxxxxxxxxxxxx"),
            renewalPrice: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            splitPayCurrentPayments: Nullable<Int>.value(1),
            splitPayRequiredPayments: Nullable<Int>.value(1),
            status: MembershipStatus.trialing,
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.memberships.assignAffiliate(
            id: "id",
            request: .init(
                commissionType: .flatFee,
                commissionValue: 5,
                email: "affiliate@example.com"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func assignAffiliate2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "affiliate": {
                    "applies_to_payments": "first_payment",
                    "commission_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "commission_percentage": 1.1,
                    "commission_source": "custom",
                    "commission_type": "flat_fee",
                    "enabled": true,
                    "id": "id",
                    "user_id": "user_id"
                  },
                  "billing_period_days": 30,
                  "cancel_at_period_end": true,
                  "cancel_option": "too_expensive",
                  "canceled_at": "2026-01-01T12:00:00.000Z",
                  "cancellation_reason": "Too expensive",
                  "collection_method": "charge_automatically",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "current_period_start": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "external_accounts": [
                    {
                      "external_id": "7012345678",
                      "platform": "discord",
                      "username": "telegram_username1"
                    }
                  ],
                  "feedback_option": {
                    "label": "The wash club costs more than I can spend"
                  },
                  "id": "mem_xxxxxxxxxxxxxx",
                  "initial_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "manage_url": "https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "most_recent_action": "canceled_on",
                  "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                  "phone_number": "+xxxxxxxxxxx",
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_xxxxxxxxxxxxxx",
                  "renewal_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "split_pay_current_payments": 1,
                  "split_pay_required_payments": 1,
                  "status": "trialing",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_xxxxxxxxxxxxxx",
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
        let expectedResponse = Membership(
            account: StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            affiliate: Nullable<MembershipAffiliate>.value(MembershipAffiliate(
                appliesToPayments: MembershipAffiliateAppliesToPayments.firstPayment,
                commissionAmount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                commissionPercentage: Nullable<Double>.value(1.1),
                commissionSource: MembershipAffiliateCommissionSource.custom,
                commissionType: MembershipAffiliateCommissionType.flatFee,
                enabled: true,
                id: "id",
                userId: "user_id"
            )),
            billingPeriodDays: Nullable<Int>.value(30),
            cancelAtPeriodEnd: true,
            cancelOption: Nullable<MembershipCancelOption>.value(MembershipCancelOption.tooExpensive),
            canceledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            cancellationReason: Nullable<String>.value("Too expensive"),
            collectionMethod: Nullable<MembershipCollectionMethod>.value(MembershipCollectionMethod.chargeAutomatically),
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            currentPeriodStart: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            externalAccounts: Nullable<[MembershipExternalAccount]>.value([
                MembershipExternalAccount(
                    externalId: "7012345678",
                    platform: MembershipExternalAccountPlatform.discord,
                    username: Nullable<String>.value("telegram_username1")
                )
            ]),
            feedbackOption: Nullable<MembershipFeedbackOption>.value(MembershipFeedbackOption(
                label: "The wash club costs more than I can spend"
            )),
            id: "mem_xxxxxxxxxxxxxx",
            initialPrice: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            manageUrl: Nullable<String>.value("https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            mostRecentAction: Nullable<MembershipMostRecentAction>.value(MembershipMostRecentAction.canceledOn),
            mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
            product: MembershipProduct(
                id: "prod_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                title: "Ceramic Coating Package"
            ),
            productId: "prod_xxxxxxxxxxxxxx",
            promoCodeId: Nullable<String>.value("promo_xxxxxxxxxxxxxx"),
            renewalPrice: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            splitPayCurrentPayments: Nullable<Int>.value(1),
            splitPayRequiredPayments: Nullable<Int>.value(1),
            status: MembershipStatus.trialing,
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.memberships.assignAffiliate(
            id: "id",
            request: .init(
                commissionType: .percentage,
                commissionValue: 20,
                userId: "user_xxxxxxxxxxxxx"
            ),
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "affiliate": {
                    "applies_to_payments": "first_payment",
                    "commission_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "commission_percentage": 1.1,
                    "commission_source": "custom",
                    "commission_type": "flat_fee",
                    "enabled": true,
                    "id": "id",
                    "user_id": "user_id"
                  },
                  "billing_period_days": 30,
                  "cancel_at_period_end": true,
                  "cancel_option": "too_expensive",
                  "canceled_at": "2026-01-01T12:00:00.000Z",
                  "cancellation_reason": "Too expensive",
                  "collection_method": "charge_automatically",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "current_period_start": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "external_accounts": [
                    {
                      "external_id": "7012345678",
                      "platform": "discord",
                      "username": "telegram_username1"
                    }
                  ],
                  "feedback_option": {
                    "label": "The wash club costs more than I can spend"
                  },
                  "id": "mem_xxxxxxxxxxxxxx",
                  "initial_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "manage_url": "https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "most_recent_action": "canceled_on",
                  "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                  "phone_number": "+xxxxxxxxxxx",
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_xxxxxxxxxxxxxx",
                  "renewal_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "split_pay_current_payments": 1,
                  "split_pay_required_payments": 1,
                  "status": "trialing",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_xxxxxxxxxxxxxx",
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
        let expectedResponse = Membership(
            account: StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            affiliate: Nullable<MembershipAffiliate>.value(MembershipAffiliate(
                appliesToPayments: MembershipAffiliateAppliesToPayments.firstPayment,
                commissionAmount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                commissionPercentage: Nullable<Double>.value(1.1),
                commissionSource: MembershipAffiliateCommissionSource.custom,
                commissionType: MembershipAffiliateCommissionType.flatFee,
                enabled: true,
                id: "id",
                userId: "user_id"
            )),
            billingPeriodDays: Nullable<Int>.value(30),
            cancelAtPeriodEnd: true,
            cancelOption: Nullable<MembershipCancelOption>.value(MembershipCancelOption.tooExpensive),
            canceledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            cancellationReason: Nullable<String>.value("Too expensive"),
            collectionMethod: Nullable<MembershipCollectionMethod>.value(MembershipCollectionMethod.chargeAutomatically),
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            currentPeriodStart: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            externalAccounts: Nullable<[MembershipExternalAccount]>.value([
                MembershipExternalAccount(
                    externalId: "7012345678",
                    platform: MembershipExternalAccountPlatform.discord,
                    username: Nullable<String>.value("telegram_username1")
                )
            ]),
            feedbackOption: Nullable<MembershipFeedbackOption>.value(MembershipFeedbackOption(
                label: "The wash club costs more than I can spend"
            )),
            id: "mem_xxxxxxxxxxxxxx",
            initialPrice: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            manageUrl: Nullable<String>.value("https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            mostRecentAction: Nullable<MembershipMostRecentAction>.value(MembershipMostRecentAction.canceledOn),
            mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
            product: MembershipProduct(
                id: "prod_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                title: "Ceramic Coating Package"
            ),
            productId: "prod_xxxxxxxxxxxxxx",
            promoCodeId: Nullable<String>.value("promo_xxxxxxxxxxxxxx"),
            renewalPrice: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            splitPayCurrentPayments: Nullable<Int>.value(1),
            splitPayRequiredPayments: Nullable<Int>.value(1),
            status: MembershipStatus.trialing,
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.memberships.cancel(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func extend1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "affiliate": {
                    "applies_to_payments": "first_payment",
                    "commission_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "commission_percentage": 1.1,
                    "commission_source": "custom",
                    "commission_type": "flat_fee",
                    "enabled": true,
                    "id": "id",
                    "user_id": "user_id"
                  },
                  "billing_period_days": 30,
                  "cancel_at_period_end": true,
                  "cancel_option": "too_expensive",
                  "canceled_at": "2026-01-01T12:00:00.000Z",
                  "cancellation_reason": "Too expensive",
                  "collection_method": "charge_automatically",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "current_period_start": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "external_accounts": [
                    {
                      "external_id": "7012345678",
                      "platform": "discord",
                      "username": "telegram_username1"
                    }
                  ],
                  "feedback_option": {
                    "label": "The wash club costs more than I can spend"
                  },
                  "id": "mem_xxxxxxxxxxxxxx",
                  "initial_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "manage_url": "https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "most_recent_action": "canceled_on",
                  "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                  "phone_number": "+xxxxxxxxxxx",
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_xxxxxxxxxxxxxx",
                  "renewal_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "split_pay_current_payments": 1,
                  "split_pay_required_payments": 1,
                  "status": "trialing",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_xxxxxxxxxxxxxx",
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
        let expectedResponse = Membership(
            account: StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            affiliate: Nullable<MembershipAffiliate>.value(MembershipAffiliate(
                appliesToPayments: MembershipAffiliateAppliesToPayments.firstPayment,
                commissionAmount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                commissionPercentage: Nullable<Double>.value(1.1),
                commissionSource: MembershipAffiliateCommissionSource.custom,
                commissionType: MembershipAffiliateCommissionType.flatFee,
                enabled: true,
                id: "id",
                userId: "user_id"
            )),
            billingPeriodDays: Nullable<Int>.value(30),
            cancelAtPeriodEnd: true,
            cancelOption: Nullable<MembershipCancelOption>.value(MembershipCancelOption.tooExpensive),
            canceledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            cancellationReason: Nullable<String>.value("Too expensive"),
            collectionMethod: Nullable<MembershipCollectionMethod>.value(MembershipCollectionMethod.chargeAutomatically),
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            currentPeriodStart: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            externalAccounts: Nullable<[MembershipExternalAccount]>.value([
                MembershipExternalAccount(
                    externalId: "7012345678",
                    platform: MembershipExternalAccountPlatform.discord,
                    username: Nullable<String>.value("telegram_username1")
                )
            ]),
            feedbackOption: Nullable<MembershipFeedbackOption>.value(MembershipFeedbackOption(
                label: "The wash club costs more than I can spend"
            )),
            id: "mem_xxxxxxxxxxxxxx",
            initialPrice: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            manageUrl: Nullable<String>.value("https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            mostRecentAction: Nullable<MembershipMostRecentAction>.value(MembershipMostRecentAction.canceledOn),
            mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
            product: MembershipProduct(
                id: "prod_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                title: "Ceramic Coating Package"
            ),
            productId: "prod_xxxxxxxxxxxxxx",
            promoCodeId: Nullable<String>.value("promo_xxxxxxxxxxxxxx"),
            renewalPrice: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            splitPayCurrentPayments: Nullable<Int>.value(1),
            splitPayRequiredPayments: Nullable<Int>.value(1),
            status: MembershipStatus.trialing,
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.memberships.extend(
            id: "id",
            request: .init(days: 7),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func pause1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "affiliate": {
                    "applies_to_payments": "first_payment",
                    "commission_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "commission_percentage": 1.1,
                    "commission_source": "custom",
                    "commission_type": "flat_fee",
                    "enabled": true,
                    "id": "id",
                    "user_id": "user_id"
                  },
                  "billing_period_days": 30,
                  "cancel_at_period_end": true,
                  "cancel_option": "too_expensive",
                  "canceled_at": "2026-01-01T12:00:00.000Z",
                  "cancellation_reason": "Too expensive",
                  "collection_method": "charge_automatically",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "current_period_start": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "external_accounts": [
                    {
                      "external_id": "7012345678",
                      "platform": "discord",
                      "username": "telegram_username1"
                    }
                  ],
                  "feedback_option": {
                    "label": "The wash club costs more than I can spend"
                  },
                  "id": "mem_xxxxxxxxxxxxxx",
                  "initial_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "manage_url": "https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "most_recent_action": "canceled_on",
                  "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                  "phone_number": "+xxxxxxxxxxx",
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_xxxxxxxxxxxxxx",
                  "renewal_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "split_pay_current_payments": 1,
                  "split_pay_required_payments": 1,
                  "status": "trialing",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_xxxxxxxxxxxxxx",
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
        let expectedResponse = Membership(
            account: StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            affiliate: Nullable<MembershipAffiliate>.value(MembershipAffiliate(
                appliesToPayments: MembershipAffiliateAppliesToPayments.firstPayment,
                commissionAmount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                commissionPercentage: Nullable<Double>.value(1.1),
                commissionSource: MembershipAffiliateCommissionSource.custom,
                commissionType: MembershipAffiliateCommissionType.flatFee,
                enabled: true,
                id: "id",
                userId: "user_id"
            )),
            billingPeriodDays: Nullable<Int>.value(30),
            cancelAtPeriodEnd: true,
            cancelOption: Nullable<MembershipCancelOption>.value(MembershipCancelOption.tooExpensive),
            canceledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            cancellationReason: Nullable<String>.value("Too expensive"),
            collectionMethod: Nullable<MembershipCollectionMethod>.value(MembershipCollectionMethod.chargeAutomatically),
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            currentPeriodStart: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            externalAccounts: Nullable<[MembershipExternalAccount]>.value([
                MembershipExternalAccount(
                    externalId: "7012345678",
                    platform: MembershipExternalAccountPlatform.discord,
                    username: Nullable<String>.value("telegram_username1")
                )
            ]),
            feedbackOption: Nullable<MembershipFeedbackOption>.value(MembershipFeedbackOption(
                label: "The wash club costs more than I can spend"
            )),
            id: "mem_xxxxxxxxxxxxxx",
            initialPrice: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            manageUrl: Nullable<String>.value("https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            mostRecentAction: Nullable<MembershipMostRecentAction>.value(MembershipMostRecentAction.canceledOn),
            mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
            product: MembershipProduct(
                id: "prod_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                title: "Ceramic Coating Package"
            ),
            productId: "prod_xxxxxxxxxxxxxx",
            promoCodeId: Nullable<String>.value("promo_xxxxxxxxxxxxxx"),
            renewalPrice: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            splitPayCurrentPayments: Nullable<Int>.value(1),
            splitPayRequiredPayments: Nullable<Int>.value(1),
            status: MembershipStatus.trialing,
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.memberships.pause(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func reactivate1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "affiliate": {
                    "applies_to_payments": "first_payment",
                    "commission_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "commission_percentage": 1.1,
                    "commission_source": "custom",
                    "commission_type": "flat_fee",
                    "enabled": true,
                    "id": "id",
                    "user_id": "user_id"
                  },
                  "billing_period_days": 30,
                  "cancel_at_period_end": true,
                  "cancel_option": "too_expensive",
                  "canceled_at": "2026-01-01T12:00:00.000Z",
                  "cancellation_reason": "Too expensive",
                  "collection_method": "charge_automatically",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "current_period_start": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "external_accounts": [
                    {
                      "external_id": "7012345678",
                      "platform": "discord",
                      "username": "telegram_username1"
                    }
                  ],
                  "feedback_option": {
                    "label": "The wash club costs more than I can spend"
                  },
                  "id": "mem_xxxxxxxxxxxxxx",
                  "initial_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "manage_url": "https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "most_recent_action": "canceled_on",
                  "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                  "phone_number": "+xxxxxxxxxxx",
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_xxxxxxxxxxxxxx",
                  "renewal_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "split_pay_current_payments": 1,
                  "split_pay_required_payments": 1,
                  "status": "trialing",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_xxxxxxxxxxxxxx",
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
        let expectedResponse = Membership(
            account: StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            affiliate: Nullable<MembershipAffiliate>.value(MembershipAffiliate(
                appliesToPayments: MembershipAffiliateAppliesToPayments.firstPayment,
                commissionAmount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                commissionPercentage: Nullable<Double>.value(1.1),
                commissionSource: MembershipAffiliateCommissionSource.custom,
                commissionType: MembershipAffiliateCommissionType.flatFee,
                enabled: true,
                id: "id",
                userId: "user_id"
            )),
            billingPeriodDays: Nullable<Int>.value(30),
            cancelAtPeriodEnd: true,
            cancelOption: Nullable<MembershipCancelOption>.value(MembershipCancelOption.tooExpensive),
            canceledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            cancellationReason: Nullable<String>.value("Too expensive"),
            collectionMethod: Nullable<MembershipCollectionMethod>.value(MembershipCollectionMethod.chargeAutomatically),
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            currentPeriodStart: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            externalAccounts: Nullable<[MembershipExternalAccount]>.value([
                MembershipExternalAccount(
                    externalId: "7012345678",
                    platform: MembershipExternalAccountPlatform.discord,
                    username: Nullable<String>.value("telegram_username1")
                )
            ]),
            feedbackOption: Nullable<MembershipFeedbackOption>.value(MembershipFeedbackOption(
                label: "The wash club costs more than I can spend"
            )),
            id: "mem_xxxxxxxxxxxxxx",
            initialPrice: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            manageUrl: Nullable<String>.value("https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            mostRecentAction: Nullable<MembershipMostRecentAction>.value(MembershipMostRecentAction.canceledOn),
            mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
            product: MembershipProduct(
                id: "prod_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                title: "Ceramic Coating Package"
            ),
            productId: "prod_xxxxxxxxxxxxxx",
            promoCodeId: Nullable<String>.value("promo_xxxxxxxxxxxxxx"),
            renewalPrice: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            splitPayCurrentPayments: Nullable<Int>.value(1),
            splitPayRequiredPayments: Nullable<Int>.value(1),
            status: MembershipStatus.trialing,
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.memberships.reactivate(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func resume1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "affiliate": {
                    "applies_to_payments": "first_payment",
                    "commission_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "commission_percentage": 1.1,
                    "commission_source": "custom",
                    "commission_type": "flat_fee",
                    "enabled": true,
                    "id": "id",
                    "user_id": "user_id"
                  },
                  "billing_period_days": 30,
                  "cancel_at_period_end": true,
                  "cancel_option": "too_expensive",
                  "canceled_at": "2026-01-01T12:00:00.000Z",
                  "cancellation_reason": "Too expensive",
                  "collection_method": "charge_automatically",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "current_period_start": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "external_accounts": [
                    {
                      "external_id": "7012345678",
                      "platform": "discord",
                      "username": "telegram_username1"
                    }
                  ],
                  "feedback_option": {
                    "label": "The wash club costs more than I can spend"
                  },
                  "id": "mem_xxxxxxxxxxxxxx",
                  "initial_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "manage_url": "https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "most_recent_action": "canceled_on",
                  "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                  "phone_number": "+xxxxxxxxxxx",
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_xxxxxxxxxxxxxx",
                  "renewal_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "split_pay_current_payments": 1,
                  "split_pay_required_payments": 1,
                  "status": "trialing",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_xxxxxxxxxxxxxx",
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
        let expectedResponse = Membership(
            account: StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            affiliate: Nullable<MembershipAffiliate>.value(MembershipAffiliate(
                appliesToPayments: MembershipAffiliateAppliesToPayments.firstPayment,
                commissionAmount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                commissionPercentage: Nullable<Double>.value(1.1),
                commissionSource: MembershipAffiliateCommissionSource.custom,
                commissionType: MembershipAffiliateCommissionType.flatFee,
                enabled: true,
                id: "id",
                userId: "user_id"
            )),
            billingPeriodDays: Nullable<Int>.value(30),
            cancelAtPeriodEnd: true,
            cancelOption: Nullable<MembershipCancelOption>.value(MembershipCancelOption.tooExpensive),
            canceledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            cancellationReason: Nullable<String>.value("Too expensive"),
            collectionMethod: Nullable<MembershipCollectionMethod>.value(MembershipCollectionMethod.chargeAutomatically),
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            currentPeriodStart: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            externalAccounts: Nullable<[MembershipExternalAccount]>.value([
                MembershipExternalAccount(
                    externalId: "7012345678",
                    platform: MembershipExternalAccountPlatform.discord,
                    username: Nullable<String>.value("telegram_username1")
                )
            ]),
            feedbackOption: Nullable<MembershipFeedbackOption>.value(MembershipFeedbackOption(
                label: "The wash club costs more than I can spend"
            )),
            id: "mem_xxxxxxxxxxxxxx",
            initialPrice: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            manageUrl: Nullable<String>.value("https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            mostRecentAction: Nullable<MembershipMostRecentAction>.value(MembershipMostRecentAction.canceledOn),
            mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
            product: MembershipProduct(
                id: "prod_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                title: "Ceramic Coating Package"
            ),
            productId: "prod_xxxxxxxxxxxxxx",
            promoCodeId: Nullable<String>.value("promo_xxxxxxxxxxxxxx"),
            renewalPrice: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            splitPayCurrentPayments: Nullable<Int>.value(1),
            splitPayRequiredPayments: Nullable<Int>.value(1),
            status: MembershipStatus.trialing,
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.memberships.resume(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func resyncAccess1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "affiliate": {
                    "applies_to_payments": "first_payment",
                    "commission_amount": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "commission_percentage": 1.1,
                    "commission_source": "custom",
                    "commission_type": "flat_fee",
                    "enabled": true,
                    "id": "id",
                    "user_id": "user_id"
                  },
                  "billing_period_days": 30,
                  "cancel_at_period_end": true,
                  "cancel_option": "too_expensive",
                  "canceled_at": "2026-01-01T12:00:00.000Z",
                  "cancellation_reason": "Too expensive",
                  "collection_method": "charge_automatically",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "current_period_start": "2026-01-01T12:00:00.000Z",
                  "expires_at": "2026-01-01T12:00:00.000Z",
                  "external_accounts": [
                    {
                      "external_id": "7012345678",
                      "platform": "discord",
                      "username": "telegram_username1"
                    }
                  ],
                  "feedback_option": {
                    "label": "The wash club costs more than I can spend"
                  },
                  "id": "mem_xxxxxxxxxxxxxx",
                  "initial_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "manage_url": "https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "member_id": "mber_xxxxxxxxxxxxxx",
                  "metadata": {
                    "key": "value"
                  },
                  "most_recent_action": "canceled_on",
                  "most_recent_action_at": "2026-01-01T12:00:00.000Z",
                  "phone_number": "+xxxxxxxxxxx",
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "promo_code_id": "promo_xxxxxxxxxxxxxx",
                  "renewal_price": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "split_pay_current_payments": 1,
                  "split_pay_required_payments": 1,
                  "status": "trialing",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user_id": "user_xxxxxxxxxxxxxx",
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
        let expectedResponse = Membership(
            account: StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            affiliate: Nullable<MembershipAffiliate>.value(MembershipAffiliate(
                appliesToPayments: MembershipAffiliateAppliesToPayments.firstPayment,
                commissionAmount: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                commissionPercentage: Nullable<Double>.value(1.1),
                commissionSource: MembershipAffiliateCommissionSource.custom,
                commissionType: MembershipAffiliateCommissionType.flatFee,
                enabled: true,
                id: "id",
                userId: "user_id"
            )),
            billingPeriodDays: Nullable<Int>.value(30),
            cancelAtPeriodEnd: true,
            cancelOption: Nullable<MembershipCancelOption>.value(MembershipCancelOption.tooExpensive),
            canceledAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            cancellationReason: Nullable<String>.value("Too expensive"),
            collectionMethod: Nullable<MembershipCollectionMethod>.value(MembershipCollectionMethod.chargeAutomatically),
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            currentPeriodStart: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            externalAccounts: Nullable<[MembershipExternalAccount]>.value([
                MembershipExternalAccount(
                    externalId: "7012345678",
                    platform: MembershipExternalAccountPlatform.discord,
                    username: Nullable<String>.value("telegram_username1")
                )
            ]),
            feedbackOption: Nullable<MembershipFeedbackOption>.value(MembershipFeedbackOption(
                label: "The wash club costs more than I can spend"
            )),
            id: "mem_xxxxxxxxxxxxxx",
            initialPrice: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            ),
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            manageUrl: Nullable<String>.value("https://whop.com/billing/manage/mber_xxxxxxxxxxxxxx"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
            metadata: [
                "key": JSONValue.string("value")
            ],
            mostRecentAction: Nullable<MembershipMostRecentAction>.value(MembershipMostRecentAction.canceledOn),
            mostRecentActionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            phoneNumber: Nullable<String>.value("+xxxxxxxxxxx"),
            product: MembershipProduct(
                id: "prod_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                title: "Ceramic Coating Package"
            ),
            productId: "prod_xxxxxxxxxxxxxx",
            promoCodeId: Nullable<String>.value("promo_xxxxxxxxxxxxxx"),
            renewalPrice: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            splitPayCurrentPayments: Nullable<Int>.value(1),
            splitPayRequiredPayments: Nullable<Int>.value(1),
            status: MembershipStatus.trialing,
            updatedAt: "2026-01-01T12:00:00.000Z",
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
            variantId: "plan_xxxxxxxxxxxxxx"
        )
        let response = try await client.memberships.resyncAccess(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func transfer1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "url": "https://whop.com/activate"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = TransferMembershipsResponse(
            url: "https://whop.com/activate"
        )
        let response = try await client.memberships.transfer(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}