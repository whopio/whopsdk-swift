import Foundation

public struct ShippingAddressChangedWebhookReply: Codable, Hashable, Sendable {
    public let lineItems: [ShippingAddressChangedWebhookReplyLineItem]
    public let shippingOptions: [ShippingAddressChangedWebhookReplyShippingOption]?
    /// The tax you charge at this address, in the currency of `data.amount`. PayPal shows it on its own Tax line, and the buyer pays it on top of the line totals. Leave it out to keep tax inside the line totals.
    public let tax: Money?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        lineItems: [ShippingAddressChangedWebhookReplyLineItem],
        shippingOptions: [ShippingAddressChangedWebhookReplyShippingOption]? = nil,
        tax: Money? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.lineItems = lineItems
        self.shippingOptions = shippingOptions
        self.tax = tax
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lineItems = try container.decode([ShippingAddressChangedWebhookReplyLineItem].self, forKey: .lineItems)
        self.shippingOptions = try container.decodeIfPresent([ShippingAddressChangedWebhookReplyShippingOption].self, forKey: .shippingOptions)
        self.tax = try container.decodeIfPresent(Money.self, forKey: .tax)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.lineItems, forKey: .lineItems)
        try container.encodeIfPresent(self.shippingOptions, forKey: .shippingOptions)
        try container.encodeIfPresent(self.tax, forKey: .tax)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case lineItems = "line_items"
        case shippingOptions = "shipping_options"
        case tax
    }
}