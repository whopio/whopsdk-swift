import Foundation

/// The instrument this payment was made with, shaped for display: the method type, a buyer-facing name, the standard icon set, and the card facts when it was a card. Null when the receipt names no payment method.
public struct PaymentPaymentInstrument: Codable, Hashable, Sendable {
    /// Card payments only: the card's network and last four.
    public let card: Nullable<PaymentPaymentInstrumentCard>
    /// Buyer-facing instrument name — "Visa •••• 4242" when the card surfaced, else the method's own name ("Klarna").
    public let displayName: String
    /// The standard icon set: square and card shapes, each in light and dark colorways.
    public let icons: PaymentPaymentInstrumentIcons
    /// Installment methods only: how many payments the charge splits into. Data, not copy — compose and translate the label client-side.
    public let installmentCount: Nullable<Int>
    /// The payment method type identifier, e.g. `card`, `klarna`, `apple_pay`.
    public let paymentMethodType: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        card: Nullable<PaymentPaymentInstrumentCard>,
        displayName: String,
        icons: PaymentPaymentInstrumentIcons,
        installmentCount: Nullable<Int>,
        paymentMethodType: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.card = card
        self.displayName = displayName
        self.icons = icons
        self.installmentCount = installmentCount
        self.paymentMethodType = paymentMethodType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.card = try container.decode(Nullable<PaymentPaymentInstrumentCard>.self, forKey: .card)
        self.displayName = try container.decode(String.self, forKey: .displayName)
        self.icons = try container.decode(PaymentPaymentInstrumentIcons.self, forKey: .icons)
        self.installmentCount = try container.decode(Nullable<Int>.self, forKey: .installmentCount)
        self.paymentMethodType = try container.decode(String.self, forKey: .paymentMethodType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.card, forKey: .card)
        try container.encode(self.displayName, forKey: .displayName)
        try container.encode(self.icons, forKey: .icons)
        try container.encode(self.installmentCount, forKey: .installmentCount)
        try container.encode(self.paymentMethodType, forKey: .paymentMethodType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case card
        case displayName = "display_name"
        case icons
        case installmentCount = "installment_count"
        case paymentMethodType = "payment_method_type"
    }
}