import Foundation

/// A physical shipment associated with a payment, including carrier details and tracking information.
public struct ShipmentLegacy: Codable, Hashable, Sendable {
    /// The datetime the shipment was created.
    public let createdAt: Date
    /// The estimated delivery date for this shipment. Null if the carrier has not provided an estimate.
    public let deliveryEstimate: Nullable<Date>
    /// The unique identifier for the shipment.
    public let id: String
    /// The payment associated with this shipment. Null if the payment has been deleted or is inaccessible.
    public let payment: Nullable<ShipmentLegacyPayment>
    /// The shipping service level used for this shipment. Null if the carrier does not specify a service tier.
    public let service: Nullable<String>
    /// The current delivery status of this shipment.
    public let status: ShipmentStatuses
    /// A more granular status providing additional detail about the shipment's current state. Null if no substatus applies.
    public let substatus: Nullable<ShipmentSubstatuses>
    /// The carrier-assigned tracking number used to look up shipment progress.
    public let trackingCode: String
    /// The datetime the shipment was last updated.
    public let updatedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: Date,
        deliveryEstimate: Nullable<Date>,
        id: String,
        payment: Nullable<ShipmentLegacyPayment>,
        service: Nullable<String>,
        status: ShipmentStatuses,
        substatus: Nullable<ShipmentSubstatuses>,
        trackingCode: String,
        updatedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.deliveryEstimate = deliveryEstimate
        self.id = id
        self.payment = payment
        self.service = service
        self.status = status
        self.substatus = substatus
        self.trackingCode = trackingCode
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.deliveryEstimate = try container.decode(Nullable<Date>.self, forKey: .deliveryEstimate)
        self.id = try container.decode(String.self, forKey: .id)
        self.payment = try container.decode(Nullable<ShipmentLegacyPayment>.self, forKey: .payment)
        self.service = try container.decode(Nullable<String>.self, forKey: .service)
        self.status = try container.decode(ShipmentStatuses.self, forKey: .status)
        self.substatus = try container.decode(Nullable<ShipmentSubstatuses>.self, forKey: .substatus)
        self.trackingCode = try container.decode(String.self, forKey: .trackingCode)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.deliveryEstimate, forKey: .deliveryEstimate)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.payment, forKey: .payment)
        try container.encode(self.service, forKey: .service)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.substatus, forKey: .substatus)
        try container.encode(self.trackingCode, forKey: .trackingCode)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case deliveryEstimate = "delivery_estimate"
        case id
        case payment
        case service
        case status
        case substatus
        case trackingCode = "tracking_code"
        case updatedAt = "updated_at"
    }
}