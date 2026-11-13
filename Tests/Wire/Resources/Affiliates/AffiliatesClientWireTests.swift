import Foundation
import Testing
import WhopSDK

@Suite("AffiliatesClient Wire Tests") struct AffiliatesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "active_members_count": 42,
                      "company": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "title": "title"
                      },
                      "created_at": "2023-12-01T05:00:00Z",
                      "customer_retention_rate": "customer_retention_rate",
                      "customer_retention_rate_ninety_days": "customer_retention_rate_ninety_days",
                      "id": "aff_xxxxxxxxxxxxxx",
                      "monthly_recurring_revenue_usd": "monthly_recurring_revenue_usd",
                      "status": "active",
                      "total_overrides_count": 42,
                      "total_referral_earnings_usd": "total_referral_earnings_usd",
                      "total_referrals_count": 42,
                      "total_revenue_usd": "total_revenue_usd",
                      "updated_at": "2023-12-01T05:00:00Z",
                      "user": {
                        "id": "user_xxxxxxxxxxxxx",
                        "name": "Jane Smith",
                        "username": "janesmith"
                      }
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
        let expectedResponse = ListAffiliatesResponse(
            data: [
                AffiliateListItem(
                    activeMembersCount: 42,
                    company: AffiliateListItemCompany(
                        id: "biz_xxxxxxxxxxxxxx",
                        title: "title"
                    ),
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    customerRetentionRate: "customer_retention_rate",
                    customerRetentionRateNinetyDays: "customer_retention_rate_ninety_days",
                    id: "aff_xxxxxxxxxxxxxx",
                    monthlyRecurringRevenueUsd: "monthly_recurring_revenue_usd",
                    status: Nullable<Status>.value(Status.active),
                    totalOverridesCount: 42,
                    totalReferralEarningsUsd: "total_referral_earnings_usd",
                    totalReferralsCount: 42,
                    totalRevenueUsd: "total_revenue_usd",
                    updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    user: AffiliateListItemUser(
                        id: "user_xxxxxxxxxxxxx",
                        name: Nullable<String>.value("Jane Smith"),
                        username: Nullable<String>.value("janesmith")
                    )
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.affiliates.list(
            first: 42,
            last: 42,
            accountId: "biz_xxxxxxxxxxxxxx",
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
                  "active_members_count": 42,
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "title"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "customer_retention_rate": "customer_retention_rate",
                  "customer_retention_rate_ninety_days": "customer_retention_rate_ninety_days",
                  "id": "aff_xxxxxxxxxxxxxx",
                  "monthly_recurring_revenue_usd": "monthly_recurring_revenue_usd",
                  "status": "active",
                  "total_overrides_count": 42,
                  "total_referral_earnings_usd": "total_referral_earnings_usd",
                  "total_referrals_count": 42,
                  "total_revenue_usd": "total_revenue_usd",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "Jane Smith",
                    "username": "janesmith"
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
        let expectedResponse = Affiliate(
            activeMembersCount: 42,
            company: AffiliateCompany(
                id: "biz_xxxxxxxxxxxxxx",
                title: "title"
            ),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            customerRetentionRate: "customer_retention_rate",
            customerRetentionRateNinetyDays: "customer_retention_rate_ninety_days",
            id: "aff_xxxxxxxxxxxxxx",
            monthlyRecurringRevenueUsd: "monthly_recurring_revenue_usd",
            status: Nullable<Status>.value(Status.active),
            totalOverridesCount: 42,
            totalReferralEarningsUsd: "total_referral_earnings_usd",
            totalReferralsCount: 42,
            totalRevenueUsd: "total_revenue_usd",
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: AffiliateUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("Jane Smith"),
                username: Nullable<String>.value("janesmith")
            )
        )
        let response = try await client.affiliates.create(
            request: .init(
                accountId: "biz_xxxxxxxxxxxxxx",
                userIdentifier: "user_identifier"
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
                  "active_members_count": 42,
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "title"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "customer_retention_rate": "customer_retention_rate",
                  "customer_retention_rate_ninety_days": "customer_retention_rate_ninety_days",
                  "id": "aff_xxxxxxxxxxxxxx",
                  "monthly_recurring_revenue_usd": "monthly_recurring_revenue_usd",
                  "status": "active",
                  "total_overrides_count": 42,
                  "total_referral_earnings_usd": "total_referral_earnings_usd",
                  "total_referrals_count": 42,
                  "total_revenue_usd": "total_revenue_usd",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "Jane Smith",
                    "username": "janesmith"
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
        let expectedResponse = Affiliate(
            activeMembersCount: 42,
            company: AffiliateCompany(
                id: "biz_xxxxxxxxxxxxxx",
                title: "title"
            ),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            customerRetentionRate: "customer_retention_rate",
            customerRetentionRateNinetyDays: "customer_retention_rate_ninety_days",
            id: "aff_xxxxxxxxxxxxxx",
            monthlyRecurringRevenueUsd: "monthly_recurring_revenue_usd",
            status: Nullable<Status>.value(Status.active),
            totalOverridesCount: 42,
            totalReferralEarningsUsd: "total_referral_earnings_usd",
            totalReferralsCount: 42,
            totalRevenueUsd: "total_revenue_usd",
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: AffiliateUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("Jane Smith"),
                username: Nullable<String>.value("janesmith")
            )
        )
        let response = try await client.affiliates.retrieve(
            id: "aff_xxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func archive1() async throws -> Void {
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
        let response = try await client.affiliates.archive(
            id: "aff_xxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func unarchive1() async throws -> Void {
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
        let response = try await client.affiliates.unarchive(
            id: "aff_xxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}