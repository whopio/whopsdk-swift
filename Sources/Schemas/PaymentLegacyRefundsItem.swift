import Foundation

/// A refund represents a full or partial reversal of a payment, including the amount, status, and payment provider.
public struct PaymentLegacyRefundsItem: Codable, Hashable, Sendable {
    /// The refunded amount as a decimal in the specified currency, such as 10.43 for $10.43 USD.
    public let amount: Double
    /// The datetime the refund was created.
    public let createdAt: Date
    /// The three-letter ISO currency code for the refunded amount.
    public let currency: Currencies
    /// The unique identifier for the refund.
    public let id: String
    /// The current processing status of the refund, such as pending, succeeded, or failed.
    public let status: RefundStatuses
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Double,
        createdAt: Date,
        currency: Currencies,
        id: String,
        status: RefundStatuses,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.createdAt = createdAt
        self.currency = currency
        self.id = id
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.id = try container.decode(String.self, forKey: .id)
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
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case createdAt = "created_at"
        case currency
        case id
        case status
    }
}