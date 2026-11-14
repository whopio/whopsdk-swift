import Foundation
import Testing
import WhopSDK

@Suite("DisputeAlertsClient Wire Tests") struct DisputeAlertsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "amount": 25,
                      "auto_refunded": false,
                      "card_brand": "visa",
                      "category": "fraud",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "currency": "usd",
                      "fee": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "fee_charged": false,
                      "id": "dspa_xxxxxxxxxxxxxx",
                      "issuer": "issuer",
                      "payment_id": "pay_xxxxxxxxxxxxxx",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "reported_at": "2026-01-01T12:00:00.000Z",
                      "source": "ethoca",
                      "transaction_at": "2026-01-01T12:00:00.000Z",
                      "type": "early_fraud_warning",
                      "updated_at": "2026-01-01T12:00:00.000Z"
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
        let expectedResponse = ListDisputeAlertsResponse(
            data: [
                DisputeAlert(
                    accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    amount: 25,
                    autoRefunded: false,
                    cardBrand: Nullable<String>.value("visa"),
                    category: Nullable<DisputeAlertCategory>.value(DisputeAlertCategory.fraud),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currency: "usd",
                    fee: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    feeCharged: false,
                    id: "dspa_xxxxxxxxxxxxxx",
                    issuer: Nullable<String>.value("issuer"),
                    paymentId: Nullable<String>.value("pay_xxxxxxxxxxxxxx"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    reportedAt: "2026-01-01T12:00:00.000Z",
                    source: Nullable<DisputeAlertSource>.value(DisputeAlertSource.ethoca),
                    transactionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    type: DisputeAlertType.earlyFraudWarning,
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListDisputeAlertsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.disputeAlerts.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "amount": 1.1,
                      "auto_refunded": true,
                      "card_brand": "card_brand",
                      "category": "fraud",
                      "created_at": "created_at",
                      "currency": "currency",
                      "fee": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "fee_charged": true,
                      "id": "id",
                      "issuer": "issuer",
                      "payment_id": "payment_id",
                      "product_id": "product_id",
                      "reported_at": "reported_at",
                      "source": "ethoca",
                      "transaction_at": "transaction_at",
                      "type": "early_fraud_warning",
                      "updated_at": "updated_at"
                    },
                    {
                      "account_id": "account_id",
                      "amount": 1.1,
                      "auto_refunded": true,
                      "card_brand": "card_brand",
                      "category": "fraud",
                      "created_at": "created_at",
                      "currency": "currency",
                      "fee": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "fee_charged": true,
                      "id": "id",
                      "issuer": "issuer",
                      "payment_id": "payment_id",
                      "product_id": "product_id",
                      "reported_at": "reported_at",
                      "source": "ethoca",
                      "transaction_at": "transaction_at",
                      "type": "early_fraud_warning",
                      "updated_at": "updated_at"
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
        let expectedResponse = ListDisputeAlertsResponse(
            data: [
                DisputeAlert(
                    accountId: Nullable<String>.value("account_id"),
                    amount: 1.1,
                    autoRefunded: true,
                    cardBrand: Nullable<String>.value("card_brand"),
                    category: Nullable<DisputeAlertCategory>.value(DisputeAlertCategory.fraud),
                    createdAt: "created_at",
                    currency: "currency",
                    fee: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    feeCharged: true,
                    id: "id",
                    issuer: Nullable<String>.value("issuer"),
                    paymentId: Nullable<String>.value("payment_id"),
                    productId: Nullable<String>.value("product_id"),
                    reportedAt: "reported_at",
                    source: Nullable<DisputeAlertSource>.value(DisputeAlertSource.ethoca),
                    transactionAt: Nullable<String>.value("transaction_at"),
                    type: DisputeAlertType.earlyFraudWarning,
                    updatedAt: "updated_at"
                ),
                DisputeAlert(
                    accountId: Nullable<String>.value("account_id"),
                    amount: 1.1,
                    autoRefunded: true,
                    cardBrand: Nullable<String>.value("card_brand"),
                    category: Nullable<DisputeAlertCategory>.value(DisputeAlertCategory.fraud),
                    createdAt: "created_at",
                    currency: "currency",
                    fee: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    feeCharged: true,
                    id: "id",
                    issuer: Nullable<String>.value("issuer"),
                    paymentId: Nullable<String>.value("payment_id"),
                    productId: Nullable<String>.value("product_id"),
                    reportedAt: "reported_at",
                    source: Nullable<DisputeAlertSource>.value(DisputeAlertSource.ethoca),
                    transactionAt: Nullable<String>.value("transaction_at"),
                    type: DisputeAlertType.earlyFraudWarning,
                    updatedAt: "updated_at"
                )
            ],
            pageInfo: ListDisputeAlertsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.disputeAlerts.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount": 25,
                  "auto_refunded": false,
                  "card_brand": "visa",
                  "category": "fraud",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "fee": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "fee_charged": false,
                  "id": "dspa_xxxxxxxxxxxxxx",
                  "issuer": "issuer",
                  "payment_id": "pay_xxxxxxxxxxxxxx",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "reported_at": "2026-01-01T12:00:00.000Z",
                  "source": "ethoca",
                  "transaction_at": "2026-01-01T12:00:00.000Z",
                  "type": "early_fraud_warning",
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DisputeAlert(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: 25,
            autoRefunded: false,
            cardBrand: Nullable<String>.value("visa"),
            category: Nullable<DisputeAlertCategory>.value(DisputeAlertCategory.fraud),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: "usd",
            fee: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            feeCharged: false,
            id: "dspa_xxxxxxxxxxxxxx",
            issuer: Nullable<String>.value("issuer"),
            paymentId: Nullable<String>.value("pay_xxxxxxxxxxxxxx"),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            reportedAt: "2026-01-01T12:00:00.000Z",
            source: Nullable<DisputeAlertSource>.value(DisputeAlertSource.ethoca),
            transactionAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            type: DisputeAlertType.earlyFraudWarning,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.disputeAlerts.retrieve(
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
                  "amount": 1.1,
                  "auto_refunded": true,
                  "card_brand": "card_brand",
                  "category": "fraud",
                  "created_at": "created_at",
                  "currency": "currency",
                  "fee": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "fee_charged": true,
                  "id": "id",
                  "issuer": "issuer",
                  "payment_id": "payment_id",
                  "product_id": "product_id",
                  "reported_at": "reported_at",
                  "source": "ethoca",
                  "transaction_at": "transaction_at",
                  "type": "early_fraud_warning",
                  "updated_at": "updated_at"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DisputeAlert(
            accountId: Nullable<String>.value("account_id"),
            amount: 1.1,
            autoRefunded: true,
            cardBrand: Nullable<String>.value("card_brand"),
            category: Nullable<DisputeAlertCategory>.value(DisputeAlertCategory.fraud),
            createdAt: "created_at",
            currency: "currency",
            fee: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            feeCharged: true,
            id: "id",
            issuer: Nullable<String>.value("issuer"),
            paymentId: Nullable<String>.value("payment_id"),
            productId: Nullable<String>.value("product_id"),
            reportedAt: "reported_at",
            source: Nullable<DisputeAlertSource>.value(DisputeAlertSource.ethoca),
            transactionAt: Nullable<String>.value("transaction_at"),
            type: DisputeAlertType.earlyFraudWarning,
            updatedAt: "updated_at"
        )
        let response = try await client.disputeAlerts.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}