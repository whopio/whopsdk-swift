import Foundation

public struct DisputeAlert: Codable, Hashable, Sendable {
    /// The account the alerted payment belongs to, prefixed `biz_`. `null` while the alert is unmatched.
    public let accountId: Nullable<String>
    /// The alerted amount, in whole units of `currency`. This is what the issuer reported, which can differ from the payment's own amount.
    public let amount: Double
    /// Whether Whop automatically refunded the alerted payment. Reflects the payment, so it can be `true` for a refund issued by another flow (RDR, resolution) on the same payment.
    public let autoRefunded: Bool
    /// The card network as reported by the issuer, lowercased, such as `visa` or `mastercard`. `unknown` when the report carries neither a network nor a recognizable BIN.
    public let cardBrand: Nullable<String>
    /// What the cardholder claims. `fraud` when they say they didn't make the payment: always for an `early_fraud_warning`, and for Ethoca fraud alerts and Visa RDR cases filed under a fraud reason. `customer_dispute` when they made the payment but dispute it, such as a product not received or a canceled subscription. `null` when the alert carries no claim, such as an issuer's request for transaction documents.
    public let category: Nullable<DisputeAlertCategory>
    /// When Whop received the alert, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Three-letter ISO currency code of the alerted amount.
    public let currency: String
    /// The alert fee charged to the account, in the currency it was collected in. `null` when `fee_charged` is false.
    public let fee: Nullable<Money>
    /// Whether Whop charged the account an alert fee for this one. Always `false` for `early_fraud_warning`, which Whop is not billed for and never passes on.
    public let feeCharged: Bool
    /// Dispute alert ID, prefixed `dspa_`.
    public let id: String
    /// Deprecated: always `null` outside Whop's own dashboard. Name of the bank that issued the card and filed the report.
    /// DEPRECATED: Always null outside Whop's own dashboard.
    public let issuer: Nullable<String>
    /// The payment the issuer reported, prefixed `pay_`. `null` when Whop could not match the report to a payment.
    public let paymentId: Nullable<String>
    /// The product the alerted payment was for, prefixed `prod_`.
    public let productId: Nullable<String>
    /// When the issuer filed the report, as an ISO 8601 timestamp. Earlier than `created_at`, which is when Whop received it.
    public let reportedAt: String
    /// The network program that sent the alert, which `type` alone doesn't tell apart. `ethoca` for Mastercard Ethoca, `cdrn` for Visa Verifi CDRN, `rdr` for Visa RDR, `tc40` / `safe` for a Visa / Mastercard fraud report, `paypal` for a PayPal alert. `null` when the network didn't say.
    public let source: Nullable<DisputeAlertSource>
    /// When the reported transaction was made, as an ISO 8601 timestamp — falls back to when the matched payment was made if the issuer's own report didn't carry one. Should not be `null` in practice; treat one as a data issue rather than expected behavior.
    public let transactionAt: Nullable<String>
    /// What the issuer sent. `early_fraud_warning` is a fraud report on a settled payment (Visa TC40 / Mastercard SAFE) — refunding still avoids the chargeback, and Whop never charges a fee for one. `dispute_alert` is a pre-dispute notice from the issuer's alert network, which Whop pays for and passes on as a fee. `rapid_dispute_resolution` is a Visa RDR case the network already closed by refunding the payment — nothing is left to act on.
    public let type: DisputeAlertType
    /// When the alert was last changed, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        amount: Double,
        autoRefunded: Bool,
        cardBrand: Nullable<String>,
        category: Nullable<DisputeAlertCategory>,
        createdAt: String,
        currency: String,
        fee: Nullable<Money>,
        feeCharged: Bool,
        id: String,
        issuer: Nullable<String>,
        paymentId: Nullable<String>,
        productId: Nullable<String>,
        reportedAt: String,
        source: Nullable<DisputeAlertSource>,
        transactionAt: Nullable<String>,
        type: DisputeAlertType,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.amount = amount
        self.autoRefunded = autoRefunded
        self.cardBrand = cardBrand
        self.category = category
        self.createdAt = createdAt
        self.currency = currency
        self.fee = fee
        self.feeCharged = feeCharged
        self.id = id
        self.issuer = issuer
        self.paymentId = paymentId
        self.productId = productId
        self.reportedAt = reportedAt
        self.source = source
        self.transactionAt = transactionAt
        self.type = type
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.autoRefunded = try container.decode(Bool.self, forKey: .autoRefunded)
        self.cardBrand = try container.decode(Nullable<String>.self, forKey: .cardBrand)
        self.category = try container.decode(Nullable<DisputeAlertCategory>.self, forKey: .category)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.fee = try container.decode(Nullable<Money>.self, forKey: .fee)
        self.feeCharged = try container.decode(Bool.self, forKey: .feeCharged)
        self.id = try container.decode(String.self, forKey: .id)
        self.issuer = try container.decode(Nullable<String>.self, forKey: .issuer)
        self.paymentId = try container.decode(Nullable<String>.self, forKey: .paymentId)
        self.productId = try container.decode(Nullable<String>.self, forKey: .productId)
        self.reportedAt = try container.decode(String.self, forKey: .reportedAt)
        self.source = try container.decode(Nullable<DisputeAlertSource>.self, forKey: .source)
        self.transactionAt = try container.decode(Nullable<String>.self, forKey: .transactionAt)
        self.type = try container.decode(DisputeAlertType.self, forKey: .type)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.autoRefunded, forKey: .autoRefunded)
        try container.encode(self.cardBrand, forKey: .cardBrand)
        try container.encode(self.category, forKey: .category)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.fee, forKey: .fee)
        try container.encode(self.feeCharged, forKey: .feeCharged)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.issuer, forKey: .issuer)
        try container.encode(self.paymentId, forKey: .paymentId)
        try container.encode(self.productId, forKey: .productId)
        try container.encode(self.reportedAt, forKey: .reportedAt)
        try container.encode(self.source, forKey: .source)
        try container.encode(self.transactionAt, forKey: .transactionAt)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case amount
        case autoRefunded = "auto_refunded"
        case cardBrand = "card_brand"
        case category
        case createdAt = "created_at"
        case currency
        case fee
        case feeCharged = "fee_charged"
        case id
        case issuer
        case paymentId = "payment_id"
        case productId = "product_id"
        case reportedAt = "reported_at"
        case source
        case transactionAt = "transaction_at"
        case type
        case updatedAt = "updated_at"
    }
}