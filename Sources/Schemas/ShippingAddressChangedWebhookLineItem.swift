import Foundation

public struct ShippingAddressChangedWebhookLineItem: Codable, Hashable, Sendable {
    /// The line's original total, the same on every call for this purchase.
    public let amount: Money
    /// Identifies the line. Your reply names each line by this id, so send it back unchanged.
    public let id: String
    /// How many of the variant this line holds.
    public let quantity: Double
    /// The variant bought on this line, prefixed `plan_`.
    public let variantId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Money,
        id: String,
        quantity: Double,
        variantId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.id = id
        self.quantity = quantity
        self.variantId = variantId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Money.self, forKey: .amount)
        self.id = try container.decode(String.self, forKey: .id)
        self.quantity = try container.decode(Double.self, forKey: .quantity)
        self.variantId = try container.decode(Nullable<String>.self, forKey: .variantId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.quantity, forKey: .quantity)
        try container.encode(self.variantId, forKey: .variantId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case id
        case quantity
        case variantId = "variant_id"
    }
}