import Foundation

/// The properties of the product to create for this invoice. Provide this to create a new product inline.
public struct CreateInvoicesRequestProductProduct: Codable, Hashable, Sendable {
    /// The ID of the product tax code to apply to this product.
    public let productTaxCodeId: Nullable<String>?
    /// The title of the product.
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        productTaxCodeId: Nullable<String>? = nil,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.productTaxCodeId = productTaxCodeId
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.productTaxCodeId = try container.decodeNullableIfPresent(String.self, forKey: .productTaxCodeId)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.productTaxCodeId, forKey: .productTaxCodeId)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case productTaxCodeId = "product_tax_code_id"
        case title
    }
}