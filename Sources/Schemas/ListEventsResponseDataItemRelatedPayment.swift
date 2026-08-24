import Foundation

public struct ListEventsResponseDataItemRelatedPayment: Codable, Hashable, Sendable {
    public let cardBrand: Nullable<String>?
    public let cardLast4: Nullable<String>?
    public let id: String?
    public let provider: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cardBrand: Nullable<String>? = nil,
        cardLast4: Nullable<String>? = nil,
        id: String? = nil,
        provider: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cardBrand = cardBrand
        self.cardLast4 = cardLast4
        self.id = id
        self.provider = provider
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cardBrand = try container.decodeNullableIfPresent(String.self, forKey: .cardBrand)
        self.cardLast4 = try container.decodeNullableIfPresent(String.self, forKey: .cardLast4)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.provider = try container.decodeNullableIfPresent(String.self, forKey: .provider)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.cardBrand, forKey: .cardBrand)
        try container.encodeNullableIfPresent(self.cardLast4, forKey: .cardLast4)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.provider, forKey: .provider)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cardBrand = "card_brand"
        case cardLast4 = "card_last4"
        case id
        case provider
    }
}