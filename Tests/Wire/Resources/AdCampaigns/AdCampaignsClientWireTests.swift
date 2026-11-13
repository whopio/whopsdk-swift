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
                      "account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "route": "shine-time-auto-detailing",
                        "title": "Shine Time Auto Detailing"
                      },
                      "added_to_cart_value": 12650,
                      "added_to_carts": 165,
                      "budget_amount": 50,
                      "budget_amount_local": 50,
                      "budget_currency": "usd",
                      "budget_optimization": "ad_campaign",
                      "budget_type": "daily",
                      "campaign_type": "standard",
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
                      "desired_cost_per_result": 4.5,
                      "ends_at": "2026-01-01T12:00:00.000Z",
                      "frequency": 1.1,
                      "id": "adcamp_xxxxxxxxxxxxxx",
                      "impressions": 220000,
                      "issues": [
                        {
                          "category": "information",
                          "id": "adiss_xxxxxxxxxxxxxx",
                          "message": "Your ad didn't pass our content review. Update it to follow our ad guidelines and resubmit.",
                          "resource_id": "ad_xxxxxxxxxxxxxx",
                          "resource_type": "ad_campaign",
                          "title": "Ad issue"
                        }
                      ],
                      "lead_value": 3960,
                      "leads": 132,
                      "link_clicks": 4400,
                      "objective": "awareness",
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
                      "starts_at": "2026-01-01T12:00:00.000Z",
                      "status": "active",
                      "submitted_application_value": 1320,
                      "submitted_applications": 11,
                      "target_cost_per_result": 1.1,
                      "target_result_event": "target_result_event",
                      "title": "Ceramic coating — Austin leads",
                      "unique_click_through_rate": 1.1,
                      "unique_clicks": 3300,
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "viewed_content_value": 8400,
                      "viewed_contents": 1200
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
        let expectedResponse = ListAdCampaignsResponse(
            data: [
                AdCampaign(
                    account: Nullable<StorefrontAccount>.value(StorefrontAccount(
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        route: "shine-time-auto-detailing",
                        title: "Shine Time Auto Detailing"
                    )),
                    addedToCartValue: 12650,
                    addedToCarts: 165,
                    budgetAmount: Nullable<Double>.value(50),
                    budgetAmountLocal: Nullable<Double>.value(50),
                    budgetCurrency: "usd",
                    budgetOptimization: Nullable<AdCampaignBudgetOptimization>.value(AdCampaignBudgetOptimization.adCampaign),
                    budgetType: Nullable<AdCampaignBudgetType>.value(AdCampaignBudgetType.daily),
                    campaignType: AdCampaignCampaignType.standard,
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
                    desiredCostPerResult: Optional(Nullable<Double>.value(4.5)),
                    endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    frequency: Nullable<Double>.value(1.1),
                    id: "adcamp_xxxxxxxxxxxxxx",
                    impressions: 220000,
                    issues: [
                        AdPlatformIssue(
                            category: AdPlatformIssueCategory.information,
                            id: "adiss_xxxxxxxxxxxxxx",
                            message: "Your ad didn't pass our content review. Update it to follow our ad guidelines and resubmit.",
                            resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                            resourceType: AdPlatformIssueResourceType.adCampaign,
                            title: "Ad issue"
                        )
                    ],
                    leadValue: 3960,
                    leads: 132,
                    linkClicks: 4400,
                    objective: Nullable<AdCampaignObjective>.value(AdCampaignObjective.awareness),
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
                    startsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    status: AdCampaignStatus.active,
                    submittedApplicationValue: 1320,
                    submittedApplications: 11,
                    targetCostPerResult: Nullable<Double>.value(1.1),
                    targetResultEvent: Nullable<String>.value("target_result_event"),
                    title: "Ceramic coating — Austin leads",
                    uniqueClickThroughRate: Nullable<Double>.value(1.1),
                    uniqueClicks: 3300,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    viewedContentValue: 8400,
                    viewedContents: 1200
                )
            ],
            pageInfo: ListAdCampaignsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "added_to_cart_value": 12650,
                  "added_to_carts": 165,
                  "budget_amount": 50,
                  "budget_amount_local": 50,
                  "budget_currency": "usd",
                  "budget_optimization": "ad_campaign",
                  "budget_type": "daily",
                  "campaign_type": "standard",
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
                  "desired_cost_per_result": 4.5,
                  "ends_at": "2026-01-01T12:00:00.000Z",
                  "frequency": 1.1,
                  "id": "adcamp_xxxxxxxxxxxxxx",
                  "impressions": 220000,
                  "issues": [
                    {
                      "category": "information",
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad didn't pass our content review. Update it to follow our ad guidelines and resubmit.",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad_campaign",
                      "title": "Ad issue"
                    }
                  ],
                  "lead_value": 3960,
                  "leads": 132,
                  "link_clicks": 4400,
                  "objective": "awareness",
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
                  "starts_at": "2026-01-01T12:00:00.000Z",
                  "status": "active",
                  "submitted_application_value": 1320,
                  "submitted_applications": 11,
                  "target_cost_per_result": 1.1,
                  "target_result_event": "target_result_event",
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
            account: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            addedToCartValue: 12650,
            addedToCarts: 165,
            budgetAmount: Nullable<Double>.value(50),
            budgetAmountLocal: Nullable<Double>.value(50),
            budgetCurrency: "usd",
            budgetOptimization: Nullable<AdCampaignBudgetOptimization>.value(AdCampaignBudgetOptimization.adCampaign),
            budgetType: Nullable<AdCampaignBudgetType>.value(AdCampaignBudgetType.daily),
            campaignType: AdCampaignCampaignType.standard,
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
            desiredCostPerResult: Optional(Nullable<Double>.value(4.5)),
            endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            frequency: Nullable<Double>.value(1.1),
            id: "adcamp_xxxxxxxxxxxxxx",
            impressions: 220000,
            issues: [
                AdPlatformIssue(
                    category: AdPlatformIssueCategory.information,
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad didn't pass our content review. Update it to follow our ad guidelines and resubmit.",
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdPlatformIssueResourceType.adCampaign,
                    title: "Ad issue"
                )
            ],
            leadValue: 3960,
            leads: 132,
            linkClicks: 4400,
            objective: Nullable<AdCampaignObjective>.value(AdCampaignObjective.awareness),
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
            startsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: AdCampaignStatus.active,
            submittedApplicationValue: 1320,
            submittedApplications: 11,
            targetCostPerResult: Nullable<Double>.value(1.1),
            targetResultEvent: Nullable<String>.value("target_result_event"),
            title: "Ceramic coating — Austin leads",
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 3300,
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewedContentValue: 8400,
            viewedContents: 1200
        )
        let response = try await client.adCampaigns.create(
            request: .init(
                objective: .traffic,
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "added_to_cart_value": 12650,
                  "added_to_carts": 165,
                  "budget_amount": 50,
                  "budget_amount_local": 50,
                  "budget_currency": "usd",
                  "budget_optimization": "ad_campaign",
                  "budget_type": "daily",
                  "campaign_type": "standard",
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
                  "desired_cost_per_result": 4.5,
                  "ends_at": "2026-01-01T12:00:00.000Z",
                  "frequency": 1.1,
                  "id": "adcamp_xxxxxxxxxxxxxx",
                  "impressions": 220000,
                  "issues": [
                    {
                      "category": "information",
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad didn't pass our content review. Update it to follow our ad guidelines and resubmit.",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad_campaign",
                      "title": "Ad issue"
                    }
                  ],
                  "lead_value": 3960,
                  "leads": 132,
                  "link_clicks": 4400,
                  "objective": "awareness",
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
                  "starts_at": "2026-01-01T12:00:00.000Z",
                  "status": "active",
                  "submitted_application_value": 1320,
                  "submitted_applications": 11,
                  "target_cost_per_result": 1.1,
                  "target_result_event": "target_result_event",
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
            account: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            addedToCartValue: 12650,
            addedToCarts: 165,
            budgetAmount: Nullable<Double>.value(50),
            budgetAmountLocal: Nullable<Double>.value(50),
            budgetCurrency: "usd",
            budgetOptimization: Nullable<AdCampaignBudgetOptimization>.value(AdCampaignBudgetOptimization.adCampaign),
            budgetType: Nullable<AdCampaignBudgetType>.value(AdCampaignBudgetType.daily),
            campaignType: AdCampaignCampaignType.standard,
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
            desiredCostPerResult: Optional(Nullable<Double>.value(4.5)),
            endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            frequency: Nullable<Double>.value(1.1),
            id: "adcamp_xxxxxxxxxxxxxx",
            impressions: 220000,
            issues: [
                AdPlatformIssue(
                    category: AdPlatformIssueCategory.information,
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad didn't pass our content review. Update it to follow our ad guidelines and resubmit.",
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdPlatformIssueResourceType.adCampaign,
                    title: "Ad issue"
                )
            ],
            leadValue: 3960,
            leads: 132,
            linkClicks: 4400,
            objective: Nullable<AdCampaignObjective>.value(AdCampaignObjective.awareness),
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
            startsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: AdCampaignStatus.active,
            submittedApplicationValue: 1320,
            submittedApplications: 11,
            targetCostPerResult: Nullable<Double>.value(1.1),
            targetResultEvent: Nullable<String>.value("target_result_event"),
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "added_to_cart_value": 12650,
                  "added_to_carts": 165,
                  "budget_amount": 50,
                  "budget_amount_local": 50,
                  "budget_currency": "usd",
                  "budget_optimization": "ad_campaign",
                  "budget_type": "daily",
                  "campaign_type": "standard",
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
                  "desired_cost_per_result": 4.5,
                  "ends_at": "2026-01-01T12:00:00.000Z",
                  "frequency": 1.1,
                  "id": "adcamp_xxxxxxxxxxxxxx",
                  "impressions": 220000,
                  "issues": [
                    {
                      "category": "information",
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad didn't pass our content review. Update it to follow our ad guidelines and resubmit.",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad_campaign",
                      "title": "Ad issue"
                    }
                  ],
                  "lead_value": 3960,
                  "leads": 132,
                  "link_clicks": 4400,
                  "objective": "awareness",
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
                  "starts_at": "2026-01-01T12:00:00.000Z",
                  "status": "active",
                  "submitted_application_value": 1320,
                  "submitted_applications": 11,
                  "target_cost_per_result": 1.1,
                  "target_result_event": "target_result_event",
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
            account: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            addedToCartValue: 12650,
            addedToCarts: 165,
            budgetAmount: Nullable<Double>.value(50),
            budgetAmountLocal: Nullable<Double>.value(50),
            budgetCurrency: "usd",
            budgetOptimization: Nullable<AdCampaignBudgetOptimization>.value(AdCampaignBudgetOptimization.adCampaign),
            budgetType: Nullable<AdCampaignBudgetType>.value(AdCampaignBudgetType.daily),
            campaignType: AdCampaignCampaignType.standard,
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
            desiredCostPerResult: Optional(Nullable<Double>.value(4.5)),
            endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            frequency: Nullable<Double>.value(1.1),
            id: "adcamp_xxxxxxxxxxxxxx",
            impressions: 220000,
            issues: [
                AdPlatformIssue(
                    category: AdPlatformIssueCategory.information,
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad didn't pass our content review. Update it to follow our ad guidelines and resubmit.",
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdPlatformIssueResourceType.adCampaign,
                    title: "Ad issue"
                )
            ],
            leadValue: 3960,
            leads: 132,
            linkClicks: 4400,
            objective: Nullable<AdCampaignObjective>.value(AdCampaignObjective.awareness),
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
            startsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: AdCampaignStatus.active,
            submittedApplicationValue: 1320,
            submittedApplications: 11,
            targetCostPerResult: Nullable<Double>.value(1.1),
            targetResultEvent: Nullable<String>.value("target_result_event"),
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

    @Test func claim1() async throws -> Void {
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
                  "added_to_cart_value": 12650,
                  "added_to_carts": 165,
                  "budget_amount": 50,
                  "budget_amount_local": 50,
                  "budget_currency": "usd",
                  "budget_optimization": "ad_campaign",
                  "budget_type": "daily",
                  "campaign_type": "standard",
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
                  "desired_cost_per_result": 4.5,
                  "ends_at": "2026-01-01T12:00:00.000Z",
                  "frequency": 1.1,
                  "id": "adcamp_xxxxxxxxxxxxxx",
                  "impressions": 220000,
                  "issues": [
                    {
                      "category": "information",
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad didn't pass our content review. Update it to follow our ad guidelines and resubmit.",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad_campaign",
                      "title": "Ad issue"
                    }
                  ],
                  "lead_value": 3960,
                  "leads": 132,
                  "link_clicks": 4400,
                  "objective": "awareness",
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
                  "starts_at": "2026-01-01T12:00:00.000Z",
                  "status": "active",
                  "submitted_application_value": 1320,
                  "submitted_applications": 11,
                  "target_cost_per_result": 1.1,
                  "target_result_event": "target_result_event",
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
            account: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            addedToCartValue: 12650,
            addedToCarts: 165,
            budgetAmount: Nullable<Double>.value(50),
            budgetAmountLocal: Nullable<Double>.value(50),
            budgetCurrency: "usd",
            budgetOptimization: Nullable<AdCampaignBudgetOptimization>.value(AdCampaignBudgetOptimization.adCampaign),
            budgetType: Nullable<AdCampaignBudgetType>.value(AdCampaignBudgetType.daily),
            campaignType: AdCampaignCampaignType.standard,
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
            desiredCostPerResult: Optional(Nullable<Double>.value(4.5)),
            endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            frequency: Nullable<Double>.value(1.1),
            id: "adcamp_xxxxxxxxxxxxxx",
            impressions: 220000,
            issues: [
                AdPlatformIssue(
                    category: AdPlatformIssueCategory.information,
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad didn't pass our content review. Update it to follow our ad guidelines and resubmit.",
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdPlatformIssueResourceType.adCampaign,
                    title: "Ad issue"
                )
            ],
            leadValue: 3960,
            leads: 132,
            linkClicks: 4400,
            objective: Nullable<AdCampaignObjective>.value(AdCampaignObjective.awareness),
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
            startsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: AdCampaignStatus.active,
            submittedApplicationValue: 1320,
            submittedApplications: 11,
            targetCostPerResult: Nullable<Double>.value(1.1),
            targetResultEvent: Nullable<String>.value("target_result_event"),
            title: "Ceramic coating — Austin leads",
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 3300,
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewedContentValue: 8400,
            viewedContents: 1200
        )
        let response = try await client.adCampaigns.claim(
            id: "id",
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
                      "account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "route": "shine-time-auto-detailing",
                        "title": "Shine Time Auto Detailing"
                      },
                      "added_to_cart_value": 12650,
                      "added_to_carts": 165,
                      "budget_amount": 50,
                      "budget_amount_local": 50,
                      "budget_currency": "usd",
                      "budget_optimization": "ad_campaign",
                      "budget_type": "daily",
                      "campaign_type": "standard",
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
                      "desired_cost_per_result": 4.5,
                      "ends_at": "2026-01-01T12:00:00.000Z",
                      "frequency": 1.1,
                      "id": "adcamp_xxxxxxxxxxxxxx",
                      "impressions": 220000,
                      "issues": [
                        {
                          "category": "information",
                          "id": "adiss_xxxxxxxxxxxxxx",
                          "message": "Your ad didn't pass our content review. Update it to follow our ad guidelines and resubmit.",
                          "resource_id": "ad_xxxxxxxxxxxxxx",
                          "resource_type": "ad_campaign",
                          "title": "Ad issue"
                        }
                      ],
                      "lead_value": 3960,
                      "leads": 132,
                      "link_clicks": 4400,
                      "objective": "awareness",
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
                      "starts_at": "2026-01-01T12:00:00.000Z",
                      "status": "active",
                      "submitted_application_value": 1320,
                      "submitted_applications": 11,
                      "target_cost_per_result": 1.1,
                      "target_result_event": "target_result_event",
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
                    account: Nullable<StorefrontAccount>.value(StorefrontAccount(
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        route: "shine-time-auto-detailing",
                        title: "Shine Time Auto Detailing"
                    )),
                    addedToCartValue: 12650,
                    addedToCarts: 165,
                    budgetAmount: Nullable<Double>.value(50),
                    budgetAmountLocal: Nullable<Double>.value(50),
                    budgetCurrency: "usd",
                    budgetOptimization: Nullable<AdCampaignBudgetOptimization>.value(AdCampaignBudgetOptimization.adCampaign),
                    budgetType: Nullable<AdCampaignBudgetType>.value(AdCampaignBudgetType.daily),
                    campaignType: AdCampaignCampaignType.standard,
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
                    desiredCostPerResult: Optional(Nullable<Double>.value(4.5)),
                    endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    frequency: Nullable<Double>.value(1.1),
                    id: "adcamp_xxxxxxxxxxxxxx",
                    impressions: 220000,
                    issues: [
                        AdPlatformIssue(
                            category: AdPlatformIssueCategory.information,
                            id: "adiss_xxxxxxxxxxxxxx",
                            message: "Your ad didn't pass our content review. Update it to follow our ad guidelines and resubmit.",
                            resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                            resourceType: AdPlatformIssueResourceType.adCampaign,
                            title: "Ad issue"
                        )
                    ],
                    leadValue: 3960,
                    leads: 132,
                    linkClicks: 4400,
                    objective: Nullable<AdCampaignObjective>.value(AdCampaignObjective.awareness),
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
                    startsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    status: AdCampaignStatus.active,
                    submittedApplicationValue: 1320,
                    submittedApplications: 11,
                    targetCostPerResult: Nullable<Double>.value(1.1),
                    targetResultEvent: Nullable<String>.value("target_result_event"),
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "added_to_cart_value": 12650,
                  "added_to_carts": 165,
                  "budget_amount": 50,
                  "budget_amount_local": 50,
                  "budget_currency": "usd",
                  "budget_optimization": "ad_campaign",
                  "budget_type": "daily",
                  "campaign_type": "standard",
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
                  "desired_cost_per_result": 4.5,
                  "ends_at": "2026-01-01T12:00:00.000Z",
                  "frequency": 1.1,
                  "id": "adcamp_xxxxxxxxxxxxxx",
                  "impressions": 220000,
                  "issues": [
                    {
                      "category": "information",
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad didn't pass our content review. Update it to follow our ad guidelines and resubmit.",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad_campaign",
                      "title": "Ad issue"
                    }
                  ],
                  "lead_value": 3960,
                  "leads": 132,
                  "link_clicks": 4400,
                  "objective": "awareness",
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
                  "starts_at": "2026-01-01T12:00:00.000Z",
                  "status": "active",
                  "submitted_application_value": 1320,
                  "submitted_applications": 11,
                  "target_cost_per_result": 1.1,
                  "target_result_event": "target_result_event",
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
            account: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            addedToCartValue: 12650,
            addedToCarts: 165,
            budgetAmount: Nullable<Double>.value(50),
            budgetAmountLocal: Nullable<Double>.value(50),
            budgetCurrency: "usd",
            budgetOptimization: Nullable<AdCampaignBudgetOptimization>.value(AdCampaignBudgetOptimization.adCampaign),
            budgetType: Nullable<AdCampaignBudgetType>.value(AdCampaignBudgetType.daily),
            campaignType: AdCampaignCampaignType.standard,
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
            desiredCostPerResult: Optional(Nullable<Double>.value(4.5)),
            endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            frequency: Nullable<Double>.value(1.1),
            id: "adcamp_xxxxxxxxxxxxxx",
            impressions: 220000,
            issues: [
                AdPlatformIssue(
                    category: AdPlatformIssueCategory.information,
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad didn't pass our content review. Update it to follow our ad guidelines and resubmit.",
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdPlatformIssueResourceType.adCampaign,
                    title: "Ad issue"
                )
            ],
            leadValue: 3960,
            leads: 132,
            linkClicks: 4400,
            objective: Nullable<AdCampaignObjective>.value(AdCampaignObjective.awareness),
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
            startsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: AdCampaignStatus.active,
            submittedApplicationValue: 1320,
            submittedApplications: 11,
            targetCostPerResult: Nullable<Double>.value(1.1),
            targetResultEvent: Nullable<String>.value("target_result_event"),
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

    @Test func unpause1() async throws -> Void {
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
                  "added_to_cart_value": 12650,
                  "added_to_carts": 165,
                  "budget_amount": 50,
                  "budget_amount_local": 50,
                  "budget_currency": "usd",
                  "budget_optimization": "ad_campaign",
                  "budget_type": "daily",
                  "campaign_type": "standard",
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
                  "desired_cost_per_result": 4.5,
                  "ends_at": "2026-01-01T12:00:00.000Z",
                  "frequency": 1.1,
                  "id": "adcamp_xxxxxxxxxxxxxx",
                  "impressions": 220000,
                  "issues": [
                    {
                      "category": "information",
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad didn't pass our content review. Update it to follow our ad guidelines and resubmit.",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad_campaign",
                      "title": "Ad issue"
                    }
                  ],
                  "lead_value": 3960,
                  "leads": 132,
                  "link_clicks": 4400,
                  "objective": "awareness",
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
                  "starts_at": "2026-01-01T12:00:00.000Z",
                  "status": "active",
                  "submitted_application_value": 1320,
                  "submitted_applications": 11,
                  "target_cost_per_result": 1.1,
                  "target_result_event": "target_result_event",
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
            account: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            addedToCartValue: 12650,
            addedToCarts: 165,
            budgetAmount: Nullable<Double>.value(50),
            budgetAmountLocal: Nullable<Double>.value(50),
            budgetCurrency: "usd",
            budgetOptimization: Nullable<AdCampaignBudgetOptimization>.value(AdCampaignBudgetOptimization.adCampaign),
            budgetType: Nullable<AdCampaignBudgetType>.value(AdCampaignBudgetType.daily),
            campaignType: AdCampaignCampaignType.standard,
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
            desiredCostPerResult: Optional(Nullable<Double>.value(4.5)),
            endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            frequency: Nullable<Double>.value(1.1),
            id: "adcamp_xxxxxxxxxxxxxx",
            impressions: 220000,
            issues: [
                AdPlatformIssue(
                    category: AdPlatformIssueCategory.information,
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad didn't pass our content review. Update it to follow our ad guidelines and resubmit.",
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdPlatformIssueResourceType.adCampaign,
                    title: "Ad issue"
                )
            ],
            leadValue: 3960,
            leads: 132,
            linkClicks: 4400,
            objective: Nullable<AdCampaignObjective>.value(AdCampaignObjective.awareness),
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
            startsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: AdCampaignStatus.active,
            submittedApplicationValue: 1320,
            submittedApplications: 11,
            targetCostPerResult: Nullable<Double>.value(1.1),
            targetResultEvent: Nullable<String>.value("target_result_event"),
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