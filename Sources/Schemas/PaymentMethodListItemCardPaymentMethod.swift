import Foundation

/// A saved card payment method, including brand, last four digits, and expiration details.
public struct PaymentMethodListItemCardPaymentMethod: Codable, Hashable, Sendable {
    /// The card-specific details for this payment method, including brand, last four digits, and expiration.
    public let card: PaymentMethodListItemCardPaymentMethodCard
    /// The time of the event in ISO 8601 UTC format with millisecond precision
    public let createdAt: Date
    /// Whether this card has the payer identity document required by its payment provider.
    public let hasPayerDocument: Bool
    /// Every rendition of the icon to display this payment method with. A saved card carries its brand's icon (Visa, Mastercard, ...) rather than the generic card art.
    public let icons: PaymentMethodListItemCardPaymentMethodIcons
    /// Represents a unique identifier that is Base64 obfuscated. It is often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `"VXNlci0xMA=="`) or integer (such as `4`) input value will be accepted as an ID.
    public let id: String
    /// The type of payment instrument stored on file (e.g., card, us_bank_account, cashapp, ideal, sepa_debit).
    public let paymentMethodType: PaymentMethodTypes
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        card: PaymentMethodListItemCardPaymentMethodCard,
        createdAt: Date,
        hasPayerDocument: Bool,
        icons: PaymentMethodListItemCardPaymentMethodIcons,
        id: String,
        paymentMethodType: PaymentMethodTypes,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.card = card
        self.createdAt = createdAt
        self.hasPayerDocument = hasPayerDocument
        self.icons = icons
        self.id = id
        self.paymentMethodType = paymentMethodType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.card = try container.decode(PaymentMethodListItemCardPaymentMethodCard.self, forKey: .card)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.hasPayerDocument = try container.decode(Bool.self, forKey: .hasPayerDocument)
        self.icons = try container.decode(PaymentMethodListItemCardPaymentMethodIcons.self, forKey: .icons)
        self.id = try container.decode(String.self, forKey: .id)
        self.paymentMethodType = try container.decode(PaymentMethodTypes.self, forKey: .paymentMethodType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.card, forKey: .card)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.hasPayerDocument, forKey: .hasPayerDocument)
        try container.encode(self.icons, forKey: .icons)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.paymentMethodType, forKey: .paymentMethodType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case card
        case createdAt = "created_at"
        case hasPayerDocument = "has_payer_document"
        case icons
        case id
        case paymentMethodType = "payment_method_type"
    }
}