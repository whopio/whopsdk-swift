import Foundation
import Testing
import WhopSDK

@Suite("OverridesClient Wire Tests") struct OverridesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "applies_to_payments": "first_payment",
                      "applies_to_products": "single_product",
                      "checkout_direct_link": "checkout_direct_link",
                      "commission_type": "percentage",
                      "commission_value": 6.9,
                      "id": "affov_xxxxxxxxxxxx",
                      "override_type": "standard",
                      "plan_id": "plan_xxxxxxxxxxxxx",
                      "product_direct_link": "product_direct_link",
                      "product_id": "product_id",
                      "revenue_basis": "pre_fees",
                      "total_referral_earnings_usd": 6.9
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
        let expectedResponse = ListOverridesResponse(
            data: [
                ListOverridesResponseDataItem(
                    appliesToPayments: Nullable<AffiliateAppliesToPayments>.value(AffiliateAppliesToPayments.firstPayment),
                    appliesToProducts: Nullable<AffiliateAppliesToProducts>.value(AffiliateAppliesToProducts.singleProduct),
                    checkoutDirectLink: Nullable<String>.value("checkout_direct_link"),
                    commissionType: AffiliatePayoutTypes.percentage,
                    commissionValue: 6.9,
                    id: "affov_xxxxxxxxxxxx",
                    overrideType: AffiliateOverrideRoles.standard,
                    planId: Nullable<String>.value("plan_xxxxxxxxxxxxx"),
                    productDirectLink: Nullable<String>.value("product_direct_link"),
                    productId: Nullable<String>.value("product_id"),
                    revenueBasis: Nullable<AffiliateRevenueBases>.value(AffiliateRevenueBases.preFees),
                    totalReferralEarningsUsd: 6.9
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.affiliates.overrides.list(
            id: "aff_xxxxxxxxxxxxxx",
            first: 42,
            last: 42,
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "applies_to_payments": "first_payment",
                  "applies_to_products": "single_product",
                  "checkout_direct_link": "checkout_direct_link",
                  "commission_type": "percentage",
                  "commission_value": 6.9,
                  "id": "affov_xxxxxxxxxxxx",
                  "override_type": "standard",
                  "plan_id": "plan_xxxxxxxxxxxxx",
                  "product_direct_link": "product_direct_link",
                  "product_id": "product_id",
                  "revenue_basis": "pre_fees",
                  "total_referral_earnings_usd": 6.9
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateOverridesResponse(
            appliesToPayments: Nullable<AffiliateAppliesToPayments>.value(AffiliateAppliesToPayments.firstPayment),
            appliesToProducts: Nullable<AffiliateAppliesToProducts>.value(AffiliateAppliesToProducts.singleProduct),
            checkoutDirectLink: Nullable<String>.value("checkout_direct_link"),
            commissionType: AffiliatePayoutTypes.percentage,
            commissionValue: 6.9,
            id: "affov_xxxxxxxxxxxx",
            overrideType: AffiliateOverrideRoles.standard,
            planId: Nullable<String>.value("plan_xxxxxxxxxxxxx"),
            productDirectLink: Nullable<String>.value("product_direct_link"),
            productId: Nullable<String>.value("product_id"),
            revenueBasis: Nullable<AffiliateRevenueBases>.value(AffiliateRevenueBases.preFees),
            totalReferralEarningsUsd: 6.9
        )
        let response = try await client.affiliates.overrides.create(
            id: "aff_xxxxxxxxxxxxxx",
            request: CreateOverridesRequestBody.standard(
                CreateOverridesRequestBodyStandard(
                    commissionValue: 6.9,
                    id: "id",
                    planId: "plan_xxxxxxxxxxxxx"
                )
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
                  "applies_to_payments": "first_payment",
                  "applies_to_products": "single_product",
                  "checkout_direct_link": "checkout_direct_link",
                  "commission_type": "percentage",
                  "commission_value": 6.9,
                  "id": "affov_xxxxxxxxxxxx",
                  "override_type": "standard",
                  "plan_id": "plan_xxxxxxxxxxxxx",
                  "product_direct_link": "product_direct_link",
                  "product_id": "product_id",
                  "revenue_basis": "pre_fees",
                  "total_referral_earnings_usd": 6.9
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RetrieveOverridesResponse(
            appliesToPayments: Nullable<AffiliateAppliesToPayments>.value(AffiliateAppliesToPayments.firstPayment),
            appliesToProducts: Nullable<AffiliateAppliesToProducts>.value(AffiliateAppliesToProducts.singleProduct),
            checkoutDirectLink: Nullable<String>.value("checkout_direct_link"),
            commissionType: AffiliatePayoutTypes.percentage,
            commissionValue: 6.9,
            id: "affov_xxxxxxxxxxxx",
            overrideType: AffiliateOverrideRoles.standard,
            planId: Nullable<String>.value("plan_xxxxxxxxxxxxx"),
            productDirectLink: Nullable<String>.value("product_direct_link"),
            productId: Nullable<String>.value("product_id"),
            revenueBasis: Nullable<AffiliateRevenueBases>.value(AffiliateRevenueBases.preFees),
            totalReferralEarningsUsd: 6.9
        )
        let response = try await client.affiliates.overrides.retrieve(
            id: "aff_xxxxxxxxxxxxxx",
            overrideId: "override_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                true
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = true
        let response = try await client.affiliates.overrides.delete(
            id: "aff_xxxxxxxxxxxxxx",
            overrideId: "override_id",
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
                  "applies_to_payments": "first_payment",
                  "applies_to_products": "single_product",
                  "checkout_direct_link": "checkout_direct_link",
                  "commission_type": "percentage",
                  "commission_value": 6.9,
                  "id": "affov_xxxxxxxxxxxx",
                  "override_type": "standard",
                  "plan_id": "plan_xxxxxxxxxxxxx",
                  "product_direct_link": "product_direct_link",
                  "product_id": "product_id",
                  "revenue_basis": "pre_fees",
                  "total_referral_earnings_usd": 6.9
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = UpdateOverridesResponse(
            appliesToPayments: Nullable<AffiliateAppliesToPayments>.value(AffiliateAppliesToPayments.firstPayment),
            appliesToProducts: Nullable<AffiliateAppliesToProducts>.value(AffiliateAppliesToProducts.singleProduct),
            checkoutDirectLink: Nullable<String>.value("checkout_direct_link"),
            commissionType: AffiliatePayoutTypes.percentage,
            commissionValue: 6.9,
            id: "affov_xxxxxxxxxxxx",
            overrideType: AffiliateOverrideRoles.standard,
            planId: Nullable<String>.value("plan_xxxxxxxxxxxxx"),
            productDirectLink: Nullable<String>.value("product_direct_link"),
            productId: Nullable<String>.value("product_id"),
            revenueBasis: Nullable<AffiliateRevenueBases>.value(AffiliateRevenueBases.preFees),
            totalReferralEarningsUsd: 6.9
        )
        let response = try await client.affiliates.overrides.update(
            id: "aff_xxxxxxxxxxxxxx",
            overrideId: "override_id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}