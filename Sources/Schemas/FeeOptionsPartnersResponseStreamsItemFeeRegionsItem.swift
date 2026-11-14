import Foundation

public struct FeeOptionsPartnersResponseStreamsItemFeeRegionsItem: Codable, Hashable, Sendable {
    /// The lowest fee this region may be priced down to.
    public let minimumPercentage: Double
    /// The fee in force for this region.
    public let percentage: Double
    /// The region this card row prices, e.g. `usa`.
    public let region: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        minimumPercentage: Double,
        percentage: Double,
        region: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.minimumPercentage = minimumPercentage
        self.percentage = percentage
        self.region = region
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.minimumPercentage = try container.decode(Double.self, forKey: .minimumPercentage)
        self.percentage = try container.decode(Double.self, forKey: .percentage)
        self.region = try container.decode(String.self, forKey: .region)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.minimumPercentage, forKey: .minimumPercentage)
        try container.encode(self.percentage, forKey: .percentage)
        try container.encode(self.region, forKey: .region)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case minimumPercentage = "minimum_percentage"
        case percentage
        case region
    }
}