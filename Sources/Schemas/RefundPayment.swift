import Foundation

/// The original payment that this refund was issued against. Null if the payment is no longer available.
public struct RefundPayment: Codable, Hashable, Sendable {
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
    public let member: Nullable<RefundPaymentMember>
    /// The membership attached to this payment.
    public let membership: Nullable<RefundPaymentMembership>
    /// The custom metadata stored on this payment. This will be copied over to the checkout configuration for which this payment was made
    public let metadata: Nullable<[String: JSONValue]>
    /// The time at which this payment was successfully collected. Null if the payment has not yet succeeded. As a Unix timestamp.
    public let paidAt: Nullable<Date>
    /// The type of payment instrument used for this payment (e.g., card, Cash App, iDEAL, Klarna, crypto). Null when the processor does not supply a type.
    public let paymentMethodType: Nullable<PaymentMethodTypes>
    /// The plan attached to this payment.
    public let plan: Nullable<RefundPaymentPlan>
    /// The product this payment was made for
    public let product: Nullable<RefundPaymentProduct>
    /// The subtotal to show to the creator (excluding buyer fees).
    public let subtotal: Nullable<Double>
    /// The calculated amount of the sales/VAT tax (if applicable).
    public let taxAmount: Nullable<Double>
    /// The type of tax inclusivity applied to the payment, for determining whether the tax is included in the final price, or paid on top.
    public let taxBehavior: Nullable<ReceiptTaxBehaviors>
    /// The amount of tax that has been refunded (if applicable).
    public let taxRefundedAmount: Nullable<Double>
    /// The total to show to the creator (excluding buyer fees).
    public let total: Nullable<Double>
    /// The total in USD to show to the creator (excluding buyer fees).
    public let usdTotal: Nullable<Double>
    /// The user that made this payment.
    public let user: Nullable<RefundPaymentUser>
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
        member: Nullable<RefundPaymentMember>,
        membership: Nullable<RefundPaymentMembership>,
        metadata: Nullable<[String: JSONValue]>,
        paidAt: Nullable<Date>,
        paymentMethodType: Nullable<PaymentMethodTypes>,
        plan: Nullable<RefundPaymentPlan>,
        product: Nullable<RefundPaymentProduct>,
        subtotal: Nullable<Double>,
        taxAmount: Nullable<Double>,
        taxBehavior: Nullable<ReceiptTaxBehaviors>,
        taxRefundedAmount: Nullable<Double>,
        total: Nullable<Double>,
        usdTotal: Nullable<Double>,
        user: Nullable<RefundPaymentUser>,
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
        self.metadata = metadata
        self.paidAt = paidAt
        self.paymentMethodType = paymentMethodType
        self.plan = plan
        self.product = product
        self.subtotal = subtotal
        self.taxAmount = taxAmount
        self.taxBehavior = taxBehavior
        self.taxRefundedAmount = taxRefundedAmount
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
        self.member = try container.decode(Nullable<RefundPaymentMember>.self, forKey: .member)
        self.membership = try container.decode(Nullable<RefundPaymentMembership>.self, forKey: .membership)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.paidAt = try container.decode(Nullable<Date>.self, forKey: .paidAt)
        self.paymentMethodType = try container.decode(Nullable<PaymentMethodTypes>.self, forKey: .paymentMethodType)
        self.plan = try container.decode(Nullable<RefundPaymentPlan>.self, forKey: .plan)
        self.product = try container.decode(Nullable<RefundPaymentProduct>.self, forKey: .product)
        self.subtotal = try container.decode(Nullable<Double>.self, forKey: .subtotal)
        self.taxAmount = try container.decode(Nullable<Double>.self, forKey: .taxAmount)
        self.taxBehavior = try container.decode(Nullable<ReceiptTaxBehaviors>.self, forKey: .taxBehavior)
        self.taxRefundedAmount = try container.decode(Nullable<Double>.self, forKey: .taxRefundedAmount)
        self.total = try container.decode(Nullable<Double>.self, forKey: .total)
        self.usdTotal = try container.decode(Nullable<Double>.self, forKey: .usdTotal)
        self.user = try container.decode(Nullable<RefundPaymentUser>.self, forKey: .user)
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
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.paidAt, forKey: .paidAt)
        try container.encode(self.paymentMethodType, forKey: .paymentMethodType)
        try container.encode(self.plan, forKey: .plan)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.subtotal, forKey: .subtotal)
        try container.encode(self.taxAmount, forKey: .taxAmount)
        try container.encode(self.taxBehavior, forKey: .taxBehavior)
        try container.encode(self.taxRefundedAmount, forKey: .taxRefundedAmount)
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
        case metadata
        case paidAt = "paid_at"
        case paymentMethodType = "payment_method_type"
        case plan
        case product
        case subtotal
        case taxAmount = "tax_amount"
        case taxBehavior = "tax_behavior"
        case taxRefundedAmount = "tax_refunded_amount"
        case total
        case usdTotal = "usd_total"
        case user
    }
}