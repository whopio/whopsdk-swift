import Foundation

public struct Refund: Codable, Hashable, Sendable {
    /// The account that issued the refund, prefixed `biz_`.
    public let accountId: Nullable<String>
    /// The refunded amount as it settled, in the payment's settlement currency, so pages of refunds net against the payment's `refunded_amount`. Converted at the rate in force when the refund was issued, not the payment's original rate. Null only when no exchange rate is recorded for a legacy multi-currency payment.
    public let amount: Nullable<Money>
    /// When the refund was requested, as an ISO 8601 timestamp.
    public let createdAt: String
    /// A merchant-facing explanation of why the refund failed, in the request's language. Null unless the refund failed or was canceled.
    public let failureMessage: Nullable<String>
    /// Why the refund failed, normalized across providers. Null unless the refund failed or was canceled.
    public let failureReason: Nullable<RefundFailureReason>
    /// Refund ID, prefixed `rf_`.
    public let id: String
    /// Your own key-value data attached when the refund was requested.
    public let metadata: Nullable<[String: JSONValue]>
    /// The refunded amount in the currency the processor moved.
    public let originalAmount: Money
    /// The payment this refund reverses, prefixed `pay_`.
    public let paymentId: String
    /// The payment provider that processed the refund, such as `paypal` or `coinbase`.
    public let provider: String
    /// When the provider created the refund, as an ISO 8601 timestamp.
    public let providerCreatedAt: Nullable<String>
    /// Why the refund was issued, when recorded.
    public let reason: Nullable<RefundReason>
    /// Whether a banking-network tracking reference is available for this refund.
    public let referenceStatus: Nullable<RefundReferenceStatus>
    /// The kind of tracking reference, such as an acquirer reference number.
    public let referenceType: Nullable<RefundReferenceType>
    /// The tracking reference the buyer's bank can trace the refund by.
    public let referenceValue: Nullable<String>
    /// Where the refund stands with the processor: `pending`, `requires_action`, `succeeded`, `failed`, or `canceled`.
    public let status: RefundStatus
    /// When the refund last changed, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// True when the card network initiated the refund through Rapid Dispute Resolution.
    public let visaRdr: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        amount: Nullable<Money>,
        createdAt: String,
        failureMessage: Nullable<String>,
        failureReason: Nullable<RefundFailureReason>,
        id: String,
        metadata: Nullable<[String: JSONValue]>,
        originalAmount: Money,
        paymentId: String,
        provider: String,
        providerCreatedAt: Nullable<String>,
        reason: Nullable<RefundReason>,
        referenceStatus: Nullable<RefundReferenceStatus>,
        referenceType: Nullable<RefundReferenceType>,
        referenceValue: Nullable<String>,
        status: RefundStatus,
        updatedAt: String,
        visaRdr: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.amount = amount
        self.createdAt = createdAt
        self.failureMessage = failureMessage
        self.failureReason = failureReason
        self.id = id
        self.metadata = metadata
        self.originalAmount = originalAmount
        self.paymentId = paymentId
        self.provider = provider
        self.providerCreatedAt = providerCreatedAt
        self.reason = reason
        self.referenceStatus = referenceStatus
        self.referenceType = referenceType
        self.referenceValue = referenceValue
        self.status = status
        self.updatedAt = updatedAt
        self.visaRdr = visaRdr
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.amount = try container.decode(Nullable<Money>.self, forKey: .amount)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.failureMessage = try container.decode(Nullable<String>.self, forKey: .failureMessage)
        self.failureReason = try container.decode(Nullable<RefundFailureReason>.self, forKey: .failureReason)
        self.id = try container.decode(String.self, forKey: .id)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.originalAmount = try container.decode(Money.self, forKey: .originalAmount)
        self.paymentId = try container.decode(String.self, forKey: .paymentId)
        self.provider = try container.decode(String.self, forKey: .provider)
        self.providerCreatedAt = try container.decode(Nullable<String>.self, forKey: .providerCreatedAt)
        self.reason = try container.decode(Nullable<RefundReason>.self, forKey: .reason)
        self.referenceStatus = try container.decode(Nullable<RefundReferenceStatus>.self, forKey: .referenceStatus)
        self.referenceType = try container.decode(Nullable<RefundReferenceType>.self, forKey: .referenceType)
        self.referenceValue = try container.decode(Nullable<String>.self, forKey: .referenceValue)
        self.status = try container.decode(RefundStatus.self, forKey: .status)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.visaRdr = try container.decode(Bool.self, forKey: .visaRdr)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.failureMessage, forKey: .failureMessage)
        try container.encode(self.failureReason, forKey: .failureReason)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.originalAmount, forKey: .originalAmount)
        try container.encode(self.paymentId, forKey: .paymentId)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.providerCreatedAt, forKey: .providerCreatedAt)
        try container.encode(self.reason, forKey: .reason)
        try container.encode(self.referenceStatus, forKey: .referenceStatus)
        try container.encode(self.referenceType, forKey: .referenceType)
        try container.encode(self.referenceValue, forKey: .referenceValue)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.visaRdr, forKey: .visaRdr)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case amount
        case createdAt = "created_at"
        case failureMessage = "failure_message"
        case failureReason = "failure_reason"
        case id
        case metadata
        case originalAmount = "original_amount"
        case paymentId = "payment_id"
        case provider
        case providerCreatedAt = "provider_created_at"
        case reason
        case referenceStatus = "reference_status"
        case referenceType = "reference_type"
        case referenceValue = "reference_value"
        case status
        case updatedAt = "updated_at"
        case visaRdr = "visa_rdr"
    }
}