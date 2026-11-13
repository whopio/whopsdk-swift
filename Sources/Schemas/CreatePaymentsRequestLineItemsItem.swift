import Foundation

public struct CreatePaymentsRequestLineItemsItem: Codable, Hashable, Sendable {
    /// How many units of the variant to purchase. Defaults to 1; more than 1 requires the variant to allow multiple quantities.
    public let quantity: Nullable<Int>?
    /// Find or create the variant for this entry by its attributes. Unknown properties return an error. Creating a variant requires `plan:create`, and creating or updating a product requires the matching product permission.
    public let variant: CreatePaymentsRequestLineItemsItemVariant?
    /// An existing variant to charge for, prefixed `plan_`. Mutually exclusive with `variant`. Each variant may appear once — use `quantity` for multiple units.
    public let variantId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        quantity: Nullable<Int>? = nil,
        variant: CreatePaymentsRequestLineItemsItemVariant? = nil,
        variantId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.quantity = quantity
        self.variant = variant
        self.variantId = variantId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.quantity = try container.decodeNullableIfPresent(Int.self, forKey: .quantity)
        self.variant = try container.decodeIfPresent(CreatePaymentsRequestLineItemsItemVariant.self, forKey: .variant)
        self.variantId = try container.decodeIfPresent(String.self, forKey: .variantId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(self.variant, forKey: .variant)
        try container.encodeIfPresent(self.variantId, forKey: .variantId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case quantity
        case variant
        case variantId = "variant_id"
    }
}