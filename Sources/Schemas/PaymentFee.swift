import Foundation

public struct PaymentFee: Codable, Hashable, Sendable {
    /// The fee in the currency it was collected in.
    public let amount: Money
    /// When the fee was collected, as an ISO 8601 timestamp, or null when it has not been.
    public let collectedAt: Nullable<String>
    /// A longer explanation of the fee, when there is one.
    public let description: Nullable<String>
    /// The name the dashboard shows for this fee.
    public let label: String
    /// The specific fee this line is, such as `payment_processing_percentage_fee` or `revshare_percentage_fee`.
    public let origin: PaymentFeeOrigin
    /// The fee converted to the payment's settlement currency, so lines can be totalled against the payment.
    public let settlementAmount: Money
    /// The family the fee belongs to: `whop_fee`, `processing_fee`, `affiliate_program_fee`, or `other_fee`.
    public let type: PaymentFeeType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Money,
        collectedAt: Nullable<String>,
        description: Nullable<String>,
        label: String,
        origin: PaymentFeeOrigin,
        settlementAmount: Money,
        type: PaymentFeeType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.collectedAt = collectedAt
        self.description = description
        self.label = label
        self.origin = origin
        self.settlementAmount = settlementAmount
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Money.self, forKey: .amount)
        self.collectedAt = try container.decode(Nullable<String>.self, forKey: .collectedAt)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.label = try container.decode(String.self, forKey: .label)
        self.origin = try container.decode(PaymentFeeOrigin.self, forKey: .origin)
        self.settlementAmount = try container.decode(Money.self, forKey: .settlementAmount)
        self.type = try container.decode(PaymentFeeType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.collectedAt, forKey: .collectedAt)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.label, forKey: .label)
        try container.encode(self.origin, forKey: .origin)
        try container.encode(self.settlementAmount, forKey: .settlementAmount)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case collectedAt = "collected_at"
        case description
        case label
        case origin
        case settlementAmount = "settlement_amount"
        case type
    }
}