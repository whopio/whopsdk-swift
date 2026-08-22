import Foundation

public struct ResolutionPayment: Codable, Hashable, Sendable {
    /// Card brand, when the customer paid by card.
    public let cardBrand: Nullable<String>
    /// Last four digits of the card, when the customer paid by card.
    public let cardLast4: Nullable<String>
    /// When the payment was made, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Payment ID, prefixed `pay_`.
    public let id: String
    /// How the customer paid, such as `card` or `paypal`.
    public let paymentMethodType: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cardBrand: Nullable<String>,
        cardLast4: Nullable<String>,
        createdAt: String,
        id: String,
        paymentMethodType: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cardBrand = cardBrand
        self.cardLast4 = cardLast4
        self.createdAt = createdAt
        self.id = id
        self.paymentMethodType = paymentMethodType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cardBrand = try container.decode(Nullable<String>.self, forKey: .cardBrand)
        self.cardLast4 = try container.decode(Nullable<String>.self, forKey: .cardLast4)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.paymentMethodType = try container.decode(Nullable<String>.self, forKey: .paymentMethodType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.cardBrand, forKey: .cardBrand)
        try container.encode(self.cardLast4, forKey: .cardLast4)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.paymentMethodType, forKey: .paymentMethodType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cardBrand = "card_brand"
        case cardLast4 = "card_last4"
        case createdAt = "created_at"
        case id
        case paymentMethodType = "payment_method_type"
    }
}