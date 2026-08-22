import Foundation
import Testing
import WhopSDK

@Suite("AdsClient Wire Tests") struct AdsClientWireTests {
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
                      "delivery_status": "rejected",
                      "descriptions": [
                        "Paint correction included"
                      ],
                      "frequency": 1.1,
                      "headlines": [
                        "Austin's mobile detailers"
                      ],
                      "id": "ad_xxxxxxxxxxxxxx",
                      "impressions": 51204,
                      "issues": [
                        {
                          "id": "adiss_xxxxxxxxxxxxxx",
                          "message": "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                          "resource_id": "ad_xxxxxxxxxxxxxx",
                          "resource_type": "ad_campaign"
                        }
                      ],
                      "lead_form": {
                        "completion": {
                          "button_text": "See our work",
                          "description": "We book coatings two days out, so pick a slot when we ring.",
                          "headline": "Thanks — we will call you today",
                          "url": "https://shinetime.example/gallery"
                        },
                        "disclaimer": {
                          "body": "Ceramic coating requires the vehicle for two days.",
                          "checkboxes": [
                            {
                              "checked_by_default": false,
                              "key": "consent_1",
                              "required": true,
                              "text": "I agree"
                            }
                          ],
                          "title": "Before you submit"
                        },
                        "form_type": "more_volume",
                        "intro": {
                          "description": "Tell us about your vehicle and we will send a fixed price.",
                          "headline": "Get a ceramic coating quote"
                        },
                        "name": "Ceramic coating quote requests",
                        "phone_verification": true,
                        "privacy_policy": {
                          "link_text": "Shine Time privacy policy",
                          "url": "https://shinetime.example/privacy"
                        },
                        "questions": [
                          {
                            "format": "multiple_choice",
                            "label": "What vehicle are we detailing?",
                            "options": [
                              {
                                "key": "ceramic_coating",
                                "logic": {
                                  "action": "go_to_question",
                                  "target_end_page_index": 0,
                                  "target_question_index": 3
                                },
                                "value": "Ceramic coating"
                              }
                            ],
                            "type": "custom"
                          }
                        ]
                      },
                      "lead_form_id": "1037724182084885",
                      "lead_value": 1180,
                      "leads": 121,
                      "messaging_config": {
                        "keyword": "Book an interior deep clean",
                        "message": "Hi! Tell us your vehicle and ZIP and we will send an interior deep clean quote."
                      },
                      "multi_advertiser_ads": true,
                      "post_id": "xxxxxxxxxxxxxxxx_98765",
                      "post_source": "facebook",
                      "post_thumbnail_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "primary_texts": [
                        "Book a two-day ceramic coating and keep the shine for three years."
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
                      "social_accounts": [
                        {
                          "id": "adcamp_xxxxxxxxxxxxxx"
                        }
                      ],
                      "spend": 482.16,
                      "spend_currency": "usd",
                      "status": "active",
                      "submitted_application_value": 300,
                      "submitted_applications": 12,
                      "title": "Ceramic coating — new ad group",
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
                    deliveryStatus: AdDeliveryStatus.rejected,
                    descriptions: [
                        "Paint correction included"
                    ],
                    frequency: Nullable<Double>.value(1.1),
                    headlines: [
                        "Austin's mobile detailers"
                    ],
                    id: "ad_xxxxxxxxxxxxxx",
                    impressions: 51204,
                    issues: [
                        AdPlatformIssue(
                            id: "adiss_xxxxxxxxxxxxxx",
                            message: "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                            resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                            resourceType: AdPlatformIssueResourceType.adCampaign
                        )
                    ],
                    leadForm: Optional(Nullable<AdLeadForm>.value(AdLeadForm(
                        completion: Nullable<AdLeadFormCompletion>.value(AdLeadFormCompletion(
                            buttonText: Nullable<String>.value("See our work"),
                            description: Nullable<String>.value("We book coatings two days out, so pick a slot when we ring."),
                            headline: Nullable<String>.value("Thanks — we will call you today"),
                            url: Nullable<String>.value("https://shinetime.example/gallery")
                        )),
                        disclaimer: Nullable<AdLeadFormDisclaimer>.value(AdLeadFormDisclaimer(
                            body: Nullable<String>.value("Ceramic coating requires the vehicle for two days."),
                            checkboxes: [
                                AdLeadFormDisclaimerCheckbox(
                                    checkedByDefault: Nullable<Bool>.value(false),
                                    key: Nullable<String>.value("consent_1"),
                                    required: Nullable<Bool>.value(true),
                                    text: "I agree"
                                )
                            ],
                            title: Nullable<String>.value("Before you submit")
                        )),
                        formType: AdLeadFormFormType.moreVolume,
                        intro: Nullable<AdLeadFormIntro>.value(AdLeadFormIntro(
                            description: Nullable<String>.value("Tell us about your vehicle and we will send a fixed price."),
                            headline: Nullable<String>.value("Get a ceramic coating quote")
                        )),
                        name: Nullable<String>.value("Ceramic coating quote requests"),
                        phoneVerification: true,
                        privacyPolicy: Nullable<AdLeadFormPrivacyPolicy>.value(AdLeadFormPrivacyPolicy(
                            linkText: Nullable<String>.value("Shine Time privacy policy"),
                            url: "https://shinetime.example/privacy"
                        )),
                        questions: [
                            AdLeadFormQuestion(
                                format: Optional("multiple_choice"),
                                label: Optional("What vehicle are we detailing?"),
                                options: Optional([
                                    AdLeadFormQuestionOption(
                                        key: Optional(Nullable<String>.value("ceramic_coating")),
                                        logic: Optional(AdLeadFormOptionLogic(
                                            action: AdLeadFormOptionLogicAction.goToQuestion,
                                            targetEndPageIndex: Optional(0),
                                            targetQuestionIndex: Optional(3)
                                        )),
                                        value: "Ceramic coating"
                                    )
                                ]),
                                type: "custom"
                            )
                        ]
                    ))),
                    leadFormId: Optional(Nullable<String>.value("1037724182084885")),
                    leadValue: 1180,
                    leads: 121,
                    messagingConfig: Optional(Nullable<AdMessagingConfig>.value(AdMessagingConfig(
                        keyword: Nullable<String>.value("Book an interior deep clean"),
                        message: Nullable<String>.value("Hi! Tell us your vehicle and ZIP and we will send an interior deep clean quote.")
                    ))),
                    multiAdvertiserAds: Optional(true),
                    postId: Nullable<String>.value("xxxxxxxxxxxxxxxx_98765"),
                    postSource: Nullable<AdPostSource>.value(AdPostSource.facebook),
                    postThumbnailUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    primaryTexts: [
                        "Book a two-day ceramic coating and keep the shine for three years."
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
                    socialAccounts: [
                        AdEntityReference(
                            id: "adcamp_xxxxxxxxxxxxxx"
                        )
                    ],
                    spend: 482.16,
                    spendCurrency: Nullable<String>.value("usd"),
                    status: AdStatus.active,
                    submittedApplicationValue: 300,
                    submittedApplications: 12,
                    title: Nullable<String>.value("Ceramic coating — new ad group"),
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
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
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
                  "delivery_status": "rejected",
                  "descriptions": [
                    "Paint correction included"
                  ],
                  "frequency": 1.1,
                  "headlines": [
                    "Austin's mobile detailers"
                  ],
                  "id": "ad_xxxxxxxxxxxxxx",
                  "impressions": 51204,
                  "issues": [
                    {
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad_campaign"
                    }
                  ],
                  "lead_form": {
                    "completion": {
                      "button_text": "See our work",
                      "description": "We book coatings two days out, so pick a slot when we ring.",
                      "headline": "Thanks — we will call you today",
                      "url": "https://shinetime.example/gallery"
                    },
                    "disclaimer": {
                      "body": "Ceramic coating requires the vehicle for two days.",
                      "checkboxes": [
                        {
                          "checked_by_default": false,
                          "key": "consent_1",
                          "required": true,
                          "text": "I agree"
                        }
                      ],
                      "title": "Before you submit"
                    },
                    "form_type": "more_volume",
                    "intro": {
                      "description": "Tell us about your vehicle and we will send a fixed price.",
                      "headline": "Get a ceramic coating quote"
                    },
                    "name": "Ceramic coating quote requests",
                    "phone_verification": true,
                    "privacy_policy": {
                      "link_text": "Shine Time privacy policy",
                      "url": "https://shinetime.example/privacy"
                    },
                    "questions": [
                      {
                        "format": "multiple_choice",
                        "label": "What vehicle are we detailing?",
                        "options": [
                          {
                            "key": "ceramic_coating",
                            "logic": {
                              "action": "go_to_question",
                              "target_end_page_index": 0,
                              "target_question_index": 3
                            },
                            "value": "Ceramic coating"
                          }
                        ],
                        "type": "custom"
                      }
                    ]
                  },
                  "lead_form_id": "1037724182084885",
                  "lead_value": 1180,
                  "leads": 121,
                  "messaging_config": {
                    "keyword": "Book an interior deep clean",
                    "message": "Hi! Tell us your vehicle and ZIP and we will send an interior deep clean quote."
                  },
                  "multi_advertiser_ads": true,
                  "post_id": "xxxxxxxxxxxxxxxx_98765",
                  "post_source": "facebook",
                  "post_thumbnail_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "primary_texts": [
                    "Book a two-day ceramic coating and keep the shine for three years."
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
                  "social_accounts": [
                    {
                      "id": "adcamp_xxxxxxxxxxxxxx"
                    }
                  ],
                  "spend": 482.16,
                  "spend_currency": "usd",
                  "status": "active",
                  "submitted_application_value": 300,
                  "submitted_applications": 12,
                  "title": "Ceramic coating — new ad group",
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
            deliveryStatus: AdDeliveryStatus.rejected,
            descriptions: [
                "Paint correction included"
            ],
            frequency: Nullable<Double>.value(1.1),
            headlines: [
                "Austin's mobile detailers"
            ],
            id: "ad_xxxxxxxxxxxxxx",
            impressions: 51204,
            issues: [
                AdPlatformIssue(
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdPlatformIssueResourceType.adCampaign
                )
            ],
            leadForm: Optional(Nullable<AdLeadForm>.value(AdLeadForm(
                completion: Nullable<AdLeadFormCompletion>.value(AdLeadFormCompletion(
                    buttonText: Nullable<String>.value("See our work"),
                    description: Nullable<String>.value("We book coatings two days out, so pick a slot when we ring."),
                    headline: Nullable<String>.value("Thanks — we will call you today"),
                    url: Nullable<String>.value("https://shinetime.example/gallery")
                )),
                disclaimer: Nullable<AdLeadFormDisclaimer>.value(AdLeadFormDisclaimer(
                    body: Nullable<String>.value("Ceramic coating requires the vehicle for two days."),
                    checkboxes: [
                        AdLeadFormDisclaimerCheckbox(
                            checkedByDefault: Nullable<Bool>.value(false),
                            key: Nullable<String>.value("consent_1"),
                            required: Nullable<Bool>.value(true),
                            text: "I agree"
                        )
                    ],
                    title: Nullable<String>.value("Before you submit")
                )),
                formType: AdLeadFormFormType.moreVolume,
                intro: Nullable<AdLeadFormIntro>.value(AdLeadFormIntro(
                    description: Nullable<String>.value("Tell us about your vehicle and we will send a fixed price."),
                    headline: Nullable<String>.value("Get a ceramic coating quote")
                )),
                name: Nullable<String>.value("Ceramic coating quote requests"),
                phoneVerification: true,
                privacyPolicy: Nullable<AdLeadFormPrivacyPolicy>.value(AdLeadFormPrivacyPolicy(
                    linkText: Nullable<String>.value("Shine Time privacy policy"),
                    url: "https://shinetime.example/privacy"
                )),
                questions: [
                    AdLeadFormQuestion(
                        format: Optional("multiple_choice"),
                        label: Optional("What vehicle are we detailing?"),
                        options: Optional([
                            AdLeadFormQuestionOption(
                                key: Optional(Nullable<String>.value("ceramic_coating")),
                                logic: Optional(AdLeadFormOptionLogic(
                                    action: AdLeadFormOptionLogicAction.goToQuestion,
                                    targetEndPageIndex: Optional(0),
                                    targetQuestionIndex: Optional(3)
                                )),
                                value: "Ceramic coating"
                            )
                        ]),
                        type: "custom"
                    )
                ]
            ))),
            leadFormId: Optional(Nullable<String>.value("1037724182084885")),
            leadValue: 1180,
            leads: 121,
            messagingConfig: Optional(Nullable<AdMessagingConfig>.value(AdMessagingConfig(
                keyword: Nullable<String>.value("Book an interior deep clean"),
                message: Nullable<String>.value("Hi! Tell us your vehicle and ZIP and we will send an interior deep clean quote.")
            ))),
            multiAdvertiserAds: Optional(true),
            postId: Nullable<String>.value("xxxxxxxxxxxxxxxx_98765"),
            postSource: Nullable<AdPostSource>.value(AdPostSource.facebook),
            postThumbnailUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            primaryTexts: [
                "Book a two-day ceramic coating and keep the shine for three years."
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
            socialAccounts: [
                AdEntityReference(
                    id: "adcamp_xxxxxxxxxxxxxx"
                )
            ],
            spend: 482.16,
            spendCurrency: Nullable<String>.value("usd"),
            status: AdStatus.active,
            submittedApplicationValue: 300,
            submittedApplications: 12,
            title: Nullable<String>.value("Ceramic coating — new ad group"),
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
                  "delivery_status": "rejected",
                  "descriptions": [
                    "Paint correction included"
                  ],
                  "frequency": 1.1,
                  "headlines": [
                    "Austin's mobile detailers"
                  ],
                  "id": "ad_xxxxxxxxxxxxxx",
                  "impressions": 51204,
                  "issues": [
                    {
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad_campaign"
                    }
                  ],
                  "lead_form": {
                    "completion": {
                      "button_text": "See our work",
                      "description": "We book coatings two days out, so pick a slot when we ring.",
                      "headline": "Thanks — we will call you today",
                      "url": "https://shinetime.example/gallery"
                    },
                    "disclaimer": {
                      "body": "Ceramic coating requires the vehicle for two days.",
                      "checkboxes": [
                        {
                          "checked_by_default": false,
                          "key": "consent_1",
                          "required": true,
                          "text": "I agree"
                        }
                      ],
                      "title": "Before you submit"
                    },
                    "form_type": "more_volume",
                    "intro": {
                      "description": "Tell us about your vehicle and we will send a fixed price.",
                      "headline": "Get a ceramic coating quote"
                    },
                    "name": "Ceramic coating quote requests",
                    "phone_verification": true,
                    "privacy_policy": {
                      "link_text": "Shine Time privacy policy",
                      "url": "https://shinetime.example/privacy"
                    },
                    "questions": [
                      {
                        "format": "multiple_choice",
                        "label": "What vehicle are we detailing?",
                        "options": [
                          {
                            "key": "ceramic_coating",
                            "logic": {
                              "action": "go_to_question",
                              "target_end_page_index": 0,
                              "target_question_index": 3
                            },
                            "value": "Ceramic coating"
                          }
                        ],
                        "type": "custom"
                      }
                    ]
                  },
                  "lead_form_id": "1037724182084885",
                  "lead_value": 1180,
                  "leads": 121,
                  "messaging_config": {
                    "keyword": "Book an interior deep clean",
                    "message": "Hi! Tell us your vehicle and ZIP and we will send an interior deep clean quote."
                  },
                  "multi_advertiser_ads": true,
                  "post_id": "xxxxxxxxxxxxxxxx_98765",
                  "post_source": "facebook",
                  "post_thumbnail_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "primary_texts": [
                    "Book a two-day ceramic coating and keep the shine for three years."
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
                  "social_accounts": [
                    {
                      "id": "adcamp_xxxxxxxxxxxxxx"
                    }
                  ],
                  "spend": 482.16,
                  "spend_currency": "usd",
                  "status": "active",
                  "submitted_application_value": 300,
                  "submitted_applications": 12,
                  "title": "Ceramic coating — new ad group",
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
            deliveryStatus: AdDeliveryStatus.rejected,
            descriptions: [
                "Paint correction included"
            ],
            frequency: Nullable<Double>.value(1.1),
            headlines: [
                "Austin's mobile detailers"
            ],
            id: "ad_xxxxxxxxxxxxxx",
            impressions: 51204,
            issues: [
                AdPlatformIssue(
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdPlatformIssueResourceType.adCampaign
                )
            ],
            leadForm: Optional(Nullable<AdLeadForm>.value(AdLeadForm(
                completion: Nullable<AdLeadFormCompletion>.value(AdLeadFormCompletion(
                    buttonText: Nullable<String>.value("See our work"),
                    description: Nullable<String>.value("We book coatings two days out, so pick a slot when we ring."),
                    headline: Nullable<String>.value("Thanks — we will call you today"),
                    url: Nullable<String>.value("https://shinetime.example/gallery")
                )),
                disclaimer: Nullable<AdLeadFormDisclaimer>.value(AdLeadFormDisclaimer(
                    body: Nullable<String>.value("Ceramic coating requires the vehicle for two days."),
                    checkboxes: [
                        AdLeadFormDisclaimerCheckbox(
                            checkedByDefault: Nullable<Bool>.value(false),
                            key: Nullable<String>.value("consent_1"),
                            required: Nullable<Bool>.value(true),
                            text: "I agree"
                        )
                    ],
                    title: Nullable<String>.value("Before you submit")
                )),
                formType: AdLeadFormFormType.moreVolume,
                intro: Nullable<AdLeadFormIntro>.value(AdLeadFormIntro(
                    description: Nullable<String>.value("Tell us about your vehicle and we will send a fixed price."),
                    headline: Nullable<String>.value("Get a ceramic coating quote")
                )),
                name: Nullable<String>.value("Ceramic coating quote requests"),
                phoneVerification: true,
                privacyPolicy: Nullable<AdLeadFormPrivacyPolicy>.value(AdLeadFormPrivacyPolicy(
                    linkText: Nullable<String>.value("Shine Time privacy policy"),
                    url: "https://shinetime.example/privacy"
                )),
                questions: [
                    AdLeadFormQuestion(
                        format: Optional("multiple_choice"),
                        label: Optional("What vehicle are we detailing?"),
                        options: Optional([
                            AdLeadFormQuestionOption(
                                key: Optional(Nullable<String>.value("ceramic_coating")),
                                logic: Optional(AdLeadFormOptionLogic(
                                    action: AdLeadFormOptionLogicAction.goToQuestion,
                                    targetEndPageIndex: Optional(0),
                                    targetQuestionIndex: Optional(3)
                                )),
                                value: "Ceramic coating"
                            )
                        ]),
                        type: "custom"
                    )
                ]
            ))),
            leadFormId: Optional(Nullable<String>.value("1037724182084885")),
            leadValue: 1180,
            leads: 121,
            messagingConfig: Optional(Nullable<AdMessagingConfig>.value(AdMessagingConfig(
                keyword: Nullable<String>.value("Book an interior deep clean"),
                message: Nullable<String>.value("Hi! Tell us your vehicle and ZIP and we will send an interior deep clean quote.")
            ))),
            multiAdvertiserAds: Optional(true),
            postId: Nullable<String>.value("xxxxxxxxxxxxxxxx_98765"),
            postSource: Nullable<AdPostSource>.value(AdPostSource.facebook),
            postThumbnailUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            primaryTexts: [
                "Book a two-day ceramic coating and keep the shine for three years."
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
            socialAccounts: [
                AdEntityReference(
                    id: "adcamp_xxxxxxxxxxxxxx"
                )
            ],
            spend: 482.16,
            spendCurrency: Nullable<String>.value("usd"),
            status: AdStatus.active,
            submittedApplicationValue: 300,
            submittedApplications: 12,
            title: Nullable<String>.value("Ceramic coating — new ad group"),
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
                  "delivery_status": "rejected",
                  "descriptions": [
                    "Paint correction included"
                  ],
                  "frequency": 1.1,
                  "headlines": [
                    "Austin's mobile detailers"
                  ],
                  "id": "ad_xxxxxxxxxxxxxx",
                  "impressions": 51204,
                  "issues": [
                    {
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad_campaign"
                    }
                  ],
                  "lead_form": {
                    "completion": {
                      "button_text": "See our work",
                      "description": "We book coatings two days out, so pick a slot when we ring.",
                      "headline": "Thanks — we will call you today",
                      "url": "https://shinetime.example/gallery"
                    },
                    "disclaimer": {
                      "body": "Ceramic coating requires the vehicle for two days.",
                      "checkboxes": [
                        {
                          "checked_by_default": false,
                          "key": "consent_1",
                          "required": true,
                          "text": "I agree"
                        }
                      ],
                      "title": "Before you submit"
                    },
                    "form_type": "more_volume",
                    "intro": {
                      "description": "Tell us about your vehicle and we will send a fixed price.",
                      "headline": "Get a ceramic coating quote"
                    },
                    "name": "Ceramic coating quote requests",
                    "phone_verification": true,
                    "privacy_policy": {
                      "link_text": "Shine Time privacy policy",
                      "url": "https://shinetime.example/privacy"
                    },
                    "questions": [
                      {
                        "format": "multiple_choice",
                        "label": "What vehicle are we detailing?",
                        "options": [
                          {
                            "key": "ceramic_coating",
                            "logic": {
                              "action": "go_to_question",
                              "target_end_page_index": 0,
                              "target_question_index": 3
                            },
                            "value": "Ceramic coating"
                          }
                        ],
                        "type": "custom"
                      }
                    ]
                  },
                  "lead_form_id": "1037724182084885",
                  "lead_value": 1180,
                  "leads": 121,
                  "messaging_config": {
                    "keyword": "Book an interior deep clean",
                    "message": "Hi! Tell us your vehicle and ZIP and we will send an interior deep clean quote."
                  },
                  "multi_advertiser_ads": true,
                  "post_id": "xxxxxxxxxxxxxxxx_98765",
                  "post_source": "facebook",
                  "post_thumbnail_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "primary_texts": [
                    "Book a two-day ceramic coating and keep the shine for three years."
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
                  "social_accounts": [
                    {
                      "id": "adcamp_xxxxxxxxxxxxxx"
                    }
                  ],
                  "spend": 482.16,
                  "spend_currency": "usd",
                  "status": "active",
                  "submitted_application_value": 300,
                  "submitted_applications": 12,
                  "title": "Ceramic coating — new ad group",
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
            deliveryStatus: AdDeliveryStatus.rejected,
            descriptions: [
                "Paint correction included"
            ],
            frequency: Nullable<Double>.value(1.1),
            headlines: [
                "Austin's mobile detailers"
            ],
            id: "ad_xxxxxxxxxxxxxx",
            impressions: 51204,
            issues: [
                AdPlatformIssue(
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdPlatformIssueResourceType.adCampaign
                )
            ],
            leadForm: Optional(Nullable<AdLeadForm>.value(AdLeadForm(
                completion: Nullable<AdLeadFormCompletion>.value(AdLeadFormCompletion(
                    buttonText: Nullable<String>.value("See our work"),
                    description: Nullable<String>.value("We book coatings two days out, so pick a slot when we ring."),
                    headline: Nullable<String>.value("Thanks — we will call you today"),
                    url: Nullable<String>.value("https://shinetime.example/gallery")
                )),
                disclaimer: Nullable<AdLeadFormDisclaimer>.value(AdLeadFormDisclaimer(
                    body: Nullable<String>.value("Ceramic coating requires the vehicle for two days."),
                    checkboxes: [
                        AdLeadFormDisclaimerCheckbox(
                            checkedByDefault: Nullable<Bool>.value(false),
                            key: Nullable<String>.value("consent_1"),
                            required: Nullable<Bool>.value(true),
                            text: "I agree"
                        )
                    ],
                    title: Nullable<String>.value("Before you submit")
                )),
                formType: AdLeadFormFormType.moreVolume,
                intro: Nullable<AdLeadFormIntro>.value(AdLeadFormIntro(
                    description: Nullable<String>.value("Tell us about your vehicle and we will send a fixed price."),
                    headline: Nullable<String>.value("Get a ceramic coating quote")
                )),
                name: Nullable<String>.value("Ceramic coating quote requests"),
                phoneVerification: true,
                privacyPolicy: Nullable<AdLeadFormPrivacyPolicy>.value(AdLeadFormPrivacyPolicy(
                    linkText: Nullable<String>.value("Shine Time privacy policy"),
                    url: "https://shinetime.example/privacy"
                )),
                questions: [
                    AdLeadFormQuestion(
                        format: Optional("multiple_choice"),
                        label: Optional("What vehicle are we detailing?"),
                        options: Optional([
                            AdLeadFormQuestionOption(
                                key: Optional(Nullable<String>.value("ceramic_coating")),
                                logic: Optional(AdLeadFormOptionLogic(
                                    action: AdLeadFormOptionLogicAction.goToQuestion,
                                    targetEndPageIndex: Optional(0),
                                    targetQuestionIndex: Optional(3)
                                )),
                                value: "Ceramic coating"
                            )
                        ]),
                        type: "custom"
                    )
                ]
            ))),
            leadFormId: Optional(Nullable<String>.value("1037724182084885")),
            leadValue: 1180,
            leads: 121,
            messagingConfig: Optional(Nullable<AdMessagingConfig>.value(AdMessagingConfig(
                keyword: Nullable<String>.value("Book an interior deep clean"),
                message: Nullable<String>.value("Hi! Tell us your vehicle and ZIP and we will send an interior deep clean quote.")
            ))),
            multiAdvertiserAds: Optional(true),
            postId: Nullable<String>.value("xxxxxxxxxxxxxxxx_98765"),
            postSource: Nullable<AdPostSource>.value(AdPostSource.facebook),
            postThumbnailUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            primaryTexts: [
                "Book a two-day ceramic coating and keep the shine for three years."
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
            socialAccounts: [
                AdEntityReference(
                    id: "adcamp_xxxxxxxxxxxxxx"
                )
            ],
            spend: 482.16,
            spendCurrency: Nullable<String>.value("usd"),
            status: AdStatus.active,
            submittedApplicationValue: 300,
            submittedApplications: 12,
            title: Nullable<String>.value("Ceramic coating — new ad group"),
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
                      "delivery_status": "rejected",
                      "descriptions": [
                        "Paint correction included"
                      ],
                      "frequency": 1.1,
                      "headlines": [
                        "Austin's mobile detailers"
                      ],
                      "id": "ad_xxxxxxxxxxxxxx",
                      "impressions": 51204,
                      "issues": [
                        {
                          "id": "adiss_xxxxxxxxxxxxxx",
                          "message": "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                          "resource_id": "ad_xxxxxxxxxxxxxx",
                          "resource_type": "ad_campaign"
                        }
                      ],
                      "lead_form": {
                        "completion": {
                          "button_text": "See our work",
                          "description": "We book coatings two days out, so pick a slot when we ring.",
                          "headline": "Thanks — we will call you today",
                          "url": "https://shinetime.example/gallery"
                        },
                        "disclaimer": {
                          "body": "Ceramic coating requires the vehicle for two days.",
                          "checkboxes": [
                            {
                              "checked_by_default": false,
                              "key": "consent_1",
                              "required": true,
                              "text": "I agree"
                            }
                          ],
                          "title": "Before you submit"
                        },
                        "form_type": "more_volume",
                        "intro": {
                          "description": "Tell us about your vehicle and we will send a fixed price.",
                          "headline": "Get a ceramic coating quote"
                        },
                        "name": "Ceramic coating quote requests",
                        "phone_verification": true,
                        "privacy_policy": {
                          "link_text": "Shine Time privacy policy",
                          "url": "https://shinetime.example/privacy"
                        },
                        "questions": [
                          {
                            "format": "multiple_choice",
                            "label": "What vehicle are we detailing?",
                            "options": [
                              {
                                "key": "ceramic_coating",
                                "logic": {
                                  "action": "go_to_question",
                                  "target_end_page_index": 0,
                                  "target_question_index": 3
                                },
                                "value": "Ceramic coating"
                              }
                            ],
                            "type": "custom"
                          }
                        ]
                      },
                      "lead_form_id": "1037724182084885",
                      "lead_value": 1180,
                      "leads": 121,
                      "messaging_config": {
                        "keyword": "Book an interior deep clean",
                        "message": "Hi! Tell us your vehicle and ZIP and we will send an interior deep clean quote."
                      },
                      "multi_advertiser_ads": true,
                      "post_id": "xxxxxxxxxxxxxxxx_98765",
                      "post_source": "facebook",
                      "post_thumbnail_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "primary_texts": [
                        "Book a two-day ceramic coating and keep the shine for three years."
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
                      "social_accounts": [
                        {
                          "id": "adcamp_xxxxxxxxxxxxxx"
                        }
                      ],
                      "spend": 482.16,
                      "spend_currency": "usd",
                      "status": "active",
                      "submitted_application_value": 300,
                      "submitted_applications": 12,
                      "title": "Ceramic coating — new ad group",
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
                    deliveryStatus: AdDeliveryStatus.rejected,
                    descriptions: [
                        "Paint correction included"
                    ],
                    frequency: Nullable<Double>.value(1.1),
                    headlines: [
                        "Austin's mobile detailers"
                    ],
                    id: "ad_xxxxxxxxxxxxxx",
                    impressions: 51204,
                    issues: [
                        AdPlatformIssue(
                            id: "adiss_xxxxxxxxxxxxxx",
                            message: "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                            resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                            resourceType: AdPlatformIssueResourceType.adCampaign
                        )
                    ],
                    leadForm: Optional(Nullable<AdLeadForm>.value(AdLeadForm(
                        completion: Nullable<AdLeadFormCompletion>.value(AdLeadFormCompletion(
                            buttonText: Nullable<String>.value("See our work"),
                            description: Nullable<String>.value("We book coatings two days out, so pick a slot when we ring."),
                            headline: Nullable<String>.value("Thanks — we will call you today"),
                            url: Nullable<String>.value("https://shinetime.example/gallery")
                        )),
                        disclaimer: Nullable<AdLeadFormDisclaimer>.value(AdLeadFormDisclaimer(
                            body: Nullable<String>.value("Ceramic coating requires the vehicle for two days."),
                            checkboxes: [
                                AdLeadFormDisclaimerCheckbox(
                                    checkedByDefault: Nullable<Bool>.value(false),
                                    key: Nullable<String>.value("consent_1"),
                                    required: Nullable<Bool>.value(true),
                                    text: "I agree"
                                )
                            ],
                            title: Nullable<String>.value("Before you submit")
                        )),
                        formType: AdLeadFormFormType.moreVolume,
                        intro: Nullable<AdLeadFormIntro>.value(AdLeadFormIntro(
                            description: Nullable<String>.value("Tell us about your vehicle and we will send a fixed price."),
                            headline: Nullable<String>.value("Get a ceramic coating quote")
                        )),
                        name: Nullable<String>.value("Ceramic coating quote requests"),
                        phoneVerification: true,
                        privacyPolicy: Nullable<AdLeadFormPrivacyPolicy>.value(AdLeadFormPrivacyPolicy(
                            linkText: Nullable<String>.value("Shine Time privacy policy"),
                            url: "https://shinetime.example/privacy"
                        )),
                        questions: [
                            AdLeadFormQuestion(
                                format: Optional("multiple_choice"),
                                label: Optional("What vehicle are we detailing?"),
                                options: Optional([
                                    AdLeadFormQuestionOption(
                                        key: Optional(Nullable<String>.value("ceramic_coating")),
                                        logic: Optional(AdLeadFormOptionLogic(
                                            action: AdLeadFormOptionLogicAction.goToQuestion,
                                            targetEndPageIndex: Optional(0),
                                            targetQuestionIndex: Optional(3)
                                        )),
                                        value: "Ceramic coating"
                                    )
                                ]),
                                type: "custom"
                            )
                        ]
                    ))),
                    leadFormId: Optional(Nullable<String>.value("1037724182084885")),
                    leadValue: 1180,
                    leads: 121,
                    messagingConfig: Optional(Nullable<AdMessagingConfig>.value(AdMessagingConfig(
                        keyword: Nullable<String>.value("Book an interior deep clean"),
                        message: Nullable<String>.value("Hi! Tell us your vehicle and ZIP and we will send an interior deep clean quote.")
                    ))),
                    multiAdvertiserAds: Optional(true),
                    postId: Nullable<String>.value("xxxxxxxxxxxxxxxx_98765"),
                    postSource: Nullable<AdPostSource>.value(AdPostSource.facebook),
                    postThumbnailUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    primaryTexts: [
                        "Book a two-day ceramic coating and keep the shine for three years."
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
                    socialAccounts: [
                        AdEntityReference(
                            id: "adcamp_xxxxxxxxxxxxxx"
                        )
                    ],
                    spend: 482.16,
                    spendCurrency: Nullable<String>.value("usd"),
                    status: AdStatus.active,
                    submittedApplicationValue: 300,
                    submittedApplications: 12,
                    title: Nullable<String>.value("Ceramic coating — new ad group"),
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
                  "delivery_status": "rejected",
                  "descriptions": [
                    "Paint correction included"
                  ],
                  "frequency": 1.1,
                  "headlines": [
                    "Austin's mobile detailers"
                  ],
                  "id": "ad_xxxxxxxxxxxxxx",
                  "impressions": 51204,
                  "issues": [
                    {
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad_campaign"
                    }
                  ],
                  "lead_form": {
                    "completion": {
                      "button_text": "See our work",
                      "description": "We book coatings two days out, so pick a slot when we ring.",
                      "headline": "Thanks — we will call you today",
                      "url": "https://shinetime.example/gallery"
                    },
                    "disclaimer": {
                      "body": "Ceramic coating requires the vehicle for two days.",
                      "checkboxes": [
                        {
                          "checked_by_default": false,
                          "key": "consent_1",
                          "required": true,
                          "text": "I agree"
                        }
                      ],
                      "title": "Before you submit"
                    },
                    "form_type": "more_volume",
                    "intro": {
                      "description": "Tell us about your vehicle and we will send a fixed price.",
                      "headline": "Get a ceramic coating quote"
                    },
                    "name": "Ceramic coating quote requests",
                    "phone_verification": true,
                    "privacy_policy": {
                      "link_text": "Shine Time privacy policy",
                      "url": "https://shinetime.example/privacy"
                    },
                    "questions": [
                      {
                        "format": "multiple_choice",
                        "label": "What vehicle are we detailing?",
                        "options": [
                          {
                            "key": "ceramic_coating",
                            "logic": {
                              "action": "go_to_question",
                              "target_end_page_index": 0,
                              "target_question_index": 3
                            },
                            "value": "Ceramic coating"
                          }
                        ],
                        "type": "custom"
                      }
                    ]
                  },
                  "lead_form_id": "1037724182084885",
                  "lead_value": 1180,
                  "leads": 121,
                  "messaging_config": {
                    "keyword": "Book an interior deep clean",
                    "message": "Hi! Tell us your vehicle and ZIP and we will send an interior deep clean quote."
                  },
                  "multi_advertiser_ads": true,
                  "post_id": "xxxxxxxxxxxxxxxx_98765",
                  "post_source": "facebook",
                  "post_thumbnail_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "primary_texts": [
                    "Book a two-day ceramic coating and keep the shine for three years."
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
                  "social_accounts": [
                    {
                      "id": "adcamp_xxxxxxxxxxxxxx"
                    }
                  ],
                  "spend": 482.16,
                  "spend_currency": "usd",
                  "status": "active",
                  "submitted_application_value": 300,
                  "submitted_applications": 12,
                  "title": "Ceramic coating — new ad group",
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
            deliveryStatus: AdDeliveryStatus.rejected,
            descriptions: [
                "Paint correction included"
            ],
            frequency: Nullable<Double>.value(1.1),
            headlines: [
                "Austin's mobile detailers"
            ],
            id: "ad_xxxxxxxxxxxxxx",
            impressions: 51204,
            issues: [
                AdPlatformIssue(
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdPlatformIssueResourceType.adCampaign
                )
            ],
            leadForm: Optional(Nullable<AdLeadForm>.value(AdLeadForm(
                completion: Nullable<AdLeadFormCompletion>.value(AdLeadFormCompletion(
                    buttonText: Nullable<String>.value("See our work"),
                    description: Nullable<String>.value("We book coatings two days out, so pick a slot when we ring."),
                    headline: Nullable<String>.value("Thanks — we will call you today"),
                    url: Nullable<String>.value("https://shinetime.example/gallery")
                )),
                disclaimer: Nullable<AdLeadFormDisclaimer>.value(AdLeadFormDisclaimer(
                    body: Nullable<String>.value("Ceramic coating requires the vehicle for two days."),
                    checkboxes: [
                        AdLeadFormDisclaimerCheckbox(
                            checkedByDefault: Nullable<Bool>.value(false),
                            key: Nullable<String>.value("consent_1"),
                            required: Nullable<Bool>.value(true),
                            text: "I agree"
                        )
                    ],
                    title: Nullable<String>.value("Before you submit")
                )),
                formType: AdLeadFormFormType.moreVolume,
                intro: Nullable<AdLeadFormIntro>.value(AdLeadFormIntro(
                    description: Nullable<String>.value("Tell us about your vehicle and we will send a fixed price."),
                    headline: Nullable<String>.value("Get a ceramic coating quote")
                )),
                name: Nullable<String>.value("Ceramic coating quote requests"),
                phoneVerification: true,
                privacyPolicy: Nullable<AdLeadFormPrivacyPolicy>.value(AdLeadFormPrivacyPolicy(
                    linkText: Nullable<String>.value("Shine Time privacy policy"),
                    url: "https://shinetime.example/privacy"
                )),
                questions: [
                    AdLeadFormQuestion(
                        format: Optional("multiple_choice"),
                        label: Optional("What vehicle are we detailing?"),
                        options: Optional([
                            AdLeadFormQuestionOption(
                                key: Optional(Nullable<String>.value("ceramic_coating")),
                                logic: Optional(AdLeadFormOptionLogic(
                                    action: AdLeadFormOptionLogicAction.goToQuestion,
                                    targetEndPageIndex: Optional(0),
                                    targetQuestionIndex: Optional(3)
                                )),
                                value: "Ceramic coating"
                            )
                        ]),
                        type: "custom"
                    )
                ]
            ))),
            leadFormId: Optional(Nullable<String>.value("1037724182084885")),
            leadValue: 1180,
            leads: 121,
            messagingConfig: Optional(Nullable<AdMessagingConfig>.value(AdMessagingConfig(
                keyword: Nullable<String>.value("Book an interior deep clean"),
                message: Nullable<String>.value("Hi! Tell us your vehicle and ZIP and we will send an interior deep clean quote.")
            ))),
            multiAdvertiserAds: Optional(true),
            postId: Nullable<String>.value("xxxxxxxxxxxxxxxx_98765"),
            postSource: Nullable<AdPostSource>.value(AdPostSource.facebook),
            postThumbnailUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            primaryTexts: [
                "Book a two-day ceramic coating and keep the shine for three years."
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
            socialAccounts: [
                AdEntityReference(
                    id: "adcamp_xxxxxxxxxxxxxx"
                )
            ],
            spend: 482.16,
            spendCurrency: Nullable<String>.value("usd"),
            status: AdStatus.active,
            submittedApplicationValue: 300,
            submittedApplications: 12,
            title: Nullable<String>.value("Ceramic coating — new ad group"),
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
                  "delivery_status": "rejected",
                  "descriptions": [
                    "Paint correction included"
                  ],
                  "frequency": 1.1,
                  "headlines": [
                    "Austin's mobile detailers"
                  ],
                  "id": "ad_xxxxxxxxxxxxxx",
                  "impressions": 51204,
                  "issues": [
                    {
                      "id": "adiss_xxxxxxxxxxxxxx",
                      "message": "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                      "resource_id": "ad_xxxxxxxxxxxxxx",
                      "resource_type": "ad_campaign"
                    }
                  ],
                  "lead_form": {
                    "completion": {
                      "button_text": "See our work",
                      "description": "We book coatings two days out, so pick a slot when we ring.",
                      "headline": "Thanks — we will call you today",
                      "url": "https://shinetime.example/gallery"
                    },
                    "disclaimer": {
                      "body": "Ceramic coating requires the vehicle for two days.",
                      "checkboxes": [
                        {
                          "checked_by_default": false,
                          "key": "consent_1",
                          "required": true,
                          "text": "I agree"
                        }
                      ],
                      "title": "Before you submit"
                    },
                    "form_type": "more_volume",
                    "intro": {
                      "description": "Tell us about your vehicle and we will send a fixed price.",
                      "headline": "Get a ceramic coating quote"
                    },
                    "name": "Ceramic coating quote requests",
                    "phone_verification": true,
                    "privacy_policy": {
                      "link_text": "Shine Time privacy policy",
                      "url": "https://shinetime.example/privacy"
                    },
                    "questions": [
                      {
                        "format": "multiple_choice",
                        "label": "What vehicle are we detailing?",
                        "options": [
                          {
                            "key": "ceramic_coating",
                            "logic": {
                              "action": "go_to_question",
                              "target_end_page_index": 0,
                              "target_question_index": 3
                            },
                            "value": "Ceramic coating"
                          }
                        ],
                        "type": "custom"
                      }
                    ]
                  },
                  "lead_form_id": "1037724182084885",
                  "lead_value": 1180,
                  "leads": 121,
                  "messaging_config": {
                    "keyword": "Book an interior deep clean",
                    "message": "Hi! Tell us your vehicle and ZIP and we will send an interior deep clean quote."
                  },
                  "multi_advertiser_ads": true,
                  "post_id": "xxxxxxxxxxxxxxxx_98765",
                  "post_source": "facebook",
                  "post_thumbnail_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "primary_texts": [
                    "Book a two-day ceramic coating and keep the shine for three years."
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
                  "social_accounts": [
                    {
                      "id": "adcamp_xxxxxxxxxxxxxx"
                    }
                  ],
                  "spend": 482.16,
                  "spend_currency": "usd",
                  "status": "active",
                  "submitted_application_value": 300,
                  "submitted_applications": 12,
                  "title": "Ceramic coating — new ad group",
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
            deliveryStatus: AdDeliveryStatus.rejected,
            descriptions: [
                "Paint correction included"
            ],
            frequency: Nullable<Double>.value(1.1),
            headlines: [
                "Austin's mobile detailers"
            ],
            id: "ad_xxxxxxxxxxxxxx",
            impressions: 51204,
            issues: [
                AdPlatformIssue(
                    id: "adiss_xxxxxxxxxxxxxx",
                    message: "Your ad was rejected for unacceptable business practices. Edit the ad's content and resubmit.",
                    resourceId: Nullable<String>.value("ad_xxxxxxxxxxxxxx"),
                    resourceType: AdPlatformIssueResourceType.adCampaign
                )
            ],
            leadForm: Optional(Nullable<AdLeadForm>.value(AdLeadForm(
                completion: Nullable<AdLeadFormCompletion>.value(AdLeadFormCompletion(
                    buttonText: Nullable<String>.value("See our work"),
                    description: Nullable<String>.value("We book coatings two days out, so pick a slot when we ring."),
                    headline: Nullable<String>.value("Thanks — we will call you today"),
                    url: Nullable<String>.value("https://shinetime.example/gallery")
                )),
                disclaimer: Nullable<AdLeadFormDisclaimer>.value(AdLeadFormDisclaimer(
                    body: Nullable<String>.value("Ceramic coating requires the vehicle for two days."),
                    checkboxes: [
                        AdLeadFormDisclaimerCheckbox(
                            checkedByDefault: Nullable<Bool>.value(false),
                            key: Nullable<String>.value("consent_1"),
                            required: Nullable<Bool>.value(true),
                            text: "I agree"
                        )
                    ],
                    title: Nullable<String>.value("Before you submit")
                )),
                formType: AdLeadFormFormType.moreVolume,
                intro: Nullable<AdLeadFormIntro>.value(AdLeadFormIntro(
                    description: Nullable<String>.value("Tell us about your vehicle and we will send a fixed price."),
                    headline: Nullable<String>.value("Get a ceramic coating quote")
                )),
                name: Nullable<String>.value("Ceramic coating quote requests"),
                phoneVerification: true,
                privacyPolicy: Nullable<AdLeadFormPrivacyPolicy>.value(AdLeadFormPrivacyPolicy(
                    linkText: Nullable<String>.value("Shine Time privacy policy"),
                    url: "https://shinetime.example/privacy"
                )),
                questions: [
                    AdLeadFormQuestion(
                        format: Optional("multiple_choice"),
                        label: Optional("What vehicle are we detailing?"),
                        options: Optional([
                            AdLeadFormQuestionOption(
                                key: Optional(Nullable<String>.value("ceramic_coating")),
                                logic: Optional(AdLeadFormOptionLogic(
                                    action: AdLeadFormOptionLogicAction.goToQuestion,
                                    targetEndPageIndex: Optional(0),
                                    targetQuestionIndex: Optional(3)
                                )),
                                value: "Ceramic coating"
                            )
                        ]),
                        type: "custom"
                    )
                ]
            ))),
            leadFormId: Optional(Nullable<String>.value("1037724182084885")),
            leadValue: 1180,
            leads: 121,
            messagingConfig: Optional(Nullable<AdMessagingConfig>.value(AdMessagingConfig(
                keyword: Nullable<String>.value("Book an interior deep clean"),
                message: Nullable<String>.value("Hi! Tell us your vehicle and ZIP and we will send an interior deep clean quote.")
            ))),
            multiAdvertiserAds: Optional(true),
            postId: Nullable<String>.value("xxxxxxxxxxxxxxxx_98765"),
            postSource: Nullable<AdPostSource>.value(AdPostSource.facebook),
            postThumbnailUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            primaryTexts: [
                "Book a two-day ceramic coating and keep the shine for three years."
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
            socialAccounts: [
                AdEntityReference(
                    id: "adcamp_xxxxxxxxxxxxxx"
                )
            ],
            spend: 482.16,
            spendCurrency: Nullable<String>.value("usd"),
            status: AdStatus.active,
            submittedApplicationValue: 300,
            submittedApplications: 12,
            title: Nullable<String>.value("Ceramic coating — new ad group"),
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