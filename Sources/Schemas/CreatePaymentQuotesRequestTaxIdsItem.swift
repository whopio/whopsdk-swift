import Foundation

public struct CreatePaymentQuotesRequestTaxIdsItem: Codable, Hashable, Sendable {
    /// The registration type. See the [tax IDs guide](/developer/guides/tax-ids) for an example of each type.
    public let type: CreatePaymentQuotesRequestTaxIdsItemType
    /// The registration number as issued. An `eu_vat` number must start with its two-letter country code (Greece uses `EL`). See the [tax IDs guide](/developer/guides/tax-ids).
    public let value: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: CreatePaymentQuotesRequestTaxIdsItemType,
        value: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(CreatePaymentQuotesRequestTaxIdsItemType.self, forKey: .type)
        self.value = try container.decode(String.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case value
    }
}