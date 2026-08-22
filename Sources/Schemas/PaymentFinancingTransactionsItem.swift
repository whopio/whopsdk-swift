import Foundation

/// A payment transaction.
public struct PaymentFinancingTransactionsItem: Codable, Hashable, Sendable {
    /// The amount of the payment transaction.
    public let amount: Double
    /// The date and time the payment transaction was created.
    public let createdAt: Date
    /// The unique identifier for the payment transaction.
    public let id: String
    /// The status of the payment transaction.
    public let status: PaymentTransactionStatuses
    /// The type of the payment transaction.
    public let transactionType: PaymentTransactionTypes
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Double,
        createdAt: Date,
        id: String,
        status: PaymentTransactionStatuses,
        transactionType: PaymentTransactionTypes,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.createdAt = createdAt
        self.id = id
        self.status = status
        self.transactionType = transactionType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.status = try container.decode(PaymentTransactionStatuses.self, forKey: .status)
        self.transactionType = try container.decode(PaymentTransactionTypes.self, forKey: .transactionType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.transactionType, forKey: .transactionType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case createdAt = "created_at"
        case id
        case status
        case transactionType = "transaction_type"
    }
}