import Foundation

public struct ShippingAddressChangedWebhookData: Codable, Hashable, Sendable {
    /// The original total, before your price for this address.
    public let amount: Money
    /// The checkout session being priced, prefixed `chs_`, when the buyer is paying through one. `null` for a payment.
    public let checkoutSessionId: Nullable<String>
    public let lineItems: [ShippingAddressChangedWebhookLineItem]
    /// The payment being priced, prefixed `pay_`. `null` when the buyer is paying through a checkout session: the payment is created only after they approve, at your price.
    public let paymentId: Nullable<String>
    /// The address the buyer picked. PayPal shares only these fields until the buyer approves.
    public let shippingAddress: ShippingAddressChangedWebhookAddress
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Money,
        checkoutSessionId: Nullable<String>,
        lineItems: [ShippingAddressChangedWebhookLineItem],
        paymentId: Nullable<String>,
        shippingAddress: ShippingAddressChangedWebhookAddress,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.checkoutSessionId = checkoutSessionId
        self.lineItems = lineItems
        self.paymentId = paymentId
        self.shippingAddress = shippingAddress
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Money.self, forKey: .amount)
        self.checkoutSessionId = try container.decode(Nullable<String>.self, forKey: .checkoutSessionId)
        self.lineItems = try container.decode([ShippingAddressChangedWebhookLineItem].self, forKey: .lineItems)
        self.paymentId = try container.decode(Nullable<String>.self, forKey: .paymentId)
        self.shippingAddress = try container.decode(ShippingAddressChangedWebhookAddress.self, forKey: .shippingAddress)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.checkoutSessionId, forKey: .checkoutSessionId)
        try container.encode(self.lineItems, forKey: .lineItems)
        try container.encode(self.paymentId, forKey: .paymentId)
        try container.encode(self.shippingAddress, forKey: .shippingAddress)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case checkoutSessionId = "checkout_session_id"
        case lineItems = "line_items"
        case paymentId = "payment_id"
        case shippingAddress = "shipping_address"
    }
}