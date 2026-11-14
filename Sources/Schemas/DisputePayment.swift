import Foundation

public struct DisputePayment: Codable, Hashable, Sendable {
    /// What the customer was charged, in whole units of the payment's currency.
    public let amount: Nullable<Double>
    /// Card brand, when the customer paid by card.
    public let cardBrand: Nullable<String>
    /// Last four digits of the card, when the customer paid by card.
    public let cardLast4: Nullable<String>
    /// When the payment was made, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Three-letter ISO currency code of the payment. Can differ from the dispute's currency when the processor settles in another currency.
    public let currency: Nullable<String>
    /// Payment ID, prefixed `pay_`.
    public let id: String
    /// The instrument this payment was made with, shaped for display: the method type, a buyer-facing name, the standard icon set, and the card facts, including the network transaction id the account uses for the card, when it was a card. Null when the payment names no method.
    public let paymentInstrument: Nullable<PaymentInstrument>
    /// How the customer paid, such as `card` or `paypal`.
    public let paymentMethodType: Nullable<String>
    /// Deprecated: no longer populated. Always `null`.
    /// DEPRECATED: No longer populated. Always null.
    public let paymentProcessor: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Nullable<Double>,
        cardBrand: Nullable<String>,
        cardLast4: Nullable<String>,
        createdAt: String,
        currency: Nullable<String>,
        id: String,
        paymentInstrument: Nullable<PaymentInstrument>,
        paymentMethodType: Nullable<String>,
        paymentProcessor: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.cardBrand = cardBrand
        self.cardLast4 = cardLast4
        self.createdAt = createdAt
        self.currency = currency
        self.id = id
        self.paymentInstrument = paymentInstrument
        self.paymentMethodType = paymentMethodType
        self.paymentProcessor = paymentProcessor
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Nullable<Double>.self, forKey: .amount)
        self.cardBrand = try container.decode(Nullable<String>.self, forKey: .cardBrand)
        self.cardLast4 = try container.decode(Nullable<String>.self, forKey: .cardLast4)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currency = try container.decode(Nullable<String>.self, forKey: .currency)
        self.id = try container.decode(String.self, forKey: .id)
        self.paymentInstrument = try container.decode(Nullable<PaymentInstrument>.self, forKey: .paymentInstrument)
        self.paymentMethodType = try container.decode(Nullable<String>.self, forKey: .paymentMethodType)
        self.paymentProcessor = try container.decode(Nullable<String>.self, forKey: .paymentProcessor)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.cardBrand, forKey: .cardBrand)
        try container.encode(self.cardLast4, forKey: .cardLast4)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.paymentInstrument, forKey: .paymentInstrument)
        try container.encode(self.paymentMethodType, forKey: .paymentMethodType)
        try container.encode(self.paymentProcessor, forKey: .paymentProcessor)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case cardBrand = "card_brand"
        case cardLast4 = "card_last4"
        case createdAt = "created_at"
        case currency
        case id
        case paymentInstrument = "payment_instrument"
        case paymentMethodType = "payment_method_type"
        case paymentProcessor = "payment_processor"
    }
}