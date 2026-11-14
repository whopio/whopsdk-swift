import Foundation

/// Fee terms for payouts to this method: a percentage of the payout amount plus a fixed fee. The quotes carry the exact fee for a specific amount.
public struct ListSupportedMethodsResponseDataItemFeeStructure: Codable, Hashable, Sendable {
    /// Fixed fee charged on every payout, on top of the percentage.
    public let fixed: Money
    /// Percentage of the payout amount charged as a fee.
    public let percentage: Float
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fixed: Money,
        percentage: Float,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fixed = fixed
        self.percentage = percentage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fixed = try container.decode(Money.self, forKey: .fixed)
        self.percentage = try container.decode(Float.self, forKey: .percentage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.fixed, forKey: .fixed)
        try container.encode(self.percentage, forKey: .percentage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fixed
        case percentage
    }
}