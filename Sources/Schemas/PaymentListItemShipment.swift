import Foundation

/// The shipment attached to this payment.
public struct PaymentListItemShipment: Codable, Hashable, Sendable {
    /// The shipping carrier detected for this shipment. Null until a tracking update identifies it.
    public let carrier: Nullable<String>
    /// The unique identifier for the shipment.
    public let id: String
    /// The current delivery status of this shipment.
    public let status: ShipmentStatuses
    /// The carrier-assigned tracking number used to look up shipment progress.
    public let trackingNumber: String
    /// A customer-facing URL to track this shipment's progress.
    public let trackingUrl: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        carrier: Nullable<String>,
        id: String,
        status: ShipmentStatuses,
        trackingNumber: String,
        trackingUrl: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.carrier = carrier
        self.id = id
        self.status = status
        self.trackingNumber = trackingNumber
        self.trackingUrl = trackingUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.carrier = try container.decode(Nullable<String>.self, forKey: .carrier)
        self.id = try container.decode(String.self, forKey: .id)
        self.status = try container.decode(ShipmentStatuses.self, forKey: .status)
        self.trackingNumber = try container.decode(String.self, forKey: .trackingNumber)
        self.trackingUrl = try container.decode(String.self, forKey: .trackingUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.carrier, forKey: .carrier)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.trackingNumber, forKey: .trackingNumber)
        try container.encode(self.trackingUrl, forKey: .trackingUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case carrier
        case id
        case status
        case trackingNumber = "tracking_number"
        case trackingUrl = "tracking_url"
    }
}