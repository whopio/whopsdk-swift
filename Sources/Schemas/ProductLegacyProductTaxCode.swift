import Foundation

/// The tax classification code applied to purchases of this product for sales tax calculation. Null if no tax code is assigned.
public struct ProductLegacyProductTaxCode: Codable, Hashable, Sendable {
    /// The unique identifier for the product tax code.
    public let id: String
    /// Human-readable name of this tax classification, such as 'Digital - SaaS'.
    public let name: String
    /// Broad product category this tax code covers, such as physical goods or digital services.
    public let productType: ProductTaxCodeProductTypes
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        productType: ProductTaxCodeProductTypes,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.productType = productType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.productType = try container.decode(ProductTaxCodeProductTypes.self, forKey: .productType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.productType, forKey: .productType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case productType = "product_type"
    }
}