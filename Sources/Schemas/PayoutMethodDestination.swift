import Foundation

/// The payout destination configuration linked to this token. Null if not yet configured.
public struct PayoutMethodDestination: Codable, Hashable, Sendable {
    /// The category of the payout destination
    public let category: PayoutDestinationCategory
    /// The country code of the payout destination
    public let countryCode: String
    /// The name of the payer associated with the payout destination
    public let name: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        category: PayoutDestinationCategory,
        countryCode: String,
        name: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.category = category
        self.countryCode = countryCode
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.category = try container.decode(PayoutDestinationCategory.self, forKey: .category)
        self.countryCode = try container.decode(String.self, forKey: .countryCode)
        self.name = try container.decode(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.category, forKey: .category)
        try container.encode(self.countryCode, forKey: .countryCode)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case category
        case countryCode = "country_code"
        case name
    }
}