import Foundation

public struct PaymentQuoteLineItem: Codable, Hashable, Sendable {
    /// The promo code's share on this line. Zero without a code.
    public let discount: Money
    /// How many units of the variant the line covers.
    public let quantity: Int
    /// The line's price before the promo code's share and tax; `subtotal` minus `discount` is what the line comes to after the discount. The lines' subtotals sum to the quote's `subtotal`.
    public let subtotal: Money
    /// The tax on this line. Zero when `tax_status` is not `calculated`.
    public let taxAmount: Money
    /// `subtotal` minus `discount`, plus `tax_amount` when tax is added on top, or without it when the price already includes it.
    public let total: Money
    /// The variant this line prices, prefixed `plan_`. Null when the purchase describes the variant by `variant` and no variant with those attributes exists yet: the payment that consumes the quote creates it, and the line names it from then on.
    public let variantId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        discount: Money,
        quantity: Int,
        subtotal: Money,
        taxAmount: Money,
        total: Money,
        variantId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.discount = discount
        self.quantity = quantity
        self.subtotal = subtotal
        self.taxAmount = taxAmount
        self.total = total
        self.variantId = variantId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.discount = try container.decode(Money.self, forKey: .discount)
        self.quantity = try container.decode(Int.self, forKey: .quantity)
        self.subtotal = try container.decode(Money.self, forKey: .subtotal)
        self.taxAmount = try container.decode(Money.self, forKey: .taxAmount)
        self.total = try container.decode(Money.self, forKey: .total)
        self.variantId = try container.decode(Nullable<String>.self, forKey: .variantId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.discount, forKey: .discount)
        try container.encode(self.quantity, forKey: .quantity)
        try container.encode(self.subtotal, forKey: .subtotal)
        try container.encode(self.taxAmount, forKey: .taxAmount)
        try container.encode(self.total, forKey: .total)
        try container.encode(self.variantId, forKey: .variantId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case discount
        case quantity
        case subtotal
        case taxAmount = "tax_amount"
        case total
        case variantId = "variant_id"
    }
}