import Foundation

public struct RetrievePeopleResponsePurchasesItem: Codable, Hashable, Sendable {
    public let eventId: String
    public let occurredAt: Date
    public let usdValue: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        eventId: String,
        occurredAt: Date,
        usdValue: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.eventId = eventId
        self.occurredAt = occurredAt
        self.usdValue = usdValue
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.eventId = try container.decode(String.self, forKey: .eventId)
        self.occurredAt = try container.decode(Date.self, forKey: .occurredAt)
        self.usdValue = try container.decode(Double.self, forKey: .usdValue)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.eventId, forKey: .eventId)
        try container.encode(self.occurredAt, forKey: .occurredAt)
        try container.encode(self.usdValue, forKey: .usdValue)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case eventId = "event_id"
        case occurredAt = "occurred_at"
        case usdValue = "usd_value"
    }
}