import Foundation

public struct InvoiceLineItem: Codable, Hashable, Sendable {
    /// Text shown under the item on the invoice, its email, and its PDF, read from the variant's `description`. A custom charge sets it with the item's `description`. A product variant keeps its own. Null when the variant has none or has since been deleted.
    public let description: Nullable<String>
    /// The promo discount applied to this item, in the payment's `currency`. Null when no discount was recorded.
    public let discountAmount: Nullable<Money>
    /// Line item ID, prefixed `li_`. Null when the payment predates item snapshots and the item is read from the payment's variant.
    public let id: Nullable<String>
    /// The item's name as shown at checkout (the product title, else the variant title).
    public let label: Nullable<String>
    /// The product the variant belongs to, prefixed `prod_`. Null for a variant with no product.
    public let productId: Nullable<String>
    /// How many units were bought.
    public let quantity: Double
    /// `unit_amount` times `quantity`, before discounts and tax, in the payment's `currency`.
    public let subtotal: Nullable<Money>
    /// The tax collected on this item, in the payment's `currency`. Null when no tax was recorded.
    public let taxAmount: Nullable<Money>
    /// The saved price of one unit before discounts, in the payment's `currency`. Creating or replacing recurring items includes the upfront fee and first billing period. Renewal invoices exclude the upfront fee. Other edits preserve saved prices. Null when the payment recorded no price.
    public let unitAmount: Nullable<Money>
    /// The variant bought, prefixed `plan_`. Null when the variant has since been deleted.
    public let variantId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        description: Nullable<String>,
        discountAmount: Nullable<Money>,
        id: Nullable<String>,
        label: Nullable<String>,
        productId: Nullable<String>,
        quantity: Double,
        subtotal: Nullable<Money>,
        taxAmount: Nullable<Money>,
        unitAmount: Nullable<Money>,
        variantId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.description = description
        self.discountAmount = discountAmount
        self.id = id
        self.label = label
        self.productId = productId
        self.quantity = quantity
        self.subtotal = subtotal
        self.taxAmount = taxAmount
        self.unitAmount = unitAmount
        self.variantId = variantId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.discountAmount = try container.decode(Nullable<Money>.self, forKey: .discountAmount)
        self.id = try container.decode(Nullable<String>.self, forKey: .id)
        self.label = try container.decode(Nullable<String>.self, forKey: .label)
        self.productId = try container.decode(Nullable<String>.self, forKey: .productId)
        self.quantity = try container.decode(Double.self, forKey: .quantity)
        self.subtotal = try container.decode(Nullable<Money>.self, forKey: .subtotal)
        self.taxAmount = try container.decode(Nullable<Money>.self, forKey: .taxAmount)
        self.unitAmount = try container.decode(Nullable<Money>.self, forKey: .unitAmount)
        self.variantId = try container.decode(Nullable<String>.self, forKey: .variantId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.discountAmount, forKey: .discountAmount)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.label, forKey: .label)
        try container.encode(self.productId, forKey: .productId)
        try container.encode(self.quantity, forKey: .quantity)
        try container.encode(self.subtotal, forKey: .subtotal)
        try container.encode(self.taxAmount, forKey: .taxAmount)
        try container.encode(self.unitAmount, forKey: .unitAmount)
        try container.encode(self.variantId, forKey: .variantId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case description
        case discountAmount = "discount_amount"
        case id
        case label
        case productId = "product_id"
        case quantity
        case subtotal
        case taxAmount = "tax_amount"
        case unitAmount = "unit_amount"
        case variantId = "variant_id"
    }
}