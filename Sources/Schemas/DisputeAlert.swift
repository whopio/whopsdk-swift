import Foundation

public struct DisputeAlert: Codable, Hashable, Sendable {
    /// The account the alerted payment belongs to, prefixed `biz_`. `null` while the alert is unmatched.
    public let accountId: Nullable<String>
    /// Whether refunding the payment can still avoid a chargeback. `false` once the payment has been disputed or fully refunded, or when the alert could not be matched to a payment — `not_actionable_reason` says which.
    public let actionable: Bool
    /// The alerted amount, in whole units of `currency`. This is what the issuer reported, which can differ from the payment's own amount.
    public let amount: Double
    /// The card network as reported by the issuer, lowercased, such as `visa` or `mastercard`. `unknown` when the report carries neither a network nor a recognizable BIN.
    public let cardBrand: Nullable<String>
    /// When Whop received the alert, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Three-letter ISO currency code of the alerted amount.
    public let currency: String
    /// Whether Whop charged the account an alert fee for this one. Always `false` for `early_fraud_warning`, which Whop is not billed for and never passes on.
    public let feeCharged: Bool
    /// Dispute alert ID, prefixed `dspa_`.
    public let id: String
    /// Name of the bank that issued the card and filed the report.
    public let issuer: Nullable<String>
    /// Why refunding can no longer avoid a chargeback. `network_resolved` when a Visa RDR already closed the case, `payment_unmatched` when no payment matched, `payment_not_captured` when it never captured money, `payment_disputed` once the payment carries a dispute, `payment_refunded` once fully refunded. `null` while `actionable` is true.
    public let notActionableReason: Nullable<DisputeAlertNotActionableReason>
    /// The payment the issuer reported, prefixed `pay_`. `null` when Whop could not match the report to a payment.
    public let paymentId: Nullable<String>
    /// The product the alerted payment was for, prefixed `prod_`.
    public let productId: Nullable<String>
    /// When the issuer filed the report, as an ISO 8601 timestamp. Earlier than `created_at`, which is when Whop received it.
    public let reportedAt: String
    /// When the reported transaction was made, as an ISO 8601 timestamp.
    public let transactionAt: Nullable<String>
    /// What the issuer sent. `early_fraud_warning` is a fraud report on a settled payment (Visa TC40 / Mastercard SAFE) — refunding still avoids the chargeback, and Whop never charges a fee for one. `dispute_alert` is a pre-dispute notice from the issuer's alert network, which Whop pays for and passes on as a fee. `rapid_dispute_resolution` is a Visa RDR case the network already closed by refunding the payment — nothing is left to act on.
    public let type: DisputeAlertType
    /// When the alert was last changed, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        actionable: Bool,
        amount: Double,
        cardBrand: Nullable<String>,
        createdAt: String,
        currency: String,
        feeCharged: Bool,
        id: String,
        issuer: Nullable<String>,
        notActionableReason: Nullable<DisputeAlertNotActionableReason>,
        paymentId: Nullable<String>,
        productId: Nullable<String>,
        reportedAt: String,
        transactionAt: Nullable<String>,
        type: DisputeAlertType,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.actionable = actionable
        self.amount = amount
        self.cardBrand = cardBrand
        self.createdAt = createdAt
        self.currency = currency
        self.feeCharged = feeCharged
        self.id = id
        self.issuer = issuer
        self.notActionableReason = notActionableReason
        self.paymentId = paymentId
        self.productId = productId
        self.reportedAt = reportedAt
        self.transactionAt = transactionAt
        self.type = type
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.actionable = try container.decode(Bool.self, forKey: .actionable)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.cardBrand = try container.decode(Nullable<String>.self, forKey: .cardBrand)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.feeCharged = try container.decode(Bool.self, forKey: .feeCharged)
        self.id = try container.decode(String.self, forKey: .id)
        self.issuer = try container.decode(Nullable<String>.self, forKey: .issuer)
        self.notActionableReason = try container.decode(Nullable<DisputeAlertNotActionableReason>.self, forKey: .notActionableReason)
        self.paymentId = try container.decode(Nullable<String>.self, forKey: .paymentId)
        self.productId = try container.decode(Nullable<String>.self, forKey: .productId)
        self.reportedAt = try container.decode(String.self, forKey: .reportedAt)
        self.transactionAt = try container.decode(Nullable<String>.self, forKey: .transactionAt)
        self.type = try container.decode(DisputeAlertType.self, forKey: .type)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.actionable, forKey: .actionable)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.cardBrand, forKey: .cardBrand)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.feeCharged, forKey: .feeCharged)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.issuer, forKey: .issuer)
        try container.encode(self.notActionableReason, forKey: .notActionableReason)
        try container.encode(self.paymentId, forKey: .paymentId)
        try container.encode(self.productId, forKey: .productId)
        try container.encode(self.reportedAt, forKey: .reportedAt)
        try container.encode(self.transactionAt, forKey: .transactionAt)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case actionable
        case amount
        case cardBrand = "card_brand"
        case createdAt = "created_at"
        case currency
        case feeCharged = "fee_charged"
        case id
        case issuer
        case notActionableReason = "not_actionable_reason"
        case paymentId = "payment_id"
        case productId = "product_id"
        case reportedAt = "reported_at"
        case transactionAt = "transaction_at"
        case type
        case updatedAt = "updated_at"
    }
}