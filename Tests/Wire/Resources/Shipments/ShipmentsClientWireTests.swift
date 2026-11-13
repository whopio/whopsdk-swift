import Foundation
import Testing
import WhopSDK

@Suite("ShipmentsClient Wire Tests") struct ShipmentsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "carrier": "ups",
                      "checkpoints": [
                        {
                          "location": "PHILADELPHIA, PA",
                          "message": "Picked up",
                          "status": "unknown",
                          "timestamp": "2026-01-01T12:00:00.000Z"
                        }
                      ],
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "id": "ship_xxxxxxxxxxxxxx",
                      "payment_id": "pay_xxxxxxxxxxxxxx",
                      "status": "unknown",
                      "tracking_number": "1Z999AA10123456784",
                      "tracking_url": "https://track.aftership.com/xxxxxxxxxxxxxxxxxx",
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
        let expectedResponse = ListShipmentsResponse(
            data: [
                Shipment(
                    accountId: "biz_xxxxxxxxxxxxxx",
                    carrier: Nullable<String>.value("ups"),
                    checkpoints: [
                        ShipmentCheckpoint(
                            location: Nullable<String>.value("PHILADELPHIA, PA"),
                            message: Nullable<String>.value("Picked up"),
                            status: ShipmentCheckpointStatus.unknown,
                            timestamp: Nullable<String>.value("2026-01-01T12:00:00.000Z")
                        )
                    ],
                    createdAt: "2026-01-01T12:00:00.000Z",
                    id: "ship_xxxxxxxxxxxxxx",
                    paymentId: "pay_xxxxxxxxxxxxxx",
                    status: ShipmentStatus.unknown,
                    trackingNumber: "1Z999AA10123456784",
                    trackingUrl: "https://track.aftership.com/xxxxxxxxxxxxxxxxxx",
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListShipmentsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.shipments.list(
            paymentId: [
                "pay_xxxxxxxxxxxxxx"
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "carrier": "ups",
                  "checkpoints": [
                    {
                      "location": "PHILADELPHIA, PA",
                      "message": "Picked up",
                      "status": "unknown",
                      "timestamp": "2026-01-01T12:00:00.000Z"
                    }
                  ],
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "ship_xxxxxxxxxxxxxx",
                  "payment_id": "pay_xxxxxxxxxxxxxx",
                  "status": "unknown",
                  "tracking_number": "1Z999AA10123456784",
                  "tracking_url": "https://track.aftership.com/xxxxxxxxxxxxxxxxxx",
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
        let expectedResponse = Shipment(
            accountId: "biz_xxxxxxxxxxxxxx",
            carrier: Nullable<String>.value("ups"),
            checkpoints: [
                ShipmentCheckpoint(
                    location: Nullable<String>.value("PHILADELPHIA, PA"),
                    message: Nullable<String>.value("Picked up"),
                    status: ShipmentCheckpointStatus.unknown,
                    timestamp: Nullable<String>.value("2026-01-01T12:00:00.000Z")
                )
            ],
            createdAt: "2026-01-01T12:00:00.000Z",
            id: "ship_xxxxxxxxxxxxxx",
            paymentId: "pay_xxxxxxxxxxxxxx",
            status: ShipmentStatus.unknown,
            trackingNumber: "1Z999AA10123456784",
            trackingUrl: "https://track.aftership.com/xxxxxxxxxxxxxxxxxx",
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.shipments.create(
            request: .init(
                paymentId: "pay_xxxxxxxxxxxxxx",
                trackingNumber: "1Z999AA10123456784"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func lookup1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "payment_id": "pay_xxxxxxxxxxxxxx",
                  "shipment": {
                    "account_id": "biz_xxxxxxxxxxxxxx",
                    "carrier": "ups",
                    "checkpoints": [
                      {
                        "location": "PHILADELPHIA, PA",
                        "message": "Picked up",
                        "status": "unknown",
                        "timestamp": "2026-01-01T12:00:00.000Z"
                      }
                    ],
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "id": "ship_xxxxxxxxxxxxxx",
                    "payment_id": "pay_xxxxxxxxxxxxxx",
                    "status": "unknown",
                    "tracking_number": "1Z999AA10123456784",
                    "tracking_url": "https://track.aftership.com/xxxxxxxxxxxxxxxxxx",
                    "updated_at": "2026-01-01T12:00:00.000Z"
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
        let expectedResponse = ShipmentLookup(
            paymentId: "pay_xxxxxxxxxxxxxx",
            shipment: Nullable<Shipment>.value(Shipment(
                accountId: "biz_xxxxxxxxxxxxxx",
                carrier: Nullable<String>.value("ups"),
                checkpoints: [
                    ShipmentCheckpoint(
                        location: Nullable<String>.value("PHILADELPHIA, PA"),
                        message: Nullable<String>.value("Picked up"),
                        status: ShipmentCheckpointStatus.unknown,
                        timestamp: Nullable<String>.value("2026-01-01T12:00:00.000Z")
                    )
                ],
                createdAt: "2026-01-01T12:00:00.000Z",
                id: "ship_xxxxxxxxxxxxxx",
                paymentId: "pay_xxxxxxxxxxxxxx",
                status: ShipmentStatus.unknown,
                trackingNumber: "1Z999AA10123456784",
                trackingUrl: "https://track.aftership.com/xxxxxxxxxxxxxxxxxx",
                updatedAt: "2026-01-01T12:00:00.000Z"
            ))
        )
        let response = try await client.shipments.lookup(
            request: .init(
                accountId: "biz_xxxxxxxxxxxxxx",
                email: "marcus@shinetime.example"
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "carrier": "ups",
                  "checkpoints": [
                    {
                      "location": "PHILADELPHIA, PA",
                      "message": "Picked up",
                      "status": "unknown",
                      "timestamp": "2026-01-01T12:00:00.000Z"
                    }
                  ],
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "ship_xxxxxxxxxxxxxx",
                  "payment_id": "pay_xxxxxxxxxxxxxx",
                  "status": "unknown",
                  "tracking_number": "1Z999AA10123456784",
                  "tracking_url": "https://track.aftership.com/xxxxxxxxxxxxxxxxxx",
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
        let expectedResponse = Shipment(
            accountId: "biz_xxxxxxxxxxxxxx",
            carrier: Nullable<String>.value("ups"),
            checkpoints: [
                ShipmentCheckpoint(
                    location: Nullable<String>.value("PHILADELPHIA, PA"),
                    message: Nullable<String>.value("Picked up"),
                    status: ShipmentCheckpointStatus.unknown,
                    timestamp: Nullable<String>.value("2026-01-01T12:00:00.000Z")
                )
            ],
            createdAt: "2026-01-01T12:00:00.000Z",
            id: "ship_xxxxxxxxxxxxxx",
            paymentId: "pay_xxxxxxxxxxxxxx",
            status: ShipmentStatus.unknown,
            trackingNumber: "1Z999AA10123456784",
            trackingUrl: "https://track.aftership.com/xxxxxxxxxxxxxxxxxx",
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.shipments.retrieve(
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "carrier": "ups",
                  "checkpoints": [
                    {
                      "location": "PHILADELPHIA, PA",
                      "message": "Picked up",
                      "status": "unknown",
                      "timestamp": "2026-01-01T12:00:00.000Z"
                    }
                  ],
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "ship_xxxxxxxxxxxxxx",
                  "payment_id": "pay_xxxxxxxxxxxxxx",
                  "status": "unknown",
                  "tracking_number": "1Z999AA10123456784",
                  "tracking_url": "https://track.aftership.com/xxxxxxxxxxxxxxxxxx",
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
        let expectedResponse = Shipment(
            accountId: "biz_xxxxxxxxxxxxxx",
            carrier: Nullable<String>.value("ups"),
            checkpoints: [
                ShipmentCheckpoint(
                    location: Nullable<String>.value("PHILADELPHIA, PA"),
                    message: Nullable<String>.value("Picked up"),
                    status: ShipmentCheckpointStatus.unknown,
                    timestamp: Nullable<String>.value("2026-01-01T12:00:00.000Z")
                )
            ],
            createdAt: "2026-01-01T12:00:00.000Z",
            id: "ship_xxxxxxxxxxxxxx",
            paymentId: "pay_xxxxxxxxxxxxxx",
            status: ShipmentStatus.unknown,
            trackingNumber: "1Z999AA10123456784",
            trackingUrl: "https://track.aftership.com/xxxxxxxxxxxxxxxxxx",
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.shipments.update(
            id: "id",
            request: .init(trackingNumber: "9400111899223456789012"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}