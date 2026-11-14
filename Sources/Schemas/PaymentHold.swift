import Foundation

public struct PaymentHold: Codable, Hashable, Sendable {
    /// The amount currently held, in the hold's currency.
    public let amount: Money
    /// The reserve percentage recorded when the hold was created, for example 3.5 for 3.5%. Null for other hold types or when no percentage was recorded.
    public let percentage: Nullable<Double>
    /// When the held funds are scheduled to become available, as an ISO 8601 timestamp. Never earlier than the payment's settlement date. Null when release depends on an event, such as shipment resolution, rather than a date.
    public let releaseAt: Nullable<String>
    /// The reason funds are held: `reserve`, `bnpl`, `sequra`, `fraud_hold`, or `preshipment_hold`.
    public let type: PaymentHoldType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Money,
        percentage: Nullable<Double>,
        releaseAt: Nullable<String>,
        type: PaymentHoldType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.percentage = percentage
        self.releaseAt = releaseAt
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Money.self, forKey: .amount)
        self.percentage = try container.decode(Nullable<Double>.self, forKey: .percentage)
        self.releaseAt = try container.decode(Nullable<String>.self, forKey: .releaseAt)
        self.type = try container.decode(PaymentHoldType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.percentage, forKey: .percentage)
        try container.encode(self.releaseAt, forKey: .releaseAt)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case percentage
        case releaseAt = "release_at"
        case type
    }
}