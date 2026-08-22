import Foundation
import Testing
import WhopSDK

@Suite("AdCampaignsClient Wire Tests") struct AdCampaignsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "added_to_cart_value": 12650,
                      "added_to_carts": 165,
                      "bid_type": "minimum_cost",
                      "budget_amount": 50,
                      "budget_optimization": "ad_campaign",
                      "budget_type": "daily",
                      "click_through_rate": 0.025,
                      "clicks": 5500,
                      "completed_registration_value": 1650,
                      "completed_registrations": 55,
                      "contact_value": 2640,
                      "contacts": 88,
                      "cost_per_added_to_cart": 8,
                      "cost_per_click": 0.24,
                      "cost_per_completed_registration": 24,
                      "cost_per_contact": 15,
                      "cost_per_lead": 10,
                      "cost_per_mille": 6,
                      "cost_per_purchase": 30,
                      "cost_per_result": 40,
                      "cost_per_schedule": 22,
                      "cost_per_submitted_application": 120,
                      "cost_per_unique_click": 0.4,
                      "cost_per_viewed_content": 1.1,
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "custom_conversions": 41,
                      "custom_event_counts": {
                        "gift_card_purchased": 5,
                        "quote_requested": 33
                      },
                      "custom_event_values": {
                        "gift_card_purchased": 750,
                        "quote_requested": 0
                      },
                      "delivery_status": "payment_failed",
                      "frequency": 1.1,
                      "id": "adcamp_xxxxxxxxxxxxxx",
                      "impressions": 220000,
                      "issues": [
                        {
                          "id": "adiss_xxxxxxxxxxxxxx",
                          "message": "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                          "resource_id": "ad_xxxxxxxxxxxxxx",
                          "resource_type": "ad_campaign"
                        }
                      ],
                      "lead_value": 3960,
                      "leads": 132,
                      "objective": "awareness",
                      "optimization_goal": "optimization_goal",
                      "platform": "meta",
                      "purchase_value": 7920,
                      "purchases": 44,
                      "reach": 0,
                      "result_event": "purchase",
                      "result_event_name": "quote_requested",
                      "results": 33,
                      "return_on_ad_spend": 6,
                      "schedule_value": 5400,
                      "schedules": 60,
                      "special_ad_categories": [
                        "housing"
                      ],
                      "spend": 1320,
                      "spend_currency": "usd",
                      "status": "active",
                      "submitted_application_value": 1320,
                      "submitted_applications": 11,
                      "title": "Ceramic coating — Austin leads",
                      "unique_click_through_rate": 1.1,
                      "unique_clicks": 3300,
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "viewed_content_value": 8400,
                      "viewed_contents": 1200
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
        let expectedResponse = ListAdCampaignsResponse(
            data: [
                AdCampaign(
                    addedToCartValue: 12650,
                    addedToCarts: 165,
                    bidType: Optional(Nullable<AdCampaignBidType>.value(AdCampaignBidType.minimumCost)),
                    budgetAmount: Nullable<Double>.value(50),
                    budgetOptimization: Nullable<AdCampaignBudgetOptimization>.value(AdCampaignBudgetOptimization.adCampaign),
                    budgetType: Nullable<AdCampaignBudgetType>.value(AdCampaignBudgetType.daily),
                    clickThroughRate: 0.025,
                    clicks: 5500,
                    completedRegistrationValue: 1650,
                    completedRegistrations: 55,
                    contactValue: 2640,
                    contacts: 88,
                    costPerAddedToCart: Nullable<Double>.value(8),
                    costPerClick: 0.24,
                    costPerCompletedRegistration: Nullable<Double>.value(24),
                    costPerContact: Nullable<Double>.value(15),
                    costPerLead: Nullable<Double>.value(10),
                    costPerMille: 6,
                    costPerPurchase: Nullable<Double>.value(30),
                    costPerResult: Nullable<Double>.value(40),
                    costPerSchedule: Nullable<Double>.value(22),
                    costPerSubmittedApplication: Nullable<Double>.value(120),
                    costPerUniqueClick: Nullable<Double>.value(0.4),
                    costPerViewedContent: Nullable<Double>.value(1.1),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    customConversions: 41,
                    customEventCounts: [
                        "gift_card_purchased": JSONValue.number(5), 
                        "quote_requested": JSONValue.number(33)
                    ],
                    customEventValues: [
                        "gift_card_purchased": JSONValue.number(750), 
                        "quote_requested": JSONValue.number(0)
                    ],
                    deliveryStatus: AdCampaignDeliveryStatus.paymentFailed,
                    frequency: Nullable<Double>.value(1.1),
                    id: "adcamp_xxxxxxxxxxxxxx",
                    impressions: 220000,
                    issues: [
                        AdPlatformIssue(
                            id: "adiss_xxxxxxxxxxxxxx",
                            message: "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                            resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                            resourceType: AdPlatformIssueResourceType.adCampaign
                        )
                    ],
                    leadValue: 3960,
                    leads: 132,
                    objective: Nullable<AdCampaignObjective>.value(AdCampaignObjective.awareness),
                    optimizationGoal: Nullable<String>.value("optimization_goal"),
                    platform: AdCampaignPlatform.meta,
                    purchaseValue: 7920,
                    purchases: 44,
                    reach: 0,
                    resultEvent: Nullable<AdCampaignResultEvent>.value(AdCampaignResultEvent.purchase),
                    resultEventName: Nullable<String>.value("quote_requested"),
                    results: Nullable<Double>.value(33),
                    returnOnAdSpend: 6,
                    scheduleValue: 5400,
                    schedules: 60,
                    specialAdCategories: [
                        AdCampaignSpecialAdCategoriesItem.housing
                    ],
                    spend: 1320,
                    spendCurrency: Nullable<String>.value("usd"),
                    status: AdCampaignStatus.active,
                    submittedApplicationValue: 1320,
                    submittedApplications: 11,
                    title: "Ceramic coating — Austin leads",
                    uniqueClickThroughRate: Nullable<Double>.value(1.1),
                    uniqueClicks: 3300,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    viewedContentValue: 8400,
                    viewedContents: 1200
                )
            ],
            pageInfo: ListAdCampaignsResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.adCampaigns.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "added_to_cart_value": 12650,
                  "added_to_carts": 165,
                  "bid_type": "minimum_cost",
                  "budget_amount": 50,
                  "budget_optimization": "ad_campaign",
                  "budget_type": "daily",
                  "click_through_rate": 0.025,
                  "clicks": 5500,
                  "completed_registration_value": 1650,
                  "completed_registrations": 55,
                  "contact_value": 2640,
                  "contacts": 88,
                  "cost_per_added_to_cart": 8,
                  "cost_per_click": 0.24,
                  "cost_per_completed_registration": 24,
                  "cost_per_contact": 15,
                  "cost_per_lead": 10,
                  "cost_per_mille": 6,
                  "cost_per_purchase": 30,
                  "cost_per_result": 40,
                  "cost_per_schedule": 22,
                  "cost_per_submitted_application": 120,
                  "cost_per_unique_click": 0.4,
                  "cost_per_viewed_content": 1.1,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_conversions": 41,
                  "custom_event_counts": {
                    "gift_card_purchased": 5,
                    "quote_requested": 33
                  },
                  "custom_event_values": {
                    "gift_card_purchased": 750,
                    "quote_requested": 0
                  },
                  "delivery_status": "payment_failed",
                  "frequency": 1.1,
                  "id": "adcamp_xxxxxxxxxxxxxx",
                  "impressions": 220000,
                  "issues": [
                    {
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad_campaign"
                    }
                  ],
                  "lead_value": 3960,
                  "leads": 132,
                  "objective": "awareness",
                  "optimization_goal": "optimization_goal",
                  "platform": "meta",
                  "purchase_value": 7920,
                  "purchases": 44,
                  "reach": 0,
                  "result_event": "purchase",
                  "result_event_name": "quote_requested",
                  "results": 33,
                  "return_on_ad_spend": 6,
                  "schedule_value": 5400,
                  "schedules": 60,
                  "special_ad_categories": [
                    "housing"
                  ],
                  "spend": 1320,
                  "spend_currency": "usd",
                  "status": "active",
                  "submitted_application_value": 1320,
                  "submitted_applications": 11,
                  "title": "Ceramic coating — Austin leads",
                  "unique_click_through_rate": 1.1,
                  "unique_clicks": 3300,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "viewed_content_value": 8400,
                  "viewed_contents": 1200
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AdCampaign(
            addedToCartValue: 12650,
            addedToCarts: 165,
            bidType: Optional(Nullable<AdCampaignBidType>.value(AdCampaignBidType.minimumCost)),
            budgetAmount: Nullable<Double>.value(50),
            budgetOptimization: Nullable<AdCampaignBudgetOptimization>.value(AdCampaignBudgetOptimization.adCampaign),
            budgetType: Nullable<AdCampaignBudgetType>.value(AdCampaignBudgetType.daily),
            clickThroughRate: 0.025,
            clicks: 5500,
            completedRegistrationValue: 1650,
            completedRegistrations: 55,
            contactValue: 2640,
            contacts: 88,
            costPerAddedToCart: Nullable<Double>.value(8),
            costPerClick: 0.24,
            costPerCompletedRegistration: Nullable<Double>.value(24),
            costPerContact: Nullable<Double>.value(15),
            costPerLead: Nullable<Double>.value(10),
            costPerMille: 6,
            costPerPurchase: Nullable<Double>.value(30),
            costPerResult: Nullable<Double>.value(40),
            costPerSchedule: Nullable<Double>.value(22),
            costPerSubmittedApplication: Nullable<Double>.value(120),
            costPerUniqueClick: Nullable<Double>.value(0.4),
            costPerViewedContent: Nullable<Double>.value(1.1),
            createdAt: "2026-01-01T12:00:00.000Z",
            customConversions: 41,
            customEventCounts: [
                "gift_card_purchased": JSONValue.number(5), 
                "quote_requested": JSONValue.number(33)
            ],
            customEventValues: [
                "gift_card_purchased": JSONValue.number(750), 
                "quote_requested": JSONValue.number(0)
            ],
            deliveryStatus: AdCampaignDeliveryStatus.paymentFailed,
            frequency: Nullable<Double>.value(1.1),
            id: "adcamp_xxxxxxxxxxxxxx",
            impressions: 220000,
            issues: [
                AdPlatformIssue(
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdPlatformIssueResourceType.adCampaign
                )
            ],
            leadValue: 3960,
            leads: 132,
            objective: Nullable<AdCampaignObjective>.value(AdCampaignObjective.awareness),
            optimizationGoal: Nullable<String>.value("optimization_goal"),
            platform: AdCampaignPlatform.meta,
            purchaseValue: 7920,
            purchases: 44,
            reach: 0,
            resultEvent: Nullable<AdCampaignResultEvent>.value(AdCampaignResultEvent.purchase),
            resultEventName: Nullable<String>.value("quote_requested"),
            results: Nullable<Double>.value(33),
            returnOnAdSpend: 6,
            scheduleValue: 5400,
            schedules: 60,
            specialAdCategories: [
                AdCampaignSpecialAdCategoriesItem.housing
            ],
            spend: 1320,
            spendCurrency: Nullable<String>.value("usd"),
            status: AdCampaignStatus.active,
            submittedApplicationValue: 1320,
            submittedApplications: 11,
            title: "Ceramic coating — Austin leads",
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 3300,
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewedContentValue: 8400,
            viewedContents: 1200
        )
        let response = try await client.adCampaigns.create(
            request: .init(
                objective: .awareness,
                platform: .meta,
                title: "Now hiring mobile detailers — Austin"
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
                  "added_to_cart_value": 12650,
                  "added_to_carts": 165,
                  "bid_type": "minimum_cost",
                  "budget_amount": 50,
                  "budget_optimization": "ad_campaign",
                  "budget_type": "daily",
                  "click_through_rate": 0.025,
                  "clicks": 5500,
                  "completed_registration_value": 1650,
                  "completed_registrations": 55,
                  "contact_value": 2640,
                  "contacts": 88,
                  "cost_per_added_to_cart": 8,
                  "cost_per_click": 0.24,
                  "cost_per_completed_registration": 24,
                  "cost_per_contact": 15,
                  "cost_per_lead": 10,
                  "cost_per_mille": 6,
                  "cost_per_purchase": 30,
                  "cost_per_result": 40,
                  "cost_per_schedule": 22,
                  "cost_per_submitted_application": 120,
                  "cost_per_unique_click": 0.4,
                  "cost_per_viewed_content": 1.1,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_conversions": 41,
                  "custom_event_counts": {
                    "gift_card_purchased": 5,
                    "quote_requested": 33
                  },
                  "custom_event_values": {
                    "gift_card_purchased": 750,
                    "quote_requested": 0
                  },
                  "delivery_status": "payment_failed",
                  "frequency": 1.1,
                  "id": "adcamp_xxxxxxxxxxxxxx",
                  "impressions": 220000,
                  "issues": [
                    {
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad_campaign"
                    }
                  ],
                  "lead_value": 3960,
                  "leads": 132,
                  "objective": "awareness",
                  "optimization_goal": "optimization_goal",
                  "platform": "meta",
                  "purchase_value": 7920,
                  "purchases": 44,
                  "reach": 0,
                  "result_event": "purchase",
                  "result_event_name": "quote_requested",
                  "results": 33,
                  "return_on_ad_spend": 6,
                  "schedule_value": 5400,
                  "schedules": 60,
                  "special_ad_categories": [
                    "housing"
                  ],
                  "spend": 1320,
                  "spend_currency": "usd",
                  "status": "active",
                  "submitted_application_value": 1320,
                  "submitted_applications": 11,
                  "title": "Ceramic coating — Austin leads",
                  "unique_click_through_rate": 1.1,
                  "unique_clicks": 3300,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "viewed_content_value": 8400,
                  "viewed_contents": 1200
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AdCampaign(
            addedToCartValue: 12650,
            addedToCarts: 165,
            bidType: Optional(Nullable<AdCampaignBidType>.value(AdCampaignBidType.minimumCost)),
            budgetAmount: Nullable<Double>.value(50),
            budgetOptimization: Nullable<AdCampaignBudgetOptimization>.value(AdCampaignBudgetOptimization.adCampaign),
            budgetType: Nullable<AdCampaignBudgetType>.value(AdCampaignBudgetType.daily),
            clickThroughRate: 0.025,
            clicks: 5500,
            completedRegistrationValue: 1650,
            completedRegistrations: 55,
            contactValue: 2640,
            contacts: 88,
            costPerAddedToCart: Nullable<Double>.value(8),
            costPerClick: 0.24,
            costPerCompletedRegistration: Nullable<Double>.value(24),
            costPerContact: Nullable<Double>.value(15),
            costPerLead: Nullable<Double>.value(10),
            costPerMille: 6,
            costPerPurchase: Nullable<Double>.value(30),
            costPerResult: Nullable<Double>.value(40),
            costPerSchedule: Nullable<Double>.value(22),
            costPerSubmittedApplication: Nullable<Double>.value(120),
            costPerUniqueClick: Nullable<Double>.value(0.4),
            costPerViewedContent: Nullable<Double>.value(1.1),
            createdAt: "2026-01-01T12:00:00.000Z",
            customConversions: 41,
            customEventCounts: [
                "gift_card_purchased": JSONValue.number(5), 
                "quote_requested": JSONValue.number(33)
            ],
            customEventValues: [
                "gift_card_purchased": JSONValue.number(750), 
                "quote_requested": JSONValue.number(0)
            ],
            deliveryStatus: AdCampaignDeliveryStatus.paymentFailed,
            frequency: Nullable<Double>.value(1.1),
            id: "adcamp_xxxxxxxxxxxxxx",
            impressions: 220000,
            issues: [
                AdPlatformIssue(
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdPlatformIssueResourceType.adCampaign
                )
            ],
            leadValue: 3960,
            leads: 132,
            objective: Nullable<AdCampaignObjective>.value(AdCampaignObjective.awareness),
            optimizationGoal: Nullable<String>.value("optimization_goal"),
            platform: AdCampaignPlatform.meta,
            purchaseValue: 7920,
            purchases: 44,
            reach: 0,
            resultEvent: Nullable<AdCampaignResultEvent>.value(AdCampaignResultEvent.purchase),
            resultEventName: Nullable<String>.value("quote_requested"),
            results: Nullable<Double>.value(33),
            returnOnAdSpend: 6,
            scheduleValue: 5400,
            schedules: 60,
            specialAdCategories: [
                AdCampaignSpecialAdCategoriesItem.housing
            ],
            spend: 1320,
            spendCurrency: Nullable<String>.value("usd"),
            status: AdCampaignStatus.active,
            submittedApplicationValue: 1320,
            submittedApplications: 11,
            title: "Ceramic coating — Austin leads",
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 3300,
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewedContentValue: 8400,
            viewedContents: 1200
        )
        let response = try await client.adCampaigns.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "deleted": true,
                  "id": "adcamp_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteAdCampaignsResponse(
            deleted: true,
            id: "adcamp_xxxxxxxxxxxxxx"
        )
        let response = try await client.adCampaigns.delete(
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
                  "added_to_cart_value": 12650,
                  "added_to_carts": 165,
                  "bid_type": "minimum_cost",
                  "budget_amount": 50,
                  "budget_optimization": "ad_campaign",
                  "budget_type": "daily",
                  "click_through_rate": 0.025,
                  "clicks": 5500,
                  "completed_registration_value": 1650,
                  "completed_registrations": 55,
                  "contact_value": 2640,
                  "contacts": 88,
                  "cost_per_added_to_cart": 8,
                  "cost_per_click": 0.24,
                  "cost_per_completed_registration": 24,
                  "cost_per_contact": 15,
                  "cost_per_lead": 10,
                  "cost_per_mille": 6,
                  "cost_per_purchase": 30,
                  "cost_per_result": 40,
                  "cost_per_schedule": 22,
                  "cost_per_submitted_application": 120,
                  "cost_per_unique_click": 0.4,
                  "cost_per_viewed_content": 1.1,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_conversions": 41,
                  "custom_event_counts": {
                    "gift_card_purchased": 5,
                    "quote_requested": 33
                  },
                  "custom_event_values": {
                    "gift_card_purchased": 750,
                    "quote_requested": 0
                  },
                  "delivery_status": "payment_failed",
                  "frequency": 1.1,
                  "id": "adcamp_xxxxxxxxxxxxxx",
                  "impressions": 220000,
                  "issues": [
                    {
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad_campaign"
                    }
                  ],
                  "lead_value": 3960,
                  "leads": 132,
                  "objective": "awareness",
                  "optimization_goal": "optimization_goal",
                  "platform": "meta",
                  "purchase_value": 7920,
                  "purchases": 44,
                  "reach": 0,
                  "result_event": "purchase",
                  "result_event_name": "quote_requested",
                  "results": 33,
                  "return_on_ad_spend": 6,
                  "schedule_value": 5400,
                  "schedules": 60,
                  "special_ad_categories": [
                    "housing"
                  ],
                  "spend": 1320,
                  "spend_currency": "usd",
                  "status": "active",
                  "submitted_application_value": 1320,
                  "submitted_applications": 11,
                  "title": "Ceramic coating — Austin leads",
                  "unique_click_through_rate": 1.1,
                  "unique_clicks": 3300,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "viewed_content_value": 8400,
                  "viewed_contents": 1200
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AdCampaign(
            addedToCartValue: 12650,
            addedToCarts: 165,
            bidType: Optional(Nullable<AdCampaignBidType>.value(AdCampaignBidType.minimumCost)),
            budgetAmount: Nullable<Double>.value(50),
            budgetOptimization: Nullable<AdCampaignBudgetOptimization>.value(AdCampaignBudgetOptimization.adCampaign),
            budgetType: Nullable<AdCampaignBudgetType>.value(AdCampaignBudgetType.daily),
            clickThroughRate: 0.025,
            clicks: 5500,
            completedRegistrationValue: 1650,
            completedRegistrations: 55,
            contactValue: 2640,
            contacts: 88,
            costPerAddedToCart: Nullable<Double>.value(8),
            costPerClick: 0.24,
            costPerCompletedRegistration: Nullable<Double>.value(24),
            costPerContact: Nullable<Double>.value(15),
            costPerLead: Nullable<Double>.value(10),
            costPerMille: 6,
            costPerPurchase: Nullable<Double>.value(30),
            costPerResult: Nullable<Double>.value(40),
            costPerSchedule: Nullable<Double>.value(22),
            costPerSubmittedApplication: Nullable<Double>.value(120),
            costPerUniqueClick: Nullable<Double>.value(0.4),
            costPerViewedContent: Nullable<Double>.value(1.1),
            createdAt: "2026-01-01T12:00:00.000Z",
            customConversions: 41,
            customEventCounts: [
                "gift_card_purchased": JSONValue.number(5), 
                "quote_requested": JSONValue.number(33)
            ],
            customEventValues: [
                "gift_card_purchased": JSONValue.number(750), 
                "quote_requested": JSONValue.number(0)
            ],
            deliveryStatus: AdCampaignDeliveryStatus.paymentFailed,
            frequency: Nullable<Double>.value(1.1),
            id: "adcamp_xxxxxxxxxxxxxx",
            impressions: 220000,
            issues: [
                AdPlatformIssue(
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdPlatformIssueResourceType.adCampaign
                )
            ],
            leadValue: 3960,
            leads: 132,
            objective: Nullable<AdCampaignObjective>.value(AdCampaignObjective.awareness),
            optimizationGoal: Nullable<String>.value("optimization_goal"),
            platform: AdCampaignPlatform.meta,
            purchaseValue: 7920,
            purchases: 44,
            reach: 0,
            resultEvent: Nullable<AdCampaignResultEvent>.value(AdCampaignResultEvent.purchase),
            resultEventName: Nullable<String>.value("quote_requested"),
            results: Nullable<Double>.value(33),
            returnOnAdSpend: 6,
            scheduleValue: 5400,
            schedules: 60,
            specialAdCategories: [
                AdCampaignSpecialAdCategoriesItem.housing
            ],
            spend: 1320,
            spendCurrency: Nullable<String>.value("usd"),
            status: AdCampaignStatus.active,
            submittedApplicationValue: 1320,
            submittedApplications: 11,
            title: "Ceramic coating — Austin leads",
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 3300,
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewedContentValue: 8400,
            viewedContents: 1200
        )
        let response = try await client.adCampaigns.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func duplicate1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "added_to_cart_value": 12650,
                      "added_to_carts": 165,
                      "bid_type": "minimum_cost",
                      "budget_amount": 50,
                      "budget_optimization": "ad_campaign",
                      "budget_type": "daily",
                      "click_through_rate": 0.025,
                      "clicks": 5500,
                      "completed_registration_value": 1650,
                      "completed_registrations": 55,
                      "contact_value": 2640,
                      "contacts": 88,
                      "cost_per_added_to_cart": 8,
                      "cost_per_click": 0.24,
                      "cost_per_completed_registration": 24,
                      "cost_per_contact": 15,
                      "cost_per_lead": 10,
                      "cost_per_mille": 6,
                      "cost_per_purchase": 30,
                      "cost_per_result": 40,
                      "cost_per_schedule": 22,
                      "cost_per_submitted_application": 120,
                      "cost_per_unique_click": 0.4,
                      "cost_per_viewed_content": 1.1,
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "custom_conversions": 41,
                      "custom_event_counts": {
                        "gift_card_purchased": 5,
                        "quote_requested": 33
                      },
                      "custom_event_values": {
                        "gift_card_purchased": 750,
                        "quote_requested": 0
                      },
                      "delivery_status": "payment_failed",
                      "frequency": 1.1,
                      "id": "adcamp_xxxxxxxxxxxxxx",
                      "impressions": 220000,
                      "issues": [
                        {
                          "id": "adiss_xxxxxxxxxxxxxx",
                          "message": "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                          "resource_id": "ad_xxxxxxxxxxxxxx",
                          "resource_type": "ad_campaign"
                        }
                      ],
                      "lead_value": 3960,
                      "leads": 132,
                      "objective": "awareness",
                      "optimization_goal": "optimization_goal",
                      "platform": "meta",
                      "purchase_value": 7920,
                      "purchases": 44,
                      "reach": 0,
                      "result_event": "purchase",
                      "result_event_name": "quote_requested",
                      "results": 33,
                      "return_on_ad_spend": 6,
                      "schedule_value": 5400,
                      "schedules": 60,
                      "special_ad_categories": [
                        "housing"
                      ],
                      "spend": 1320,
                      "spend_currency": "usd",
                      "status": "active",
                      "submitted_application_value": 1320,
                      "submitted_applications": 11,
                      "title": "Ceramic coating — Austin leads",
                      "unique_click_through_rate": 1.1,
                      "unique_clicks": 3300,
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "viewed_content_value": 8400,
                      "viewed_contents": 1200
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
        let expectedResponse = DuplicateAdCampaignsResponse(
            data: [
                AdCampaign(
                    addedToCartValue: 12650,
                    addedToCarts: 165,
                    bidType: Optional(Nullable<AdCampaignBidType>.value(AdCampaignBidType.minimumCost)),
                    budgetAmount: Nullable<Double>.value(50),
                    budgetOptimization: Nullable<AdCampaignBudgetOptimization>.value(AdCampaignBudgetOptimization.adCampaign),
                    budgetType: Nullable<AdCampaignBudgetType>.value(AdCampaignBudgetType.daily),
                    clickThroughRate: 0.025,
                    clicks: 5500,
                    completedRegistrationValue: 1650,
                    completedRegistrations: 55,
                    contactValue: 2640,
                    contacts: 88,
                    costPerAddedToCart: Nullable<Double>.value(8),
                    costPerClick: 0.24,
                    costPerCompletedRegistration: Nullable<Double>.value(24),
                    costPerContact: Nullable<Double>.value(15),
                    costPerLead: Nullable<Double>.value(10),
                    costPerMille: 6,
                    costPerPurchase: Nullable<Double>.value(30),
                    costPerResult: Nullable<Double>.value(40),
                    costPerSchedule: Nullable<Double>.value(22),
                    costPerSubmittedApplication: Nullable<Double>.value(120),
                    costPerUniqueClick: Nullable<Double>.value(0.4),
                    costPerViewedContent: Nullable<Double>.value(1.1),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    customConversions: 41,
                    customEventCounts: [
                        "gift_card_purchased": JSONValue.number(5), 
                        "quote_requested": JSONValue.number(33)
                    ],
                    customEventValues: [
                        "gift_card_purchased": JSONValue.number(750), 
                        "quote_requested": JSONValue.number(0)
                    ],
                    deliveryStatus: AdCampaignDeliveryStatus.paymentFailed,
                    frequency: Nullable<Double>.value(1.1),
                    id: "adcamp_xxxxxxxxxxxxxx",
                    impressions: 220000,
                    issues: [
                        AdPlatformIssue(
                            id: "adiss_xxxxxxxxxxxxxx",
                            message: "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                            resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                            resourceType: AdPlatformIssueResourceType.adCampaign
                        )
                    ],
                    leadValue: 3960,
                    leads: 132,
                    objective: Nullable<AdCampaignObjective>.value(AdCampaignObjective.awareness),
                    optimizationGoal: Nullable<String>.value("optimization_goal"),
                    platform: AdCampaignPlatform.meta,
                    purchaseValue: 7920,
                    purchases: 44,
                    reach: 0,
                    resultEvent: Nullable<AdCampaignResultEvent>.value(AdCampaignResultEvent.purchase),
                    resultEventName: Nullable<String>.value("quote_requested"),
                    results: Nullable<Double>.value(33),
                    returnOnAdSpend: 6,
                    scheduleValue: 5400,
                    schedules: 60,
                    specialAdCategories: [
                        AdCampaignSpecialAdCategoriesItem.housing
                    ],
                    spend: 1320,
                    spendCurrency: Nullable<String>.value("usd"),
                    status: AdCampaignStatus.active,
                    submittedApplicationValue: 1320,
                    submittedApplications: 11,
                    title: "Ceramic coating — Austin leads",
                    uniqueClickThroughRate: Nullable<Double>.value(1.1),
                    uniqueClicks: 3300,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    viewedContentValue: 8400,
                    viewedContents: 1200
                )
            ]
        )
        let response = try await client.adCampaigns.duplicate(
            id: "id",
            request: .init(),
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
                  "added_to_cart_value": 12650,
                  "added_to_carts": 165,
                  "bid_type": "minimum_cost",
                  "budget_amount": 50,
                  "budget_optimization": "ad_campaign",
                  "budget_type": "daily",
                  "click_through_rate": 0.025,
                  "clicks": 5500,
                  "completed_registration_value": 1650,
                  "completed_registrations": 55,
                  "contact_value": 2640,
                  "contacts": 88,
                  "cost_per_added_to_cart": 8,
                  "cost_per_click": 0.24,
                  "cost_per_completed_registration": 24,
                  "cost_per_contact": 15,
                  "cost_per_lead": 10,
                  "cost_per_mille": 6,
                  "cost_per_purchase": 30,
                  "cost_per_result": 40,
                  "cost_per_schedule": 22,
                  "cost_per_submitted_application": 120,
                  "cost_per_unique_click": 0.4,
                  "cost_per_viewed_content": 1.1,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_conversions": 41,
                  "custom_event_counts": {
                    "gift_card_purchased": 5,
                    "quote_requested": 33
                  },
                  "custom_event_values": {
                    "gift_card_purchased": 750,
                    "quote_requested": 0
                  },
                  "delivery_status": "payment_failed",
                  "frequency": 1.1,
                  "id": "adcamp_xxxxxxxxxxxxxx",
                  "impressions": 220000,
                  "issues": [
                    {
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad_campaign"
                    }
                  ],
                  "lead_value": 3960,
                  "leads": 132,
                  "objective": "awareness",
                  "optimization_goal": "optimization_goal",
                  "platform": "meta",
                  "purchase_value": 7920,
                  "purchases": 44,
                  "reach": 0,
                  "result_event": "purchase",
                  "result_event_name": "quote_requested",
                  "results": 33,
                  "return_on_ad_spend": 6,
                  "schedule_value": 5400,
                  "schedules": 60,
                  "special_ad_categories": [
                    "housing"
                  ],
                  "spend": 1320,
                  "spend_currency": "usd",
                  "status": "active",
                  "submitted_application_value": 1320,
                  "submitted_applications": 11,
                  "title": "Ceramic coating — Austin leads",
                  "unique_click_through_rate": 1.1,
                  "unique_clicks": 3300,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "viewed_content_value": 8400,
                  "viewed_contents": 1200
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AdCampaign(
            addedToCartValue: 12650,
            addedToCarts: 165,
            bidType: Optional(Nullable<AdCampaignBidType>.value(AdCampaignBidType.minimumCost)),
            budgetAmount: Nullable<Double>.value(50),
            budgetOptimization: Nullable<AdCampaignBudgetOptimization>.value(AdCampaignBudgetOptimization.adCampaign),
            budgetType: Nullable<AdCampaignBudgetType>.value(AdCampaignBudgetType.daily),
            clickThroughRate: 0.025,
            clicks: 5500,
            completedRegistrationValue: 1650,
            completedRegistrations: 55,
            contactValue: 2640,
            contacts: 88,
            costPerAddedToCart: Nullable<Double>.value(8),
            costPerClick: 0.24,
            costPerCompletedRegistration: Nullable<Double>.value(24),
            costPerContact: Nullable<Double>.value(15),
            costPerLead: Nullable<Double>.value(10),
            costPerMille: 6,
            costPerPurchase: Nullable<Double>.value(30),
            costPerResult: Nullable<Double>.value(40),
            costPerSchedule: Nullable<Double>.value(22),
            costPerSubmittedApplication: Nullable<Double>.value(120),
            costPerUniqueClick: Nullable<Double>.value(0.4),
            costPerViewedContent: Nullable<Double>.value(1.1),
            createdAt: "2026-01-01T12:00:00.000Z",
            customConversions: 41,
            customEventCounts: [
                "gift_card_purchased": JSONValue.number(5), 
                "quote_requested": JSONValue.number(33)
            ],
            customEventValues: [
                "gift_card_purchased": JSONValue.number(750), 
                "quote_requested": JSONValue.number(0)
            ],
            deliveryStatus: AdCampaignDeliveryStatus.paymentFailed,
            frequency: Nullable<Double>.value(1.1),
            id: "adcamp_xxxxxxxxxxxxxx",
            impressions: 220000,
            issues: [
                AdPlatformIssue(
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdPlatformIssueResourceType.adCampaign
                )
            ],
            leadValue: 3960,
            leads: 132,
            objective: Nullable<AdCampaignObjective>.value(AdCampaignObjective.awareness),
            optimizationGoal: Nullable<String>.value("optimization_goal"),
            platform: AdCampaignPlatform.meta,
            purchaseValue: 7920,
            purchases: 44,
            reach: 0,
            resultEvent: Nullable<AdCampaignResultEvent>.value(AdCampaignResultEvent.purchase),
            resultEventName: Nullable<String>.value("quote_requested"),
            results: Nullable<Double>.value(33),
            returnOnAdSpend: 6,
            scheduleValue: 5400,
            schedules: 60,
            specialAdCategories: [
                AdCampaignSpecialAdCategoriesItem.housing
            ],
            spend: 1320,
            spendCurrency: Nullable<String>.value("usd"),
            status: AdCampaignStatus.active,
            submittedApplicationValue: 1320,
            submittedApplications: 11,
            title: "Ceramic coating — Austin leads",
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 3300,
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewedContentValue: 8400,
            viewedContents: 1200
        )
        let response = try await client.adCampaigns.pause(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retryPayment1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "added_to_cart_value": 12650,
                  "added_to_carts": 165,
                  "bid_type": "minimum_cost",
                  "budget_amount": 50,
                  "budget_optimization": "ad_campaign",
                  "budget_type": "daily",
                  "click_through_rate": 0.025,
                  "clicks": 5500,
                  "completed_registration_value": 1650,
                  "completed_registrations": 55,
                  "contact_value": 2640,
                  "contacts": 88,
                  "cost_per_added_to_cart": 8,
                  "cost_per_click": 0.24,
                  "cost_per_completed_registration": 24,
                  "cost_per_contact": 15,
                  "cost_per_lead": 10,
                  "cost_per_mille": 6,
                  "cost_per_purchase": 30,
                  "cost_per_result": 40,
                  "cost_per_schedule": 22,
                  "cost_per_submitted_application": 120,
                  "cost_per_unique_click": 0.4,
                  "cost_per_viewed_content": 1.1,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_conversions": 41,
                  "custom_event_counts": {
                    "gift_card_purchased": 5,
                    "quote_requested": 33
                  },
                  "custom_event_values": {
                    "gift_card_purchased": 750,
                    "quote_requested": 0
                  },
                  "delivery_status": "payment_failed",
                  "frequency": 1.1,
                  "id": "adcamp_xxxxxxxxxxxxxx",
                  "impressions": 220000,
                  "issues": [
                    {
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad_campaign"
                    }
                  ],
                  "lead_value": 3960,
                  "leads": 132,
                  "objective": "awareness",
                  "optimization_goal": "optimization_goal",
                  "platform": "meta",
                  "purchase_value": 7920,
                  "purchases": 44,
                  "reach": 0,
                  "result_event": "purchase",
                  "result_event_name": "quote_requested",
                  "results": 33,
                  "return_on_ad_spend": 6,
                  "schedule_value": 5400,
                  "schedules": 60,
                  "special_ad_categories": [
                    "housing"
                  ],
                  "spend": 1320,
                  "spend_currency": "usd",
                  "status": "active",
                  "submitted_application_value": 1320,
                  "submitted_applications": 11,
                  "title": "Ceramic coating — Austin leads",
                  "unique_click_through_rate": 1.1,
                  "unique_clicks": 3300,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "viewed_content_value": 8400,
                  "viewed_contents": 1200
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AdCampaign(
            addedToCartValue: 12650,
            addedToCarts: 165,
            bidType: Optional(Nullable<AdCampaignBidType>.value(AdCampaignBidType.minimumCost)),
            budgetAmount: Nullable<Double>.value(50),
            budgetOptimization: Nullable<AdCampaignBudgetOptimization>.value(AdCampaignBudgetOptimization.adCampaign),
            budgetType: Nullable<AdCampaignBudgetType>.value(AdCampaignBudgetType.daily),
            clickThroughRate: 0.025,
            clicks: 5500,
            completedRegistrationValue: 1650,
            completedRegistrations: 55,
            contactValue: 2640,
            contacts: 88,
            costPerAddedToCart: Nullable<Double>.value(8),
            costPerClick: 0.24,
            costPerCompletedRegistration: Nullable<Double>.value(24),
            costPerContact: Nullable<Double>.value(15),
            costPerLead: Nullable<Double>.value(10),
            costPerMille: 6,
            costPerPurchase: Nullable<Double>.value(30),
            costPerResult: Nullable<Double>.value(40),
            costPerSchedule: Nullable<Double>.value(22),
            costPerSubmittedApplication: Nullable<Double>.value(120),
            costPerUniqueClick: Nullable<Double>.value(0.4),
            costPerViewedContent: Nullable<Double>.value(1.1),
            createdAt: "2026-01-01T12:00:00.000Z",
            customConversions: 41,
            customEventCounts: [
                "gift_card_purchased": JSONValue.number(5), 
                "quote_requested": JSONValue.number(33)
            ],
            customEventValues: [
                "gift_card_purchased": JSONValue.number(750), 
                "quote_requested": JSONValue.number(0)
            ],
            deliveryStatus: AdCampaignDeliveryStatus.paymentFailed,
            frequency: Nullable<Double>.value(1.1),
            id: "adcamp_xxxxxxxxxxxxxx",
            impressions: 220000,
            issues: [
                AdPlatformIssue(
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdPlatformIssueResourceType.adCampaign
                )
            ],
            leadValue: 3960,
            leads: 132,
            objective: Nullable<AdCampaignObjective>.value(AdCampaignObjective.awareness),
            optimizationGoal: Nullable<String>.value("optimization_goal"),
            platform: AdCampaignPlatform.meta,
            purchaseValue: 7920,
            purchases: 44,
            reach: 0,
            resultEvent: Nullable<AdCampaignResultEvent>.value(AdCampaignResultEvent.purchase),
            resultEventName: Nullable<String>.value("quote_requested"),
            results: Nullable<Double>.value(33),
            returnOnAdSpend: 6,
            scheduleValue: 5400,
            schedules: 60,
            specialAdCategories: [
                AdCampaignSpecialAdCategoriesItem.housing
            ],
            spend: 1320,
            spendCurrency: Nullable<String>.value("usd"),
            status: AdCampaignStatus.active,
            submittedApplicationValue: 1320,
            submittedApplications: 11,
            title: "Ceramic coating — Austin leads",
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 3300,
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewedContentValue: 8400,
            viewedContents: 1200
        )
        let response = try await client.adCampaigns.retryPayment(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func unpause1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "added_to_cart_value": 12650,
                  "added_to_carts": 165,
                  "bid_type": "minimum_cost",
                  "budget_amount": 50,
                  "budget_optimization": "ad_campaign",
                  "budget_type": "daily",
                  "click_through_rate": 0.025,
                  "clicks": 5500,
                  "completed_registration_value": 1650,
                  "completed_registrations": 55,
                  "contact_value": 2640,
                  "contacts": 88,
                  "cost_per_added_to_cart": 8,
                  "cost_per_click": 0.24,
                  "cost_per_completed_registration": 24,
                  "cost_per_contact": 15,
                  "cost_per_lead": 10,
                  "cost_per_mille": 6,
                  "cost_per_purchase": 30,
                  "cost_per_result": 40,
                  "cost_per_schedule": 22,
                  "cost_per_submitted_application": 120,
                  "cost_per_unique_click": 0.4,
                  "cost_per_viewed_content": 1.1,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_conversions": 41,
                  "custom_event_counts": {
                    "gift_card_purchased": 5,
                    "quote_requested": 33
                  },
                  "custom_event_values": {
                    "gift_card_purchased": 750,
                    "quote_requested": 0
                  },
                  "delivery_status": "payment_failed",
                  "frequency": 1.1,
                  "id": "adcamp_xxxxxxxxxxxxxx",
                  "impressions": 220000,
                  "issues": [
                    {
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad_campaign"
                    }
                  ],
                  "lead_value": 3960,
                  "leads": 132,
                  "objective": "awareness",
                  "optimization_goal": "optimization_goal",
                  "platform": "meta",
                  "purchase_value": 7920,
                  "purchases": 44,
                  "reach": 0,
                  "result_event": "purchase",
                  "result_event_name": "quote_requested",
                  "results": 33,
                  "return_on_ad_spend": 6,
                  "schedule_value": 5400,
                  "schedules": 60,
                  "special_ad_categories": [
                    "housing"
                  ],
                  "spend": 1320,
                  "spend_currency": "usd",
                  "status": "active",
                  "submitted_application_value": 1320,
                  "submitted_applications": 11,
                  "title": "Ceramic coating — Austin leads",
                  "unique_click_through_rate": 1.1,
                  "unique_clicks": 3300,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "viewed_content_value": 8400,
                  "viewed_contents": 1200
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AdCampaign(
            addedToCartValue: 12650,
            addedToCarts: 165,
            bidType: Optional(Nullable<AdCampaignBidType>.value(AdCampaignBidType.minimumCost)),
            budgetAmount: Nullable<Double>.value(50),
            budgetOptimization: Nullable<AdCampaignBudgetOptimization>.value(AdCampaignBudgetOptimization.adCampaign),
            budgetType: Nullable<AdCampaignBudgetType>.value(AdCampaignBudgetType.daily),
            clickThroughRate: 0.025,
            clicks: 5500,
            completedRegistrationValue: 1650,
            completedRegistrations: 55,
            contactValue: 2640,
            contacts: 88,
            costPerAddedToCart: Nullable<Double>.value(8),
            costPerClick: 0.24,
            costPerCompletedRegistration: Nullable<Double>.value(24),
            costPerContact: Nullable<Double>.value(15),
            costPerLead: Nullable<Double>.value(10),
            costPerMille: 6,
            costPerPurchase: Nullable<Double>.value(30),
            costPerResult: Nullable<Double>.value(40),
            costPerSchedule: Nullable<Double>.value(22),
            costPerSubmittedApplication: Nullable<Double>.value(120),
            costPerUniqueClick: Nullable<Double>.value(0.4),
            costPerViewedContent: Nullable<Double>.value(1.1),
            createdAt: "2026-01-01T12:00:00.000Z",
            customConversions: 41,
            customEventCounts: [
                "gift_card_purchased": JSONValue.number(5), 
                "quote_requested": JSONValue.number(33)
            ],
            customEventValues: [
                "gift_card_purchased": JSONValue.number(750), 
                "quote_requested": JSONValue.number(0)
            ],
            deliveryStatus: AdCampaignDeliveryStatus.paymentFailed,
            frequency: Nullable<Double>.value(1.1),
            id: "adcamp_xxxxxxxxxxxxxx",
            impressions: 220000,
            issues: [
                AdPlatformIssue(
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdPlatformIssueResourceType.adCampaign
                )
            ],
            leadValue: 3960,
            leads: 132,
            objective: Nullable<AdCampaignObjective>.value(AdCampaignObjective.awareness),
            optimizationGoal: Nullable<String>.value("optimization_goal"),
            platform: AdCampaignPlatform.meta,
            purchaseValue: 7920,
            purchases: 44,
            reach: 0,
            resultEvent: Nullable<AdCampaignResultEvent>.value(AdCampaignResultEvent.purchase),
            resultEventName: Nullable<String>.value("quote_requested"),
            results: Nullable<Double>.value(33),
            returnOnAdSpend: 6,
            scheduleValue: 5400,
            schedules: 60,
            specialAdCategories: [
                AdCampaignSpecialAdCategoriesItem.housing
            ],
            spend: 1320,
            spendCurrency: Nullable<String>.value("usd"),
            status: AdCampaignStatus.active,
            submittedApplicationValue: 1320,
            submittedApplications: 11,
            title: "Ceramic coating — Austin leads",
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 3300,
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewedContentValue: 8400,
            viewedContents: 1200
        )
        let response = try await client.adCampaigns.unpause(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}