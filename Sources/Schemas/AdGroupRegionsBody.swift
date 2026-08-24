import Foundation

/// Locations to target and exclude.
public struct AdGroupRegionsBody: Codable, Hashable, Sendable {
    /// Locations excluded from targeting. Country groups can't be excluded.
    public let exclude: AdGroupGeoLocationsBody?
    /// Locations the ad group targets.
    public let include: AdGroupGeoLocationsBody?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        exclude: AdGroupGeoLocationsBody? = nil,
        include: AdGroupGeoLocationsBody? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.exclude = exclude
        self.include = include
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.exclude = try container.decodeIfPresent(AdGroupGeoLocationsBody.self, forKey: .exclude)
        self.include = try container.decodeIfPresent(AdGroupGeoLocationsBody.self, forKey: .include)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.exclude, forKey: .exclude)
        try container.encodeIfPresent(self.include, forKey: .include)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case exclude
        case include
    }
}