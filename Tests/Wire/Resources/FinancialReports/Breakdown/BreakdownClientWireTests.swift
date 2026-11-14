import Foundation
import Testing
import WhopSDK

@Suite("BreakdownClient Wire Tests") struct BreakdownClientWireTests {
    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "activity_filters": {
                    "direction": "money_in",
                    "line_types": [
                      "platform_balance_transfer_outgoing"
                    ]
                  },
                  "bucket": "transfers",
                  "currency": "usd",
                  "direction": "money_in",
                  "items": [
                    {
                      "amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "avatar": {
                        "shape": "circle",
                        "url": null
                      },
                      "image_url": "image_url",
                      "key": "key",
                      "name": "name",
                      "object": "user",
                      "resource_id": "resource_id"
                    }
                  ],
                  "other_amount": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "other_name": "Other"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RetrieveBreakdownResponse(
            activityFilters: RetrieveBreakdownResponseActivityFilters(
                direction: RetrieveBreakdownResponseActivityFiltersDirection.moneyIn,
                lineTypes: [
                    "platform_balance_transfer_outgoing"
                ]
            ),
            bucket: RetrieveBreakdownResponseBucket.transfers,
            currency: "usd",
            direction: RetrieveBreakdownResponseDirection.moneyIn,
            items: [
                RetrieveBreakdownResponseItemsItem(
                    amount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    avatar: Nullable<RetrieveBreakdownResponseItemsItemAvatar>.value(RetrieveBreakdownResponseItemsItemAvatar(
                        shape: RetrieveBreakdownResponseItemsItemAvatarShape.circle,
                        url: .null
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    key: "key",
                    name: "name",
                    object: RetrieveBreakdownResponseItemsItemObject.user,
                    resourceId: Nullable<String>.value("resource_id")
                )
            ],
            otherAmount: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            otherName: "Other"
        )
        let response = try await client.financialReports.breakdown.retrieve(
            accountId: "account_id",
            bucket: .transfers,
            direction: .moneyIn,
            currency: "currency",
            from: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            to: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
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
                  "activity_filters": {
                    "direction": "money_in",
                    "line_types": [
                      "line_types",
                      "line_types"
                    ]
                  },
                  "bucket": "transfers",
                  "currency": "currency",
                  "direction": "money_in",
                  "items": [
                    {
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "avatar": {
                        "shape": "circle",
                        "url": "url"
                      },
                      "image_url": "image_url",
                      "key": "key",
                      "name": "name",
                      "object": "user",
                      "resource_id": "resource_id"
                    },
                    {
                      "amount": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "avatar": {
                        "shape": "circle",
                        "url": "url"
                      },
                      "image_url": "image_url",
                      "key": "key",
                      "name": "name",
                      "object": "user",
                      "resource_id": "resource_id"
                    }
                  ],
                  "other_amount": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "other_name": "other_name"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RetrieveBreakdownResponse(
            activityFilters: RetrieveBreakdownResponseActivityFilters(
                direction: RetrieveBreakdownResponseActivityFiltersDirection.moneyIn,
                lineTypes: [
                    "line_types",
                    "line_types"
                ]
            ),
            bucket: RetrieveBreakdownResponseBucket.transfers,
            currency: "currency",
            direction: RetrieveBreakdownResponseDirection.moneyIn,
            items: [
                RetrieveBreakdownResponseItemsItem(
                    amount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    avatar: Nullable<RetrieveBreakdownResponseItemsItemAvatar>.value(RetrieveBreakdownResponseItemsItemAvatar(
                        shape: RetrieveBreakdownResponseItemsItemAvatarShape.circle,
                        url: Nullable<String>.value("url")
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    key: "key",
                    name: "name",
                    object: RetrieveBreakdownResponseItemsItemObject.user,
                    resourceId: Nullable<String>.value("resource_id")
                ),
                RetrieveBreakdownResponseItemsItem(
                    amount: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    avatar: Nullable<RetrieveBreakdownResponseItemsItemAvatar>.value(RetrieveBreakdownResponseItemsItemAvatar(
                        shape: RetrieveBreakdownResponseItemsItemAvatarShape.circle,
                        url: Nullable<String>.value("url")
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    key: "key",
                    name: "name",
                    object: RetrieveBreakdownResponseItemsItemObject.user,
                    resourceId: Nullable<String>.value("resource_id")
                )
            ],
            otherAmount: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            otherName: "other_name"
        )
        let response = try await client.financialReports.breakdown.retrieve(
            accountId: "account_id",
            bucket: .transfers,
            direction: .moneyIn,
            currency: "currency",
            from: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            to: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}