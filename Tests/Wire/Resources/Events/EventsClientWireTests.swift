import Foundation
import Testing
import WhopSDK

@Suite("EventsClient Wire Tests") struct EventsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "context": {
                        "ad_campaign_id": "adcamp_xxxxxxxxxxxxxx",
                        "ad_click_id": "IwAR123",
                        "ad_click_type": "fbclid",
                        "ad_id": "ad_xxxxxxxxxxxxxx",
                        "ad_set_id": "adgrp_xxxxxxxxxxxxxx",
                        "utm_campaign": "brand",
                        "utm_content": "creative",
                        "utm_medium": "paid",
                        "utm_source": "google",
                        "utm_term": "keyword"
                      },
                      "currency": "usd",
                      "custom_name": "coating_deposit_paid",
                      "event_id": "evt_124",
                      "event_name": "pixel.custom",
                      "event_time": "2026-01-01T12:00:00Z",
                      "id": "evt_124",
                      "path": "/checkout/complete",
                      "person_id": "prsn_123",
                      "questions": [
                        {
                          "answer": "SUV",
                          "id": "q_2",
                          "key": "vehicle_type",
                          "options": [
                            "Truck"
                          ],
                          "question": "What vehicle are we detailing?",
                          "type": "custom"
                        }
                      ],
                      "recommended_action_chain_id": "recommended_action_chain_id",
                      "recommended_action_shown_position": 1,
                      "referrer_url": "https://google.com",
                      "related": {
                        "account": {
                          "id": "biz_xxxxxxxxxxxxxx",
                          "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                          "route": "biz_xxxxxxxxxxxxxx",
                          "title": "Shine Time Auto Detailing"
                        },
                        "ad": {
                          "id": "ad_xxxxxxxxxxxxxx",
                          "thumbnail_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                          "title": "Ceramic coating — before/after reel"
                        },
                        "ad_campaign": {
                          "id": "adcamp_xxxxxxxxxxxxxx",
                          "platform": "meta",
                          "title": "Ceramic coating — spring push"
                        },
                        "ad_group": {
                          "id": "adgrp_xxxxxxxxxxxxxx",
                          "title": "Austin — SUV owners"
                        },
                        "app": {
                          "domain_id": "whopappdomain0000001",
                          "icon_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                          "id": "app_xxxxxxxxxxxxxx",
                          "title": "Shine Time Booking"
                        },
                        "audience": {
                          "file_name": "shine-time-customers.csv",
                          "id": "adaud_xxxxxxxxxxxxxx",
                          "title": "Austin ceramic coating leads"
                        },
                        "payment": {
                          "card_brand": "visa",
                          "card_last4": "4242",
                          "id": "pay_xxxxxxxxxxxxxx",
                          "provider": "stripe"
                        },
                        "plan": {
                          "billing_period": 30,
                          "currency": "usd",
                          "id": "plan_xxxxxxxxxxxxxx",
                          "initial_price": 0,
                          "renewal_price": 59,
                          "title": "Unlimited Wash Club"
                        },
                        "product": {
                          "id": "prod_xxxxxxxxxxxxxx",
                          "route": "ceramic-coating-package",
                          "title": "Ceramic Coating Package"
                        },
                        "user": {
                          "avatar_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                          "id": "user_xxxxxxxxxxxxxx",
                          "name": "Dana Whitfield",
                          "username": "danawhitfield"
                        }
                      },
                      "total_usd_amount": 249,
                      "url": "https://shinetime.example/checkout/complete",
                      "user": {
                        "city": "Austin",
                        "country": "US",
                        "email": "marcus@shinetime.example",
                        "first_name": "Dana",
                        "last_name": "Whitfield",
                        "name": "Dana Whitfield",
                        "phone": "5551234567"
                      },
                      "value": 249
                    }
                  ],
                  "page_info": {
                    "end_cursor": "cursor_end",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "cursor_start"
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
        let expectedResponse = ListEventsResponse(
            data: [
                ListEventsResponseDataItem(
                    context: Optional(Nullable<ListEventsResponseDataItemContext>.value(ListEventsResponseDataItemContext(
                        adCampaignId: Optional(Nullable<String>.value("adcamp_xxxxxxxxxxxxxx")),
                        adClickId: Optional(Nullable<String>.value("IwAR123")),
                        adClickType: Optional(Nullable<String>.value("fbclid")),
                        adId: Optional(Nullable<String>.value("ad_xxxxxxxxxxxxxx")),
                        adSetId: Optional(Nullable<String>.value("adgrp_xxxxxxxxxxxxxx")),
                        utmCampaign: Optional(Nullable<String>.value("brand")),
                        utmContent: Optional(Nullable<String>.value("creative")),
                        utmMedium: Optional(Nullable<String>.value("paid")),
                        utmSource: Optional(Nullable<String>.value("google")),
                        utmTerm: Optional(Nullable<String>.value("keyword"))
                    ))),
                    currency: Optional(Nullable<String>.value("usd")),
                    customName: Optional(Nullable<String>.value("coating_deposit_paid")),
                    eventId: "evt_124",
                    eventName: "pixel.custom",
                    eventTime: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                    id: "evt_124",
                    path: Optional(Nullable<String>.value("/checkout/complete")),
                    personId: "prsn_123",
                    questions: Optional(Nullable<[ListEventsResponseDataItemQuestionsItem]>.value([
                        ListEventsResponseDataItemQuestionsItem(
                            answer: Optional(Nullable<String>.value("SUV")),
                            id: Optional(Nullable<String>.value("q_2")),
                            key: Optional(Nullable<String>.value("vehicle_type")),
                            options: Optional(Nullable<[String]>.value([
                                "Truck"
                            ])),
                            question: Optional(Nullable<String>.value("What vehicle are we detailing?")),
                            type: Optional(Nullable<String>.value("custom"))
                        )
                    ])),
                    recommendedActionChainId: Optional(Nullable<String>.value("recommended_action_chain_id")),
                    recommendedActionShownPosition: Optional(Nullable<Int>.value(1)),
                    referrerUrl: Optional(Nullable<String>.value("https://google.com")),
                    related: Optional(Nullable<ListEventsResponseDataItemRelated>.value(ListEventsResponseDataItemRelated(
                        account: Optional(Nullable<ListEventsResponseDataItemRelatedAccount>.value(ListEventsResponseDataItemRelatedAccount(
                            id: Optional("biz_xxxxxxxxxxxxxx"),
                            logoUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")),
                            route: Optional(Nullable<String>.value("biz_xxxxxxxxxxxxxx")),
                            title: Optional(Nullable<String>.value("Shine Time Auto Detailing"))
                        ))),
                        ad: Optional(Nullable<ListEventsResponseDataItemRelatedAd>.value(ListEventsResponseDataItemRelatedAd(
                            id: Optional("ad_xxxxxxxxxxxxxx"),
                            thumbnailUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")),
                            title: Optional(Nullable<String>.value("Ceramic coating — before/after reel"))
                        ))),
                        adCampaign: Optional(Nullable<ListEventsResponseDataItemRelatedAdCampaign>.value(ListEventsResponseDataItemRelatedAdCampaign(
                            id: Optional("adcamp_xxxxxxxxxxxxxx"),
                            platform: Optional(Nullable<String>.value("meta")),
                            title: Optional(Nullable<String>.value("Ceramic coating — spring push"))
                        ))),
                        adGroup: Optional(Nullable<ListEventsResponseDataItemRelatedAdGroup>.value(ListEventsResponseDataItemRelatedAdGroup(
                            id: Optional("adgrp_xxxxxxxxxxxxxx"),
                            title: Optional(Nullable<String>.value("Austin — SUV owners"))
                        ))),
                        app: Optional(Nullable<ListEventsResponseDataItemRelatedApp>.value(ListEventsResponseDataItemRelatedApp(
                            domainId: Optional(Nullable<String>.value("whopappdomain0000001")),
                            iconUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")),
                            id: Optional("app_xxxxxxxxxxxxxx"),
                            title: Optional(Nullable<String>.value("Shine Time Booking"))
                        ))),
                        audience: Optional(Nullable<ListEventsResponseDataItemRelatedAudience>.value(ListEventsResponseDataItemRelatedAudience(
                            fileName: Optional(Nullable<String>.value("shine-time-customers.csv")),
                            id: Optional("adaud_xxxxxxxxxxxxxx"),
                            title: Optional(Nullable<String>.value("Austin ceramic coating leads"))
                        ))),
                        payment: Optional(Nullable<ListEventsResponseDataItemRelatedPayment>.value(ListEventsResponseDataItemRelatedPayment(
                            cardBrand: Optional(Nullable<String>.value("visa")),
                            cardLast4: Optional(Nullable<String>.value("4242")),
                            id: Optional("pay_xxxxxxxxxxxxxx"),
                            provider: Optional(Nullable<String>.value("stripe"))
                        ))),
                        plan: Optional(Nullable<ListEventsResponseDataItemRelatedPlan>.value(ListEventsResponseDataItemRelatedPlan(
                            billingPeriod: Optional(Nullable<Int>.value(30)),
                            currency: Optional(Nullable<String>.value("usd")),
                            id: Optional("plan_xxxxxxxxxxxxxx"),
                            initialPrice: Optional(Nullable<Double>.value(0)),
                            renewalPrice: Optional(Nullable<Double>.value(59)),
                            title: Optional(Nullable<String>.value("Unlimited Wash Club"))
                        ))),
                        product: Optional(Nullable<ListEventsResponseDataItemRelatedProduct>.value(ListEventsResponseDataItemRelatedProduct(
                            id: Optional("prod_xxxxxxxxxxxxxx"),
                            route: Optional(Nullable<String>.value("ceramic-coating-package")),
                            title: Optional(Nullable<String>.value("Ceramic Coating Package"))
                        ))),
                        user: Optional(Nullable<ListEventsResponseDataItemRelatedUser>.value(ListEventsResponseDataItemRelatedUser(
                            avatarUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")),
                            id: Optional("user_xxxxxxxxxxxxxx"),
                            name: Optional(Nullable<String>.value("Dana Whitfield")),
                            username: Optional(Nullable<String>.value("danawhitfield"))
                        )))
                    ))),
                    totalUsdAmount: Optional(Nullable<Double>.value(249)),
                    url: Optional(Nullable<String>.value("https://shinetime.example/checkout/complete")),
                    user: Optional(Nullable<ListEventsResponseDataItemUser>.value(ListEventsResponseDataItemUser(
                        city: Optional(Nullable<String>.value("Austin")),
                        country: Optional(Nullable<String>.value("US")),
                        email: Optional(Nullable<String>.value("marcus@shinetime.example")),
                        firstName: Optional(Nullable<String>.value("Dana")),
                        lastName: Optional(Nullable<String>.value("Whitfield")),
                        name: Optional(Nullable<String>.value("Dana Whitfield")),
                        phone: Optional(Nullable<String>.value("5551234567"))
                    ))),
                    value: Optional(Nullable<Double>.value(249))
                )
            ],
            pageInfo: ListEventsResponsePageInfo(
                endCursor: Optional(Nullable<String>.value("cursor_end")),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Optional(Nullable<String>.value("cursor_start"))
            )
        )
        let response = try await client.events.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "id": "evnt_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateEventsResponse(
            id: "evnt_xxxxxxxxxxxxxx"
        )
        let response = try await client.events.create(
            request: .init(
                accountId: "biz_xxxxxxxxxxxxxx",
                eventName: "coating_deposit_paid"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func pulse1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "event_name": "ledger_line.created",
                      "event_time": "2026-01-01T12:00:00Z",
                      "total_usd_amount": 45.5,
                      "type": "purchase",
                      "user": {
                        "city": "Austin",
                        "country": "US"
                      }
                    }
                  ],
                  "page_info": {
                    "end_cursor": "cursor_end",
                    "has_next_page": true,
                    "has_previous_page": false,
                    "start_cursor": "cursor_start"
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
        let expectedResponse = PulseEventsResponse(
            data: [
                PulseEventsResponseDataItem(
                    eventName: PulseEventsResponseDataItemEventName.ledgerLineCreated,
                    eventTime: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                    totalUsdAmount: Optional(Nullable<Double>.value(45.5)),
                    type: PulseEventsResponseDataItemType.purchase,
                    user: Optional(PulseEventsResponseDataItemUser(
                        city: Optional("Austin"),
                        country: Optional("US")
                    ))
                )
            ],
            pageInfo: PulseEventsResponsePageInfo(
                endCursor: Optional(Nullable<String>.value("cursor_end")),
                hasNextPage: true,
                hasPreviousPage: false,
                startCursor: Optional(Nullable<String>.value("cursor_start"))
            )
        )
        let response = try await client.events.pulse(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func validatePixel1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "firing_data_ok": true,
                  "host_events": [
                    "lead"
                  ],
                  "installed": true,
                  "last_fired_days": {
                    "lead": 2
                  },
                  "last_seen_days": 2,
                  "native_tracking": false,
                  "page_events": [
                    "lead"
                  ],
                  "reachable": true,
                  "url": "https://shinetime.example/checkout/complete"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PixelValidation(
            firingDataOk: true,
            hostEvents: [
                "lead"
            ],
            installed: true,
            lastFiredDays: [
                "lead": JSONValue.number(2)
            ],
            lastSeenDays: Nullable<Double>.value(2),
            nativeTracking: false,
            pageEvents: [
                "lead"
            ],
            reachable: Nullable<Bool>.value(true),
            url: Nullable<String>.value("https://shinetime.example/checkout/complete")
        )
        let response = try await client.events.validatePixel(
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}