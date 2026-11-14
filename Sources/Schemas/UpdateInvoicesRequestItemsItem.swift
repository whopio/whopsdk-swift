import Foundation

public struct UpdateInvoicesRequestItemsItem: Codable, Hashable, Sendable {
    /// Text shown under a custom charge on the invoice, its email, and its PDF, up to 1,000 characters. Line breaks are kept. Only for an item with `variant`, where it is saved as that variant's `description` and overrides `variant.description`. An item with `variant_id` shows its variant's own description and rejects this field.
    public let description: Nullable<String>?
    public let quantity: Int?
    /// Find or create a variant inline by its attributes, using the payment API properties. Requires plan:create.
    public let variant: UpdateInvoicesRequestItemsItemVariant?
    /// An existing variant belonging to the account, identified by its plan_ ID.
    public let variantId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        description: Nullable<String>? = nil,
        quantity: Int? = nil,
        variant: UpdateInvoicesRequestItemsItemVariant? = nil,
        variantId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.description = description
        self.quantity = quantity
        self.variant = variant
        self.variantId = variantId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
        self.quantity = try container.decodeIfPresent(Int.self, forKey: .quantity)
        self.variant = try container.decodeIfPresent(UpdateInvoicesRequestItemsItemVariant.self, forKey: .variant)
        self.variantId = try container.decodeIfPresent(String.self, forKey: .variantId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(self.variant, forKey: .variant)
        try container.encodeIfPresent(self.variantId, forKey: .variantId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case description
        case quantity
        case variant
        case variantId = "variant_id"
    }
}