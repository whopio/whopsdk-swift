import Foundation

public struct ReceiptLineItem: Codable, Hashable, Sendable {
    /// Line item ID, prefixed `li_`. Null when the payment predates item snapshots and the item is read from the payment's variant.
    public let id: Nullable<String>
    /// The item's name as shown at checkout (the product title, else the variant title).
    public let label: Nullable<String>
    /// The product the variant belongs to, prefixed `prod_`. On a payment that predates item snapshots this falls back to the variant's product, so it can be set where the parent's own `product_id` is null. Null for a variant with no product.
    public let productId: Nullable<String>
    /// The product's current title, or `null` when the item has no product.
    public let productTitle: Nullable<String>
    /// How many units were bought.
    public let quantity: Double
    /// The variant's stock keeping unit, free text set by the seller (e.g. `TSHIRT-LARGE-BLUE`). Accounts with billing-reason SKU suffixes enabled receive it stamped with why the charge happened: `-S` for a first subscription charge, `-R` for a renewal, `-C` for a one-time purchase, `-U` when the payment's own metadata carries `upsell: true`, `-F` when nothing was charged. Other billing reasons carry the bare SKU. `null` when the variant has no SKU or has been deleted.
    public let sku: Nullable<String>
    /// The recorded amount for this item's full quantity, before discounts, tax, and fees, in its purchase currency. Returns `null` when no item amount was recorded.
    public let subtotal: Nullable<Money>
    /// The variant bought, prefixed `plan_`. Null when the variant has since been deleted.
    public let variantId: Nullable<String>
    /// The variant's current title, or `null` when the variant has been deleted or has no title.
    public let variantTitle: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: Nullable<String>,
        label: Nullable<String>,
        productId: Nullable<String>,
        productTitle: Nullable<String>,
        quantity: Double,
        sku: Nullable<String>,
        subtotal: Nullable<Money>,
        variantId: Nullable<String>,
        variantTitle: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.label = label
        self.productId = productId
        self.productTitle = productTitle
        self.quantity = quantity
        self.sku = sku
        self.subtotal = subtotal
        self.variantId = variantId
        self.variantTitle = variantTitle
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Nullable<String>.self, forKey: .id)
        self.label = try container.decode(Nullable<String>.self, forKey: .label)
        self.productId = try container.decode(Nullable<String>.self, forKey: .productId)
        self.productTitle = try container.decode(Nullable<String>.self, forKey: .productTitle)
        self.quantity = try container.decode(Double.self, forKey: .quantity)
        self.sku = try container.decode(Nullable<String>.self, forKey: .sku)
        self.subtotal = try container.decode(Nullable<Money>.self, forKey: .subtotal)
        self.variantId = try container.decode(Nullable<String>.self, forKey: .variantId)
        self.variantTitle = try container.decode(Nullable<String>.self, forKey: .variantTitle)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.label, forKey: .label)
        try container.encode(self.productId, forKey: .productId)
        try container.encode(self.productTitle, forKey: .productTitle)
        try container.encode(self.quantity, forKey: .quantity)
        try container.encode(self.sku, forKey: .sku)
        try container.encode(self.subtotal, forKey: .subtotal)
        try container.encode(self.variantId, forKey: .variantId)
        try container.encode(self.variantTitle, forKey: .variantTitle)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case label
        case productId = "product_id"
        case productTitle = "product_title"
        case quantity
        case sku
        case subtotal
        case variantId = "variant_id"
        case variantTitle = "variant_title"
    }
}