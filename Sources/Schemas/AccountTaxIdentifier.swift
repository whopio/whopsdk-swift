import Foundation

public struct AccountTaxIdentifier: Codable, Hashable, Sendable {
    /// Tax identifier ID.
    public let id: String
    /// Tax ID type.
    public let taxIdType: AccountTaxIdentifierTaxIdType
    /// Tax ID value, for example `DE123456789`. See the [tax IDs guide](/developer/guides/tax-ids).
    public let taxIdValue: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        taxIdType: AccountTaxIdentifierTaxIdType,
        taxIdValue: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.taxIdType = taxIdType
        self.taxIdValue = taxIdValue
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.taxIdType = try container.decode(AccountTaxIdentifierTaxIdType.self, forKey: .taxIdType)
        self.taxIdValue = try container.decode(String.self, forKey: .taxIdValue)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.taxIdType, forKey: .taxIdType)
        try container.encode(self.taxIdValue, forKey: .taxIdValue)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case taxIdType = "tax_id_type"
        case taxIdValue = "tax_id_value"
    }
}