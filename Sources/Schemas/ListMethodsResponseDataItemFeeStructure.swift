import Foundation

/// Configured fee terms for this payout method. Null when the method is not currently eligible. An amount-specific quote remains authoritative.
public struct ListMethodsResponseDataItemFeeStructure: Codable, Hashable, Sendable {
    /// Currency code of fixed_amount.
    public let currency: String
    /// Fixed fee charged, denominated in `currency`.
    public let fixedAmount: Float
    /// Percentage of the withdrawal amount charged as a fee.
    public let percentage: Float
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        currency: String,
        fixedAmount: Float,
        percentage: Float,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.currency = currency
        self.fixedAmount = fixedAmount
        self.percentage = percentage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.fixedAmount = try container.decode(Float.self, forKey: .fixedAmount)
        self.percentage = try container.decode(Float.self, forKey: .percentage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.fixedAmount, forKey: .fixedAmount)
        try container.encode(self.percentage, forKey: .percentage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case currency
        case fixedAmount = "fixed_amount"
        case percentage
    }
}