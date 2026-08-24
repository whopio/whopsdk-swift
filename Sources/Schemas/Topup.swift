import Foundation

/// A payment represents a completed or attempted charge. Payments track the amount, status, currency, and payment method used.
public struct Topup: Codable, Hashable, Sendable {
    /// The datetime the payment was created.
    public let createdAt: Date
    /// The three-letter ISO currency code for this payment (e.g., 'usd', 'eur').
    public let currency: Nullable<Currencies>
    /// If the payment failed, the reason for the failure.
    public let failureMessage: Nullable<String>
    /// The unique identifier for the payment.
    public let id: String
    /// The time at which this payment was successfully collected. Null if the payment has not yet succeeded. As a Unix timestamp.
    public let paidAt: Nullable<Date>
    /// The current lifecycle state of this payment (e.g., 'draft', 'open', 'paid', 'void').
    public let status: Nullable<ReceiptStatus>
    /// The total to show to the creator (excluding buyer fees).
    public let total: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: Date,
        currency: Nullable<Currencies>,
        failureMessage: Nullable<String>,
        id: String,
        paidAt: Nullable<Date>,
        status: Nullable<ReceiptStatus>,
        total: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.currency = currency
        self.failureMessage = failureMessage
        self.id = id
        self.paidAt = paidAt
        self.status = status
        self.total = total
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(Nullable<Currencies>.self, forKey: .currency)
        self.failureMessage = try container.decode(Nullable<String>.self, forKey: .failureMessage)
        self.id = try container.decode(String.self, forKey: .id)
        self.paidAt = try container.decode(Nullable<Date>.self, forKey: .paidAt)
        self.status = try container.decode(Nullable<ReceiptStatus>.self, forKey: .status)
        self.total = try container.decode(Nullable<Double>.self, forKey: .total)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.failureMessage, forKey: .failureMessage)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.paidAt, forKey: .paidAt)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.total, forKey: .total)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case currency
        case failureMessage = "failure_message"
        case id
        case paidAt = "paid_at"
        case status
        case total
    }
}