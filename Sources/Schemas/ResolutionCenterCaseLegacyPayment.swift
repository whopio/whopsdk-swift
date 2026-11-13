import Foundation

/// The payment record that is the subject of this resolution case.
public struct ResolutionCenterCaseLegacyPayment: Codable, Hashable, Sendable {
    /// The datetime the payment was created.
    public let createdAt: Date
    /// The three-letter ISO currency code for this payment (e.g., 'usd', 'eur').
    public let currency: Nullable<Currencies>
    /// The unique identifier for the payment.
    public let id: String
    /// The time at which this payment was successfully collected. Null if the payment has not yet succeeded. As a Unix timestamp.
    public let paidAt: Nullable<Date>
    /// The payment amount before taxes and discounts are applied. In the currency specified by the currency field.
    public let subtotal: Nullable<Double>
    /// The total amount charged to the customer for this payment, including taxes and after any discounts. In the currency specified by the currency field.
    public let total: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: Date,
        currency: Nullable<Currencies>,
        id: String,
        paidAt: Nullable<Date>,
        subtotal: Nullable<Double>,
        total: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.currency = currency
        self.id = id
        self.paidAt = paidAt
        self.subtotal = subtotal
        self.total = total
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(Nullable<Currencies>.self, forKey: .currency)
        self.id = try container.decode(String.self, forKey: .id)
        self.paidAt = try container.decode(Nullable<Date>.self, forKey: .paidAt)
        self.subtotal = try container.decode(Nullable<Double>.self, forKey: .subtotal)
        self.total = try container.decode(Double.self, forKey: .total)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.paidAt, forKey: .paidAt)
        try container.encode(self.subtotal, forKey: .subtotal)
        try container.encode(self.total, forKey: .total)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case currency
        case id
        case paidAt = "paid_at"
        case subtotal
        case total
    }
}