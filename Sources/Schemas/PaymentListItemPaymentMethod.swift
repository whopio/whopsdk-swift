import Foundation

/// The tokenized payment method reference used for this payment. Null if no token was used.
public struct PaymentListItemPaymentMethod: Codable, Hashable, Sendable {
    /// The card data associated with the payment method, if its a debit or credit card.
    public let card: Nullable<PaymentListItemPaymentMethodCard>
    /// The datetime the payment token was created.
    public let createdAt: Date
    /// The unique identifier for the payment token.
    public let id: String
    /// The payment method type of the payment method
    public let paymentMethodType: PaymentMethodTypes
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        card: Nullable<PaymentListItemPaymentMethodCard>,
        createdAt: Date,
        id: String,
        paymentMethodType: PaymentMethodTypes,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.card = card
        self.createdAt = createdAt
        self.id = id
        self.paymentMethodType = paymentMethodType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.card = try container.decode(Nullable<PaymentListItemPaymentMethodCard>.self, forKey: .card)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.paymentMethodType = try container.decode(PaymentMethodTypes.self, forKey: .paymentMethodType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.card, forKey: .card)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.paymentMethodType, forKey: .paymentMethodType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case card
        case createdAt = "created_at"
        case id
        case paymentMethodType = "payment_method_type"
    }
}