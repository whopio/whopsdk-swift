import Foundation
import Testing
import WhopSDK

@Suite("PeopleClient Wire Tests") struct PeopleClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "aov": 74.99,
                      "device": {
                        "browser": "Dana Whitfield",
                        "device": "Dana Whitfield",
                        "os": "Dana Whitfield"
                      },
                      "email": "marcus@shinetime.example",
                      "event_count": 42,
                      "first_purchase_at": "2026-01-01T12:00:00Z",
                      "first_seen_at": "2026-01-01T12:00:00Z",
                      "first_source": {
                        "ad": {
                          "id": "adcamp_1",
                          "name": "Dana Whitfield",
                          "thumbnail_url": "Dana Whitfield"
                        },
                        "ad_group": {
                          "id": "adcamp_1",
                          "name": "Dana Whitfield",
                          "thumbnail_url": "Dana Whitfield"
                        },
                        "campaign": {
                          "id": "adcamp_1",
                          "name": "Dana Whitfield",
                          "thumbnail_url": "Dana Whitfield"
                        },
                        "domain": "Dana Whitfield",
                        "occurred_at": "2026-01-01T12:00:00Z",
                        "platform": "Dana Whitfield",
                        "type": "ad_click",
                        "utm_source": "Dana Whitfield"
                      },
                      "id": "prsn_123",
                      "last_ip": "Dana Whitfield",
                      "last_purchase_at": "2026-01-01T12:00:00Z",
                      "last_seen_at": "2026-01-01T12:00:00Z",
                      "last_source": {
                        "ad": {
                          "id": "adcamp_1",
                          "name": "Dana Whitfield",
                          "thumbnail_url": "Dana Whitfield"
                        },
                        "ad_group": {
                          "id": "adcamp_1",
                          "name": "Dana Whitfield",
                          "thumbnail_url": "Dana Whitfield"
                        },
                        "campaign": {
                          "id": "adcamp_1",
                          "name": "Dana Whitfield",
                          "thumbnail_url": "Dana Whitfield"
                        },
                        "domain": "Dana Whitfield",
                        "occurred_at": "2026-01-01T12:00:00Z",
                        "platform": "Dana Whitfield",
                        "type": "ad_click",
                        "utm_source": "Dana Whitfield"
                      },
                      "location": {
                        "city": "Dana Whitfield",
                        "continent": "Dana Whitfield",
                        "country": "Dana Whitfield"
                      },
                      "ltv": 149.98,
                      "member": {
                        "id": "mem_dana1",
                        "joined_at": "2026-01-01T12:00:00Z",
                        "status": "Dana Whitfield",
                        "usd_total_spend": 149.98
                      },
                      "name": "Dana Whitfield",
                      "phone": "+xxxxxxxxxxx",
                      "purchase_count": 2,
                      "timezone": "Dana Whitfield",
                      "user": {
                        "id": "user_dana1",
                        "name": "Dana Whitfield",
                        "profile_pic_url": "Dana Whitfield",
                        "username": "danawhitfield"
                      }
                    }
                  ],
                  "page_info": {
                    "end_cursor": "cursor_end",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "cursor_start"
                  },
                  "total_count": 42
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListPeopleResponse(
            data: [
                ListPeopleResponseDataItem(
                    accountId: "biz_xxxxxxxxxxxxxx",
                    aov: Optional(74.99),
                    device: Optional(ListPeopleResponseDataItemDevice(
                        browser: Optional(Nullable<String>.value("Dana Whitfield")),
                        device: Optional(Nullable<String>.value("Dana Whitfield")),
                        os: Optional(Nullable<String>.value("Dana Whitfield"))
                    )),
                    email: Optional(Nullable<String>.value("marcus@shinetime.example")),
                    eventCount: 42,
                    firstPurchaseAt: Optional(Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601))),
                    firstSeenAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                    firstSource: Optional(Nullable<ListPeopleResponseDataItemFirstSource>.value(ListPeopleResponseDataItemFirstSource(
                        ad: Optional(Nullable<ListPeopleResponseDataItemFirstSourceAd>.value(ListPeopleResponseDataItemFirstSourceAd(
                            id: "adcamp_1",
                            name: Optional(Nullable<String>.value("Dana Whitfield")),
                            thumbnailUrl: Optional(Nullable<String>.value("Dana Whitfield"))
                        ))),
                        adGroup: Optional(Nullable<ListPeopleResponseDataItemFirstSourceAdGroup>.value(ListPeopleResponseDataItemFirstSourceAdGroup(
                            id: "adcamp_1",
                            name: Optional(Nullable<String>.value("Dana Whitfield")),
                            thumbnailUrl: Optional(Nullable<String>.value("Dana Whitfield"))
                        ))),
                        campaign: Optional(Nullable<ListPeopleResponseDataItemFirstSourceCampaign>.value(ListPeopleResponseDataItemFirstSourceCampaign(
                            id: "adcamp_1",
                            name: Optional(Nullable<String>.value("Dana Whitfield")),
                            thumbnailUrl: Optional(Nullable<String>.value("Dana Whitfield"))
                        ))),
                        domain: Optional(Nullable<String>.value("Dana Whitfield")),
                        occurredAt: Optional(Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601))),
                        platform: Optional(Nullable<String>.value("Dana Whitfield")),
                        type: ListPeopleResponseDataItemFirstSourceType.adClick,
                        utmSource: Optional(Nullable<String>.value("Dana Whitfield"))
                    ))),
                    id: "prsn_123",
                    lastIp: Optional(Nullable<String>.value("Dana Whitfield")),
                    lastPurchaseAt: Optional(Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601))),
                    lastSeenAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                    lastSource: Optional(Nullable<ListPeopleResponseDataItemLastSource>.value(ListPeopleResponseDataItemLastSource(
                        ad: Optional(Nullable<ListPeopleResponseDataItemLastSourceAd>.value(ListPeopleResponseDataItemLastSourceAd(
                            id: "adcamp_1",
                            name: Optional(Nullable<String>.value("Dana Whitfield")),
                            thumbnailUrl: Optional(Nullable<String>.value("Dana Whitfield"))
                        ))),
                        adGroup: Optional(Nullable<ListPeopleResponseDataItemLastSourceAdGroup>.value(ListPeopleResponseDataItemLastSourceAdGroup(
                            id: "adcamp_1",
                            name: Optional(Nullable<String>.value("Dana Whitfield")),
                            thumbnailUrl: Optional(Nullable<String>.value("Dana Whitfield"))
                        ))),
                        campaign: Optional(Nullable<ListPeopleResponseDataItemLastSourceCampaign>.value(ListPeopleResponseDataItemLastSourceCampaign(
                            id: "adcamp_1",
                            name: Optional(Nullable<String>.value("Dana Whitfield")),
                            thumbnailUrl: Optional(Nullable<String>.value("Dana Whitfield"))
                        ))),
                        domain: Optional(Nullable<String>.value("Dana Whitfield")),
                        occurredAt: Optional(Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601))),
                        platform: Optional(Nullable<String>.value("Dana Whitfield")),
                        type: ListPeopleResponseDataItemLastSourceType.adClick,
                        utmSource: Optional(Nullable<String>.value("Dana Whitfield"))
                    ))),
                    location: Optional(ListPeopleResponseDataItemLocation(
                        city: Optional(Nullable<String>.value("Dana Whitfield")),
                        continent: Optional(Nullable<String>.value("Dana Whitfield")),
                        country: Optional(Nullable<String>.value("Dana Whitfield"))
                    )),
                    ltv: Optional(149.98),
                    member: Optional(Nullable<ListPeopleResponseDataItemMember>.value(ListPeopleResponseDataItemMember(
                        id: "mem_dana1",
                        joinedAt: Optional(Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601))),
                        status: Optional(Nullable<String>.value("Dana Whitfield")),
                        usdTotalSpend: Optional(149.98)
                    ))),
                    name: Optional(Nullable<String>.value("Dana Whitfield")),
                    phone: Optional(Nullable<String>.value("+xxxxxxxxxxx")),
                    purchaseCount: 2,
                    timezone: Optional(Nullable<String>.value("Dana Whitfield")),
                    user: Optional(Nullable<ListPeopleResponseDataItemUser>.value(ListPeopleResponseDataItemUser(
                        id: "user_dana1",
                        name: Optional(Nullable<String>.value("Dana Whitfield")),
                        profilePicUrl: Optional(Nullable<String>.value("Dana Whitfield")),
                        username: "danawhitfield"
                    )))
                )
            ],
            pageInfo: ListPeopleResponsePageInfo(
                endCursor: Optional(Nullable<String>.value("cursor_end")),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Optional(Nullable<String>.value("cursor_start"))
            ),
            totalCount: Optional(42)
        )
        let response = try await client.people.list(
            source: [
                "direct"
            ],
            eventName: [
                "payment.completed"
            ],
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
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
                      "aov": 1.1,
                      "device": {
                        "browser": "browser",
                        "device": "device",
                        "os": "os"
                      },
                      "email": "email",
                      "event_count": 1,
                      "first_purchase_at": "2024-01-15T09:30:00Z",
                      "first_seen_at": "2024-01-15T09:30:00Z",
                      "first_source": {
                        "ad": {
                          "id": "id",
                          "name": null,
                          "thumbnail_url": null
                        },
                        "ad_group": {
                          "id": "id",
                          "name": null,
                          "thumbnail_url": null
                        },
                        "campaign": {
                          "id": "id",
                          "name": null,
                          "thumbnail_url": null
                        },
                        "domain": "domain",
                        "occurred_at": "2024-01-15T09:30:00Z",
                        "platform": "platform",
                        "type": "ad_click",
                        "utm_source": "utm_source"
                      },
                      "id": "id",
                      "last_ip": "last_ip",
                      "last_purchase_at": "2024-01-15T09:30:00Z",
                      "last_seen_at": "2024-01-15T09:30:00Z",
                      "last_source": {
                        "ad": {
                          "id": "id",
                          "name": null,
                          "thumbnail_url": null
                        },
                        "ad_group": {
                          "id": "id",
                          "name": null,
                          "thumbnail_url": null
                        },
                        "campaign": {
                          "id": "id",
                          "name": null,
                          "thumbnail_url": null
                        },
                        "domain": "domain",
                        "occurred_at": "2024-01-15T09:30:00Z",
                        "platform": "platform",
                        "type": "ad_click",
                        "utm_source": "utm_source"
                      },
                      "location": {
                        "city": "city",
                        "continent": "continent",
                        "country": "country"
                      },
                      "ltv": 1.1,
                      "member": {
                        "id": "id",
                        "joined_at": "2024-01-15T09:30:00Z",
                        "status": "status",
                        "usd_total_spend": 1.1
                      },
                      "name": "name",
                      "phone": "phone",
                      "purchase_count": 1,
                      "timezone": "timezone",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_pic_url": "profile_pic_url",
                        "username": "username"
                      }
                    },
                    {
                      "account_id": "account_id",
                      "aov": 1.1,
                      "device": {
                        "browser": "browser",
                        "device": "device",
                        "os": "os"
                      },
                      "email": "email",
                      "event_count": 1,
                      "first_purchase_at": "2024-01-15T09:30:00Z",
                      "first_seen_at": "2024-01-15T09:30:00Z",
                      "first_source": {
                        "ad": {
                          "id": "id",
                          "name": null,
                          "thumbnail_url": null
                        },
                        "ad_group": {
                          "id": "id",
                          "name": null,
                          "thumbnail_url": null
                        },
                        "campaign": {
                          "id": "id",
                          "name": null,
                          "thumbnail_url": null
                        },
                        "domain": "domain",
                        "occurred_at": "2024-01-15T09:30:00Z",
                        "platform": "platform",
                        "type": "ad_click",
                        "utm_source": "utm_source"
                      },
                      "id": "id",
                      "last_ip": "last_ip",
                      "last_purchase_at": "2024-01-15T09:30:00Z",
                      "last_seen_at": "2024-01-15T09:30:00Z",
                      "last_source": {
                        "ad": {
                          "id": "id",
                          "name": null,
                          "thumbnail_url": null
                        },
                        "ad_group": {
                          "id": "id",
                          "name": null,
                          "thumbnail_url": null
                        },
                        "campaign": {
                          "id": "id",
                          "name": null,
                          "thumbnail_url": null
                        },
                        "domain": "domain",
                        "occurred_at": "2024-01-15T09:30:00Z",
                        "platform": "platform",
                        "type": "ad_click",
                        "utm_source": "utm_source"
                      },
                      "location": {
                        "city": "city",
                        "continent": "continent",
                        "country": "country"
                      },
                      "ltv": 1.1,
                      "member": {
                        "id": "id",
                        "joined_at": "2024-01-15T09:30:00Z",
                        "status": "status",
                        "usd_total_spend": 1.1
                      },
                      "name": "name",
                      "phone": "phone",
                      "purchase_count": 1,
                      "timezone": "timezone",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_pic_url": "profile_pic_url",
                        "username": "username"
                      }
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": true,
                    "has_previous_page": true,
                    "start_cursor": "start_cursor"
                  },
                  "total_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListPeopleResponse(
            data: [
                ListPeopleResponseDataItem(
                    accountId: "account_id",
                    aov: Optional(1.1),
                    device: Optional(ListPeopleResponseDataItemDevice(
                        browser: Optional(Nullable<String>.value("browser")),
                        device: Optional(Nullable<String>.value("device")),
                        os: Optional(Nullable<String>.value("os"))
                    )),
                    email: Optional(Nullable<String>.value("email")),
                    eventCount: 1,
                    firstPurchaseAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                    firstSeenAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    firstSource: Optional(Nullable<ListPeopleResponseDataItemFirstSource>.value(ListPeopleResponseDataItemFirstSource(
                        ad: Optional(Nullable<ListPeopleResponseDataItemFirstSourceAd>.value(ListPeopleResponseDataItemFirstSourceAd(
                            id: "id",
                            name: Optional(.null),
                            thumbnailUrl: Optional(.null)
                        ))),
                        adGroup: Optional(Nullable<ListPeopleResponseDataItemFirstSourceAdGroup>.value(ListPeopleResponseDataItemFirstSourceAdGroup(
                            id: "id",
                            name: Optional(.null),
                            thumbnailUrl: Optional(.null)
                        ))),
                        campaign: Optional(Nullable<ListPeopleResponseDataItemFirstSourceCampaign>.value(ListPeopleResponseDataItemFirstSourceCampaign(
                            id: "id",
                            name: Optional(.null),
                            thumbnailUrl: Optional(.null)
                        ))),
                        domain: Optional(Nullable<String>.value("domain")),
                        occurredAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                        platform: Optional(Nullable<String>.value("platform")),
                        type: ListPeopleResponseDataItemFirstSourceType.adClick,
                        utmSource: Optional(Nullable<String>.value("utm_source"))
                    ))),
                    id: "id",
                    lastIp: Optional(Nullable<String>.value("last_ip")),
                    lastPurchaseAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                    lastSeenAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    lastSource: Optional(Nullable<ListPeopleResponseDataItemLastSource>.value(ListPeopleResponseDataItemLastSource(
                        ad: Optional(Nullable<ListPeopleResponseDataItemLastSourceAd>.value(ListPeopleResponseDataItemLastSourceAd(
                            id: "id",
                            name: Optional(.null),
                            thumbnailUrl: Optional(.null)
                        ))),
                        adGroup: Optional(Nullable<ListPeopleResponseDataItemLastSourceAdGroup>.value(ListPeopleResponseDataItemLastSourceAdGroup(
                            id: "id",
                            name: Optional(.null),
                            thumbnailUrl: Optional(.null)
                        ))),
                        campaign: Optional(Nullable<ListPeopleResponseDataItemLastSourceCampaign>.value(ListPeopleResponseDataItemLastSourceCampaign(
                            id: "id",
                            name: Optional(.null),
                            thumbnailUrl: Optional(.null)
                        ))),
                        domain: Optional(Nullable<String>.value("domain")),
                        occurredAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                        platform: Optional(Nullable<String>.value("platform")),
                        type: ListPeopleResponseDataItemLastSourceType.adClick,
                        utmSource: Optional(Nullable<String>.value("utm_source"))
                    ))),
                    location: Optional(ListPeopleResponseDataItemLocation(
                        city: Optional(Nullable<String>.value("city")),
                        continent: Optional(Nullable<String>.value("continent")),
                        country: Optional(Nullable<String>.value("country"))
                    )),
                    ltv: Optional(1.1),
                    member: Optional(Nullable<ListPeopleResponseDataItemMember>.value(ListPeopleResponseDataItemMember(
                        id: "id",
                        joinedAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                        status: Optional(Nullable<String>.value("status")),
                        usdTotalSpend: Optional(1.1)
                    ))),
                    name: Optional(Nullable<String>.value("name")),
                    phone: Optional(Nullable<String>.value("phone")),
                    purchaseCount: 1,
                    timezone: Optional(Nullable<String>.value("timezone")),
                    user: Optional(Nullable<ListPeopleResponseDataItemUser>.value(ListPeopleResponseDataItemUser(
                        id: "id",
                        name: Optional(Nullable<String>.value("name")),
                        profilePicUrl: Optional(Nullable<String>.value("profile_pic_url")),
                        username: "username"
                    )))
                ),
                ListPeopleResponseDataItem(
                    accountId: "account_id",
                    aov: Optional(1.1),
                    device: Optional(ListPeopleResponseDataItemDevice(
                        browser: Optional(Nullable<String>.value("browser")),
                        device: Optional(Nullable<String>.value("device")),
                        os: Optional(Nullable<String>.value("os"))
                    )),
                    email: Optional(Nullable<String>.value("email")),
                    eventCount: 1,
                    firstPurchaseAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                    firstSeenAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    firstSource: Optional(Nullable<ListPeopleResponseDataItemFirstSource>.value(ListPeopleResponseDataItemFirstSource(
                        ad: Optional(Nullable<ListPeopleResponseDataItemFirstSourceAd>.value(ListPeopleResponseDataItemFirstSourceAd(
                            id: "id",
                            name: Optional(.null),
                            thumbnailUrl: Optional(.null)
                        ))),
                        adGroup: Optional(Nullable<ListPeopleResponseDataItemFirstSourceAdGroup>.value(ListPeopleResponseDataItemFirstSourceAdGroup(
                            id: "id",
                            name: Optional(.null),
                            thumbnailUrl: Optional(.null)
                        ))),
                        campaign: Optional(Nullable<ListPeopleResponseDataItemFirstSourceCampaign>.value(ListPeopleResponseDataItemFirstSourceCampaign(
                            id: "id",
                            name: Optional(.null),
                            thumbnailUrl: Optional(.null)
                        ))),
                        domain: Optional(Nullable<String>.value("domain")),
                        occurredAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                        platform: Optional(Nullable<String>.value("platform")),
                        type: ListPeopleResponseDataItemFirstSourceType.adClick,
                        utmSource: Optional(Nullable<String>.value("utm_source"))
                    ))),
                    id: "id",
                    lastIp: Optional(Nullable<String>.value("last_ip")),
                    lastPurchaseAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                    lastSeenAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    lastSource: Optional(Nullable<ListPeopleResponseDataItemLastSource>.value(ListPeopleResponseDataItemLastSource(
                        ad: Optional(Nullable<ListPeopleResponseDataItemLastSourceAd>.value(ListPeopleResponseDataItemLastSourceAd(
                            id: "id",
                            name: Optional(.null),
                            thumbnailUrl: Optional(.null)
                        ))),
                        adGroup: Optional(Nullable<ListPeopleResponseDataItemLastSourceAdGroup>.value(ListPeopleResponseDataItemLastSourceAdGroup(
                            id: "id",
                            name: Optional(.null),
                            thumbnailUrl: Optional(.null)
                        ))),
                        campaign: Optional(Nullable<ListPeopleResponseDataItemLastSourceCampaign>.value(ListPeopleResponseDataItemLastSourceCampaign(
                            id: "id",
                            name: Optional(.null),
                            thumbnailUrl: Optional(.null)
                        ))),
                        domain: Optional(Nullable<String>.value("domain")),
                        occurredAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                        platform: Optional(Nullable<String>.value("platform")),
                        type: ListPeopleResponseDataItemLastSourceType.adClick,
                        utmSource: Optional(Nullable<String>.value("utm_source"))
                    ))),
                    location: Optional(ListPeopleResponseDataItemLocation(
                        city: Optional(Nullable<String>.value("city")),
                        continent: Optional(Nullable<String>.value("continent")),
                        country: Optional(Nullable<String>.value("country"))
                    )),
                    ltv: Optional(1.1),
                    member: Optional(Nullable<ListPeopleResponseDataItemMember>.value(ListPeopleResponseDataItemMember(
                        id: "id",
                        joinedAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                        status: Optional(Nullable<String>.value("status")),
                        usdTotalSpend: Optional(1.1)
                    ))),
                    name: Optional(Nullable<String>.value("name")),
                    phone: Optional(Nullable<String>.value("phone")),
                    purchaseCount: 1,
                    timezone: Optional(Nullable<String>.value("timezone")),
                    user: Optional(Nullable<ListPeopleResponseDataItemUser>.value(ListPeopleResponseDataItemUser(
                        id: "id",
                        name: Optional(Nullable<String>.value("name")),
                        profilePicUrl: Optional(Nullable<String>.value("profile_pic_url")),
                        username: "username"
                    )))
                )
            ],
            pageInfo: ListPeopleResponsePageInfo(
                endCursor: Optional(Nullable<String>.value("end_cursor")),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Optional(Nullable<String>.value("start_cursor"))
            ),
            totalCount: Optional(1)
        )
        let response = try await client.people.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "aov": 74.99,
                  "audience_ids": [
                    "Dana Whitfield"
                  ],
                  "custom_event_names": [
                    "Dana Whitfield"
                  ],
                  "device": {
                    "browser": "Dana Whitfield",
                    "device": "Dana Whitfield",
                    "os": "Dana Whitfield"
                  },
                  "email": "marcus@shinetime.example",
                  "emails": [
                    "Dana Whitfield"
                  ],
                  "event_count": 42,
                  "event_names": [
                    "Dana Whitfield"
                  ],
                  "first_purchase_at": "2026-01-01T12:00:00Z",
                  "first_seen_at": "2026-01-01T12:00:00Z",
                  "first_source": {
                    "ad": {
                      "id": "adcamp_1",
                      "name": "Dana Whitfield",
                      "thumbnail_url": "Dana Whitfield"
                    },
                    "ad_group": {
                      "id": "adcamp_1",
                      "name": "Dana Whitfield",
                      "thumbnail_url": "Dana Whitfield"
                    },
                    "campaign": {
                      "id": "adcamp_1",
                      "name": "Dana Whitfield",
                      "thumbnail_url": "Dana Whitfield"
                    },
                    "domain": "Dana Whitfield",
                    "occurred_at": "2026-01-01T12:00:00Z",
                    "platform": "Dana Whitfield",
                    "type": "ad_click",
                    "utm_source": "Dana Whitfield"
                  },
                  "id": "prsn_123",
                  "last_ip": "Dana Whitfield",
                  "last_purchase_at": "2026-01-01T12:00:00Z",
                  "last_seen_at": "2026-01-01T12:00:00Z",
                  "last_source": {
                    "ad": {
                      "id": "adcamp_1",
                      "name": "Dana Whitfield",
                      "thumbnail_url": "Dana Whitfield"
                    },
                    "ad_group": {
                      "id": "adcamp_1",
                      "name": "Dana Whitfield",
                      "thumbnail_url": "Dana Whitfield"
                    },
                    "campaign": {
                      "id": "adcamp_1",
                      "name": "Dana Whitfield",
                      "thumbnail_url": "Dana Whitfield"
                    },
                    "domain": "Dana Whitfield",
                    "occurred_at": "2026-01-01T12:00:00Z",
                    "platform": "Dana Whitfield",
                    "type": "ad_click",
                    "utm_source": "Dana Whitfield"
                  },
                  "location": {
                    "city": "Dana Whitfield",
                    "continent": "Dana Whitfield",
                    "country": "Dana Whitfield"
                  },
                  "ltv": 149.98,
                  "member": {
                    "id": "mem_dana1",
                    "joined_at": "2026-01-01T12:00:00Z",
                    "status": "Dana Whitfield",
                    "usd_total_spend": 149.98
                  },
                  "name": "Dana Whitfield",
                  "names": [
                    "Dana Whitfield"
                  ],
                  "phone": "+xxxxxxxxxxx",
                  "phones": [
                    "Dana Whitfield"
                  ],
                  "purchase_count": 2,
                  "purchases": [
                    {
                      "event_id": "evt_2",
                      "occurred_at": "2026-01-01T12:00:00Z",
                      "usd_value": 74.99
                    }
                  ],
                  "roles": [
                    "Dana Whitfield"
                  ],
                  "sources": [
                    {
                      "ad": {
                        "id": "adcamp_1",
                        "name": "Dana Whitfield",
                        "thumbnail_url": "Dana Whitfield"
                      },
                      "ad_group": {
                        "id": "adcamp_1",
                        "name": "Dana Whitfield",
                        "thumbnail_url": "Dana Whitfield"
                      },
                      "campaign": {
                        "id": "adcamp_1",
                        "name": "Dana Whitfield",
                        "thumbnail_url": "Dana Whitfield"
                      },
                      "domain": "Dana Whitfield",
                      "occurred_at": "2026-01-01T12:00:00Z",
                      "platform": "Dana Whitfield",
                      "type": "ad_click",
                      "utm_source": "Dana Whitfield"
                    }
                  ],
                  "timezone": "Dana Whitfield",
                  "usage": {
                    "browser": [
                      {
                        "events": 10,
                        "value": "Chrome"
                      }
                    ],
                    "city": [
                      {
                        "events": 9,
                        "value": "Austin"
                      }
                    ],
                    "country": [
                      {
                        "events": 12,
                        "value": "US"
                      }
                    ],
                    "device": [
                      {
                        "events": 5,
                        "value": "iPhone"
                      }
                    ],
                    "ip": [
                      {
                        "events": 3,
                        "value": "1.1.1.1"
                      }
                    ],
                    "os": [
                      {
                        "events": 7,
                        "value": "Mac OS X"
                      }
                    ],
                    "referrer": [
                      {
                        "events": 4,
                        "value": "google.com"
                      }
                    ],
                    "timezone": [
                      {
                        "events": 12,
                        "value": "America/Chicago"
                      }
                    ]
                  },
                  "user": {
                    "id": "user_dana1",
                    "name": "Dana Whitfield",
                    "profile_pic_url": "Dana Whitfield",
                    "username": "danawhitfield"
                  },
                  "user_ids": [
                    "Dana Whitfield"
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
        let expectedResponse = RetrievePeopleResponse(
            accountId: "biz_xxxxxxxxxxxxxx",
            aov: Optional(74.99),
            audienceIds: Optional([
                "Dana Whitfield"
            ]),
            customEventNames: Optional([
                "Dana Whitfield"
            ]),
            device: Optional(RetrievePeopleResponseDevice(
                browser: Optional(Nullable<String>.value("Dana Whitfield")),
                device: Optional(Nullable<String>.value("Dana Whitfield")),
                os: Optional(Nullable<String>.value("Dana Whitfield"))
            )),
            email: Optional(Nullable<String>.value("marcus@shinetime.example")),
            emails: Optional([
                "Dana Whitfield"
            ]),
            eventCount: 42,
            eventNames: Optional([
                "Dana Whitfield"
            ]),
            firstPurchaseAt: Optional(Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601))),
            firstSeenAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
            firstSource: Optional(Nullable<RetrievePeopleResponseFirstSource>.value(RetrievePeopleResponseFirstSource(
                ad: Optional(Nullable<RetrievePeopleResponseFirstSourceAd>.value(RetrievePeopleResponseFirstSourceAd(
                    id: "adcamp_1",
                    name: Optional(Nullable<String>.value("Dana Whitfield")),
                    thumbnailUrl: Optional(Nullable<String>.value("Dana Whitfield"))
                ))),
                adGroup: Optional(Nullable<RetrievePeopleResponseFirstSourceAdGroup>.value(RetrievePeopleResponseFirstSourceAdGroup(
                    id: "adcamp_1",
                    name: Optional(Nullable<String>.value("Dana Whitfield")),
                    thumbnailUrl: Optional(Nullable<String>.value("Dana Whitfield"))
                ))),
                campaign: Optional(Nullable<RetrievePeopleResponseFirstSourceCampaign>.value(RetrievePeopleResponseFirstSourceCampaign(
                    id: "adcamp_1",
                    name: Optional(Nullable<String>.value("Dana Whitfield")),
                    thumbnailUrl: Optional(Nullable<String>.value("Dana Whitfield"))
                ))),
                domain: Optional(Nullable<String>.value("Dana Whitfield")),
                occurredAt: Optional(Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601))),
                platform: Optional(Nullable<String>.value("Dana Whitfield")),
                type: RetrievePeopleResponseFirstSourceType.adClick,
                utmSource: Optional(Nullable<String>.value("Dana Whitfield"))
            ))),
            id: "prsn_123",
            lastIp: Optional(Nullable<String>.value("Dana Whitfield")),
            lastPurchaseAt: Optional(Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601))),
            lastSeenAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
            lastSource: Optional(Nullable<RetrievePeopleResponseLastSource>.value(RetrievePeopleResponseLastSource(
                ad: Optional(Nullable<RetrievePeopleResponseLastSourceAd>.value(RetrievePeopleResponseLastSourceAd(
                    id: "adcamp_1",
                    name: Optional(Nullable<String>.value("Dana Whitfield")),
                    thumbnailUrl: Optional(Nullable<String>.value("Dana Whitfield"))
                ))),
                adGroup: Optional(Nullable<RetrievePeopleResponseLastSourceAdGroup>.value(RetrievePeopleResponseLastSourceAdGroup(
                    id: "adcamp_1",
                    name: Optional(Nullable<String>.value("Dana Whitfield")),
                    thumbnailUrl: Optional(Nullable<String>.value("Dana Whitfield"))
                ))),
                campaign: Optional(Nullable<RetrievePeopleResponseLastSourceCampaign>.value(RetrievePeopleResponseLastSourceCampaign(
                    id: "adcamp_1",
                    name: Optional(Nullable<String>.value("Dana Whitfield")),
                    thumbnailUrl: Optional(Nullable<String>.value("Dana Whitfield"))
                ))),
                domain: Optional(Nullable<String>.value("Dana Whitfield")),
                occurredAt: Optional(Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601))),
                platform: Optional(Nullable<String>.value("Dana Whitfield")),
                type: RetrievePeopleResponseLastSourceType.adClick,
                utmSource: Optional(Nullable<String>.value("Dana Whitfield"))
            ))),
            location: Optional(RetrievePeopleResponseLocation(
                city: Optional(Nullable<String>.value("Dana Whitfield")),
                continent: Optional(Nullable<String>.value("Dana Whitfield")),
                country: Optional(Nullable<String>.value("Dana Whitfield"))
            )),
            ltv: Optional(149.98),
            member: Optional(Nullable<RetrievePeopleResponseMember>.value(RetrievePeopleResponseMember(
                id: "mem_dana1",
                joinedAt: Optional(Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601))),
                status: Optional(Nullable<String>.value("Dana Whitfield")),
                usdTotalSpend: Optional(149.98)
            ))),
            name: Optional(Nullable<String>.value("Dana Whitfield")),
            names: Optional([
                "Dana Whitfield"
            ]),
            phone: Optional(Nullable<String>.value("+xxxxxxxxxxx")),
            phones: Optional([
                "Dana Whitfield"
            ]),
            purchaseCount: 2,
            purchases: Optional([
                RetrievePeopleResponsePurchasesItem(
                    eventId: "evt_2",
                    occurredAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                    usdValue: 74.99
                )
            ]),
            roles: Optional([
                "Dana Whitfield"
            ]),
            sources: Optional([
                RetrievePeopleResponseSourcesItem(
                    ad: Optional(Nullable<RetrievePeopleResponseSourcesItemAd>.value(RetrievePeopleResponseSourcesItemAd(
                        id: "adcamp_1",
                        name: Optional(Nullable<String>.value("Dana Whitfield")),
                        thumbnailUrl: Optional(Nullable<String>.value("Dana Whitfield"))
                    ))),
                    adGroup: Optional(Nullable<RetrievePeopleResponseSourcesItemAdGroup>.value(RetrievePeopleResponseSourcesItemAdGroup(
                        id: "adcamp_1",
                        name: Optional(Nullable<String>.value("Dana Whitfield")),
                        thumbnailUrl: Optional(Nullable<String>.value("Dana Whitfield"))
                    ))),
                    campaign: Optional(Nullable<RetrievePeopleResponseSourcesItemCampaign>.value(RetrievePeopleResponseSourcesItemCampaign(
                        id: "adcamp_1",
                        name: Optional(Nullable<String>.value("Dana Whitfield")),
                        thumbnailUrl: Optional(Nullable<String>.value("Dana Whitfield"))
                    ))),
                    domain: Optional(Nullable<String>.value("Dana Whitfield")),
                    occurredAt: Optional(Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601))),
                    platform: Optional(Nullable<String>.value("Dana Whitfield")),
                    type: RetrievePeopleResponseSourcesItemType.adClick,
                    utmSource: Optional(Nullable<String>.value("Dana Whitfield"))
                )
            ]),
            timezone: Optional(Nullable<String>.value("Dana Whitfield")),
            usage: Optional(RetrievePeopleResponseUsage(
                browser: Optional([
                    RetrievePeopleResponseUsageBrowserItem(
                        events: 10,
                        value: "Chrome"
                    )
                ]),
                city: Optional([
                    RetrievePeopleResponseUsageCityItem(
                        events: 9,
                        value: "Austin"
                    )
                ]),
                country: Optional([
                    RetrievePeopleResponseUsageCountryItem(
                        events: 12,
                        value: "US"
                    )
                ]),
                device: Optional([
                    RetrievePeopleResponseUsageDeviceItem(
                        events: 5,
                        value: "iPhone"
                    )
                ]),
                ip: Optional([
                    RetrievePeopleResponseUsageIpItem(
                        events: 3,
                        value: "1.1.1.1"
                    )
                ]),
                os: Optional([
                    RetrievePeopleResponseUsageOsItem(
                        events: 7,
                        value: "Mac OS X"
                    )
                ]),
                referrer: Optional([
                    RetrievePeopleResponseUsageReferrerItem(
                        events: 4,
                        value: "google.com"
                    )
                ]),
                timezone: Optional([
                    RetrievePeopleResponseUsageTimezoneItem(
                        events: 12,
                        value: "America/Chicago"
                    )
                ])
            )),
            user: Optional(Nullable<RetrievePeopleResponseUser>.value(RetrievePeopleResponseUser(
                id: "user_dana1",
                name: Optional(Nullable<String>.value("Dana Whitfield")),
                profilePicUrl: Optional(Nullable<String>.value("Dana Whitfield")),
                username: "danawhitfield"
            ))),
            userIds: Optional([
                "Dana Whitfield"
            ])
        )
        let response = try await client.people.retrieve(
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
                  "aov": 1.1,
                  "audience_ids": [
                    "audience_ids",
                    "audience_ids"
                  ],
                  "custom_event_names": [
                    "custom_event_names",
                    "custom_event_names"
                  ],
                  "device": {
                    "browser": "browser",
                    "device": "device",
                    "os": "os"
                  },
                  "email": "email",
                  "emails": [
                    "emails",
                    "emails"
                  ],
                  "event_count": 1,
                  "event_names": [
                    "event_names",
                    "event_names"
                  ],
                  "first_purchase_at": "2024-01-15T09:30:00Z",
                  "first_seen_at": "2024-01-15T09:30:00Z",
                  "first_source": {
                    "ad": {
                      "id": "id",
                      "name": "name",
                      "thumbnail_url": "thumbnail_url"
                    },
                    "ad_group": {
                      "id": "id",
                      "name": "name",
                      "thumbnail_url": "thumbnail_url"
                    },
                    "campaign": {
                      "id": "id",
                      "name": "name",
                      "thumbnail_url": "thumbnail_url"
                    },
                    "domain": "domain",
                    "occurred_at": "2024-01-15T09:30:00Z",
                    "platform": "platform",
                    "type": "ad_click",
                    "utm_source": "utm_source"
                  },
                  "id": "id",
                  "last_ip": "last_ip",
                  "last_purchase_at": "2024-01-15T09:30:00Z",
                  "last_seen_at": "2024-01-15T09:30:00Z",
                  "last_source": {
                    "ad": {
                      "id": "id",
                      "name": "name",
                      "thumbnail_url": "thumbnail_url"
                    },
                    "ad_group": {
                      "id": "id",
                      "name": "name",
                      "thumbnail_url": "thumbnail_url"
                    },
                    "campaign": {
                      "id": "id",
                      "name": "name",
                      "thumbnail_url": "thumbnail_url"
                    },
                    "domain": "domain",
                    "occurred_at": "2024-01-15T09:30:00Z",
                    "platform": "platform",
                    "type": "ad_click",
                    "utm_source": "utm_source"
                  },
                  "location": {
                    "city": "city",
                    "continent": "continent",
                    "country": "country"
                  },
                  "ltv": 1.1,
                  "member": {
                    "id": "id",
                    "joined_at": "2024-01-15T09:30:00Z",
                    "status": "status",
                    "usd_total_spend": 1.1
                  },
                  "name": "name",
                  "names": [
                    "names",
                    "names"
                  ],
                  "phone": "phone",
                  "phones": [
                    "phones",
                    "phones"
                  ],
                  "purchase_count": 1,
                  "purchases": [
                    {
                      "event_id": "event_id",
                      "occurred_at": "2024-01-15T09:30:00Z",
                      "usd_value": 1.1
                    },
                    {
                      "event_id": "event_id",
                      "occurred_at": "2024-01-15T09:30:00Z",
                      "usd_value": 1.1
                    }
                  ],
                  "roles": [
                    "roles",
                    "roles"
                  ],
                  "sources": [
                    {
                      "ad": {
                        "id": "id",
                        "name": "name",
                        "thumbnail_url": "thumbnail_url"
                      },
                      "ad_group": {
                        "id": "id",
                        "name": "name",
                        "thumbnail_url": "thumbnail_url"
                      },
                      "campaign": {
                        "id": "id",
                        "name": "name",
                        "thumbnail_url": "thumbnail_url"
                      },
                      "domain": "domain",
                      "occurred_at": "2024-01-15T09:30:00Z",
                      "platform": "platform",
                      "type": "ad_click",
                      "utm_source": "utm_source"
                    },
                    {
                      "ad": {
                        "id": "id",
                        "name": "name",
                        "thumbnail_url": "thumbnail_url"
                      },
                      "ad_group": {
                        "id": "id",
                        "name": "name",
                        "thumbnail_url": "thumbnail_url"
                      },
                      "campaign": {
                        "id": "id",
                        "name": "name",
                        "thumbnail_url": "thumbnail_url"
                      },
                      "domain": "domain",
                      "occurred_at": "2024-01-15T09:30:00Z",
                      "platform": "platform",
                      "type": "ad_click",
                      "utm_source": "utm_source"
                    }
                  ],
                  "timezone": "timezone",
                  "usage": {
                    "browser": [
                      {
                        "events": 1,
                        "value": "value"
                      },
                      {
                        "events": 1,
                        "value": "value"
                      }
                    ],
                    "city": [
                      {
                        "events": 1,
                        "value": "value"
                      },
                      {
                        "events": 1,
                        "value": "value"
                      }
                    ],
                    "country": [
                      {
                        "events": 1,
                        "value": "value"
                      },
                      {
                        "events": 1,
                        "value": "value"
                      }
                    ],
                    "device": [
                      {
                        "events": 1,
                        "value": "value"
                      },
                      {
                        "events": 1,
                        "value": "value"
                      }
                    ],
                    "ip": [
                      {
                        "events": 1,
                        "value": "value"
                      },
                      {
                        "events": 1,
                        "value": "value"
                      }
                    ],
                    "os": [
                      {
                        "events": 1,
                        "value": "value"
                      },
                      {
                        "events": 1,
                        "value": "value"
                      }
                    ],
                    "referrer": [
                      {
                        "events": 1,
                        "value": "value"
                      },
                      {
                        "events": 1,
                        "value": "value"
                      }
                    ],
                    "timezone": [
                      {
                        "events": 1,
                        "value": "value"
                      },
                      {
                        "events": 1,
                        "value": "value"
                      }
                    ]
                  },
                  "user": {
                    "id": "id",
                    "name": "name",
                    "profile_pic_url": "profile_pic_url",
                    "username": "username"
                  },
                  "user_ids": [
                    "user_ids",
                    "user_ids"
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
        let expectedResponse = RetrievePeopleResponse(
            accountId: "account_id",
            aov: Optional(1.1),
            audienceIds: Optional([
                "audience_ids",
                "audience_ids"
            ]),
            customEventNames: Optional([
                "custom_event_names",
                "custom_event_names"
            ]),
            device: Optional(RetrievePeopleResponseDevice(
                browser: Optional(Nullable<String>.value("browser")),
                device: Optional(Nullable<String>.value("device")),
                os: Optional(Nullable<String>.value("os"))
            )),
            email: Optional(Nullable<String>.value("email")),
            emails: Optional([
                "emails",
                "emails"
            ]),
            eventCount: 1,
            eventNames: Optional([
                "event_names",
                "event_names"
            ]),
            firstPurchaseAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
            firstSeenAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            firstSource: Optional(Nullable<RetrievePeopleResponseFirstSource>.value(RetrievePeopleResponseFirstSource(
                ad: Optional(Nullable<RetrievePeopleResponseFirstSourceAd>.value(RetrievePeopleResponseFirstSourceAd(
                    id: "id",
                    name: Optional(Nullable<String>.value("name")),
                    thumbnailUrl: Optional(Nullable<String>.value("thumbnail_url"))
                ))),
                adGroup: Optional(Nullable<RetrievePeopleResponseFirstSourceAdGroup>.value(RetrievePeopleResponseFirstSourceAdGroup(
                    id: "id",
                    name: Optional(Nullable<String>.value("name")),
                    thumbnailUrl: Optional(Nullable<String>.value("thumbnail_url"))
                ))),
                campaign: Optional(Nullable<RetrievePeopleResponseFirstSourceCampaign>.value(RetrievePeopleResponseFirstSourceCampaign(
                    id: "id",
                    name: Optional(Nullable<String>.value("name")),
                    thumbnailUrl: Optional(Nullable<String>.value("thumbnail_url"))
                ))),
                domain: Optional(Nullable<String>.value("domain")),
                occurredAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                platform: Optional(Nullable<String>.value("platform")),
                type: RetrievePeopleResponseFirstSourceType.adClick,
                utmSource: Optional(Nullable<String>.value("utm_source"))
            ))),
            id: "id",
            lastIp: Optional(Nullable<String>.value("last_ip")),
            lastPurchaseAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
            lastSeenAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            lastSource: Optional(Nullable<RetrievePeopleResponseLastSource>.value(RetrievePeopleResponseLastSource(
                ad: Optional(Nullable<RetrievePeopleResponseLastSourceAd>.value(RetrievePeopleResponseLastSourceAd(
                    id: "id",
                    name: Optional(Nullable<String>.value("name")),
                    thumbnailUrl: Optional(Nullable<String>.value("thumbnail_url"))
                ))),
                adGroup: Optional(Nullable<RetrievePeopleResponseLastSourceAdGroup>.value(RetrievePeopleResponseLastSourceAdGroup(
                    id: "id",
                    name: Optional(Nullable<String>.value("name")),
                    thumbnailUrl: Optional(Nullable<String>.value("thumbnail_url"))
                ))),
                campaign: Optional(Nullable<RetrievePeopleResponseLastSourceCampaign>.value(RetrievePeopleResponseLastSourceCampaign(
                    id: "id",
                    name: Optional(Nullable<String>.value("name")),
                    thumbnailUrl: Optional(Nullable<String>.value("thumbnail_url"))
                ))),
                domain: Optional(Nullable<String>.value("domain")),
                occurredAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                platform: Optional(Nullable<String>.value("platform")),
                type: RetrievePeopleResponseLastSourceType.adClick,
                utmSource: Optional(Nullable<String>.value("utm_source"))
            ))),
            location: Optional(RetrievePeopleResponseLocation(
                city: Optional(Nullable<String>.value("city")),
                continent: Optional(Nullable<String>.value("continent")),
                country: Optional(Nullable<String>.value("country"))
            )),
            ltv: Optional(1.1),
            member: Optional(Nullable<RetrievePeopleResponseMember>.value(RetrievePeopleResponseMember(
                id: "id",
                joinedAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                status: Optional(Nullable<String>.value("status")),
                usdTotalSpend: Optional(1.1)
            ))),
            name: Optional(Nullable<String>.value("name")),
            names: Optional([
                "names",
                "names"
            ]),
            phone: Optional(Nullable<String>.value("phone")),
            phones: Optional([
                "phones",
                "phones"
            ]),
            purchaseCount: 1,
            purchases: Optional([
                RetrievePeopleResponsePurchasesItem(
                    eventId: "event_id",
                    occurredAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    usdValue: 1.1
                ),
                RetrievePeopleResponsePurchasesItem(
                    eventId: "event_id",
                    occurredAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    usdValue: 1.1
                )
            ]),
            roles: Optional([
                "roles",
                "roles"
            ]),
            sources: Optional([
                RetrievePeopleResponseSourcesItem(
                    ad: Optional(Nullable<RetrievePeopleResponseSourcesItemAd>.value(RetrievePeopleResponseSourcesItemAd(
                        id: "id",
                        name: Optional(Nullable<String>.value("name")),
                        thumbnailUrl: Optional(Nullable<String>.value("thumbnail_url"))
                    ))),
                    adGroup: Optional(Nullable<RetrievePeopleResponseSourcesItemAdGroup>.value(RetrievePeopleResponseSourcesItemAdGroup(
                        id: "id",
                        name: Optional(Nullable<String>.value("name")),
                        thumbnailUrl: Optional(Nullable<String>.value("thumbnail_url"))
                    ))),
                    campaign: Optional(Nullable<RetrievePeopleResponseSourcesItemCampaign>.value(RetrievePeopleResponseSourcesItemCampaign(
                        id: "id",
                        name: Optional(Nullable<String>.value("name")),
                        thumbnailUrl: Optional(Nullable<String>.value("thumbnail_url"))
                    ))),
                    domain: Optional(Nullable<String>.value("domain")),
                    occurredAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                    platform: Optional(Nullable<String>.value("platform")),
                    type: RetrievePeopleResponseSourcesItemType.adClick,
                    utmSource: Optional(Nullable<String>.value("utm_source"))
                ),
                RetrievePeopleResponseSourcesItem(
                    ad: Optional(Nullable<RetrievePeopleResponseSourcesItemAd>.value(RetrievePeopleResponseSourcesItemAd(
                        id: "id",
                        name: Optional(Nullable<String>.value("name")),
                        thumbnailUrl: Optional(Nullable<String>.value("thumbnail_url"))
                    ))),
                    adGroup: Optional(Nullable<RetrievePeopleResponseSourcesItemAdGroup>.value(RetrievePeopleResponseSourcesItemAdGroup(
                        id: "id",
                        name: Optional(Nullable<String>.value("name")),
                        thumbnailUrl: Optional(Nullable<String>.value("thumbnail_url"))
                    ))),
                    campaign: Optional(Nullable<RetrievePeopleResponseSourcesItemCampaign>.value(RetrievePeopleResponseSourcesItemCampaign(
                        id: "id",
                        name: Optional(Nullable<String>.value("name")),
                        thumbnailUrl: Optional(Nullable<String>.value("thumbnail_url"))
                    ))),
                    domain: Optional(Nullable<String>.value("domain")),
                    occurredAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                    platform: Optional(Nullable<String>.value("platform")),
                    type: RetrievePeopleResponseSourcesItemType.adClick,
                    utmSource: Optional(Nullable<String>.value("utm_source"))
                )
            ]),
            timezone: Optional(Nullable<String>.value("timezone")),
            usage: Optional(RetrievePeopleResponseUsage(
                browser: Optional([
                    RetrievePeopleResponseUsageBrowserItem(
                        events: 1,
                        value: "value"
                    ),
                    RetrievePeopleResponseUsageBrowserItem(
                        events: 1,
                        value: "value"
                    )
                ]),
                city: Optional([
                    RetrievePeopleResponseUsageCityItem(
                        events: 1,
                        value: "value"
                    ),
                    RetrievePeopleResponseUsageCityItem(
                        events: 1,
                        value: "value"
                    )
                ]),
                country: Optional([
                    RetrievePeopleResponseUsageCountryItem(
                        events: 1,
                        value: "value"
                    ),
                    RetrievePeopleResponseUsageCountryItem(
                        events: 1,
                        value: "value"
                    )
                ]),
                device: Optional([
                    RetrievePeopleResponseUsageDeviceItem(
                        events: 1,
                        value: "value"
                    ),
                    RetrievePeopleResponseUsageDeviceItem(
                        events: 1,
                        value: "value"
                    )
                ]),
                ip: Optional([
                    RetrievePeopleResponseUsageIpItem(
                        events: 1,
                        value: "value"
                    ),
                    RetrievePeopleResponseUsageIpItem(
                        events: 1,
                        value: "value"
                    )
                ]),
                os: Optional([
                    RetrievePeopleResponseUsageOsItem(
                        events: 1,
                        value: "value"
                    ),
                    RetrievePeopleResponseUsageOsItem(
                        events: 1,
                        value: "value"
                    )
                ]),
                referrer: Optional([
                    RetrievePeopleResponseUsageReferrerItem(
                        events: 1,
                        value: "value"
                    ),
                    RetrievePeopleResponseUsageReferrerItem(
                        events: 1,
                        value: "value"
                    )
                ]),
                timezone: Optional([
                    RetrievePeopleResponseUsageTimezoneItem(
                        events: 1,
                        value: "value"
                    ),
                    RetrievePeopleResponseUsageTimezoneItem(
                        events: 1,
                        value: "value"
                    )
                ])
            )),
            user: Optional(Nullable<RetrievePeopleResponseUser>.value(RetrievePeopleResponseUser(
                id: "id",
                name: Optional(Nullable<String>.value("name")),
                profilePicUrl: Optional(Nullable<String>.value("profile_pic_url")),
                username: "username"
            ))),
            userIds: Optional([
                "user_ids",
                "user_ids"
            ])
        )
        let response = try await client.people.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}