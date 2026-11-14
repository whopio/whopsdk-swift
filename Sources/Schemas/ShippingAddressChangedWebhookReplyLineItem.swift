import Foundation

public struct ShippingAddressChangedWebhookReplyLineItem: Codable, Hashable, Sendable {
    /// The line's total at this address, in the currency of `data.amount`. It includes tax unless you send `tax`, and shipping unless you send `shipping_options`.
    public let amount: Money
    /// The line's `id` from `data.line_items`, unchanged.
    public let id: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Money,
        id: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.id = id
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Money.self, forKey: .amount)
        self.id = try container.decode(String.self, forKey: .id)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.id, forKey: .id)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case id
    }
}