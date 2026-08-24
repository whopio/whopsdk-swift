import Foundation

public struct ShipmentCheckpoint: Codable, Hashable, Sendable {
    /// Where the carrier recorded the scan, such as `PHILADELPHIA, PA`. Null when the carrier sent none.
    public let location: Nullable<String>
    /// Carrier's description of the scan, such as `Departed USPS Regional Facility`. Null when the carrier sent none.
    public let message: Nullable<String>
    /// Delivery status this carrier scan maps to.
    public let status: ShipmentCheckpointStatus
    /// When the carrier recorded the scan, as an ISO 8601 timestamp. Null when the carrier sent no scan time.
    public let timestamp: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        location: Nullable<String>,
        message: Nullable<String>,
        status: ShipmentCheckpointStatus,
        timestamp: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.location = location
        self.message = message
        self.status = status
        self.timestamp = timestamp
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.location = try container.decode(Nullable<String>.self, forKey: .location)
        self.message = try container.decode(Nullable<String>.self, forKey: .message)
        self.status = try container.decode(ShipmentCheckpointStatus.self, forKey: .status)
        self.timestamp = try container.decode(Nullable<String>.self, forKey: .timestamp)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.location, forKey: .location)
        try container.encode(self.message, forKey: .message)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.timestamp, forKey: .timestamp)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case location
        case message
        case status
        case timestamp
    }
}