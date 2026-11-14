import Foundation

public struct UpdateAccountsRequestTaxIdentifiersItem: Codable, Hashable, Sendable {
    /// Tax ID type, for example `eu_vat`, `gb_vat`, or `us_ein`. See the [tax IDs guide](/developer/guides/tax-ids) for an example of each type.
    public let taxIdType: UpdateAccountsRequestTaxIdentifiersItemTaxIdType
    /// Tax ID value, for example `DE123456789`. An `eu_vat` number must start with its two-letter country code (Greece uses `EL`); spaces, dots, and dashes are removed and letters are uppercased. See the [tax IDs guide](/developer/guides/tax-ids).
    public let taxIdValue: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        taxIdType: UpdateAccountsRequestTaxIdentifiersItemTaxIdType,
        taxIdValue: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.taxIdType = taxIdType
        self.taxIdValue = taxIdValue
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.taxIdType = try container.decode(UpdateAccountsRequestTaxIdentifiersItemTaxIdType.self, forKey: .taxIdType)
        self.taxIdValue = try container.decode(String.self, forKey: .taxIdValue)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.taxIdType, forKey: .taxIdType)
        try container.encode(self.taxIdValue, forKey: .taxIdValue)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case taxIdType = "tax_id_type"
        case taxIdValue = "tax_id_value"
    }
}