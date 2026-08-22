import Foundation

/// A refund represents a full or partial reversal of a payment, including the amount, status, and payment provider.
public struct Refund: Codable, Hashable, Sendable {
    /// The refunded amount as a decimal in the specified currency, such as 10.43 for $10.43 USD.
    public let amount: Double
    /// The datetime the refund was created.
    public let createdAt: Date
    /// The three-letter ISO currency code for the refunded amount.
    public let currency: Currencies
    /// The unique identifier for the refund.
    public let id: String
    /// The original payment that this refund was issued against. Null if the payment is no longer available.
    public let payment: Nullable<RefundPayment>
    /// The payment provider that processed the refund.
    public let provider: PaymentProviders
    /// The timestamp when the refund was created in the payment provider's system. Null if not available from the provider.
    public let providerCreatedAt: Nullable<Date>
    /// The availability status of the refund tracking reference from the payment processor. Null if no reference was provided.
    public let referenceStatus: Nullable<RefundReferenceStatuses>
    /// The type of tracking reference provided by the payment processor, such as an acquirer reference number. Null if no reference was provided.
    public let referenceType: Nullable<RefundReferenceTypes>
    /// The tracking reference value from the payment processor, used to trace the refund through banking networks. Null if no reference was provided.
    public let referenceValue: Nullable<String>
    /// The current processing status of the refund, such as pending, succeeded, or failed.
    public let status: RefundStatuses
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Double,
        createdAt: Date,
        currency: Currencies,
        id: String,
        payment: Nullable<RefundPayment>,
        provider: PaymentProviders,
        providerCreatedAt: Nullable<Date>,
        referenceStatus: Nullable<RefundReferenceStatuses>,
        referenceType: Nullable<RefundReferenceTypes>,
        referenceValue: Nullable<String>,
        status: RefundStatuses,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.createdAt = createdAt
        self.currency = currency
        self.id = id
        self.payment = payment
        self.provider = provider
        self.providerCreatedAt = providerCreatedAt
        self.referenceStatus = referenceStatus
        self.referenceType = referenceType
        self.referenceValue = referenceValue
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.id = try container.decode(String.self, forKey: .id)
        self.payment = try container.decode(Nullable<RefundPayment>.self, forKey: .payment)
        self.provider = try container.decode(PaymentProviders.self, forKey: .provider)
        self.providerCreatedAt = try container.decode(Nullable<Date>.self, forKey: .providerCreatedAt)
        self.referenceStatus = try container.decode(Nullable<RefundReferenceStatuses>.self, forKey: .referenceStatus)
        self.referenceType = try container.decode(Nullable<RefundReferenceTypes>.self, forKey: .referenceType)
        self.referenceValue = try container.decode(Nullable<String>.self, forKey: .referenceValue)
        self.status = try container.decode(RefundStatuses.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.payment, forKey: .payment)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.providerCreatedAt, forKey: .providerCreatedAt)
        try container.encode(self.referenceStatus, forKey: .referenceStatus)
        try container.encode(self.referenceType, forKey: .referenceType)
        try container.encode(self.referenceValue, forKey: .referenceValue)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case createdAt = "created_at"
        case currency
        case id
        case payment
        case provider
        case providerCreatedAt = "provider_created_at"
        case referenceStatus = "reference_status"
        case referenceType = "reference_type"
        case referenceValue = "reference_value"
        case status
    }
}