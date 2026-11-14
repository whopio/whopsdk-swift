import Foundation

public struct AccountProcessingOfferLevel: Codable, Hashable, Sendable {
    /// The processing level.
    public let level: Int
    /// The monthly qualifying spend required to reach this level.
    public let minimumSpend: Money
    /// The standard US and Canada card processing percentage at this level, regardless of the account's custom rate.
    public let processingRatePercentage: Double
    public let regionalRates: [AccountProcessingOfferRegionalRate]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        level: Int,
        minimumSpend: Money,
        processingRatePercentage: Double,
        regionalRates: [AccountProcessingOfferRegionalRate],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.level = level
        self.minimumSpend = minimumSpend
        self.processingRatePercentage = processingRatePercentage
        self.regionalRates = regionalRates
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.level = try container.decode(Int.self, forKey: .level)
        self.minimumSpend = try container.decode(Money.self, forKey: .minimumSpend)
        self.processingRatePercentage = try container.decode(Double.self, forKey: .processingRatePercentage)
        self.regionalRates = try container.decode([AccountProcessingOfferRegionalRate].self, forKey: .regionalRates)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.level, forKey: .level)
        try container.encode(self.minimumSpend, forKey: .minimumSpend)
        try container.encode(self.processingRatePercentage, forKey: .processingRatePercentage)
        try container.encode(self.regionalRates, forKey: .regionalRates)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case level
        case minimumSpend = "minimum_spend"
        case processingRatePercentage = "processing_rate_percentage"
        case regionalRates = "regional_rates"
    }
}