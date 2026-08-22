import Foundation

/// The plan attached to this payment.
public struct PaymentListItemPlan: Codable, Hashable, Sendable {
    /// The unique identifier for the plan.
    public let id: String
    /// A personal description or notes section for the business.
    public let internalNotes: Nullable<String>
    /// Custom key-value pairs stored on the plan. Included in webhook payloads for payment and membership events. Max 50 keys, 100 chars per key, 500 chars per string value. The reserved keys `custom_cta` and `custom_cta_url`, when set, override the product's checkout call to action for this plan.
    public let metadata: Nullable<[String: JSONValue]>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        internalNotes: Nullable<String>,
        metadata: Nullable<[String: JSONValue]>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.internalNotes = internalNotes
        self.metadata = metadata
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.internalNotes = try container.decode(Nullable<String>.self, forKey: .internalNotes)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.internalNotes, forKey: .internalNotes)
        try container.encode(self.metadata, forKey: .metadata)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case internalNotes = "internal_notes"
        case metadata
    }
}