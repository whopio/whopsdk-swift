import Foundation

public struct PartnerPayoutRate: Codable, Hashable, Sendable {
    /// Income source that generates this percentage payout.
    public let incomeSource: PartnerPayoutRateIncomeSource
    /// Partner's default percentage for this tier and income source. For example, 30 means 30%.
    public let percentage: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        incomeSource: PartnerPayoutRateIncomeSource,
        percentage: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.incomeSource = incomeSource
        self.percentage = percentage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.incomeSource = try container.decode(PartnerPayoutRateIncomeSource.self, forKey: .incomeSource)
        self.percentage = try container.decode(Double.self, forKey: .percentage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.incomeSource, forKey: .incomeSource)
        try container.encode(self.percentage, forKey: .percentage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case incomeSource = "income_source"
        case percentage
    }
}