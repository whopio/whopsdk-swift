import Foundation
import Testing
import WhopSDK

@Suite("AdGroupsClient Wire Tests") struct AdGroupsClientWireTests {
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
                      "added_to_cart_value": 12650,
                      "added_to_carts": 165,
                      "audiences": {
                        "exclude": [
                          "adaud_xxxxxxxxxxxxxx"
                        ],
                        "include": [
                          "adaud_xxxxxxxxxxxxxx"
                        ]
                      },
                      "bid_type": "minimum_cost",
                      "budget_amount": 60,
                      "budget_amount_local": 60,
                      "budget_currency": "usd",
                      "budget_type": "daily",
                      "click_through_rate": 0.025,
                      "clicks": 5500,
                      "completed_registration_value": 1650,
                      "completed_registrations": 55,
                      "contact_value": 2640,
                      "contacts": 88,
                      "conversion_event": "purchase",
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
                      "delivery_schedule": {
                        "friday": [
                          {
                            "end": "12:00",
                            "start": "10:00"
                          }
                        ],
                        "monday": [
                          {
                            "end": "12:00",
                            "start": "10:00"
                          }
                        ],
                        "saturday": [
                          {
                            "end": "12:00",
                            "start": "10:00"
                          }
                        ],
                        "sunday": [
                          {
                            "end": "12:00",
                            "start": "10:00"
                          }
                        ],
                        "thursday": [
                          {
                            "end": "12:00",
                            "start": "10:00"
                          }
                        ],
                        "tuesday": [
                          {
                            "end": "12:00",
                            "start": "10:00"
                          }
                        ],
                        "wednesday": [
                          {
                            "end": "12:00",
                            "start": "10:00"
                          }
                        ]
                      },
                      "delivery_status": "in_appeal",
                      "demographics": {
                        "automatic": false,
                        "gender": "all",
                        "maximum_age": 64,
                        "minimum_age": 21
                      },
                      "desired_cost_per_result": 40,
                      "devices": {
                        "operating_systems": [
                          {
                            "minimum_version": "18.0",
                            "os": "ios"
                          }
                        ],
                        "platforms": [
                          "mobile"
                        ]
                      },
                      "ends_at": "2026-01-01T12:00:00.000Z",
                      "frequency": 1.1,
                      "id": "adgrp_xxxxxxxxxxxxxx",
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
                      "keywords": [
                        {
                          "match_type": "broad",
                          "negative": true,
                          "text": "text"
                        }
                      ],
                      "languages": [
                        "en"
                      ],
                      "lead_value": 3960,
                      "leads": 132,
                      "learning_progress": {
                        "conversion_threshold": 1,
                        "conversions": 1,
                        "progress_percent": 1.1
                      },
                      "link_clicks": 4400,
                      "purchase_value": 7920,
                      "purchases": 44,
                      "reach": 0,
                      "regions": {
                        "exclude": {
                          "cities": [
                            {
                              "key": "2418046",
                              "name": "Austin"
                            }
                          ],
                          "countries": [
                            "US"
                          ],
                          "country_groups": [
                            "north_america"
                          ],
                          "custom_locations": [
                            {
                              "distance_unit": "mile",
                              "latitude": 30.2672,
                              "longitude": -97.7431,
                              "name": "4180 Burnet Rd, Austin TX 78756",
                              "radius": 25
                            }
                          ],
                          "regions": [
                            "US-TX"
                          ],
                          "zips": [
                            "US:78756"
                          ]
                        },
                        "include": {
                          "cities": [
                            {
                              "key": "2418046",
                              "name": "Austin"
                            }
                          ],
                          "countries": [
                            "US"
                          ],
                          "country_groups": [
                            "north_america"
                          ],
                          "custom_locations": [
                            {
                              "distance_unit": "mile",
                              "latitude": 30.2672,
                              "longitude": -97.7431,
                              "name": "4180 Burnet Rd, Austin TX 78756",
                              "radius": 25
                            }
                          ],
                          "regions": [
                            "US-TX"
                          ],
                          "zips": [
                            "US:78756"
                          ]
                        }
                      },
                      "result_event": "purchase",
                      "result_event_name": "quote_requested",
                      "results": 33,
                      "return_on_ad_spend": 6,
                      "schedule_value": 5400,
                      "schedules": 60,
                      "spend": 1320,
                      "spend_currency": "usd",
                      "starts_at": "2026-01-01T12:00:00.000Z",
                      "status": "active",
                      "submitted_application_value": 1320,
                      "submitted_applications": 11,
                      "title": "Austin ceramic coating — repeat customers",
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
        let expectedResponse = ListAdGroupsResponse(
            data: [
                AdGroup(
                    adCampaign: AdEntityReference(
                        id: "adcamp_xxxxxxxxxxxxxx"
                    ),
                    addedToCartValue: 12650,
                    addedToCarts: 165,
                    audiences: AdGroupAudiences(
                        exclude: [
                            "adaud_xxxxxxxxxxxxxx"
                        ],
                        include: [
                            "adaud_xxxxxxxxxxxxxx"
                        ]
                    ),
                    bidType: Nullable<AdGroupBidType>.value(AdGroupBidType.minimumCost),
                    budgetAmount: Nullable<Double>.value(60),
                    budgetAmountLocal: Nullable<Double>.value(60),
                    budgetCurrency: "usd",
                    budgetType: Nullable<AdGroupBudgetType>.value(AdGroupBudgetType.daily),
                    clickThroughRate: 0.025,
                    clicks: 5500,
                    completedRegistrationValue: 1650,
                    completedRegistrations: 55,
                    contactValue: 2640,
                    contacts: 88,
                    conversionEvent: Nullable<ConversionEvent>.value(ConversionEvent.conversionEventZero(
                        ConversionEventZero.purchase
                    )),
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
                    deliverySchedule: Nullable<AdGroupDeliverySchedule>.value(AdGroupDeliverySchedule(
                        friday: Optional([
                            AdGroupDeliveryWindow(
                                end: "12:00",
                                start: "10:00"
                            )
                        ]),
                        monday: Optional([
                            AdGroupDeliveryWindow(
                                end: "12:00",
                                start: "10:00"
                            )
                        ]),
                        saturday: Optional([
                            AdGroupDeliveryWindow(
                                end: "12:00",
                                start: "10:00"
                            )
                        ]),
                        sunday: Optional([
                            AdGroupDeliveryWindow(
                                end: "12:00",
                                start: "10:00"
                            )
                        ]),
                        thursday: Optional([
                            AdGroupDeliveryWindow(
                                end: "12:00",
                                start: "10:00"
                            )
                        ]),
                        tuesday: Optional([
                            AdGroupDeliveryWindow(
                                end: "12:00",
                                start: "10:00"
                            )
                        ]),
                        wednesday: Optional([
                            AdGroupDeliveryWindow(
                                end: "12:00",
                                start: "10:00"
                            )
                        ])
                    )),
                    deliveryStatus: AdGroupDeliveryStatus.inAppeal,
                    demographics: AdGroupDemographics(
                        automatic: false,
                        gender: AdGroupDemographicsGender.all,
                        maximumAge: Nullable<Double>.value(64),
                        minimumAge: Nullable<Double>.value(21)
                    ),
                    desiredCostPerResult: Nullable<Double>.value(40),
                    devices: AdGroupDevices(
                        operatingSystems: [
                            AdGroupOperatingSystem(
                                minimumVersion: Optional("18.0"),
                                os: AdGroupOperatingSystemOs.ios
                            )
                        ],
                        platforms: [
                            AdGroupDevicesPlatformsItem.mobile
                        ]
                    ),
                    endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    frequency: Nullable<Double>.value(1.1),
                    id: "adgrp_xxxxxxxxxxxxxx",
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
                    keywords: Optional([
                        AdGroupKeyword(
                            matchType: AdGroupKeywordMatchType.broad,
                            negative: true,
                            text: "text"
                        )
                    ]),
                    languages: [
                        "en"
                    ],
                    leadValue: 3960,
                    leads: 132,
                    learningProgress: Nullable<AdGroupLearningProgress>.value(AdGroupLearningProgress(
                        conversionThreshold: 1,
                        conversions: 1,
                        progressPercent: 1.1
                    )),
                    linkClicks: 4400,
                    purchaseValue: 7920,
                    purchases: 44,
                    reach: 0,
                    regions: AdGroupRegions(
                        exclude: AdGroupGeoLocations(
                            cities: [
                                AdGroupCity(
                                    key: "2418046",
                                    name: Optional("Austin")
                                )
                            ],
                            countries: [
                                "US"
                            ],
                            countryGroups: [
                                "north_america"
                            ],
                            customLocations: [
                                AdGroupCustomLocation(
                                    distanceUnit: AdGroupCustomLocationDistanceUnit.mile,
                                    latitude: 30.2672,
                                    longitude: -97.7431,
                                    name: Optional("4180 Burnet Rd, Austin TX 78756"),
                                    radius: 25
                                )
                            ],
                            regions: [
                                "US-TX"
                            ],
                            zips: [
                                "US:78756"
                            ]
                        ),
                        include: AdGroupGeoLocations(
                            cities: [
                                AdGroupCity(
                                    key: "2418046",
                                    name: Optional("Austin")
                                )
                            ],
                            countries: [
                                "US"
                            ],
                            countryGroups: [
                                "north_america"
                            ],
                            customLocations: [
                                AdGroupCustomLocation(
                                    distanceUnit: AdGroupCustomLocationDistanceUnit.mile,
                                    latitude: 30.2672,
                                    longitude: -97.7431,
                                    name: Optional("4180 Burnet Rd, Austin TX 78756"),
                                    radius: 25
                                )
                            ],
                            regions: [
                                "US-TX"
                            ],
                            zips: [
                                "US:78756"
                            ]
                        )
                    ),
                    resultEvent: Nullable<AdGroupResultEvent>.value(AdGroupResultEvent.purchase),
                    resultEventName: Nullable<String>.value("quote_requested"),
                    results: Nullable<Double>.value(33),
                    returnOnAdSpend: 6,
                    scheduleValue: 5400,
                    schedules: 60,
                    spend: 1320,
                    spendCurrency: Nullable<String>.value("usd"),
                    startsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    status: AdGroupStatus.active,
                    submittedApplicationValue: 1320,
                    submittedApplications: 11,
                    title: Nullable<String>.value("Austin ceramic coating — repeat customers"),
                    uniqueClickThroughRate: Nullable<Double>.value(1.1),
                    uniqueClicks: 3300,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    viewedContentValue: 8400,
                    viewedContents: 1200
                )
            ],
            pageInfo: ListAdGroupsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.adGroups.list(
            adCampaignIds: [
                "adcamp_xxxxxxxxxxxxxx"
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
                  "added_to_cart_value": 12650,
                  "added_to_carts": 165,
                  "audiences": {
                    "exclude": [
                      "adaud_xxxxxxxxxxxxxx"
                    ],
                    "include": [
                      "adaud_xxxxxxxxxxxxxx"
                    ]
                  },
                  "bid_type": "minimum_cost",
                  "budget_amount": 60,
                  "budget_amount_local": 60,
                  "budget_currency": "usd",
                  "budget_type": "daily",
                  "click_through_rate": 0.025,
                  "clicks": 5500,
                  "completed_registration_value": 1650,
                  "completed_registrations": 55,
                  "contact_value": 2640,
                  "contacts": 88,
                  "conversion_event": "purchase",
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
                  "delivery_schedule": {
                    "friday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "monday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "saturday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "sunday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "thursday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "tuesday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "wednesday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ]
                  },
                  "delivery_status": "in_appeal",
                  "demographics": {
                    "automatic": false,
                    "gender": "all",
                    "maximum_age": 64,
                    "minimum_age": 21
                  },
                  "desired_cost_per_result": 40,
                  "devices": {
                    "operating_systems": [
                      {
                        "minimum_version": "18.0",
                        "os": "ios"
                      }
                    ],
                    "platforms": [
                      "mobile"
                    ]
                  },
                  "ends_at": "2026-01-01T12:00:00.000Z",
                  "frequency": 1.1,
                  "id": "adgrp_xxxxxxxxxxxxxx",
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
                  "keywords": [
                    {
                      "match_type": "broad",
                      "negative": true,
                      "text": "text"
                    }
                  ],
                  "languages": [
                    "en"
                  ],
                  "lead_value": 3960,
                  "leads": 132,
                  "learning_progress": {
                    "conversion_threshold": 1,
                    "conversions": 1,
                    "progress_percent": 1.1
                  },
                  "link_clicks": 4400,
                  "purchase_value": 7920,
                  "purchases": 44,
                  "reach": 0,
                  "regions": {
                    "exclude": {
                      "cities": [
                        {
                          "key": "2418046",
                          "name": "Austin"
                        }
                      ],
                      "countries": [
                        "US"
                      ],
                      "country_groups": [
                        "north_america"
                      ],
                      "custom_locations": [
                        {
                          "distance_unit": "mile",
                          "latitude": 30.2672,
                          "longitude": -97.7431,
                          "name": "4180 Burnet Rd, Austin TX 78756",
                          "radius": 25
                        }
                      ],
                      "regions": [
                        "US-TX"
                      ],
                      "zips": [
                        "US:78756"
                      ]
                    },
                    "include": {
                      "cities": [
                        {
                          "key": "2418046",
                          "name": "Austin"
                        }
                      ],
                      "countries": [
                        "US"
                      ],
                      "country_groups": [
                        "north_america"
                      ],
                      "custom_locations": [
                        {
                          "distance_unit": "mile",
                          "latitude": 30.2672,
                          "longitude": -97.7431,
                          "name": "4180 Burnet Rd, Austin TX 78756",
                          "radius": 25
                        }
                      ],
                      "regions": [
                        "US-TX"
                      ],
                      "zips": [
                        "US:78756"
                      ]
                    }
                  },
                  "result_event": "purchase",
                  "result_event_name": "quote_requested",
                  "results": 33,
                  "return_on_ad_spend": 6,
                  "schedule_value": 5400,
                  "schedules": 60,
                  "spend": 1320,
                  "spend_currency": "usd",
                  "starts_at": "2026-01-01T12:00:00.000Z",
                  "status": "active",
                  "submitted_application_value": 1320,
                  "submitted_applications": 11,
                  "title": "Austin ceramic coating — repeat customers",
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
        let expectedResponse = AdGroup(
            adCampaign: AdEntityReference(
                id: "adcamp_xxxxxxxxxxxxxx"
            ),
            addedToCartValue: 12650,
            addedToCarts: 165,
            audiences: AdGroupAudiences(
                exclude: [
                    "adaud_xxxxxxxxxxxxxx"
                ],
                include: [
                    "adaud_xxxxxxxxxxxxxx"
                ]
            ),
            bidType: Nullable<AdGroupBidType>.value(AdGroupBidType.minimumCost),
            budgetAmount: Nullable<Double>.value(60),
            budgetAmountLocal: Nullable<Double>.value(60),
            budgetCurrency: "usd",
            budgetType: Nullable<AdGroupBudgetType>.value(AdGroupBudgetType.daily),
            clickThroughRate: 0.025,
            clicks: 5500,
            completedRegistrationValue: 1650,
            completedRegistrations: 55,
            contactValue: 2640,
            contacts: 88,
            conversionEvent: Nullable<ConversionEvent>.value(ConversionEvent.conversionEventZero(
                ConversionEventZero.purchase
            )),
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
            deliverySchedule: Nullable<AdGroupDeliverySchedule>.value(AdGroupDeliverySchedule(
                friday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                monday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                saturday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                sunday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                thursday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                tuesday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                wednesday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ])
            )),
            deliveryStatus: AdGroupDeliveryStatus.inAppeal,
            demographics: AdGroupDemographics(
                automatic: false,
                gender: AdGroupDemographicsGender.all,
                maximumAge: Nullable<Double>.value(64),
                minimumAge: Nullable<Double>.value(21)
            ),
            desiredCostPerResult: Nullable<Double>.value(40),
            devices: AdGroupDevices(
                operatingSystems: [
                    AdGroupOperatingSystem(
                        minimumVersion: Optional("18.0"),
                        os: AdGroupOperatingSystemOs.ios
                    )
                ],
                platforms: [
                    AdGroupDevicesPlatformsItem.mobile
                ]
            ),
            endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            frequency: Nullable<Double>.value(1.1),
            id: "adgrp_xxxxxxxxxxxxxx",
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
            keywords: Optional([
                AdGroupKeyword(
                    matchType: AdGroupKeywordMatchType.broad,
                    negative: true,
                    text: "text"
                )
            ]),
            languages: [
                "en"
            ],
            leadValue: 3960,
            leads: 132,
            learningProgress: Nullable<AdGroupLearningProgress>.value(AdGroupLearningProgress(
                conversionThreshold: 1,
                conversions: 1,
                progressPercent: 1.1
            )),
            linkClicks: 4400,
            purchaseValue: 7920,
            purchases: 44,
            reach: 0,
            regions: AdGroupRegions(
                exclude: AdGroupGeoLocations(
                    cities: [
                        AdGroupCity(
                            key: "2418046",
                            name: Optional("Austin")
                        )
                    ],
                    countries: [
                        "US"
                    ],
                    countryGroups: [
                        "north_america"
                    ],
                    customLocations: [
                        AdGroupCustomLocation(
                            distanceUnit: AdGroupCustomLocationDistanceUnit.mile,
                            latitude: 30.2672,
                            longitude: -97.7431,
                            name: Optional("4180 Burnet Rd, Austin TX 78756"),
                            radius: 25
                        )
                    ],
                    regions: [
                        "US-TX"
                    ],
                    zips: [
                        "US:78756"
                    ]
                ),
                include: AdGroupGeoLocations(
                    cities: [
                        AdGroupCity(
                            key: "2418046",
                            name: Optional("Austin")
                        )
                    ],
                    countries: [
                        "US"
                    ],
                    countryGroups: [
                        "north_america"
                    ],
                    customLocations: [
                        AdGroupCustomLocation(
                            distanceUnit: AdGroupCustomLocationDistanceUnit.mile,
                            latitude: 30.2672,
                            longitude: -97.7431,
                            name: Optional("4180 Burnet Rd, Austin TX 78756"),
                            radius: 25
                        )
                    ],
                    regions: [
                        "US-TX"
                    ],
                    zips: [
                        "US:78756"
                    ]
                )
            ),
            resultEvent: Nullable<AdGroupResultEvent>.value(AdGroupResultEvent.purchase),
            resultEventName: Nullable<String>.value("quote_requested"),
            results: Nullable<Double>.value(33),
            returnOnAdSpend: 6,
            scheduleValue: 5400,
            schedules: 60,
            spend: 1320,
            spendCurrency: Nullable<String>.value("usd"),
            startsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: AdGroupStatus.active,
            submittedApplicationValue: 1320,
            submittedApplications: 11,
            title: Nullable<String>.value("Austin ceramic coating — repeat customers"),
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 3300,
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewedContentValue: 8400,
            viewedContents: 1200
        )
        let response = try await client.adGroups.create(
            request: .init(adCampaignId: "adcamp_xxxxxxxxxxxxxx"),
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
                  "added_to_cart_value": 12650,
                  "added_to_carts": 165,
                  "audiences": {
                    "exclude": [
                      "adaud_xxxxxxxxxxxxxx"
                    ],
                    "include": [
                      "adaud_xxxxxxxxxxxxxx"
                    ]
                  },
                  "bid_type": "minimum_cost",
                  "budget_amount": 60,
                  "budget_amount_local": 60,
                  "budget_currency": "usd",
                  "budget_type": "daily",
                  "click_through_rate": 0.025,
                  "clicks": 5500,
                  "completed_registration_value": 1650,
                  "completed_registrations": 55,
                  "contact_value": 2640,
                  "contacts": 88,
                  "conversion_event": "purchase",
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
                  "delivery_schedule": {
                    "friday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "monday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "saturday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "sunday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "thursday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "tuesday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "wednesday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ]
                  },
                  "delivery_status": "in_appeal",
                  "demographics": {
                    "automatic": false,
                    "gender": "all",
                    "maximum_age": 64,
                    "minimum_age": 21
                  },
                  "desired_cost_per_result": 40,
                  "devices": {
                    "operating_systems": [
                      {
                        "minimum_version": "18.0",
                        "os": "ios"
                      }
                    ],
                    "platforms": [
                      "mobile"
                    ]
                  },
                  "ends_at": "2026-01-01T12:00:00.000Z",
                  "frequency": 1.1,
                  "id": "adgrp_xxxxxxxxxxxxxx",
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
                  "keywords": [
                    {
                      "match_type": "broad",
                      "negative": true,
                      "text": "text"
                    }
                  ],
                  "languages": [
                    "en"
                  ],
                  "lead_value": 3960,
                  "leads": 132,
                  "learning_progress": {
                    "conversion_threshold": 1,
                    "conversions": 1,
                    "progress_percent": 1.1
                  },
                  "link_clicks": 4400,
                  "purchase_value": 7920,
                  "purchases": 44,
                  "reach": 0,
                  "regions": {
                    "exclude": {
                      "cities": [
                        {
                          "key": "2418046",
                          "name": "Austin"
                        }
                      ],
                      "countries": [
                        "US"
                      ],
                      "country_groups": [
                        "north_america"
                      ],
                      "custom_locations": [
                        {
                          "distance_unit": "mile",
                          "latitude": 30.2672,
                          "longitude": -97.7431,
                          "name": "4180 Burnet Rd, Austin TX 78756",
                          "radius": 25
                        }
                      ],
                      "regions": [
                        "US-TX"
                      ],
                      "zips": [
                        "US:78756"
                      ]
                    },
                    "include": {
                      "cities": [
                        {
                          "key": "2418046",
                          "name": "Austin"
                        }
                      ],
                      "countries": [
                        "US"
                      ],
                      "country_groups": [
                        "north_america"
                      ],
                      "custom_locations": [
                        {
                          "distance_unit": "mile",
                          "latitude": 30.2672,
                          "longitude": -97.7431,
                          "name": "4180 Burnet Rd, Austin TX 78756",
                          "radius": 25
                        }
                      ],
                      "regions": [
                        "US-TX"
                      ],
                      "zips": [
                        "US:78756"
                      ]
                    }
                  },
                  "result_event": "purchase",
                  "result_event_name": "quote_requested",
                  "results": 33,
                  "return_on_ad_spend": 6,
                  "schedule_value": 5400,
                  "schedules": 60,
                  "spend": 1320,
                  "spend_currency": "usd",
                  "starts_at": "2026-01-01T12:00:00.000Z",
                  "status": "active",
                  "submitted_application_value": 1320,
                  "submitted_applications": 11,
                  "title": "Austin ceramic coating — repeat customers",
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
        let expectedResponse = AdGroup(
            adCampaign: AdEntityReference(
                id: "adcamp_xxxxxxxxxxxxxx"
            ),
            addedToCartValue: 12650,
            addedToCarts: 165,
            audiences: AdGroupAudiences(
                exclude: [
                    "adaud_xxxxxxxxxxxxxx"
                ],
                include: [
                    "adaud_xxxxxxxxxxxxxx"
                ]
            ),
            bidType: Nullable<AdGroupBidType>.value(AdGroupBidType.minimumCost),
            budgetAmount: Nullable<Double>.value(60),
            budgetAmountLocal: Nullable<Double>.value(60),
            budgetCurrency: "usd",
            budgetType: Nullable<AdGroupBudgetType>.value(AdGroupBudgetType.daily),
            clickThroughRate: 0.025,
            clicks: 5500,
            completedRegistrationValue: 1650,
            completedRegistrations: 55,
            contactValue: 2640,
            contacts: 88,
            conversionEvent: Nullable<ConversionEvent>.value(ConversionEvent.conversionEventZero(
                ConversionEventZero.purchase
            )),
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
            deliverySchedule: Nullable<AdGroupDeliverySchedule>.value(AdGroupDeliverySchedule(
                friday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                monday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                saturday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                sunday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                thursday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                tuesday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                wednesday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ])
            )),
            deliveryStatus: AdGroupDeliveryStatus.inAppeal,
            demographics: AdGroupDemographics(
                automatic: false,
                gender: AdGroupDemographicsGender.all,
                maximumAge: Nullable<Double>.value(64),
                minimumAge: Nullable<Double>.value(21)
            ),
            desiredCostPerResult: Nullable<Double>.value(40),
            devices: AdGroupDevices(
                operatingSystems: [
                    AdGroupOperatingSystem(
                        minimumVersion: Optional("18.0"),
                        os: AdGroupOperatingSystemOs.ios
                    )
                ],
                platforms: [
                    AdGroupDevicesPlatformsItem.mobile
                ]
            ),
            endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            frequency: Nullable<Double>.value(1.1),
            id: "adgrp_xxxxxxxxxxxxxx",
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
            keywords: Optional([
                AdGroupKeyword(
                    matchType: AdGroupKeywordMatchType.broad,
                    negative: true,
                    text: "text"
                )
            ]),
            languages: [
                "en"
            ],
            leadValue: 3960,
            leads: 132,
            learningProgress: Nullable<AdGroupLearningProgress>.value(AdGroupLearningProgress(
                conversionThreshold: 1,
                conversions: 1,
                progressPercent: 1.1
            )),
            linkClicks: 4400,
            purchaseValue: 7920,
            purchases: 44,
            reach: 0,
            regions: AdGroupRegions(
                exclude: AdGroupGeoLocations(
                    cities: [
                        AdGroupCity(
                            key: "2418046",
                            name: Optional("Austin")
                        )
                    ],
                    countries: [
                        "US"
                    ],
                    countryGroups: [
                        "north_america"
                    ],
                    customLocations: [
                        AdGroupCustomLocation(
                            distanceUnit: AdGroupCustomLocationDistanceUnit.mile,
                            latitude: 30.2672,
                            longitude: -97.7431,
                            name: Optional("4180 Burnet Rd, Austin TX 78756"),
                            radius: 25
                        )
                    ],
                    regions: [
                        "US-TX"
                    ],
                    zips: [
                        "US:78756"
                    ]
                ),
                include: AdGroupGeoLocations(
                    cities: [
                        AdGroupCity(
                            key: "2418046",
                            name: Optional("Austin")
                        )
                    ],
                    countries: [
                        "US"
                    ],
                    countryGroups: [
                        "north_america"
                    ],
                    customLocations: [
                        AdGroupCustomLocation(
                            distanceUnit: AdGroupCustomLocationDistanceUnit.mile,
                            latitude: 30.2672,
                            longitude: -97.7431,
                            name: Optional("4180 Burnet Rd, Austin TX 78756"),
                            radius: 25
                        )
                    ],
                    regions: [
                        "US-TX"
                    ],
                    zips: [
                        "US:78756"
                    ]
                )
            ),
            resultEvent: Nullable<AdGroupResultEvent>.value(AdGroupResultEvent.purchase),
            resultEventName: Nullable<String>.value("quote_requested"),
            results: Nullable<Double>.value(33),
            returnOnAdSpend: 6,
            scheduleValue: 5400,
            schedules: 60,
            spend: 1320,
            spendCurrency: Nullable<String>.value("usd"),
            startsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: AdGroupStatus.active,
            submittedApplicationValue: 1320,
            submittedApplications: 11,
            title: Nullable<String>.value("Austin ceramic coating — repeat customers"),
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 3300,
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewedContentValue: 8400,
            viewedContents: 1200
        )
        let response = try await client.adGroups.retrieve(
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
                  "id": "adgrp_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteAdGroupsResponse(
            deleted: true,
            id: "adgrp_xxxxxxxxxxxxxx"
        )
        let response = try await client.adGroups.delete(
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
                  "added_to_cart_value": 12650,
                  "added_to_carts": 165,
                  "audiences": {
                    "exclude": [
                      "adaud_xxxxxxxxxxxxxx"
                    ],
                    "include": [
                      "adaud_xxxxxxxxxxxxxx"
                    ]
                  },
                  "bid_type": "minimum_cost",
                  "budget_amount": 60,
                  "budget_amount_local": 60,
                  "budget_currency": "usd",
                  "budget_type": "daily",
                  "click_through_rate": 0.025,
                  "clicks": 5500,
                  "completed_registration_value": 1650,
                  "completed_registrations": 55,
                  "contact_value": 2640,
                  "contacts": 88,
                  "conversion_event": "purchase",
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
                  "delivery_schedule": {
                    "friday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "monday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "saturday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "sunday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "thursday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "tuesday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "wednesday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ]
                  },
                  "delivery_status": "in_appeal",
                  "demographics": {
                    "automatic": false,
                    "gender": "all",
                    "maximum_age": 64,
                    "minimum_age": 21
                  },
                  "desired_cost_per_result": 40,
                  "devices": {
                    "operating_systems": [
                      {
                        "minimum_version": "18.0",
                        "os": "ios"
                      }
                    ],
                    "platforms": [
                      "mobile"
                    ]
                  },
                  "ends_at": "2026-01-01T12:00:00.000Z",
                  "frequency": 1.1,
                  "id": "adgrp_xxxxxxxxxxxxxx",
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
                  "keywords": [
                    {
                      "match_type": "broad",
                      "negative": true,
                      "text": "text"
                    }
                  ],
                  "languages": [
                    "en"
                  ],
                  "lead_value": 3960,
                  "leads": 132,
                  "learning_progress": {
                    "conversion_threshold": 1,
                    "conversions": 1,
                    "progress_percent": 1.1
                  },
                  "link_clicks": 4400,
                  "purchase_value": 7920,
                  "purchases": 44,
                  "reach": 0,
                  "regions": {
                    "exclude": {
                      "cities": [
                        {
                          "key": "2418046",
                          "name": "Austin"
                        }
                      ],
                      "countries": [
                        "US"
                      ],
                      "country_groups": [
                        "north_america"
                      ],
                      "custom_locations": [
                        {
                          "distance_unit": "mile",
                          "latitude": 30.2672,
                          "longitude": -97.7431,
                          "name": "4180 Burnet Rd, Austin TX 78756",
                          "radius": 25
                        }
                      ],
                      "regions": [
                        "US-TX"
                      ],
                      "zips": [
                        "US:78756"
                      ]
                    },
                    "include": {
                      "cities": [
                        {
                          "key": "2418046",
                          "name": "Austin"
                        }
                      ],
                      "countries": [
                        "US"
                      ],
                      "country_groups": [
                        "north_america"
                      ],
                      "custom_locations": [
                        {
                          "distance_unit": "mile",
                          "latitude": 30.2672,
                          "longitude": -97.7431,
                          "name": "4180 Burnet Rd, Austin TX 78756",
                          "radius": 25
                        }
                      ],
                      "regions": [
                        "US-TX"
                      ],
                      "zips": [
                        "US:78756"
                      ]
                    }
                  },
                  "result_event": "purchase",
                  "result_event_name": "quote_requested",
                  "results": 33,
                  "return_on_ad_spend": 6,
                  "schedule_value": 5400,
                  "schedules": 60,
                  "spend": 1320,
                  "spend_currency": "usd",
                  "starts_at": "2026-01-01T12:00:00.000Z",
                  "status": "active",
                  "submitted_application_value": 1320,
                  "submitted_applications": 11,
                  "title": "Austin ceramic coating — repeat customers",
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
        let expectedResponse = AdGroup(
            adCampaign: AdEntityReference(
                id: "adcamp_xxxxxxxxxxxxxx"
            ),
            addedToCartValue: 12650,
            addedToCarts: 165,
            audiences: AdGroupAudiences(
                exclude: [
                    "adaud_xxxxxxxxxxxxxx"
                ],
                include: [
                    "adaud_xxxxxxxxxxxxxx"
                ]
            ),
            bidType: Nullable<AdGroupBidType>.value(AdGroupBidType.minimumCost),
            budgetAmount: Nullable<Double>.value(60),
            budgetAmountLocal: Nullable<Double>.value(60),
            budgetCurrency: "usd",
            budgetType: Nullable<AdGroupBudgetType>.value(AdGroupBudgetType.daily),
            clickThroughRate: 0.025,
            clicks: 5500,
            completedRegistrationValue: 1650,
            completedRegistrations: 55,
            contactValue: 2640,
            contacts: 88,
            conversionEvent: Nullable<ConversionEvent>.value(ConversionEvent.conversionEventZero(
                ConversionEventZero.purchase
            )),
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
            deliverySchedule: Nullable<AdGroupDeliverySchedule>.value(AdGroupDeliverySchedule(
                friday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                monday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                saturday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                sunday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                thursday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                tuesday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                wednesday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ])
            )),
            deliveryStatus: AdGroupDeliveryStatus.inAppeal,
            demographics: AdGroupDemographics(
                automatic: false,
                gender: AdGroupDemographicsGender.all,
                maximumAge: Nullable<Double>.value(64),
                minimumAge: Nullable<Double>.value(21)
            ),
            desiredCostPerResult: Nullable<Double>.value(40),
            devices: AdGroupDevices(
                operatingSystems: [
                    AdGroupOperatingSystem(
                        minimumVersion: Optional("18.0"),
                        os: AdGroupOperatingSystemOs.ios
                    )
                ],
                platforms: [
                    AdGroupDevicesPlatformsItem.mobile
                ]
            ),
            endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            frequency: Nullable<Double>.value(1.1),
            id: "adgrp_xxxxxxxxxxxxxx",
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
            keywords: Optional([
                AdGroupKeyword(
                    matchType: AdGroupKeywordMatchType.broad,
                    negative: true,
                    text: "text"
                )
            ]),
            languages: [
                "en"
            ],
            leadValue: 3960,
            leads: 132,
            learningProgress: Nullable<AdGroupLearningProgress>.value(AdGroupLearningProgress(
                conversionThreshold: 1,
                conversions: 1,
                progressPercent: 1.1
            )),
            linkClicks: 4400,
            purchaseValue: 7920,
            purchases: 44,
            reach: 0,
            regions: AdGroupRegions(
                exclude: AdGroupGeoLocations(
                    cities: [
                        AdGroupCity(
                            key: "2418046",
                            name: Optional("Austin")
                        )
                    ],
                    countries: [
                        "US"
                    ],
                    countryGroups: [
                        "north_america"
                    ],
                    customLocations: [
                        AdGroupCustomLocation(
                            distanceUnit: AdGroupCustomLocationDistanceUnit.mile,
                            latitude: 30.2672,
                            longitude: -97.7431,
                            name: Optional("4180 Burnet Rd, Austin TX 78756"),
                            radius: 25
                        )
                    ],
                    regions: [
                        "US-TX"
                    ],
                    zips: [
                        "US:78756"
                    ]
                ),
                include: AdGroupGeoLocations(
                    cities: [
                        AdGroupCity(
                            key: "2418046",
                            name: Optional("Austin")
                        )
                    ],
                    countries: [
                        "US"
                    ],
                    countryGroups: [
                        "north_america"
                    ],
                    customLocations: [
                        AdGroupCustomLocation(
                            distanceUnit: AdGroupCustomLocationDistanceUnit.mile,
                            latitude: 30.2672,
                            longitude: -97.7431,
                            name: Optional("4180 Burnet Rd, Austin TX 78756"),
                            radius: 25
                        )
                    ],
                    regions: [
                        "US-TX"
                    ],
                    zips: [
                        "US:78756"
                    ]
                )
            ),
            resultEvent: Nullable<AdGroupResultEvent>.value(AdGroupResultEvent.purchase),
            resultEventName: Nullable<String>.value("quote_requested"),
            results: Nullable<Double>.value(33),
            returnOnAdSpend: 6,
            scheduleValue: 5400,
            schedules: 60,
            spend: 1320,
            spendCurrency: Nullable<String>.value("usd"),
            startsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: AdGroupStatus.active,
            submittedApplicationValue: 1320,
            submittedApplications: 11,
            title: Nullable<String>.value("Austin ceramic coating — repeat customers"),
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 3300,
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewedContentValue: 8400,
            viewedContents: 1200
        )
        let response = try await client.adGroups.update(
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
                      "added_to_cart_value": 12650,
                      "added_to_carts": 165,
                      "audiences": {
                        "exclude": [
                          "adaud_xxxxxxxxxxxxxx"
                        ],
                        "include": [
                          "adaud_xxxxxxxxxxxxxx"
                        ]
                      },
                      "bid_type": "minimum_cost",
                      "budget_amount": 60,
                      "budget_amount_local": 60,
                      "budget_currency": "usd",
                      "budget_type": "daily",
                      "click_through_rate": 0.025,
                      "clicks": 5500,
                      "completed_registration_value": 1650,
                      "completed_registrations": 55,
                      "contact_value": 2640,
                      "contacts": 88,
                      "conversion_event": "purchase",
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
                      "delivery_schedule": {
                        "friday": [
                          {
                            "end": "12:00",
                            "start": "10:00"
                          }
                        ],
                        "monday": [
                          {
                            "end": "12:00",
                            "start": "10:00"
                          }
                        ],
                        "saturday": [
                          {
                            "end": "12:00",
                            "start": "10:00"
                          }
                        ],
                        "sunday": [
                          {
                            "end": "12:00",
                            "start": "10:00"
                          }
                        ],
                        "thursday": [
                          {
                            "end": "12:00",
                            "start": "10:00"
                          }
                        ],
                        "tuesday": [
                          {
                            "end": "12:00",
                            "start": "10:00"
                          }
                        ],
                        "wednesday": [
                          {
                            "end": "12:00",
                            "start": "10:00"
                          }
                        ]
                      },
                      "delivery_status": "in_appeal",
                      "demographics": {
                        "automatic": false,
                        "gender": "all",
                        "maximum_age": 64,
                        "minimum_age": 21
                      },
                      "desired_cost_per_result": 40,
                      "devices": {
                        "operating_systems": [
                          {
                            "minimum_version": "18.0",
                            "os": "ios"
                          }
                        ],
                        "platforms": [
                          "mobile"
                        ]
                      },
                      "ends_at": "2026-01-01T12:00:00.000Z",
                      "frequency": 1.1,
                      "id": "adgrp_xxxxxxxxxxxxxx",
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
                      "keywords": [
                        {
                          "match_type": "broad",
                          "negative": true,
                          "text": "text"
                        }
                      ],
                      "languages": [
                        "en"
                      ],
                      "lead_value": 3960,
                      "leads": 132,
                      "learning_progress": {
                        "conversion_threshold": 1,
                        "conversions": 1,
                        "progress_percent": 1.1
                      },
                      "link_clicks": 4400,
                      "purchase_value": 7920,
                      "purchases": 44,
                      "reach": 0,
                      "regions": {
                        "exclude": {
                          "cities": [
                            {
                              "key": "2418046",
                              "name": "Austin"
                            }
                          ],
                          "countries": [
                            "US"
                          ],
                          "country_groups": [
                            "north_america"
                          ],
                          "custom_locations": [
                            {
                              "distance_unit": "mile",
                              "latitude": 30.2672,
                              "longitude": -97.7431,
                              "name": "4180 Burnet Rd, Austin TX 78756",
                              "radius": 25
                            }
                          ],
                          "regions": [
                            "US-TX"
                          ],
                          "zips": [
                            "US:78756"
                          ]
                        },
                        "include": {
                          "cities": [
                            {
                              "key": "2418046",
                              "name": "Austin"
                            }
                          ],
                          "countries": [
                            "US"
                          ],
                          "country_groups": [
                            "north_america"
                          ],
                          "custom_locations": [
                            {
                              "distance_unit": "mile",
                              "latitude": 30.2672,
                              "longitude": -97.7431,
                              "name": "4180 Burnet Rd, Austin TX 78756",
                              "radius": 25
                            }
                          ],
                          "regions": [
                            "US-TX"
                          ],
                          "zips": [
                            "US:78756"
                          ]
                        }
                      },
                      "result_event": "purchase",
                      "result_event_name": "quote_requested",
                      "results": 33,
                      "return_on_ad_spend": 6,
                      "schedule_value": 5400,
                      "schedules": 60,
                      "spend": 1320,
                      "spend_currency": "usd",
                      "starts_at": "2026-01-01T12:00:00.000Z",
                      "status": "active",
                      "submitted_application_value": 1320,
                      "submitted_applications": 11,
                      "title": "Austin ceramic coating — repeat customers",
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
        let expectedResponse = DuplicateAdGroupsResponse(
            data: [
                AdGroup(
                    adCampaign: AdEntityReference(
                        id: "adcamp_xxxxxxxxxxxxxx"
                    ),
                    addedToCartValue: 12650,
                    addedToCarts: 165,
                    audiences: AdGroupAudiences(
                        exclude: [
                            "adaud_xxxxxxxxxxxxxx"
                        ],
                        include: [
                            "adaud_xxxxxxxxxxxxxx"
                        ]
                    ),
                    bidType: Nullable<AdGroupBidType>.value(AdGroupBidType.minimumCost),
                    budgetAmount: Nullable<Double>.value(60),
                    budgetAmountLocal: Nullable<Double>.value(60),
                    budgetCurrency: "usd",
                    budgetType: Nullable<AdGroupBudgetType>.value(AdGroupBudgetType.daily),
                    clickThroughRate: 0.025,
                    clicks: 5500,
                    completedRegistrationValue: 1650,
                    completedRegistrations: 55,
                    contactValue: 2640,
                    contacts: 88,
                    conversionEvent: Nullable<ConversionEvent>.value(ConversionEvent.conversionEventZero(
                        ConversionEventZero.purchase
                    )),
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
                    deliverySchedule: Nullable<AdGroupDeliverySchedule>.value(AdGroupDeliverySchedule(
                        friday: Optional([
                            AdGroupDeliveryWindow(
                                end: "12:00",
                                start: "10:00"
                            )
                        ]),
                        monday: Optional([
                            AdGroupDeliveryWindow(
                                end: "12:00",
                                start: "10:00"
                            )
                        ]),
                        saturday: Optional([
                            AdGroupDeliveryWindow(
                                end: "12:00",
                                start: "10:00"
                            )
                        ]),
                        sunday: Optional([
                            AdGroupDeliveryWindow(
                                end: "12:00",
                                start: "10:00"
                            )
                        ]),
                        thursday: Optional([
                            AdGroupDeliveryWindow(
                                end: "12:00",
                                start: "10:00"
                            )
                        ]),
                        tuesday: Optional([
                            AdGroupDeliveryWindow(
                                end: "12:00",
                                start: "10:00"
                            )
                        ]),
                        wednesday: Optional([
                            AdGroupDeliveryWindow(
                                end: "12:00",
                                start: "10:00"
                            )
                        ])
                    )),
                    deliveryStatus: AdGroupDeliveryStatus.inAppeal,
                    demographics: AdGroupDemographics(
                        automatic: false,
                        gender: AdGroupDemographicsGender.all,
                        maximumAge: Nullable<Double>.value(64),
                        minimumAge: Nullable<Double>.value(21)
                    ),
                    desiredCostPerResult: Nullable<Double>.value(40),
                    devices: AdGroupDevices(
                        operatingSystems: [
                            AdGroupOperatingSystem(
                                minimumVersion: Optional("18.0"),
                                os: AdGroupOperatingSystemOs.ios
                            )
                        ],
                        platforms: [
                            AdGroupDevicesPlatformsItem.mobile
                        ]
                    ),
                    endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    frequency: Nullable<Double>.value(1.1),
                    id: "adgrp_xxxxxxxxxxxxxx",
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
                    keywords: Optional([
                        AdGroupKeyword(
                            matchType: AdGroupKeywordMatchType.broad,
                            negative: true,
                            text: "text"
                        )
                    ]),
                    languages: [
                        "en"
                    ],
                    leadValue: 3960,
                    leads: 132,
                    learningProgress: Nullable<AdGroupLearningProgress>.value(AdGroupLearningProgress(
                        conversionThreshold: 1,
                        conversions: 1,
                        progressPercent: 1.1
                    )),
                    linkClicks: 4400,
                    purchaseValue: 7920,
                    purchases: 44,
                    reach: 0,
                    regions: AdGroupRegions(
                        exclude: AdGroupGeoLocations(
                            cities: [
                                AdGroupCity(
                                    key: "2418046",
                                    name: Optional("Austin")
                                )
                            ],
                            countries: [
                                "US"
                            ],
                            countryGroups: [
                                "north_america"
                            ],
                            customLocations: [
                                AdGroupCustomLocation(
                                    distanceUnit: AdGroupCustomLocationDistanceUnit.mile,
                                    latitude: 30.2672,
                                    longitude: -97.7431,
                                    name: Optional("4180 Burnet Rd, Austin TX 78756"),
                                    radius: 25
                                )
                            ],
                            regions: [
                                "US-TX"
                            ],
                            zips: [
                                "US:78756"
                            ]
                        ),
                        include: AdGroupGeoLocations(
                            cities: [
                                AdGroupCity(
                                    key: "2418046",
                                    name: Optional("Austin")
                                )
                            ],
                            countries: [
                                "US"
                            ],
                            countryGroups: [
                                "north_america"
                            ],
                            customLocations: [
                                AdGroupCustomLocation(
                                    distanceUnit: AdGroupCustomLocationDistanceUnit.mile,
                                    latitude: 30.2672,
                                    longitude: -97.7431,
                                    name: Optional("4180 Burnet Rd, Austin TX 78756"),
                                    radius: 25
                                )
                            ],
                            regions: [
                                "US-TX"
                            ],
                            zips: [
                                "US:78756"
                            ]
                        )
                    ),
                    resultEvent: Nullable<AdGroupResultEvent>.value(AdGroupResultEvent.purchase),
                    resultEventName: Nullable<String>.value("quote_requested"),
                    results: Nullable<Double>.value(33),
                    returnOnAdSpend: 6,
                    scheduleValue: 5400,
                    schedules: 60,
                    spend: 1320,
                    spendCurrency: Nullable<String>.value("usd"),
                    startsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    status: AdGroupStatus.active,
                    submittedApplicationValue: 1320,
                    submittedApplications: 11,
                    title: Nullable<String>.value("Austin ceramic coating — repeat customers"),
                    uniqueClickThroughRate: Nullable<Double>.value(1.1),
                    uniqueClicks: 3300,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    viewedContentValue: 8400,
                    viewedContents: 1200
                )
            ]
        )
        let response = try await client.adGroups.duplicate(
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
                  "added_to_cart_value": 12650,
                  "added_to_carts": 165,
                  "audiences": {
                    "exclude": [
                      "adaud_xxxxxxxxxxxxxx"
                    ],
                    "include": [
                      "adaud_xxxxxxxxxxxxxx"
                    ]
                  },
                  "bid_type": "minimum_cost",
                  "budget_amount": 60,
                  "budget_amount_local": 60,
                  "budget_currency": "usd",
                  "budget_type": "daily",
                  "click_through_rate": 0.025,
                  "clicks": 5500,
                  "completed_registration_value": 1650,
                  "completed_registrations": 55,
                  "contact_value": 2640,
                  "contacts": 88,
                  "conversion_event": "purchase",
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
                  "delivery_schedule": {
                    "friday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "monday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "saturday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "sunday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "thursday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "tuesday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "wednesday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ]
                  },
                  "delivery_status": "in_appeal",
                  "demographics": {
                    "automatic": false,
                    "gender": "all",
                    "maximum_age": 64,
                    "minimum_age": 21
                  },
                  "desired_cost_per_result": 40,
                  "devices": {
                    "operating_systems": [
                      {
                        "minimum_version": "18.0",
                        "os": "ios"
                      }
                    ],
                    "platforms": [
                      "mobile"
                    ]
                  },
                  "ends_at": "2026-01-01T12:00:00.000Z",
                  "frequency": 1.1,
                  "id": "adgrp_xxxxxxxxxxxxxx",
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
                  "keywords": [
                    {
                      "match_type": "broad",
                      "negative": true,
                      "text": "text"
                    }
                  ],
                  "languages": [
                    "en"
                  ],
                  "lead_value": 3960,
                  "leads": 132,
                  "learning_progress": {
                    "conversion_threshold": 1,
                    "conversions": 1,
                    "progress_percent": 1.1
                  },
                  "link_clicks": 4400,
                  "purchase_value": 7920,
                  "purchases": 44,
                  "reach": 0,
                  "regions": {
                    "exclude": {
                      "cities": [
                        {
                          "key": "2418046",
                          "name": "Austin"
                        }
                      ],
                      "countries": [
                        "US"
                      ],
                      "country_groups": [
                        "north_america"
                      ],
                      "custom_locations": [
                        {
                          "distance_unit": "mile",
                          "latitude": 30.2672,
                          "longitude": -97.7431,
                          "name": "4180 Burnet Rd, Austin TX 78756",
                          "radius": 25
                        }
                      ],
                      "regions": [
                        "US-TX"
                      ],
                      "zips": [
                        "US:78756"
                      ]
                    },
                    "include": {
                      "cities": [
                        {
                          "key": "2418046",
                          "name": "Austin"
                        }
                      ],
                      "countries": [
                        "US"
                      ],
                      "country_groups": [
                        "north_america"
                      ],
                      "custom_locations": [
                        {
                          "distance_unit": "mile",
                          "latitude": 30.2672,
                          "longitude": -97.7431,
                          "name": "4180 Burnet Rd, Austin TX 78756",
                          "radius": 25
                        }
                      ],
                      "regions": [
                        "US-TX"
                      ],
                      "zips": [
                        "US:78756"
                      ]
                    }
                  },
                  "result_event": "purchase",
                  "result_event_name": "quote_requested",
                  "results": 33,
                  "return_on_ad_spend": 6,
                  "schedule_value": 5400,
                  "schedules": 60,
                  "spend": 1320,
                  "spend_currency": "usd",
                  "starts_at": "2026-01-01T12:00:00.000Z",
                  "status": "active",
                  "submitted_application_value": 1320,
                  "submitted_applications": 11,
                  "title": "Austin ceramic coating — repeat customers",
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
        let expectedResponse = AdGroup(
            adCampaign: AdEntityReference(
                id: "adcamp_xxxxxxxxxxxxxx"
            ),
            addedToCartValue: 12650,
            addedToCarts: 165,
            audiences: AdGroupAudiences(
                exclude: [
                    "adaud_xxxxxxxxxxxxxx"
                ],
                include: [
                    "adaud_xxxxxxxxxxxxxx"
                ]
            ),
            bidType: Nullable<AdGroupBidType>.value(AdGroupBidType.minimumCost),
            budgetAmount: Nullable<Double>.value(60),
            budgetAmountLocal: Nullable<Double>.value(60),
            budgetCurrency: "usd",
            budgetType: Nullable<AdGroupBudgetType>.value(AdGroupBudgetType.daily),
            clickThroughRate: 0.025,
            clicks: 5500,
            completedRegistrationValue: 1650,
            completedRegistrations: 55,
            contactValue: 2640,
            contacts: 88,
            conversionEvent: Nullable<ConversionEvent>.value(ConversionEvent.conversionEventZero(
                ConversionEventZero.purchase
            )),
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
            deliverySchedule: Nullable<AdGroupDeliverySchedule>.value(AdGroupDeliverySchedule(
                friday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                monday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                saturday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                sunday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                thursday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                tuesday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                wednesday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ])
            )),
            deliveryStatus: AdGroupDeliveryStatus.inAppeal,
            demographics: AdGroupDemographics(
                automatic: false,
                gender: AdGroupDemographicsGender.all,
                maximumAge: Nullable<Double>.value(64),
                minimumAge: Nullable<Double>.value(21)
            ),
            desiredCostPerResult: Nullable<Double>.value(40),
            devices: AdGroupDevices(
                operatingSystems: [
                    AdGroupOperatingSystem(
                        minimumVersion: Optional("18.0"),
                        os: AdGroupOperatingSystemOs.ios
                    )
                ],
                platforms: [
                    AdGroupDevicesPlatformsItem.mobile
                ]
            ),
            endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            frequency: Nullable<Double>.value(1.1),
            id: "adgrp_xxxxxxxxxxxxxx",
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
            keywords: Optional([
                AdGroupKeyword(
                    matchType: AdGroupKeywordMatchType.broad,
                    negative: true,
                    text: "text"
                )
            ]),
            languages: [
                "en"
            ],
            leadValue: 3960,
            leads: 132,
            learningProgress: Nullable<AdGroupLearningProgress>.value(AdGroupLearningProgress(
                conversionThreshold: 1,
                conversions: 1,
                progressPercent: 1.1
            )),
            linkClicks: 4400,
            purchaseValue: 7920,
            purchases: 44,
            reach: 0,
            regions: AdGroupRegions(
                exclude: AdGroupGeoLocations(
                    cities: [
                        AdGroupCity(
                            key: "2418046",
                            name: Optional("Austin")
                        )
                    ],
                    countries: [
                        "US"
                    ],
                    countryGroups: [
                        "north_america"
                    ],
                    customLocations: [
                        AdGroupCustomLocation(
                            distanceUnit: AdGroupCustomLocationDistanceUnit.mile,
                            latitude: 30.2672,
                            longitude: -97.7431,
                            name: Optional("4180 Burnet Rd, Austin TX 78756"),
                            radius: 25
                        )
                    ],
                    regions: [
                        "US-TX"
                    ],
                    zips: [
                        "US:78756"
                    ]
                ),
                include: AdGroupGeoLocations(
                    cities: [
                        AdGroupCity(
                            key: "2418046",
                            name: Optional("Austin")
                        )
                    ],
                    countries: [
                        "US"
                    ],
                    countryGroups: [
                        "north_america"
                    ],
                    customLocations: [
                        AdGroupCustomLocation(
                            distanceUnit: AdGroupCustomLocationDistanceUnit.mile,
                            latitude: 30.2672,
                            longitude: -97.7431,
                            name: Optional("4180 Burnet Rd, Austin TX 78756"),
                            radius: 25
                        )
                    ],
                    regions: [
                        "US-TX"
                    ],
                    zips: [
                        "US:78756"
                    ]
                )
            ),
            resultEvent: Nullable<AdGroupResultEvent>.value(AdGroupResultEvent.purchase),
            resultEventName: Nullable<String>.value("quote_requested"),
            results: Nullable<Double>.value(33),
            returnOnAdSpend: 6,
            scheduleValue: 5400,
            schedules: 60,
            spend: 1320,
            spendCurrency: Nullable<String>.value("usd"),
            startsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: AdGroupStatus.active,
            submittedApplicationValue: 1320,
            submittedApplications: 11,
            title: Nullable<String>.value("Austin ceramic coating — repeat customers"),
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 3300,
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewedContentValue: 8400,
            viewedContents: 1200
        )
        let response = try await client.adGroups.pause(
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
                  "added_to_cart_value": 12650,
                  "added_to_carts": 165,
                  "audiences": {
                    "exclude": [
                      "adaud_xxxxxxxxxxxxxx"
                    ],
                    "include": [
                      "adaud_xxxxxxxxxxxxxx"
                    ]
                  },
                  "bid_type": "minimum_cost",
                  "budget_amount": 60,
                  "budget_amount_local": 60,
                  "budget_currency": "usd",
                  "budget_type": "daily",
                  "click_through_rate": 0.025,
                  "clicks": 5500,
                  "completed_registration_value": 1650,
                  "completed_registrations": 55,
                  "contact_value": 2640,
                  "contacts": 88,
                  "conversion_event": "purchase",
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
                  "delivery_schedule": {
                    "friday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "monday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "saturday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "sunday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "thursday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "tuesday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ],
                    "wednesday": [
                      {
                        "end": "12:00",
                        "start": "10:00"
                      }
                    ]
                  },
                  "delivery_status": "in_appeal",
                  "demographics": {
                    "automatic": false,
                    "gender": "all",
                    "maximum_age": 64,
                    "minimum_age": 21
                  },
                  "desired_cost_per_result": 40,
                  "devices": {
                    "operating_systems": [
                      {
                        "minimum_version": "18.0",
                        "os": "ios"
                      }
                    ],
                    "platforms": [
                      "mobile"
                    ]
                  },
                  "ends_at": "2026-01-01T12:00:00.000Z",
                  "frequency": 1.1,
                  "id": "adgrp_xxxxxxxxxxxxxx",
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
                  "keywords": [
                    {
                      "match_type": "broad",
                      "negative": true,
                      "text": "text"
                    }
                  ],
                  "languages": [
                    "en"
                  ],
                  "lead_value": 3960,
                  "leads": 132,
                  "learning_progress": {
                    "conversion_threshold": 1,
                    "conversions": 1,
                    "progress_percent": 1.1
                  },
                  "link_clicks": 4400,
                  "purchase_value": 7920,
                  "purchases": 44,
                  "reach": 0,
                  "regions": {
                    "exclude": {
                      "cities": [
                        {
                          "key": "2418046",
                          "name": "Austin"
                        }
                      ],
                      "countries": [
                        "US"
                      ],
                      "country_groups": [
                        "north_america"
                      ],
                      "custom_locations": [
                        {
                          "distance_unit": "mile",
                          "latitude": 30.2672,
                          "longitude": -97.7431,
                          "name": "4180 Burnet Rd, Austin TX 78756",
                          "radius": 25
                        }
                      ],
                      "regions": [
                        "US-TX"
                      ],
                      "zips": [
                        "US:78756"
                      ]
                    },
                    "include": {
                      "cities": [
                        {
                          "key": "2418046",
                          "name": "Austin"
                        }
                      ],
                      "countries": [
                        "US"
                      ],
                      "country_groups": [
                        "north_america"
                      ],
                      "custom_locations": [
                        {
                          "distance_unit": "mile",
                          "latitude": 30.2672,
                          "longitude": -97.7431,
                          "name": "4180 Burnet Rd, Austin TX 78756",
                          "radius": 25
                        }
                      ],
                      "regions": [
                        "US-TX"
                      ],
                      "zips": [
                        "US:78756"
                      ]
                    }
                  },
                  "result_event": "purchase",
                  "result_event_name": "quote_requested",
                  "results": 33,
                  "return_on_ad_spend": 6,
                  "schedule_value": 5400,
                  "schedules": 60,
                  "spend": 1320,
                  "spend_currency": "usd",
                  "starts_at": "2026-01-01T12:00:00.000Z",
                  "status": "active",
                  "submitted_application_value": 1320,
                  "submitted_applications": 11,
                  "title": "Austin ceramic coating — repeat customers",
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
        let expectedResponse = AdGroup(
            adCampaign: AdEntityReference(
                id: "adcamp_xxxxxxxxxxxxxx"
            ),
            addedToCartValue: 12650,
            addedToCarts: 165,
            audiences: AdGroupAudiences(
                exclude: [
                    "adaud_xxxxxxxxxxxxxx"
                ],
                include: [
                    "adaud_xxxxxxxxxxxxxx"
                ]
            ),
            bidType: Nullable<AdGroupBidType>.value(AdGroupBidType.minimumCost),
            budgetAmount: Nullable<Double>.value(60),
            budgetAmountLocal: Nullable<Double>.value(60),
            budgetCurrency: "usd",
            budgetType: Nullable<AdGroupBudgetType>.value(AdGroupBudgetType.daily),
            clickThroughRate: 0.025,
            clicks: 5500,
            completedRegistrationValue: 1650,
            completedRegistrations: 55,
            contactValue: 2640,
            contacts: 88,
            conversionEvent: Nullable<ConversionEvent>.value(ConversionEvent.conversionEventZero(
                ConversionEventZero.purchase
            )),
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
            deliverySchedule: Nullable<AdGroupDeliverySchedule>.value(AdGroupDeliverySchedule(
                friday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                monday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                saturday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                sunday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                thursday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                tuesday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ]),
                wednesday: Optional([
                    AdGroupDeliveryWindow(
                        end: "12:00",
                        start: "10:00"
                    )
                ])
            )),
            deliveryStatus: AdGroupDeliveryStatus.inAppeal,
            demographics: AdGroupDemographics(
                automatic: false,
                gender: AdGroupDemographicsGender.all,
                maximumAge: Nullable<Double>.value(64),
                minimumAge: Nullable<Double>.value(21)
            ),
            desiredCostPerResult: Nullable<Double>.value(40),
            devices: AdGroupDevices(
                operatingSystems: [
                    AdGroupOperatingSystem(
                        minimumVersion: Optional("18.0"),
                        os: AdGroupOperatingSystemOs.ios
                    )
                ],
                platforms: [
                    AdGroupDevicesPlatformsItem.mobile
                ]
            ),
            endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            frequency: Nullable<Double>.value(1.1),
            id: "adgrp_xxxxxxxxxxxxxx",
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
            keywords: Optional([
                AdGroupKeyword(
                    matchType: AdGroupKeywordMatchType.broad,
                    negative: true,
                    text: "text"
                )
            ]),
            languages: [
                "en"
            ],
            leadValue: 3960,
            leads: 132,
            learningProgress: Nullable<AdGroupLearningProgress>.value(AdGroupLearningProgress(
                conversionThreshold: 1,
                conversions: 1,
                progressPercent: 1.1
            )),
            linkClicks: 4400,
            purchaseValue: 7920,
            purchases: 44,
            reach: 0,
            regions: AdGroupRegions(
                exclude: AdGroupGeoLocations(
                    cities: [
                        AdGroupCity(
                            key: "2418046",
                            name: Optional("Austin")
                        )
                    ],
                    countries: [
                        "US"
                    ],
                    countryGroups: [
                        "north_america"
                    ],
                    customLocations: [
                        AdGroupCustomLocation(
                            distanceUnit: AdGroupCustomLocationDistanceUnit.mile,
                            latitude: 30.2672,
                            longitude: -97.7431,
                            name: Optional("4180 Burnet Rd, Austin TX 78756"),
                            radius: 25
                        )
                    ],
                    regions: [
                        "US-TX"
                    ],
                    zips: [
                        "US:78756"
                    ]
                ),
                include: AdGroupGeoLocations(
                    cities: [
                        AdGroupCity(
                            key: "2418046",
                            name: Optional("Austin")
                        )
                    ],
                    countries: [
                        "US"
                    ],
                    countryGroups: [
                        "north_america"
                    ],
                    customLocations: [
                        AdGroupCustomLocation(
                            distanceUnit: AdGroupCustomLocationDistanceUnit.mile,
                            latitude: 30.2672,
                            longitude: -97.7431,
                            name: Optional("4180 Burnet Rd, Austin TX 78756"),
                            radius: 25
                        )
                    ],
                    regions: [
                        "US-TX"
                    ],
                    zips: [
                        "US:78756"
                    ]
                )
            ),
            resultEvent: Nullable<AdGroupResultEvent>.value(AdGroupResultEvent.purchase),
            resultEventName: Nullable<String>.value("quote_requested"),
            results: Nullable<Double>.value(33),
            returnOnAdSpend: 6,
            scheduleValue: 5400,
            schedules: 60,
            spend: 1320,
            spendCurrency: Nullable<String>.value("usd"),
            startsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: AdGroupStatus.active,
            submittedApplicationValue: 1320,
            submittedApplications: 11,
            title: Nullable<String>.value("Austin ceramic coating — repeat customers"),
            uniqueClickThroughRate: Nullable<Double>.value(1.1),
            uniqueClicks: 3300,
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewedContentValue: 8400,
            viewedContents: 1200
        )
        let response = try await client.adGroups.unpause(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}