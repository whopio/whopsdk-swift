import Foundation
import Testing
import WhopSDK

@Suite("AdsClient Wire Tests") struct AdsClientWireTests {
    @Test func reportIssues1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad was rejected in ad review for misleading claims. Edit the ad's text or creative to follow advertising policies, then resubmit.",
                      "policy": "misleading",
                      "reason": "content_rejected",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad",
                      "updated_at": "2026-01-01T12:00:00.000Z"
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
        let expectedResponse = ReportIssuesAdsResponse(
            data: [
                AdIssue(
                    createdAt: "2026-01-01T12:00:00.000Z",
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad was rejected in ad review for misleading claims. Edit the ad's text or creative to follow advertising policies, then resubmit.",
                    policy: Nullable<AdIssuePolicy>.value(AdIssuePolicy.misleading),
                    reason: AdIssueReason.contentRejected,
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdIssueResourceType.ad,
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ]
        )
        let response = try await client.ads.reportIssues(
            request: .init(issues: [
                ReportIssuesAdsRequestIssuesItem(
                    reason: .contentRejected
                )
            ]),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func reportStats1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "ad_campaign_id": "adcamp_xxxxxxxxxxxxxx",
                  "ad_group_id": "adgrp_xxxxxxxxxxxxxx",
                  "ad_id": "ad_xxxxxxxxxxxxxx",
                  "clicks": 0,
                  "hour_started_at": "2026-01-01T12:00:00.000Z",
                  "impressions": 6000,
                  "spend": {
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
        let expectedResponse = AdStat(
            adCampaignId: "adcamp_xxxxxxxxxxxxxx",
            adGroupId: "adgrp_xxxxxxxxxxxxxx",
            adId: "ad_xxxxxxxxxxxxxx",
            clicks: 0,
            hourStartedAt: "2026-01-01T12:00:00.000Z",
            impressions: 6000,
            spend: Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )
        )
        let response = try await client.ads.reportStats(
            request: .init(
                adId: "ad_xxxxxxxxxxxxxx",
                hourStartedAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                spend: ReportStatsAdsRequestSpend.double(
                    1.1
                )
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "ad_campaign": {
                        "id": "adcamp_xxxxxxxxxxxxxx"
                      },
                      "ad_group": {
                        "id": "adcamp_xxxxxxxxxxxxxx"
                      },
                      "added_to_cart_value": 1850,
                      "added_to_carts": 74,
                      "call_to_action": "learn_more",
                      "click_through_rate": 0.0261,
                      "clicks": 1337,
                      "completed_registration_value": 95,
                      "completed_registrations": 19,
                      "contact_value": 175,
                      "contacts": 27,
                      "content_review": {
                        "networks": [
                          {
                            "recommended": true,
                            "title": "whop"
                          }
                        ],
                        "status": "reviewed",
                        "tags": [
                          {
                            "message": "message",
                            "title": "title"
                          }
                        ]
                      },
                      "cost_per_added_to_cart": 6.515675675675676,
                      "cost_per_click": 0.36,
                      "cost_per_completed_registration": 25.37684210526316,
                      "cost_per_contact": 17.85777777777778,
                      "cost_per_lead": 3.984793388429752,
                      "cost_per_mille": 9.42,
                      "cost_per_purchase": 12.68842105263158,
                      "cost_per_result": 7.653333333333333,
                      "cost_per_schedule": 10.48173913043478,
                      "cost_per_submitted_application": 40.18,
                      "cost_per_unique_click": 0.48,
                      "cost_per_viewed_content": 0.2253084112149533,
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "creatives": [
                        {
                          "crop": {
                            "height": 1000,
                            "width": 1000,
                            "x": 40,
                            "y": 0
                          },
                          "format": null,
                          "id": "file_xxxxxxxxxxxxxx",
                          "language": null,
                          "media_type": "image",
                          "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                        }
                      ],
                      "custom_conversions": 63,
                      "custom_event_counts": {
                        "booked_detail": 63
                      },
                      "custom_event_values": {
                        "booked_detail": 4820
                      },
                      "delivery_status": "in_appeal",
                      "descriptions": [
                        {
                          "language": null,
                          "text": "Austin's mobile detailers"
                        }
                      ],
                      "frequency": 1.1,
                      "headlines": [
                        {
                          "language": null,
                          "text": "Austin's mobile detailers"
                        }
                      ],
                      "id": "ad_xxxxxxxxxxxxxx",
                      "impressions": 51204,
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
                      "lead_value": 1180,
                      "leads": 121,
                      "link_clicks": 1071,
                      "primary_texts": [
                        {
                          "language": null,
                          "text": "Austin's mobile detailers"
                        }
                      ],
                      "purchase_value": 9462,
                      "purchases": 38,
                      "reach": 0,
                      "result_event": "purchase",
                      "result_event_name": "booked_detail",
                      "results": 63,
                      "return_on_ad_spend": 19.62419113987058,
                      "schedule_value": 640,
                      "schedules": 46,
                      "spend": 482.16,
                      "spend_currency": "usd",
                      "status": "active",
                      "submitted_application_value": 300,
                      "submitted_applications": 12,
                      "title": "Ceramic coating — spring hook v2",
                      "unique_click_through_rate": 1.1,
                      "unique_clicks": 1012,
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "url": "https://shinetime.example/ceramic-coating",
                      "url_parameters": {
                        "key": "value"
                      },
                      "viewed_content_value": 0,
                      "viewed_contents": 2140
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
        let expectedResponse = ListAdsResponse(
            data: [
                Ad(
                    adCampaign: AdEntityReference(
                        id: "adcamp_xxxxxxxxxxxxxx"
                    ),
                    adGroup: AdEntityReference(
                        id: "adcamp_xxxxxxxxxxxxxx"
                    ),
                    addedToCartValue: 1850,
                    addedToCarts: 74,
                    callToAction: Nullable<AdCallToAction>.value(AdCallToAction.learnMore),
                    clickThroughRate: 0.0261,
                    clicks: 1337,
                    completedRegistrationValue: 95,
                    completedRegistrations: 19,
                    contactValue: 175,
                    contacts: 27,
                    contentReview: AdContentReview(
                        networks: [
                            AdContentReviewNetwork(
                                recommended: true,
                                title: AdContentReviewNetworkTitle.whop
                            )
                        ],
                        status: AdContentReviewStatus.reviewed,
                        tags: [
                            AdContentReviewTag(
                                message: "message",
                                title: "title"
                            )
                        ]
                    ),
                    costPerAddedToCart: Nullable<Double>.value(6.515675675675676),
                    costPerClick: 0.36,
                    costPerCompletedRegistration: Nullable<Double>.value(25.37684210526316),
                    costPerContact: Nullable<Double>.value(17.85777777777778),
                    costPerLead: Nullable<Double>.value(3.984793388429752),
                    costPerMille: 9.42,
                    costPerPurchase: Nullable<Double>.value(12.68842105263158),
                    costPerResult: Nullable<Double>.value(7.653333333333333),
                    costPerSchedule: Nullable<Double>.value(10.48173913043478),
                    costPerSubmittedApplication: Nullable<Double>.value(40.18),
                    costPerUniqueClick: Nullable<Double>.value(0.48),
                    costPerViewedContent: Nullable<Double>.value(0.2253084112149533),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    creatives: [
                        AdCreative(
                            crop: Nullable<AdCreativeCrop>.value(AdCreativeCrop(
                                height: 1000,
                                width: 1000,
                                x: 40,
                                y: 0
                            )),
                            format: .null,
                            id: "file_xxxxxxxxxxxxxx",
                            language: .null,
                            mediaType: Nullable<String>.value("image"),
                            url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                        )
                    ],
                    customConversions: 63,
                    customEventCounts: [
                        "booked_detail": JSONValue.number(63)
                    ],
                    customEventValues: [
                        "booked_detail": JSONValue.number(4820)
                    ],
                    deliveryStatus: AdDeliveryStatus.inAppeal,
                    descriptions: [
                        AdText(
                            language: .null,
                            text: "Austin's mobile detailers"
                        )
                    ],
                    frequency: Nullable<Double>.value(1.1),
                    headlines: [
                        AdText(
                            language: .null,
                            text: "Austin's mobile detailers"
                        )
                    ],
                    id: "ad_xxxxxxxxxxxxxx",
                    impressions: 51204,
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
                    leadValue: 1180,
                    leads: 121,
                    linkClicks: 1071,
                    primaryTexts: [
                        AdText(
                            language: .null,
                            text: "Austin's mobile detailers"
                        )
                    ],
                    purchaseValue: 9462,
                    purchases: 38,
                    reach: 0,
                    resultEvent: Nullable<AdResultEvent>.value(AdResultEvent.purchase),
                    resultEventName: Nullable<String>.value("booked_detail"),
                    results: Nullable<Double>.value(63),
                    returnOnAdSpend: 19.62419113987058,
                    scheduleValue: 640,
                    schedules: 46,
                    spend: 482.16,
                    spendCurrency: Nullable<String>.value("usd"),
                    status: AdStatus.active,
                    submittedApplicationValue: 300,
                    submittedApplications: 12,
                    title: Nullable<String>.value("Ceramic coating — spring hook v2"),
                    uniqueClickThroughRate: Nullable<Double>.value(1.1),
                    uniqueClicks: 1012,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    url: Nullable<String>.value("https://shinetime.example/ceramic-coating"),
                    urlParameters: [
                        "key": JSONValue.string("value")
                    ],
                    viewedContentValue: 0,
                    viewedContents: 2140
                )
            ],
            pageInfo: ListAdsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.ads.list(
            adCampaignIds: [
                "adcamp_xxxxxxxxxxxxxx"
            ],
            adGroupIds: [
                "adgrp_xxxxxxxxxxxxxx"
            ],
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
                  "ad_campaign": {
                    "id": "adcamp_xxxxxxxxxxxxxx"
                  },
                  "ad_group": {
                    "id": "adcamp_xxxxxxxxxxxxxx"
                  },
                  "added_to_cart_value": 1850,
                  "added_to_carts": 74,
                  "call_to_action": "learn_more",
                  "click_through_rate": 0.0261,
                  "clicks": 1337,
                  "completed_registration_value": 95,
                  "completed_registrations": 19,
                  "contact_value": 175,
                  "contacts": 27,
                  "content_review": {
                    "networks": [
                      {
                        "recommended": true,
                        "title": "whop"
                      }
                    ],
                    "status": "reviewed",
                    "tags": [
                      {
                        "message": "message",
                        "title": "title"
                      }
                    ]
                  },
                  "cost_per_added_to_cart": 6.515675675675676,
                  "cost_per_click": 0.36,
                  "cost_per_completed_registration": 25.37684210526316,
                  "cost_per_contact": 17.85777777777778,
                  "cost_per_lead": 3.984793388429752,
                  "cost_per_mille": 9.42,
                  "cost_per_purchase": 12.68842105263158,
                  "cost_per_result": 7.653333333333333,
                  "cost_per_schedule": 10.48173913043478,
                  "cost_per_submitted_application": 40.18,
                  "cost_per_unique_click": 0.48,
                  "cost_per_viewed_content": 0.2253084112149533,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "creatives": [
                    {
                      "crop": {
                        "height": 1000,
                        "width": 1000,
                        "x": 40,
                        "y": 0
                      },
                      "format": "square",
                      "id": "file_xxxxxxxxxxxxxx",
                      "language": "language",
                      "media_type": "image",
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  ],
                  "custom_conversions": 63,
                  "custom_event_counts": {
                    "booked_detail": 63
                  },
                  "custom_event_values": {
                    "booked_detail": 4820
                  },
                  "delivery_status": "in_appeal",
                  "descriptions": [
                    {
                      "language": "language",
                      "text": "Austin's mobile detailers"
                    }
                  ],
                  "frequency": 1.1,
                  "headlines": [
                    {
                      "language": "language",
                      "text": "Austin's mobile detailers"
                    }
                  ],
                  "id": "ad_xxxxxxxxxxxxxx",
                  "impressions": 51204,
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
                  "lead_value": 1180,
                  "leads": 121,
                  "link_clicks": 1071,
                  "primary_texts": [
                    {
                      "language": "language",
                      "text": "Austin's mobile detailers"
                    }
                  ],
                  "purchase_value": 9462,
                  "purchases": 38,
                  "reach": 0,
                  "result_event": "purchase",
                  "result_event_name": "booked_detail",
                  "results": 63,
                  "return_on_ad_spend": 19.62419113987058,
                  "schedule_value": 640,
                  "schedules": 46,
                  "spend": 482.16,
                  "spend_currency": "usd",
                  "status": "active",
                  "submitted_application_value": 300,
                  "submitted_applications": 12,
                  "title": "Ceramic coating — spring hook v2",
                  "unique_click_through_rate": 1.1,
                  "unique_clicks": 1012,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "url": "https://shinetime.example/ceramic-coating",
                  "url_parameters": {
                    "key": "value"
                  },
                  "viewed_content_value": 0,
                  "viewed_contents": 2140
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Ad(
            adCampaign: AdEntityReference(
                id: "adcamp_xxxxxxxxxxxxxx"
            ),
            adGroup: AdEntityReference(
                id: "adcamp_xxxxxxxxxxxxxx"
            ),
            addedToCartValue: 1850,
            addedToCarts: 74,
            callToAction: Nullable<AdCallToAction>.value(AdCallToAction.learnMore),
            clickThroughRate: 0.0261,
            clicks: 1337,
            completedRegistrationValue: 95,
            completedRegistrations: 19,
            contactValue: 175,
            contacts: 27,
            contentReview: AdContentReview(
                networks: [
                    AdContentReviewNetwork(
                        recommended: true,
                        title: AdContentReviewNetworkTitle.whop
                    )
                ],
                status: AdContentReviewStatus.reviewed,
                tags: [
                    AdContentReviewTag(
                        message: "message",
                        title: "title"
                    )
                ]
            ),
            costPerAddedToCart: Nullable<Double>.value(6.515675675675676),
            costPerClick: 0.36,
            costPerCompletedRegistration: Nullable<Double>.value(25.37684210526316),
            costPerContact: Nullable<Double>.value(17.85777777777778),
            costPerLead: Nullable<Double>.value(3.984793388429752),
            costPerMille: 9.42,
            costPerPurchase: Nullable<Double>.value(12.68842105263158),
            costPerResult: Nullable<Double>.value(7.653333333333333),
            costPerSchedule: Nullable<Double>.value(10.48173913043478),
            costPerSubmittedApplication: Nullable<Double>.value(40.18),
            costPerUniqueClick: Nullable<Double>.value(0.48),
            costPerViewedContent: Nullable<Double>.value(0.2253084112149533),
            createdAt: "2026-01-01T12:00:00.000Z",
            creatives: [
                AdCreative(
                    crop: Nullable<AdCreativeCrop>.value(AdCreativeCrop(
                        height: 1000,
                        width: 1000,
                        x: 40,
                        y: 0
                    )),
                    format: Nullable<AdCreativeFormat>.value(AdCreativeFormat.square),
                    id: "file_xxxxxxxxxxxxxx",
                    language: Nullable<String>.value("language"),
                    mediaType: Nullable<String>.value("image"),
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )
            ],
            customConversions: 63,
            customEventCounts: [
                "booked_detail": JSONValue.number(63)
            ],
            customEventValues: [
                "booked_detail": JSONValue.number(4820)
            ],
            deliveryStatus: AdDeliveryStatus.inAppeal,
            descriptions: [
                AdText(
                    language: Nullable<String>.value("language"),
                    text: "Austin's mobile detailers"
                )
            ],
            frequency: Nullable<Double>.value(1.1),
            headlines: [
                AdText(
                    language: Nullable<String>.value("language"),
                    text: "Austin's mobile detailers"
                )
            ],
            id: "ad_xxxxxxxxxxxxxx",
            impressions: 51204,
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
            leadValue: 1180,
            leads: 121,
            linkClicks: 1071,
            primaryTexts: [
                AdText(
                    language: Nullable<String>.value("language"),
                    text: "Austin's mobile detailers"
                )
            ],
            purchaseValue: 9462,
            purchases: 38,
            reach: 0,
            resultEvent: Nullable<AdResultEvent>.value(AdResultEvent.purchase),
            resultEventName: Nullable<String>.value("booked_detail"),
            results: Nullable<Double>.value(63),
            returnOnAdSpend: 19.62419113987058,
            scheduleValue: 640,
            schedules: 46,
            spend: 482.16,
            spendCurrency: Nullable<String>.value("usd"),
            status: AdStatus.active,
            submittedApplicationValue: 300,
            submittedApplications: 12,
            title: Nullable<String>.value("Ceramic coating — spring hook v2"),
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 1012,
            updatedAt: "2026-01-01T12:00:00.000Z",
            url: Nullable<String>.value("https://shinetime.example/ceramic-coating"),
            urlParameters: [
                "key": JSONValue.string("value")
            ],
            viewedContentValue: 0,
            viewedContents: 2140
        )
        let response = try await client.ads.create(
            request: .init(),
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
                  "ad_campaign": {
                    "id": "adcamp_xxxxxxxxxxxxxx"
                  },
                  "ad_group": {
                    "id": "adcamp_xxxxxxxxxxxxxx"
                  },
                  "added_to_cart_value": 1850,
                  "added_to_carts": 74,
                  "call_to_action": "learn_more",
                  "click_through_rate": 0.0261,
                  "clicks": 1337,
                  "completed_registration_value": 95,
                  "completed_registrations": 19,
                  "contact_value": 175,
                  "contacts": 27,
                  "content_review": {
                    "networks": [
                      {
                        "recommended": true,
                        "title": "whop"
                      }
                    ],
                    "status": "reviewed",
                    "tags": [
                      {
                        "message": "message",
                        "title": "title"
                      }
                    ]
                  },
                  "cost_per_added_to_cart": 6.515675675675676,
                  "cost_per_click": 0.36,
                  "cost_per_completed_registration": 25.37684210526316,
                  "cost_per_contact": 17.85777777777778,
                  "cost_per_lead": 3.984793388429752,
                  "cost_per_mille": 9.42,
                  "cost_per_purchase": 12.68842105263158,
                  "cost_per_result": 7.653333333333333,
                  "cost_per_schedule": 10.48173913043478,
                  "cost_per_submitted_application": 40.18,
                  "cost_per_unique_click": 0.48,
                  "cost_per_viewed_content": 0.2253084112149533,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "creatives": [
                    {
                      "crop": {
                        "height": 1000,
                        "width": 1000,
                        "x": 40,
                        "y": 0
                      },
                      "format": "square",
                      "id": "file_xxxxxxxxxxxxxx",
                      "language": "language",
                      "media_type": "image",
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  ],
                  "custom_conversions": 63,
                  "custom_event_counts": {
                    "booked_detail": 63
                  },
                  "custom_event_values": {
                    "booked_detail": 4820
                  },
                  "delivery_status": "in_appeal",
                  "descriptions": [
                    {
                      "language": "language",
                      "text": "Austin's mobile detailers"
                    }
                  ],
                  "frequency": 1.1,
                  "headlines": [
                    {
                      "language": "language",
                      "text": "Austin's mobile detailers"
                    }
                  ],
                  "id": "ad_xxxxxxxxxxxxxx",
                  "impressions": 51204,
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
                  "lead_value": 1180,
                  "leads": 121,
                  "link_clicks": 1071,
                  "primary_texts": [
                    {
                      "language": "language",
                      "text": "Austin's mobile detailers"
                    }
                  ],
                  "purchase_value": 9462,
                  "purchases": 38,
                  "reach": 0,
                  "result_event": "purchase",
                  "result_event_name": "booked_detail",
                  "results": 63,
                  "return_on_ad_spend": 19.62419113987058,
                  "schedule_value": 640,
                  "schedules": 46,
                  "spend": 482.16,
                  "spend_currency": "usd",
                  "status": "active",
                  "submitted_application_value": 300,
                  "submitted_applications": 12,
                  "title": "Ceramic coating — spring hook v2",
                  "unique_click_through_rate": 1.1,
                  "unique_clicks": 1012,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "url": "https://shinetime.example/ceramic-coating",
                  "url_parameters": {
                    "key": "value"
                  },
                  "viewed_content_value": 0,
                  "viewed_contents": 2140
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Ad(
            adCampaign: AdEntityReference(
                id: "adcamp_xxxxxxxxxxxxxx"
            ),
            adGroup: AdEntityReference(
                id: "adcamp_xxxxxxxxxxxxxx"
            ),
            addedToCartValue: 1850,
            addedToCarts: 74,
            callToAction: Nullable<AdCallToAction>.value(AdCallToAction.learnMore),
            clickThroughRate: 0.0261,
            clicks: 1337,
            completedRegistrationValue: 95,
            completedRegistrations: 19,
            contactValue: 175,
            contacts: 27,
            contentReview: AdContentReview(
                networks: [
                    AdContentReviewNetwork(
                        recommended: true,
                        title: AdContentReviewNetworkTitle.whop
                    )
                ],
                status: AdContentReviewStatus.reviewed,
                tags: [
                    AdContentReviewTag(
                        message: "message",
                        title: "title"
                    )
                ]
            ),
            costPerAddedToCart: Nullable<Double>.value(6.515675675675676),
            costPerClick: 0.36,
            costPerCompletedRegistration: Nullable<Double>.value(25.37684210526316),
            costPerContact: Nullable<Double>.value(17.85777777777778),
            costPerLead: Nullable<Double>.value(3.984793388429752),
            costPerMille: 9.42,
            costPerPurchase: Nullable<Double>.value(12.68842105263158),
            costPerResult: Nullable<Double>.value(7.653333333333333),
            costPerSchedule: Nullable<Double>.value(10.48173913043478),
            costPerSubmittedApplication: Nullable<Double>.value(40.18),
            costPerUniqueClick: Nullable<Double>.value(0.48),
            costPerViewedContent: Nullable<Double>.value(0.2253084112149533),
            createdAt: "2026-01-01T12:00:00.000Z",
            creatives: [
                AdCreative(
                    crop: Nullable<AdCreativeCrop>.value(AdCreativeCrop(
                        height: 1000,
                        width: 1000,
                        x: 40,
                        y: 0
                    )),
                    format: Nullable<AdCreativeFormat>.value(AdCreativeFormat.square),
                    id: "file_xxxxxxxxxxxxxx",
                    language: Nullable<String>.value("language"),
                    mediaType: Nullable<String>.value("image"),
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )
            ],
            customConversions: 63,
            customEventCounts: [
                "booked_detail": JSONValue.number(63)
            ],
            customEventValues: [
                "booked_detail": JSONValue.number(4820)
            ],
            deliveryStatus: AdDeliveryStatus.inAppeal,
            descriptions: [
                AdText(
                    language: Nullable<String>.value("language"),
                    text: "Austin's mobile detailers"
                )
            ],
            frequency: Nullable<Double>.value(1.1),
            headlines: [
                AdText(
                    language: Nullable<String>.value("language"),
                    text: "Austin's mobile detailers"
                )
            ],
            id: "ad_xxxxxxxxxxxxxx",
            impressions: 51204,
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
            leadValue: 1180,
            leads: 121,
            linkClicks: 1071,
            primaryTexts: [
                AdText(
                    language: Nullable<String>.value("language"),
                    text: "Austin's mobile detailers"
                )
            ],
            purchaseValue: 9462,
            purchases: 38,
            reach: 0,
            resultEvent: Nullable<AdResultEvent>.value(AdResultEvent.purchase),
            resultEventName: Nullable<String>.value("booked_detail"),
            results: Nullable<Double>.value(63),
            returnOnAdSpend: 19.62419113987058,
            scheduleValue: 640,
            schedules: 46,
            spend: 482.16,
            spendCurrency: Nullable<String>.value("usd"),
            status: AdStatus.active,
            submittedApplicationValue: 300,
            submittedApplications: 12,
            title: Nullable<String>.value("Ceramic coating — spring hook v2"),
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 1012,
            updatedAt: "2026-01-01T12:00:00.000Z",
            url: Nullable<String>.value("https://shinetime.example/ceramic-coating"),
            urlParameters: [
                "key": JSONValue.string("value")
            ],
            viewedContentValue: 0,
            viewedContents: 2140
        )
        let response = try await client.ads.retrieve(
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
                  "id": "ad_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteAdsResponse(
            deleted: true,
            id: "ad_xxxxxxxxxxxxxx"
        )
        let response = try await client.ads.delete(
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
                  "ad_campaign": {
                    "id": "adcamp_xxxxxxxxxxxxxx"
                  },
                  "ad_group": {
                    "id": "adcamp_xxxxxxxxxxxxxx"
                  },
                  "added_to_cart_value": 1850,
                  "added_to_carts": 74,
                  "call_to_action": "learn_more",
                  "click_through_rate": 0.0261,
                  "clicks": 1337,
                  "completed_registration_value": 95,
                  "completed_registrations": 19,
                  "contact_value": 175,
                  "contacts": 27,
                  "content_review": {
                    "networks": [
                      {
                        "recommended": true,
                        "title": "whop"
                      }
                    ],
                    "status": "reviewed",
                    "tags": [
                      {
                        "message": "message",
                        "title": "title"
                      }
                    ]
                  },
                  "cost_per_added_to_cart": 6.515675675675676,
                  "cost_per_click": 0.36,
                  "cost_per_completed_registration": 25.37684210526316,
                  "cost_per_contact": 17.85777777777778,
                  "cost_per_lead": 3.984793388429752,
                  "cost_per_mille": 9.42,
                  "cost_per_purchase": 12.68842105263158,
                  "cost_per_result": 7.653333333333333,
                  "cost_per_schedule": 10.48173913043478,
                  "cost_per_submitted_application": 40.18,
                  "cost_per_unique_click": 0.48,
                  "cost_per_viewed_content": 0.2253084112149533,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "creatives": [
                    {
                      "crop": {
                        "height": 1000,
                        "width": 1000,
                        "x": 40,
                        "y": 0
                      },
                      "format": "square",
                      "id": "file_xxxxxxxxxxxxxx",
                      "language": "language",
                      "media_type": "image",
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  ],
                  "custom_conversions": 63,
                  "custom_event_counts": {
                    "booked_detail": 63
                  },
                  "custom_event_values": {
                    "booked_detail": 4820
                  },
                  "delivery_status": "in_appeal",
                  "descriptions": [
                    {
                      "language": "language",
                      "text": "Austin's mobile detailers"
                    }
                  ],
                  "frequency": 1.1,
                  "headlines": [
                    {
                      "language": "language",
                      "text": "Austin's mobile detailers"
                    }
                  ],
                  "id": "ad_xxxxxxxxxxxxxx",
                  "impressions": 51204,
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
                  "lead_value": 1180,
                  "leads": 121,
                  "link_clicks": 1071,
                  "primary_texts": [
                    {
                      "language": "language",
                      "text": "Austin's mobile detailers"
                    }
                  ],
                  "purchase_value": 9462,
                  "purchases": 38,
                  "reach": 0,
                  "result_event": "purchase",
                  "result_event_name": "booked_detail",
                  "results": 63,
                  "return_on_ad_spend": 19.62419113987058,
                  "schedule_value": 640,
                  "schedules": 46,
                  "spend": 482.16,
                  "spend_currency": "usd",
                  "status": "active",
                  "submitted_application_value": 300,
                  "submitted_applications": 12,
                  "title": "Ceramic coating — spring hook v2",
                  "unique_click_through_rate": 1.1,
                  "unique_clicks": 1012,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "url": "https://shinetime.example/ceramic-coating",
                  "url_parameters": {
                    "key": "value"
                  },
                  "viewed_content_value": 0,
                  "viewed_contents": 2140
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Ad(
            adCampaign: AdEntityReference(
                id: "adcamp_xxxxxxxxxxxxxx"
            ),
            adGroup: AdEntityReference(
                id: "adcamp_xxxxxxxxxxxxxx"
            ),
            addedToCartValue: 1850,
            addedToCarts: 74,
            callToAction: Nullable<AdCallToAction>.value(AdCallToAction.learnMore),
            clickThroughRate: 0.0261,
            clicks: 1337,
            completedRegistrationValue: 95,
            completedRegistrations: 19,
            contactValue: 175,
            contacts: 27,
            contentReview: AdContentReview(
                networks: [
                    AdContentReviewNetwork(
                        recommended: true,
                        title: AdContentReviewNetworkTitle.whop
                    )
                ],
                status: AdContentReviewStatus.reviewed,
                tags: [
                    AdContentReviewTag(
                        message: "message",
                        title: "title"
                    )
                ]
            ),
            costPerAddedToCart: Nullable<Double>.value(6.515675675675676),
            costPerClick: 0.36,
            costPerCompletedRegistration: Nullable<Double>.value(25.37684210526316),
            costPerContact: Nullable<Double>.value(17.85777777777778),
            costPerLead: Nullable<Double>.value(3.984793388429752),
            costPerMille: 9.42,
            costPerPurchase: Nullable<Double>.value(12.68842105263158),
            costPerResult: Nullable<Double>.value(7.653333333333333),
            costPerSchedule: Nullable<Double>.value(10.48173913043478),
            costPerSubmittedApplication: Nullable<Double>.value(40.18),
            costPerUniqueClick: Nullable<Double>.value(0.48),
            costPerViewedContent: Nullable<Double>.value(0.2253084112149533),
            createdAt: "2026-01-01T12:00:00.000Z",
            creatives: [
                AdCreative(
                    crop: Nullable<AdCreativeCrop>.value(AdCreativeCrop(
                        height: 1000,
                        width: 1000,
                        x: 40,
                        y: 0
                    )),
                    format: Nullable<AdCreativeFormat>.value(AdCreativeFormat.square),
                    id: "file_xxxxxxxxxxxxxx",
                    language: Nullable<String>.value("language"),
                    mediaType: Nullable<String>.value("image"),
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )
            ],
            customConversions: 63,
            customEventCounts: [
                "booked_detail": JSONValue.number(63)
            ],
            customEventValues: [
                "booked_detail": JSONValue.number(4820)
            ],
            deliveryStatus: AdDeliveryStatus.inAppeal,
            descriptions: [
                AdText(
                    language: Nullable<String>.value("language"),
                    text: "Austin's mobile detailers"
                )
            ],
            frequency: Nullable<Double>.value(1.1),
            headlines: [
                AdText(
                    language: Nullable<String>.value("language"),
                    text: "Austin's mobile detailers"
                )
            ],
            id: "ad_xxxxxxxxxxxxxx",
            impressions: 51204,
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
            leadValue: 1180,
            leads: 121,
            linkClicks: 1071,
            primaryTexts: [
                AdText(
                    language: Nullable<String>.value("language"),
                    text: "Austin's mobile detailers"
                )
            ],
            purchaseValue: 9462,
            purchases: 38,
            reach: 0,
            resultEvent: Nullable<AdResultEvent>.value(AdResultEvent.purchase),
            resultEventName: Nullable<String>.value("booked_detail"),
            results: Nullable<Double>.value(63),
            returnOnAdSpend: 19.62419113987058,
            scheduleValue: 640,
            schedules: 46,
            spend: 482.16,
            spendCurrency: Nullable<String>.value("usd"),
            status: AdStatus.active,
            submittedApplicationValue: 300,
            submittedApplications: 12,
            title: Nullable<String>.value("Ceramic coating — spring hook v2"),
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 1012,
            updatedAt: "2026-01-01T12:00:00.000Z",
            url: Nullable<String>.value("https://shinetime.example/ceramic-coating"),
            urlParameters: [
                "key": JSONValue.string("value")
            ],
            viewedContentValue: 0,
            viewedContents: 2140
        )
        let response = try await client.ads.update(
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
                      "ad_campaign": {
                        "id": "adcamp_xxxxxxxxxxxxxx"
                      },
                      "ad_group": {
                        "id": "adcamp_xxxxxxxxxxxxxx"
                      },
                      "added_to_cart_value": 1850,
                      "added_to_carts": 74,
                      "call_to_action": "learn_more",
                      "click_through_rate": 0.0261,
                      "clicks": 1337,
                      "completed_registration_value": 95,
                      "completed_registrations": 19,
                      "contact_value": 175,
                      "contacts": 27,
                      "content_review": {
                        "networks": [
                          {
                            "recommended": true,
                            "title": "whop"
                          }
                        ],
                        "status": "reviewed",
                        "tags": [
                          {
                            "message": "message",
                            "title": "title"
                          }
                        ]
                      },
                      "cost_per_added_to_cart": 6.515675675675676,
                      "cost_per_click": 0.36,
                      "cost_per_completed_registration": 25.37684210526316,
                      "cost_per_contact": 17.85777777777778,
                      "cost_per_lead": 3.984793388429752,
                      "cost_per_mille": 9.42,
                      "cost_per_purchase": 12.68842105263158,
                      "cost_per_result": 7.653333333333333,
                      "cost_per_schedule": 10.48173913043478,
                      "cost_per_submitted_application": 40.18,
                      "cost_per_unique_click": 0.48,
                      "cost_per_viewed_content": 0.2253084112149533,
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "creatives": [
                        {
                          "crop": {
                            "height": 1000,
                            "width": 1000,
                            "x": 40,
                            "y": 0
                          },
                          "format": null,
                          "id": "file_xxxxxxxxxxxxxx",
                          "language": null,
                          "media_type": "image",
                          "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                        }
                      ],
                      "custom_conversions": 63,
                      "custom_event_counts": {
                        "booked_detail": 63
                      },
                      "custom_event_values": {
                        "booked_detail": 4820
                      },
                      "delivery_status": "in_appeal",
                      "descriptions": [
                        {
                          "language": null,
                          "text": "Austin's mobile detailers"
                        }
                      ],
                      "frequency": 1.1,
                      "headlines": [
                        {
                          "language": null,
                          "text": "Austin's mobile detailers"
                        }
                      ],
                      "id": "ad_xxxxxxxxxxxxxx",
                      "impressions": 51204,
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
                      "lead_value": 1180,
                      "leads": 121,
                      "link_clicks": 1071,
                      "primary_texts": [
                        {
                          "language": null,
                          "text": "Austin's mobile detailers"
                        }
                      ],
                      "purchase_value": 9462,
                      "purchases": 38,
                      "reach": 0,
                      "result_event": "purchase",
                      "result_event_name": "booked_detail",
                      "results": 63,
                      "return_on_ad_spend": 19.62419113987058,
                      "schedule_value": 640,
                      "schedules": 46,
                      "spend": 482.16,
                      "spend_currency": "usd",
                      "status": "active",
                      "submitted_application_value": 300,
                      "submitted_applications": 12,
                      "title": "Ceramic coating — spring hook v2",
                      "unique_click_through_rate": 1.1,
                      "unique_clicks": 1012,
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "url": "https://shinetime.example/ceramic-coating",
                      "url_parameters": {
                        "key": "value"
                      },
                      "viewed_content_value": 0,
                      "viewed_contents": 2140
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
        let expectedResponse = DuplicateAdsResponse(
            data: [
                Ad(
                    adCampaign: AdEntityReference(
                        id: "adcamp_xxxxxxxxxxxxxx"
                    ),
                    adGroup: AdEntityReference(
                        id: "adcamp_xxxxxxxxxxxxxx"
                    ),
                    addedToCartValue: 1850,
                    addedToCarts: 74,
                    callToAction: Nullable<AdCallToAction>.value(AdCallToAction.learnMore),
                    clickThroughRate: 0.0261,
                    clicks: 1337,
                    completedRegistrationValue: 95,
                    completedRegistrations: 19,
                    contactValue: 175,
                    contacts: 27,
                    contentReview: AdContentReview(
                        networks: [
                            AdContentReviewNetwork(
                                recommended: true,
                                title: AdContentReviewNetworkTitle.whop
                            )
                        ],
                        status: AdContentReviewStatus.reviewed,
                        tags: [
                            AdContentReviewTag(
                                message: "message",
                                title: "title"
                            )
                        ]
                    ),
                    costPerAddedToCart: Nullable<Double>.value(6.515675675675676),
                    costPerClick: 0.36,
                    costPerCompletedRegistration: Nullable<Double>.value(25.37684210526316),
                    costPerContact: Nullable<Double>.value(17.85777777777778),
                    costPerLead: Nullable<Double>.value(3.984793388429752),
                    costPerMille: 9.42,
                    costPerPurchase: Nullable<Double>.value(12.68842105263158),
                    costPerResult: Nullable<Double>.value(7.653333333333333),
                    costPerSchedule: Nullable<Double>.value(10.48173913043478),
                    costPerSubmittedApplication: Nullable<Double>.value(40.18),
                    costPerUniqueClick: Nullable<Double>.value(0.48),
                    costPerViewedContent: Nullable<Double>.value(0.2253084112149533),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    creatives: [
                        AdCreative(
                            crop: Nullable<AdCreativeCrop>.value(AdCreativeCrop(
                                height: 1000,
                                width: 1000,
                                x: 40,
                                y: 0
                            )),
                            format: .null,
                            id: "file_xxxxxxxxxxxxxx",
                            language: .null,
                            mediaType: Nullable<String>.value("image"),
                            url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                        )
                    ],
                    customConversions: 63,
                    customEventCounts: [
                        "booked_detail": JSONValue.number(63)
                    ],
                    customEventValues: [
                        "booked_detail": JSONValue.number(4820)
                    ],
                    deliveryStatus: AdDeliveryStatus.inAppeal,
                    descriptions: [
                        AdText(
                            language: .null,
                            text: "Austin's mobile detailers"
                        )
                    ],
                    frequency: Nullable<Double>.value(1.1),
                    headlines: [
                        AdText(
                            language: .null,
                            text: "Austin's mobile detailers"
                        )
                    ],
                    id: "ad_xxxxxxxxxxxxxx",
                    impressions: 51204,
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
                    leadValue: 1180,
                    leads: 121,
                    linkClicks: 1071,
                    primaryTexts: [
                        AdText(
                            language: .null,
                            text: "Austin's mobile detailers"
                        )
                    ],
                    purchaseValue: 9462,
                    purchases: 38,
                    reach: 0,
                    resultEvent: Nullable<AdResultEvent>.value(AdResultEvent.purchase),
                    resultEventName: Nullable<String>.value("booked_detail"),
                    results: Nullable<Double>.value(63),
                    returnOnAdSpend: 19.62419113987058,
                    scheduleValue: 640,
                    schedules: 46,
                    spend: 482.16,
                    spendCurrency: Nullable<String>.value("usd"),
                    status: AdStatus.active,
                    submittedApplicationValue: 300,
                    submittedApplications: 12,
                    title: Nullable<String>.value("Ceramic coating — spring hook v2"),
                    uniqueClickThroughRate: Nullable<Double>.value(1.1),
                    uniqueClicks: 1012,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    url: Nullable<String>.value("https://shinetime.example/ceramic-coating"),
                    urlParameters: [
                        "key": JSONValue.string("value")
                    ],
                    viewedContentValue: 0,
                    viewedContents: 2140
                )
            ]
        )
        let response = try await client.ads.duplicate(
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
                  "ad_campaign": {
                    "id": "adcamp_xxxxxxxxxxxxxx"
                  },
                  "ad_group": {
                    "id": "adcamp_xxxxxxxxxxxxxx"
                  },
                  "added_to_cart_value": 1850,
                  "added_to_carts": 74,
                  "call_to_action": "learn_more",
                  "click_through_rate": 0.0261,
                  "clicks": 1337,
                  "completed_registration_value": 95,
                  "completed_registrations": 19,
                  "contact_value": 175,
                  "contacts": 27,
                  "content_review": {
                    "networks": [
                      {
                        "recommended": true,
                        "title": "whop"
                      }
                    ],
                    "status": "reviewed",
                    "tags": [
                      {
                        "message": "message",
                        "title": "title"
                      }
                    ]
                  },
                  "cost_per_added_to_cart": 6.515675675675676,
                  "cost_per_click": 0.36,
                  "cost_per_completed_registration": 25.37684210526316,
                  "cost_per_contact": 17.85777777777778,
                  "cost_per_lead": 3.984793388429752,
                  "cost_per_mille": 9.42,
                  "cost_per_purchase": 12.68842105263158,
                  "cost_per_result": 7.653333333333333,
                  "cost_per_schedule": 10.48173913043478,
                  "cost_per_submitted_application": 40.18,
                  "cost_per_unique_click": 0.48,
                  "cost_per_viewed_content": 0.2253084112149533,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "creatives": [
                    {
                      "crop": {
                        "height": 1000,
                        "width": 1000,
                        "x": 40,
                        "y": 0
                      },
                      "format": "square",
                      "id": "file_xxxxxxxxxxxxxx",
                      "language": "language",
                      "media_type": "image",
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  ],
                  "custom_conversions": 63,
                  "custom_event_counts": {
                    "booked_detail": 63
                  },
                  "custom_event_values": {
                    "booked_detail": 4820
                  },
                  "delivery_status": "in_appeal",
                  "descriptions": [
                    {
                      "language": "language",
                      "text": "Austin's mobile detailers"
                    }
                  ],
                  "frequency": 1.1,
                  "headlines": [
                    {
                      "language": "language",
                      "text": "Austin's mobile detailers"
                    }
                  ],
                  "id": "ad_xxxxxxxxxxxxxx",
                  "impressions": 51204,
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
                  "lead_value": 1180,
                  "leads": 121,
                  "link_clicks": 1071,
                  "primary_texts": [
                    {
                      "language": "language",
                      "text": "Austin's mobile detailers"
                    }
                  ],
                  "purchase_value": 9462,
                  "purchases": 38,
                  "reach": 0,
                  "result_event": "purchase",
                  "result_event_name": "booked_detail",
                  "results": 63,
                  "return_on_ad_spend": 19.62419113987058,
                  "schedule_value": 640,
                  "schedules": 46,
                  "spend": 482.16,
                  "spend_currency": "usd",
                  "status": "active",
                  "submitted_application_value": 300,
                  "submitted_applications": 12,
                  "title": "Ceramic coating — spring hook v2",
                  "unique_click_through_rate": 1.1,
                  "unique_clicks": 1012,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "url": "https://shinetime.example/ceramic-coating",
                  "url_parameters": {
                    "key": "value"
                  },
                  "viewed_content_value": 0,
                  "viewed_contents": 2140
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Ad(
            adCampaign: AdEntityReference(
                id: "adcamp_xxxxxxxxxxxxxx"
            ),
            adGroup: AdEntityReference(
                id: "adcamp_xxxxxxxxxxxxxx"
            ),
            addedToCartValue: 1850,
            addedToCarts: 74,
            callToAction: Nullable<AdCallToAction>.value(AdCallToAction.learnMore),
            clickThroughRate: 0.0261,
            clicks: 1337,
            completedRegistrationValue: 95,
            completedRegistrations: 19,
            contactValue: 175,
            contacts: 27,
            contentReview: AdContentReview(
                networks: [
                    AdContentReviewNetwork(
                        recommended: true,
                        title: AdContentReviewNetworkTitle.whop
                    )
                ],
                status: AdContentReviewStatus.reviewed,
                tags: [
                    AdContentReviewTag(
                        message: "message",
                        title: "title"
                    )
                ]
            ),
            costPerAddedToCart: Nullable<Double>.value(6.515675675675676),
            costPerClick: 0.36,
            costPerCompletedRegistration: Nullable<Double>.value(25.37684210526316),
            costPerContact: Nullable<Double>.value(17.85777777777778),
            costPerLead: Nullable<Double>.value(3.984793388429752),
            costPerMille: 9.42,
            costPerPurchase: Nullable<Double>.value(12.68842105263158),
            costPerResult: Nullable<Double>.value(7.653333333333333),
            costPerSchedule: Nullable<Double>.value(10.48173913043478),
            costPerSubmittedApplication: Nullable<Double>.value(40.18),
            costPerUniqueClick: Nullable<Double>.value(0.48),
            costPerViewedContent: Nullable<Double>.value(0.2253084112149533),
            createdAt: "2026-01-01T12:00:00.000Z",
            creatives: [
                AdCreative(
                    crop: Nullable<AdCreativeCrop>.value(AdCreativeCrop(
                        height: 1000,
                        width: 1000,
                        x: 40,
                        y: 0
                    )),
                    format: Nullable<AdCreativeFormat>.value(AdCreativeFormat.square),
                    id: "file_xxxxxxxxxxxxxx",
                    language: Nullable<String>.value("language"),
                    mediaType: Nullable<String>.value("image"),
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )
            ],
            customConversions: 63,
            customEventCounts: [
                "booked_detail": JSONValue.number(63)
            ],
            customEventValues: [
                "booked_detail": JSONValue.number(4820)
            ],
            deliveryStatus: AdDeliveryStatus.inAppeal,
            descriptions: [
                AdText(
                    language: Nullable<String>.value("language"),
                    text: "Austin's mobile detailers"
                )
            ],
            frequency: Nullable<Double>.value(1.1),
            headlines: [
                AdText(
                    language: Nullable<String>.value("language"),
                    text: "Austin's mobile detailers"
                )
            ],
            id: "ad_xxxxxxxxxxxxxx",
            impressions: 51204,
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
            leadValue: 1180,
            leads: 121,
            linkClicks: 1071,
            primaryTexts: [
                AdText(
                    language: Nullable<String>.value("language"),
                    text: "Austin's mobile detailers"
                )
            ],
            purchaseValue: 9462,
            purchases: 38,
            reach: 0,
            resultEvent: Nullable<AdResultEvent>.value(AdResultEvent.purchase),
            resultEventName: Nullable<String>.value("booked_detail"),
            results: Nullable<Double>.value(63),
            returnOnAdSpend: 19.62419113987058,
            scheduleValue: 640,
            schedules: 46,
            spend: 482.16,
            spendCurrency: Nullable<String>.value("usd"),
            status: AdStatus.active,
            submittedApplicationValue: 300,
            submittedApplications: 12,
            title: Nullable<String>.value("Ceramic coating — spring hook v2"),
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 1012,
            updatedAt: "2026-01-01T12:00:00.000Z",
            url: Nullable<String>.value("https://shinetime.example/ceramic-coating"),
            urlParameters: [
                "key": JSONValue.string("value")
            ],
            viewedContentValue: 0,
            viewedContents: 2140
        )
        let response = try await client.ads.pause(
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
                  "ad_campaign": {
                    "id": "adcamp_xxxxxxxxxxxxxx"
                  },
                  "ad_group": {
                    "id": "adcamp_xxxxxxxxxxxxxx"
                  },
                  "added_to_cart_value": 1850,
                  "added_to_carts": 74,
                  "call_to_action": "learn_more",
                  "click_through_rate": 0.0261,
                  "clicks": 1337,
                  "completed_registration_value": 95,
                  "completed_registrations": 19,
                  "contact_value": 175,
                  "contacts": 27,
                  "content_review": {
                    "networks": [
                      {
                        "recommended": true,
                        "title": "whop"
                      }
                    ],
                    "status": "reviewed",
                    "tags": [
                      {
                        "message": "message",
                        "title": "title"
                      }
                    ]
                  },
                  "cost_per_added_to_cart": 6.515675675675676,
                  "cost_per_click": 0.36,
                  "cost_per_completed_registration": 25.37684210526316,
                  "cost_per_contact": 17.85777777777778,
                  "cost_per_lead": 3.984793388429752,
                  "cost_per_mille": 9.42,
                  "cost_per_purchase": 12.68842105263158,
                  "cost_per_result": 7.653333333333333,
                  "cost_per_schedule": 10.48173913043478,
                  "cost_per_submitted_application": 40.18,
                  "cost_per_unique_click": 0.48,
                  "cost_per_viewed_content": 0.2253084112149533,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "creatives": [
                    {
                      "crop": {
                        "height": 1000,
                        "width": 1000,
                        "x": 40,
                        "y": 0
                      },
                      "format": "square",
                      "id": "file_xxxxxxxxxxxxxx",
                      "language": "language",
                      "media_type": "image",
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  ],
                  "custom_conversions": 63,
                  "custom_event_counts": {
                    "booked_detail": 63
                  },
                  "custom_event_values": {
                    "booked_detail": 4820
                  },
                  "delivery_status": "in_appeal",
                  "descriptions": [
                    {
                      "language": "language",
                      "text": "Austin's mobile detailers"
                    }
                  ],
                  "frequency": 1.1,
                  "headlines": [
                    {
                      "language": "language",
                      "text": "Austin's mobile detailers"
                    }
                  ],
                  "id": "ad_xxxxxxxxxxxxxx",
                  "impressions": 51204,
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
                  "lead_value": 1180,
                  "leads": 121,
                  "link_clicks": 1071,
                  "primary_texts": [
                    {
                      "language": "language",
                      "text": "Austin's mobile detailers"
                    }
                  ],
                  "purchase_value": 9462,
                  "purchases": 38,
                  "reach": 0,
                  "result_event": "purchase",
                  "result_event_name": "booked_detail",
                  "results": 63,
                  "return_on_ad_spend": 19.62419113987058,
                  "schedule_value": 640,
                  "schedules": 46,
                  "spend": 482.16,
                  "spend_currency": "usd",
                  "status": "active",
                  "submitted_application_value": 300,
                  "submitted_applications": 12,
                  "title": "Ceramic coating — spring hook v2",
                  "unique_click_through_rate": 1.1,
                  "unique_clicks": 1012,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "url": "https://shinetime.example/ceramic-coating",
                  "url_parameters": {
                    "key": "value"
                  },
                  "viewed_content_value": 0,
                  "viewed_contents": 2140
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Ad(
            adCampaign: AdEntityReference(
                id: "adcamp_xxxxxxxxxxxxxx"
            ),
            adGroup: AdEntityReference(
                id: "adcamp_xxxxxxxxxxxxxx"
            ),
            addedToCartValue: 1850,
            addedToCarts: 74,
            callToAction: Nullable<AdCallToAction>.value(AdCallToAction.learnMore),
            clickThroughRate: 0.0261,
            clicks: 1337,
            completedRegistrationValue: 95,
            completedRegistrations: 19,
            contactValue: 175,
            contacts: 27,
            contentReview: AdContentReview(
                networks: [
                    AdContentReviewNetwork(
                        recommended: true,
                        title: AdContentReviewNetworkTitle.whop
                    )
                ],
                status: AdContentReviewStatus.reviewed,
                tags: [
                    AdContentReviewTag(
                        message: "message",
                        title: "title"
                    )
                ]
            ),
            costPerAddedToCart: Nullable<Double>.value(6.515675675675676),
            costPerClick: 0.36,
            costPerCompletedRegistration: Nullable<Double>.value(25.37684210526316),
            costPerContact: Nullable<Double>.value(17.85777777777778),
            costPerLead: Nullable<Double>.value(3.984793388429752),
            costPerMille: 9.42,
            costPerPurchase: Nullable<Double>.value(12.68842105263158),
            costPerResult: Nullable<Double>.value(7.653333333333333),
            costPerSchedule: Nullable<Double>.value(10.48173913043478),
            costPerSubmittedApplication: Nullable<Double>.value(40.18),
            costPerUniqueClick: Nullable<Double>.value(0.48),
            costPerViewedContent: Nullable<Double>.value(0.2253084112149533),
            createdAt: "2026-01-01T12:00:00.000Z",
            creatives: [
                AdCreative(
                    crop: Nullable<AdCreativeCrop>.value(AdCreativeCrop(
                        height: 1000,
                        width: 1000,
                        x: 40,
                        y: 0
                    )),
                    format: Nullable<AdCreativeFormat>.value(AdCreativeFormat.square),
                    id: "file_xxxxxxxxxxxxxx",
                    language: Nullable<String>.value("language"),
                    mediaType: Nullable<String>.value("image"),
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )
            ],
            customConversions: 63,
            customEventCounts: [
                "booked_detail": JSONValue.number(63)
            ],
            customEventValues: [
                "booked_detail": JSONValue.number(4820)
            ],
            deliveryStatus: AdDeliveryStatus.inAppeal,
            descriptions: [
                AdText(
                    language: Nullable<String>.value("language"),
                    text: "Austin's mobile detailers"
                )
            ],
            frequency: Nullable<Double>.value(1.1),
            headlines: [
                AdText(
                    language: Nullable<String>.value("language"),
                    text: "Austin's mobile detailers"
                )
            ],
            id: "ad_xxxxxxxxxxxxxx",
            impressions: 51204,
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
            leadValue: 1180,
            leads: 121,
            linkClicks: 1071,
            primaryTexts: [
                AdText(
                    language: Nullable<String>.value("language"),
                    text: "Austin's mobile detailers"
                )
            ],
            purchaseValue: 9462,
            purchases: 38,
            reach: 0,
            resultEvent: Nullable<AdResultEvent>.value(AdResultEvent.purchase),
            resultEventName: Nullable<String>.value("booked_detail"),
            results: Nullable<Double>.value(63),
            returnOnAdSpend: 19.62419113987058,
            scheduleValue: 640,
            schedules: 46,
            spend: 482.16,
            spendCurrency: Nullable<String>.value("usd"),
            status: AdStatus.active,
            submittedApplicationValue: 300,
            submittedApplications: 12,
            title: Nullable<String>.value("Ceramic coating — spring hook v2"),
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 1012,
            updatedAt: "2026-01-01T12:00:00.000Z",
            url: Nullable<String>.value("https://shinetime.example/ceramic-coating"),
            urlParameters: [
                "key": JSONValue.string("value")
            ],
            viewedContentValue: 0,
            viewedContents: 2140
        )
        let response = try await client.ads.unpause(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}