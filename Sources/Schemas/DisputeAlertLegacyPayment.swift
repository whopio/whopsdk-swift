import Foundation

/// The payment associated with the dispute alert.
public struct DisputeAlertLegacyPayment: Codable, Hashable, Sendable {
    /// The machine-readable reason this charge was created, such as initial subscription purchase, renewal cycle, or one-time payment.
    public let billingReason: Nullable<BillingReasons>
    /// Card network reported by the processor (e.g., 'visa', 'mastercard', 'amex'). Present only when the payment method type is 'card'.
    public let cardBrand: Nullable<CardBrands>
    /// The last four digits of the card used to make this payment. Null if the payment was not made with a card.
    public let cardLast4: Nullable<String>
    /// The datetime the payment was created.
    public let createdAt: Date
    /// The three-letter ISO currency code for this payment (e.g., 'usd', 'eur').
    public let currency: Currencies
    /// When an alert came in that this transaction will be disputed
    public let disputeAlertedAt: Nullable<Date>
    /// The unique identifier for the payment.
    public let id: String
    /// The member attached to this payment.
    public let member: Nullable<DisputeAlertLegacyPaymentMember>
    /// The membership attached to this payment.
    public let membership: Nullable<DisputeAlertLegacyPaymentMembership>
    /// The time at which this payment was successfully collected. Null if the payment has not yet succeeded. As a Unix timestamp.
    public let paidAt: Nullable<Date>
    /// The type of payment instrument used for this payment (e.g., card, Cash App, iDEAL, Klarna, crypto). Null when the processor does not supply a type.
    public let paymentMethodType: Nullable<PaymentMethodTypes>
    /// The subtotal to show to the creator (excluding buyer fees).
    public let subtotal: Nullable<Double>
    /// The total to show to the creator (excluding buyer fees).
    public let total: Nullable<Double>
    /// The total in USD to show to the creator (excluding buyer fees).
    public let usdTotal: Nullable<Double>
    /// The user that made this payment.
    public let user: Nullable<DisputeAlertLegacyPaymentUser>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        billingReason: Nullable<BillingReasons>,
        cardBrand: Nullable<CardBrands>,
        cardLast4: Nullable<String>,
        createdAt: Date,
        currency: Currencies,
        disputeAlertedAt: Nullable<Date>,
        id: String,
        member: Nullable<DisputeAlertLegacyPaymentMember>,
        membership: Nullable<DisputeAlertLegacyPaymentMembership>,
        paidAt: Nullable<Date>,
        paymentMethodType: Nullable<PaymentMethodTypes>,
        subtotal: Nullable<Double>,
        total: Nullable<Double>,
        usdTotal: Nullable<Double>,
        user: Nullable<DisputeAlertLegacyPaymentUser>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.billingReason = billingReason
        self.cardBrand = cardBrand
        self.cardLast4 = cardLast4
        self.createdAt = createdAt
        self.currency = currency
        self.disputeAlertedAt = disputeAlertedAt
        self.id = id
        self.member = member
        self.membership = membership
        self.paidAt = paidAt
        self.paymentMethodType = paymentMethodType
        self.subtotal = subtotal
        self.total = total
        self.usdTotal = usdTotal
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.billingReason = try container.decode(Nullable<BillingReasons>.self, forKey: .billingReason)
        self.cardBrand = try container.decode(Nullable<CardBrands>.self, forKey: .cardBrand)
        self.cardLast4 = try container.decode(Nullable<String>.self, forKey: .cardLast4)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.disputeAlertedAt = try container.decode(Nullable<Date>.self, forKey: .disputeAlertedAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.member = try container.decode(Nullable<DisputeAlertLegacyPaymentMember>.self, forKey: .member)
        self.membership = try container.decode(Nullable<DisputeAlertLegacyPaymentMembership>.self, forKey: .membership)
        self.paidAt = try container.decode(Nullable<Date>.self, forKey: .paidAt)
        self.paymentMethodType = try container.decode(Nullable<PaymentMethodTypes>.self, forKey: .paymentMethodType)
        self.subtotal = try container.decode(Nullable<Double>.self, forKey: .subtotal)
        self.total = try container.decode(Nullable<Double>.self, forKey: .total)
        self.usdTotal = try container.decode(Nullable<Double>.self, forKey: .usdTotal)
        self.user = try container.decode(Nullable<DisputeAlertLegacyPaymentUser>.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.billingReason, forKey: .billingReason)
        try container.encode(self.cardBrand, forKey: .cardBrand)
        try container.encode(self.cardLast4, forKey: .cardLast4)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.disputeAlertedAt, forKey: .disputeAlertedAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.member, forKey: .member)
        try container.encode(self.membership, forKey: .membership)
        try container.encode(self.paidAt, forKey: .paidAt)
        try container.encode(self.paymentMethodType, forKey: .paymentMethodType)
        try container.encode(self.subtotal, forKey: .subtotal)
        try container.encode(self.total, forKey: .total)
        try container.encode(self.usdTotal, forKey: .usdTotal)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case billingReason = "billing_reason"
        case cardBrand = "card_brand"
        case cardLast4 = "card_last4"
        case createdAt = "created_at"
        case currency
        case disputeAlertedAt = "dispute_alerted_at"
        case id
        case member
        case membership
        case paidAt = "paid_at"
        case paymentMethodType = "payment_method_type"
        case subtotal
        case total
        case usdTotal = "usd_total"
        case user
    }
}