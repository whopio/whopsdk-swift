import Foundation

public struct CreatePaymentQuotesRequestLineItemsItem: Codable, Hashable, Sendable {
    /// How many units of the variant to purchase. Defaults to 1; more than 1 requires the variant to allow multiple quantities.
    public let quantity: Nullable<Int>?
    /// An existing variant to charge for, prefixed `plan_`. Each variant may appear once — use `quantity` for multiple units.
    public let variantId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        quantity: Nullable<Int>? = nil,
        variantId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.quantity = quantity
        self.variantId = variantId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.quantity = try container.decodeNullableIfPresent(Int.self, forKey: .quantity)
        self.variantId = try container.decode(String.self, forKey: .variantId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.quantity, forKey: .quantity)
        try container.encode(self.variantId, forKey: .variantId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case quantity
        case variantId = "variant_id"
    }
}