import Foundation

public struct AdGroupRegions: Codable, Hashable, Sendable {
    /// Locations excluded from targeting. Country groups can't be excluded.
    public let exclude: AdGroupGeoLocations
    /// Locations the ad group targets.
    public let include: AdGroupGeoLocations
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        exclude: AdGroupGeoLocations,
        include: AdGroupGeoLocations,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.exclude = exclude
        self.include = include
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.exclude = try container.decode(AdGroupGeoLocations.self, forKey: .exclude)
        self.include = try container.decode(AdGroupGeoLocations.self, forKey: .include)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.exclude, forKey: .exclude)
        try container.encode(self.include, forKey: .include)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case exclude
        case include
    }
}