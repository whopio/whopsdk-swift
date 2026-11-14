import Foundation
import Testing
import WhopSDK

@Suite("CardsClient Wire Tests") struct CardsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "billing": {
                        "city": "Austin",
                        "country_code": "US",
                        "line1": "4180 Burnet Rd",
                        "line2": "Suite 210",
                        "postal_code": "78756",
                        "region": "TX"
                      },
                      "canceled_at": "2026-01-01T12:00:00Z",
                      "created_at": "2026-01-01T12:00:00Z",
                      "digital_wallets": [
                        "apple_pay"
                      ],
                      "expiration_month": "12",
                      "expiration_year": "2029",
                      "id": "icrd_xxxxxxxxxxxxxx",
                      "issued": false,
                      "last4": "8319",
                      "limit": {
                        "amount": 50,
                        "frequency": "daily"
                      },
                      "name": "Detailing supplies",
                      "object": "card",
                      "secrets": {
                        "card_number": "card_number",
                        "cvc": "cvc",
                        "name_on_card": null,
                        "pin": null
                      },
                      "spent_last_month": 0,
                      "status": "active",
                      "type": "virtual",
                      "user_id": "user_xxxxxxxxxxxxxx"
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
        let expectedResponse = ListCardsResponse(
            data: [
                ListCardsResponseDataItem(
                    billing: Nullable<ListCardsResponseDataItemBilling>.value(ListCardsResponseDataItemBilling(
                        city: Nullable<String>.value("Austin"),
                        countryCode: Nullable<String>.value("US"),
                        line1: Nullable<String>.value("4180 Burnet Rd"),
                        line2: Nullable<String>.value("Suite 210"),
                        postalCode: Nullable<String>.value("78756"),
                        region: Nullable<String>.value("TX")
                    )),
                    canceledAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
                    createdAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
                    digitalWallets: Nullable<[ListCardsResponseDataItemDigitalWalletsItem]>.value([
                        ListCardsResponseDataItemDigitalWalletsItem.applePay
                    ]),
                    expirationMonth: Nullable<String>.value("12"),
                    expirationYear: Nullable<String>.value("2029"),
                    id: "icrd_xxxxxxxxxxxxxx",
                    issued: false,
                    last4: Nullable<String>.value("8319"),
                    limit: Nullable<ListCardsResponseDataItemLimit>.value(ListCardsResponseDataItemLimit(
                        amount: 50,
                        frequency: ListCardsResponseDataItemLimitFrequency.daily
                    )),
                    name: Nullable<String>.value("Detailing supplies"),
                    object: ListCardsResponseDataItemObject.card,
                    secrets: Optional(Nullable<ListCardsResponseDataItemSecrets>.value(ListCardsResponseDataItemSecrets(
                        cardNumber: "card_number",
                        cvc: "cvc",
                        nameOnCard: .null,
                        pin: .null
                    ))),
                    spentLastMonth: Nullable<Int>.value(0),
                    status: Nullable<ListCardsResponseDataItemStatus>.value(ListCardsResponseDataItemStatus.active),
                    type: Nullable<ListCardsResponseDataItemType>.value(ListCardsResponseDataItemType.virtual),
                    userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
                )
            ]
        )
        let response = try await client.cards.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "billing": {
                        "city": "city",
                        "country_code": "country_code",
                        "line1": "line1",
                        "line2": "line2",
                        "postal_code": "postal_code",
                        "region": "region"
                      },
                      "canceled_at": "2024-01-15T09:30:00Z",
                      "created_at": "2024-01-15T09:30:00Z",
                      "digital_wallets": [
                        "apple_pay",
                        "apple_pay"
                      ],
                      "expiration_month": "expiration_month",
                      "expiration_year": "expiration_year",
                      "id": "id",
                      "issued": true,
                      "last4": "last4",
                      "limit": {
                        "amount": 1.1,
                        "frequency": "daily"
                      },
                      "name": "name",
                      "object": "card",
                      "secrets": {
                        "card_number": "card_number",
                        "cvc": "cvc",
                        "name_on_card": "name_on_card",
                        "pin": "pin"
                      },
                      "spent_last_month": 1,
                      "status": "active",
                      "type": "virtual",
                      "user_id": "user_id"
                    },
                    {
                      "billing": {
                        "city": "city",
                        "country_code": "country_code",
                        "line1": "line1",
                        "line2": "line2",
                        "postal_code": "postal_code",
                        "region": "region"
                      },
                      "canceled_at": "2024-01-15T09:30:00Z",
                      "created_at": "2024-01-15T09:30:00Z",
                      "digital_wallets": [
                        "apple_pay",
                        "apple_pay"
                      ],
                      "expiration_month": "expiration_month",
                      "expiration_year": "expiration_year",
                      "id": "id",
                      "issued": true,
                      "last4": "last4",
                      "limit": {
                        "amount": 1.1,
                        "frequency": "daily"
                      },
                      "name": "name",
                      "object": "card",
                      "secrets": {
                        "card_number": "card_number",
                        "cvc": "cvc",
                        "name_on_card": "name_on_card",
                        "pin": "pin"
                      },
                      "spent_last_month": 1,
                      "status": "active",
                      "type": "virtual",
                      "user_id": "user_id"
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
        let expectedResponse = ListCardsResponse(
            data: [
                ListCardsResponseDataItem(
                    billing: Nullable<ListCardsResponseDataItemBilling>.value(ListCardsResponseDataItemBilling(
                        city: Nullable<String>.value("city"),
                        countryCode: Nullable<String>.value("country_code"),
                        line1: Nullable<String>.value("line1"),
                        line2: Nullable<String>.value("line2"),
                        postalCode: Nullable<String>.value("postal_code"),
                        region: Nullable<String>.value("region")
                    )),
                    canceledAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    createdAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    digitalWallets: Nullable<[ListCardsResponseDataItemDigitalWalletsItem]>.value([
                        ListCardsResponseDataItemDigitalWalletsItem.applePay,
                        ListCardsResponseDataItemDigitalWalletsItem.applePay
                    ]),
                    expirationMonth: Nullable<String>.value("expiration_month"),
                    expirationYear: Nullable<String>.value("expiration_year"),
                    id: "id",
                    issued: true,
                    last4: Nullable<String>.value("last4"),
                    limit: Nullable<ListCardsResponseDataItemLimit>.value(ListCardsResponseDataItemLimit(
                        amount: 1.1,
                        frequency: ListCardsResponseDataItemLimitFrequency.daily
                    )),
                    name: Nullable<String>.value("name"),
                    object: ListCardsResponseDataItemObject.card,
                    secrets: Optional(Nullable<ListCardsResponseDataItemSecrets>.value(ListCardsResponseDataItemSecrets(
                        cardNumber: "card_number",
                        cvc: "cvc",
                        nameOnCard: Nullable<String>.value("name_on_card"),
                        pin: Nullable<String>.value("pin")
                    ))),
                    spentLastMonth: Nullable<Int>.value(1),
                    status: Nullable<ListCardsResponseDataItemStatus>.value(ListCardsResponseDataItemStatus.active),
                    type: Nullable<ListCardsResponseDataItemType>.value(ListCardsResponseDataItemType.virtual),
                    userId: Nullable<String>.value("user_id")
                ),
                ListCardsResponseDataItem(
                    billing: Nullable<ListCardsResponseDataItemBilling>.value(ListCardsResponseDataItemBilling(
                        city: Nullable<String>.value("city"),
                        countryCode: Nullable<String>.value("country_code"),
                        line1: Nullable<String>.value("line1"),
                        line2: Nullable<String>.value("line2"),
                        postalCode: Nullable<String>.value("postal_code"),
                        region: Nullable<String>.value("region")
                    )),
                    canceledAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    createdAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    digitalWallets: Nullable<[ListCardsResponseDataItemDigitalWalletsItem]>.value([
                        ListCardsResponseDataItemDigitalWalletsItem.applePay,
                        ListCardsResponseDataItemDigitalWalletsItem.applePay
                    ]),
                    expirationMonth: Nullable<String>.value("expiration_month"),
                    expirationYear: Nullable<String>.value("expiration_year"),
                    id: "id",
                    issued: true,
                    last4: Nullable<String>.value("last4"),
                    limit: Nullable<ListCardsResponseDataItemLimit>.value(ListCardsResponseDataItemLimit(
                        amount: 1.1,
                        frequency: ListCardsResponseDataItemLimitFrequency.daily
                    )),
                    name: Nullable<String>.value("name"),
                    object: ListCardsResponseDataItemObject.card,
                    secrets: Optional(Nullable<ListCardsResponseDataItemSecrets>.value(ListCardsResponseDataItemSecrets(
                        cardNumber: "card_number",
                        cvc: "cvc",
                        nameOnCard: Nullable<String>.value("name_on_card"),
                        pin: Nullable<String>.value("pin")
                    ))),
                    spentLastMonth: Nullable<Int>.value(1),
                    status: Nullable<ListCardsResponseDataItemStatus>.value(ListCardsResponseDataItemStatus.active),
                    type: Nullable<ListCardsResponseDataItemType>.value(ListCardsResponseDataItemType.virtual),
                    userId: Nullable<String>.value("user_id")
                )
            ]
        )
        let response = try await client.cards.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "billing": {
                    "city": "Austin",
                    "country_code": "US",
                    "line1": "4180 Burnet Rd",
                    "line2": "Suite 210",
                    "postal_code": "78756",
                    "region": "TX"
                  },
                  "canceled_at": "2024-01-15T09:30:00Z",
                  "created_at": "2026-01-01T12:00:00Z",
                  "digital_wallets": [
                    "apple_pay"
                  ],
                  "expiration_month": "12",
                  "expiration_year": "2030",
                  "id": "icrd_xxxxxxxxxxxxxx",
                  "issued": true,
                  "last4": "4242",
                  "limit": {
                    "amount": 2500,
                    "frequency": "daily"
                  },
                  "name": "Detailing supplies",
                  "object": "card",
                  "secrets": {
                    "card_number": "card_number",
                    "cvc": "cvc",
                    "name_on_card": "name_on_card",
                    "pin": "pin"
                  },
                  "spent_last_month": 0,
                  "status": "active",
                  "type": "virtual",
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateCardsResponse(
            billing: Nullable<CreateCardsResponseBilling>.value(CreateCardsResponseBilling(
                city: Nullable<String>.value("Austin"),
                countryCode: Nullable<String>.value("US"),
                line1: Nullable<String>.value("4180 Burnet Rd"),
                line2: Nullable<String>.value("Suite 210"),
                postalCode: Nullable<String>.value("78756"),
                region: Nullable<String>.value("TX")
            )),
            canceledAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            createdAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
            digitalWallets: Nullable<[CreateCardsResponseDigitalWalletsItem]>.value([
                CreateCardsResponseDigitalWalletsItem.applePay
            ]),
            expirationMonth: Nullable<String>.value("12"),
            expirationYear: Nullable<String>.value("2030"),
            id: "icrd_xxxxxxxxxxxxxx",
            issued: true,
            last4: Nullable<String>.value("4242"),
            limit: Nullable<CreateCardsResponseLimit>.value(CreateCardsResponseLimit(
                amount: 2500,
                frequency: CreateCardsResponseLimitFrequency.daily
            )),
            name: Nullable<String>.value("Detailing supplies"),
            object: CreateCardsResponseObject.card,
            secrets: Optional(Nullable<CreateCardsResponseSecrets>.value(CreateCardsResponseSecrets(
                cardNumber: "card_number",
                cvc: "cvc",
                nameOnCard: Nullable<String>.value("name_on_card"),
                pin: Nullable<String>.value("pin")
            ))),
            spentLastMonth: Nullable<Int>.value(0),
            status: Nullable<CreateCardsResponseStatus>.value(CreateCardsResponseStatus.active),
            type: Nullable<CreateCardsResponseType>.value(CreateCardsResponseType.virtual),
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
        )
        let response = try await client.cards.create(
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "billing": {
                    "city": "city",
                    "country_code": "country_code",
                    "line1": "line1",
                    "line2": "line2",
                    "postal_code": "postal_code",
                    "region": "region"
                  },
                  "canceled_at": "2024-01-15T09:30:00Z",
                  "created_at": "2024-01-15T09:30:00Z",
                  "digital_wallets": [
                    "apple_pay",
                    "apple_pay"
                  ],
                  "expiration_month": "expiration_month",
                  "expiration_year": "expiration_year",
                  "id": "id",
                  "issued": true,
                  "last4": "last4",
                  "limit": {
                    "amount": 1.1,
                    "frequency": "daily"
                  },
                  "name": "name",
                  "object": "card",
                  "secrets": {
                    "card_number": "card_number",
                    "cvc": "cvc",
                    "name_on_card": "name_on_card",
                    "pin": "pin"
                  },
                  "spent_last_month": 1,
                  "status": "active",
                  "type": "virtual",
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateCardsResponse(
            billing: Nullable<CreateCardsResponseBilling>.value(CreateCardsResponseBilling(
                city: Nullable<String>.value("city"),
                countryCode: Nullable<String>.value("country_code"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                postalCode: Nullable<String>.value("postal_code"),
                region: Nullable<String>.value("region")
            )),
            canceledAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            createdAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            digitalWallets: Nullable<[CreateCardsResponseDigitalWalletsItem]>.value([
                CreateCardsResponseDigitalWalletsItem.applePay,
                CreateCardsResponseDigitalWalletsItem.applePay
            ]),
            expirationMonth: Nullable<String>.value("expiration_month"),
            expirationYear: Nullable<String>.value("expiration_year"),
            id: "id",
            issued: true,
            last4: Nullable<String>.value("last4"),
            limit: Nullable<CreateCardsResponseLimit>.value(CreateCardsResponseLimit(
                amount: 1.1,
                frequency: CreateCardsResponseLimitFrequency.daily
            )),
            name: Nullable<String>.value("name"),
            object: CreateCardsResponseObject.card,
            secrets: Optional(Nullable<CreateCardsResponseSecrets>.value(CreateCardsResponseSecrets(
                cardNumber: "card_number",
                cvc: "cvc",
                nameOnCard: Nullable<String>.value("name_on_card"),
                pin: Nullable<String>.value("pin")
            ))),
            spentLastMonth: Nullable<Int>.value(1),
            status: Nullable<CreateCardsResponseStatus>.value(CreateCardsResponseStatus.active),
            type: Nullable<CreateCardsResponseType>.value(CreateCardsResponseType.virtual),
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.cards.create(
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
                  "billing": {
                    "city": "Austin",
                    "country_code": "US",
                    "line1": "4180 Burnet Rd",
                    "line2": "Suite 210",
                    "postal_code": "78756",
                    "region": "TX"
                  },
                  "canceled_at": "2026-01-01T12:00:00Z",
                  "created_at": "2026-01-01T12:00:00Z",
                  "digital_wallets": [
                    "apple_pay"
                  ],
                  "expiration_month": "12",
                  "expiration_year": "2027",
                  "id": "icrd_xxxxxxxxxxxxxx",
                  "issued": true,
                  "last4": "4242",
                  "limit": {
                    "amount": 50,
                    "frequency": "daily"
                  },
                  "name": "Bay rent card",
                  "object": "card",
                  "secrets": {
                    "card_number": "4242424242424242",
                    "cvc": "123",
                    "name_on_card": "Tanya Cole",
                    "pin": "1234"
                  },
                  "spent_last_month": 1234,
                  "status": "active",
                  "type": "virtual",
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RetrieveCardsResponse(
            billing: Nullable<RetrieveCardsResponseBilling>.value(RetrieveCardsResponseBilling(
                city: Nullable<String>.value("Austin"),
                countryCode: Nullable<String>.value("US"),
                line1: Nullable<String>.value("4180 Burnet Rd"),
                line2: Nullable<String>.value("Suite 210"),
                postalCode: Nullable<String>.value("78756"),
                region: Nullable<String>.value("TX")
            )),
            canceledAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
            createdAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
            digitalWallets: Nullable<[RetrieveCardsResponseDigitalWalletsItem]>.value([
                RetrieveCardsResponseDigitalWalletsItem.applePay
            ]),
            expirationMonth: Nullable<String>.value("12"),
            expirationYear: Nullable<String>.value("2027"),
            id: "icrd_xxxxxxxxxxxxxx",
            issued: true,
            last4: Nullable<String>.value("4242"),
            limit: Nullable<RetrieveCardsResponseLimit>.value(RetrieveCardsResponseLimit(
                amount: 50,
                frequency: RetrieveCardsResponseLimitFrequency.daily
            )),
            name: Nullable<String>.value("Bay rent card"),
            object: RetrieveCardsResponseObject.card,
            secrets: Optional(Nullable<RetrieveCardsResponseSecrets>.value(RetrieveCardsResponseSecrets(
                cardNumber: "4242424242424242",
                cvc: "123",
                nameOnCard: Nullable<String>.value("Tanya Cole"),
                pin: Nullable<String>.value("1234")
            ))),
            spentLastMonth: Nullable<Int>.value(1234),
            status: Nullable<RetrieveCardsResponseStatus>.value(RetrieveCardsResponseStatus.active),
            type: Nullable<RetrieveCardsResponseType>.value(RetrieveCardsResponseType.virtual),
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
        )
        let response = try await client.cards.retrieve(
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
                  "billing": {
                    "city": "city",
                    "country_code": "country_code",
                    "line1": "line1",
                    "line2": "line2",
                    "postal_code": "postal_code",
                    "region": "region"
                  },
                  "canceled_at": "2024-01-15T09:30:00Z",
                  "created_at": "2024-01-15T09:30:00Z",
                  "digital_wallets": [
                    "apple_pay",
                    "apple_pay"
                  ],
                  "expiration_month": "expiration_month",
                  "expiration_year": "expiration_year",
                  "id": "id",
                  "issued": true,
                  "last4": "last4",
                  "limit": {
                    "amount": 1.1,
                    "frequency": "daily"
                  },
                  "name": "name",
                  "object": "card",
                  "secrets": {
                    "card_number": "card_number",
                    "cvc": "cvc",
                    "name_on_card": "name_on_card",
                    "pin": "pin"
                  },
                  "spent_last_month": 1,
                  "status": "active",
                  "type": "virtual",
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RetrieveCardsResponse(
            billing: Nullable<RetrieveCardsResponseBilling>.value(RetrieveCardsResponseBilling(
                city: Nullable<String>.value("city"),
                countryCode: Nullable<String>.value("country_code"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                postalCode: Nullable<String>.value("postal_code"),
                region: Nullable<String>.value("region")
            )),
            canceledAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            createdAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            digitalWallets: Nullable<[RetrieveCardsResponseDigitalWalletsItem]>.value([
                RetrieveCardsResponseDigitalWalletsItem.applePay,
                RetrieveCardsResponseDigitalWalletsItem.applePay
            ]),
            expirationMonth: Nullable<String>.value("expiration_month"),
            expirationYear: Nullable<String>.value("expiration_year"),
            id: "id",
            issued: true,
            last4: Nullable<String>.value("last4"),
            limit: Nullable<RetrieveCardsResponseLimit>.value(RetrieveCardsResponseLimit(
                amount: 1.1,
                frequency: RetrieveCardsResponseLimitFrequency.daily
            )),
            name: Nullable<String>.value("name"),
            object: RetrieveCardsResponseObject.card,
            secrets: Optional(Nullable<RetrieveCardsResponseSecrets>.value(RetrieveCardsResponseSecrets(
                cardNumber: "card_number",
                cvc: "cvc",
                nameOnCard: Nullable<String>.value("name_on_card"),
                pin: Nullable<String>.value("pin")
            ))),
            spentLastMonth: Nullable<Int>.value(1),
            status: Nullable<RetrieveCardsResponseStatus>.value(RetrieveCardsResponseStatus.active),
            type: Nullable<RetrieveCardsResponseType>.value(RetrieveCardsResponseType.virtual),
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.cards.retrieve(
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
                  "billing": {
                    "city": "Austin",
                    "country_code": "US",
                    "line1": "4180 Burnet Rd",
                    "line2": "Suite 210",
                    "postal_code": "78756",
                    "region": "TX"
                  },
                  "canceled_at": "2026-01-01T12:00:00Z",
                  "created_at": "2026-01-01T12:00:00Z",
                  "digital_wallets": [
                    "apple_pay"
                  ],
                  "expiration_month": "12",
                  "expiration_year": "2027",
                  "id": "icrd_xxxxxxxxxxxxxx",
                  "issued": true,
                  "last4": "4242",
                  "limit": {
                    "amount": 50,
                    "frequency": "daily"
                  },
                  "name": "Detailing supplies",
                  "object": "card",
                  "secrets": {
                    "card_number": "card_number",
                    "cvc": "cvc",
                    "name_on_card": "name_on_card",
                    "pin": "pin"
                  },
                  "spent_last_month": 1234,
                  "status": "active",
                  "type": "virtual",
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = UpdateCardsResponse(
            billing: Nullable<UpdateCardsResponseBilling>.value(UpdateCardsResponseBilling(
                city: Nullable<String>.value("Austin"),
                countryCode: Nullable<String>.value("US"),
                line1: Nullable<String>.value("4180 Burnet Rd"),
                line2: Nullable<String>.value("Suite 210"),
                postalCode: Nullable<String>.value("78756"),
                region: Nullable<String>.value("TX")
            )),
            canceledAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
            createdAt: Nullable<Date>.value(try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)),
            digitalWallets: Nullable<[UpdateCardsResponseDigitalWalletsItem]>.value([
                UpdateCardsResponseDigitalWalletsItem.applePay
            ]),
            expirationMonth: Nullable<String>.value("12"),
            expirationYear: Nullable<String>.value("2027"),
            id: "icrd_xxxxxxxxxxxxxx",
            issued: true,
            last4: Nullable<String>.value("4242"),
            limit: Nullable<UpdateCardsResponseLimit>.value(UpdateCardsResponseLimit(
                amount: 50,
                frequency: UpdateCardsResponseLimitFrequency.daily
            )),
            name: Nullable<String>.value("Detailing supplies"),
            object: UpdateCardsResponseObject.card,
            secrets: Optional(Nullable<UpdateCardsResponseSecrets>.value(UpdateCardsResponseSecrets(
                cardNumber: "card_number",
                cvc: "cvc",
                nameOnCard: Nullable<String>.value("name_on_card"),
                pin: Nullable<String>.value("pin")
            ))),
            spentLastMonth: Nullable<Int>.value(1234),
            status: Nullable<UpdateCardsResponseStatus>.value(UpdateCardsResponseStatus.active),
            type: Nullable<UpdateCardsResponseType>.value(UpdateCardsResponseType.virtual),
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
        )
        let response = try await client.cards.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "billing": {
                    "city": "city",
                    "country_code": "country_code",
                    "line1": "line1",
                    "line2": "line2",
                    "postal_code": "postal_code",
                    "region": "region"
                  },
                  "canceled_at": "2024-01-15T09:30:00Z",
                  "created_at": "2024-01-15T09:30:00Z",
                  "digital_wallets": [
                    "apple_pay",
                    "apple_pay"
                  ],
                  "expiration_month": "expiration_month",
                  "expiration_year": "expiration_year",
                  "id": "id",
                  "issued": true,
                  "last4": "last4",
                  "limit": {
                    "amount": 1.1,
                    "frequency": "daily"
                  },
                  "name": "name",
                  "object": "card",
                  "secrets": {
                    "card_number": "card_number",
                    "cvc": "cvc",
                    "name_on_card": "name_on_card",
                    "pin": "pin"
                  },
                  "spent_last_month": 1,
                  "status": "active",
                  "type": "virtual",
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = UpdateCardsResponse(
            billing: Nullable<UpdateCardsResponseBilling>.value(UpdateCardsResponseBilling(
                city: Nullable<String>.value("city"),
                countryCode: Nullable<String>.value("country_code"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                postalCode: Nullable<String>.value("postal_code"),
                region: Nullable<String>.value("region")
            )),
            canceledAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            createdAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            digitalWallets: Nullable<[UpdateCardsResponseDigitalWalletsItem]>.value([
                UpdateCardsResponseDigitalWalletsItem.applePay,
                UpdateCardsResponseDigitalWalletsItem.applePay
            ]),
            expirationMonth: Nullable<String>.value("expiration_month"),
            expirationYear: Nullable<String>.value("expiration_year"),
            id: "id",
            issued: true,
            last4: Nullable<String>.value("last4"),
            limit: Nullable<UpdateCardsResponseLimit>.value(UpdateCardsResponseLimit(
                amount: 1.1,
                frequency: UpdateCardsResponseLimitFrequency.daily
            )),
            name: Nullable<String>.value("name"),
            object: UpdateCardsResponseObject.card,
            secrets: Optional(Nullable<UpdateCardsResponseSecrets>.value(UpdateCardsResponseSecrets(
                cardNumber: "card_number",
                cvc: "cvc",
                nameOnCard: Nullable<String>.value("name_on_card"),
                pin: Nullable<String>.value("pin")
            ))),
            spentLastMonth: Nullable<Int>.value(1),
            status: Nullable<UpdateCardsResponseStatus>.value(UpdateCardsResponseStatus.active),
            type: Nullable<UpdateCardsResponseType>.value(UpdateCardsResponseType.virtual),
            userId: Nullable<String>.value("user_id")
        )
        let response = try await client.cards.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}