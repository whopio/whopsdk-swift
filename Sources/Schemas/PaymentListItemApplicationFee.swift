import Foundation

/// The application fee charged on this payment.
public struct PaymentListItemApplicationFee: Codable, Hashable, Sendable {
    /// The application fee amount.
    public let amount: Double
    /// The amount of the application fee that has been captured.
    public let amountCaptured: Double
    /// The amount of the application fee that has been refunded.
    public let amountRefunded: Double
    /// The datetime the application fee was created.
    public let createdAt: Date
    /// The currency of the application fee.
    public let currency: Currencies
    /// The unique identifier for the application fee.
    public let id: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Double,
        amountCaptured: Double,
        amountRefunded: Double,
        createdAt: Date,
        currency: Currencies,
        id: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.amountCaptured = amountCaptured
        self.amountRefunded = amountRefunded
        self.createdAt = createdAt
        self.currency = currency
        self.id = id
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.amountCaptured = try container.decode(Double.self, forKey: .amountCaptured)
        self.amountRefunded = try container.decode(Double.self, forKey: .amountRefunded)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.id = try container.decode(String.self, forKey: .id)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.amountCaptured, forKey: .amountCaptured)
        try container.encode(self.amountRefunded, forKey: .amountRefunded)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.id, forKey: .id)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case amountCaptured = "amount_captured"
        case amountRefunded = "amount_refunded"
        case createdAt = "created_at"
        case currency
        case id
    }
}