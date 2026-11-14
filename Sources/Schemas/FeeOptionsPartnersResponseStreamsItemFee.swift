import Foundation

/// The merchant fee behind this stream, or null when the business is charged nothing on it.
public struct FeeOptionsPartnersResponseStreamsItemFee: Codable, Hashable, Sendable {
    /// The lowest the fee may be priced down to.
    public let minimumPercentage: Double
    /// The fee in force, in percent units (2.7 means 2.7%).
    public let percentage: Double
    /// For a regionally priced fee, the region `percentage` and `minimum_percentage` describe, and the region an adjustment is quoted against. Null for a fee that is not priced per region.
    public let referenceRegion: Nullable<String>
    /// Every region this fee is priced for, so a caller can tell which regions a given value would reach. Empty for a fee that is not priced per region.
    public let regions: [FeeOptionsPartnersResponseStreamsItemFeeRegionsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        minimumPercentage: Double,
        percentage: Double,
        referenceRegion: Nullable<String>,
        regions: [FeeOptionsPartnersResponseStreamsItemFeeRegionsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.minimumPercentage = minimumPercentage
        self.percentage = percentage
        self.referenceRegion = referenceRegion
        self.regions = regions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.minimumPercentage = try container.decode(Double.self, forKey: .minimumPercentage)
        self.percentage = try container.decode(Double.self, forKey: .percentage)
        self.referenceRegion = try container.decode(Nullable<String>.self, forKey: .referenceRegion)
        self.regions = try container.decode([FeeOptionsPartnersResponseStreamsItemFeeRegionsItem].self, forKey: .regions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.minimumPercentage, forKey: .minimumPercentage)
        try container.encode(self.percentage, forKey: .percentage)
        try container.encode(self.referenceRegion, forKey: .referenceRegion)
        try container.encode(self.regions, forKey: .regions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case minimumPercentage = "minimum_percentage"
        case percentage
        case referenceRegion = "reference_region"
        case regions
    }
}