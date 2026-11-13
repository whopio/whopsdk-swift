import Foundation

public struct ShippingAddressChangedWebhookReplyShippingOption: Codable, Hashable, Sendable {
    /// What this option costs at this address, in the currency of `data.amount`. Zero for free shipping.
    public let amount: Money
    /// What the buyer sees for this option in PayPal, up to 127 characters.
    public let description: String
    /// Your identifier for this option, unique within `shipping_options` and up to 127 characters. PayPal returns it to Whop when the buyer picks this option.
    public let externalIdentifier: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Money,
        description: String,
        externalIdentifier: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.description = description
        self.externalIdentifier = externalIdentifier
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Money.self, forKey: .amount)
        self.description = try container.decode(String.self, forKey: .description)
        self.externalIdentifier = try container.decode(String.self, forKey: .externalIdentifier)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.externalIdentifier, forKey: .externalIdentifier)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case description
        case externalIdentifier = "external_identifier"
    }
}