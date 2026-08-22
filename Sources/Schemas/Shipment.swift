import Foundation

public struct Shipment: Codable, Hashable, Sendable {
    /// The account that owns this shipment, prefixed `biz_`.
    public let accountId: String
    /// The shipping carrier detected for this shipment. Null until a tracking update identifies it.
    public let carrier: Nullable<String>
    public let checkpoints: [ShipmentCheckpoint]
    /// The datetime the shipment was created (ISO 8601).
    public let createdAt: String
    /// Shipment ID, prefixed `ship_`.
    public let id: String
    /// The payment this shipment fulfills, prefixed `pay_`.
    public let paymentId: String
    /// The current delivery status of this shipment.
    public let status: ShipmentStatus
    /// The carrier-assigned tracking number used to look up shipment progress.
    public let trackingNumber: String
    /// A customer-facing URL to track this shipment's progress.
    public let trackingUrl: String
    /// The datetime the shipment was last updated (ISO 8601).
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        carrier: Nullable<String>,
        checkpoints: [ShipmentCheckpoint],
        createdAt: String,
        id: String,
        paymentId: String,
        status: ShipmentStatus,
        trackingNumber: String,
        trackingUrl: String,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.carrier = carrier
        self.checkpoints = checkpoints
        self.createdAt = createdAt
        self.id = id
        self.paymentId = paymentId
        self.status = status
        self.trackingNumber = trackingNumber
        self.trackingUrl = trackingUrl
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.carrier = try container.decode(Nullable<String>.self, forKey: .carrier)
        self.checkpoints = try container.decode([ShipmentCheckpoint].self, forKey: .checkpoints)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.paymentId = try container.decode(String.self, forKey: .paymentId)
        self.status = try container.decode(ShipmentStatus.self, forKey: .status)
        self.trackingNumber = try container.decode(String.self, forKey: .trackingNumber)
        self.trackingUrl = try container.decode(String.self, forKey: .trackingUrl)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.carrier, forKey: .carrier)
        try container.encode(self.checkpoints, forKey: .checkpoints)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.paymentId, forKey: .paymentId)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.trackingNumber, forKey: .trackingNumber)
        try container.encode(self.trackingUrl, forKey: .trackingUrl)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case carrier
        case checkpoints
        case createdAt = "created_at"
        case id
        case paymentId = "payment_id"
        case status
        case trackingNumber = "tracking_number"
        case trackingUrl = "tracking_url"
        case updatedAt = "updated_at"
    }
}