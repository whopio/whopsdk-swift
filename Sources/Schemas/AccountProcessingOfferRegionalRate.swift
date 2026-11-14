import Foundation

public struct AccountProcessingOfferRegionalRate: Codable, Hashable, Sendable {
    /// The standard card processing percentage at this level for cards from this region, regardless of the account's custom rate.
    public let processingRatePercentage: Double
    /// The card region this fee applies to.
    public let region: AccountProcessingOfferRegionalRateRegion
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        processingRatePercentage: Double,
        region: AccountProcessingOfferRegionalRateRegion,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.processingRatePercentage = processingRatePercentage
        self.region = region
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.processingRatePercentage = try container.decode(Double.self, forKey: .processingRatePercentage)
        self.region = try container.decode(AccountProcessingOfferRegionalRateRegion.self, forKey: .region)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.processingRatePercentage, forKey: .processingRatePercentage)
        try container.encode(self.region, forKey: .region)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case processingRatePercentage = "processing_rate_percentage"
        case region
    }
}