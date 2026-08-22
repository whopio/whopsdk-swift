import Foundation

public struct AdGroupGeoLocations: Codable, Hashable, Sendable {
    public let cities: [AdGroupCity]
    public let countries: [String]
    public let countryGroups: [String]
    public let customLocations: [AdGroupCustomLocation]
    public let regions: [String]
    public let zips: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cities: [AdGroupCity],
        countries: [String],
        countryGroups: [String],
        customLocations: [AdGroupCustomLocation],
        regions: [String],
        zips: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cities = cities
        self.countries = countries
        self.countryGroups = countryGroups
        self.customLocations = customLocations
        self.regions = regions
        self.zips = zips
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cities = try container.decode([AdGroupCity].self, forKey: .cities)
        self.countries = try container.decode([String].self, forKey: .countries)
        self.countryGroups = try container.decode([String].self, forKey: .countryGroups)
        self.customLocations = try container.decode([AdGroupCustomLocation].self, forKey: .customLocations)
        self.regions = try container.decode([String].self, forKey: .regions)
        self.zips = try container.decode([String].self, forKey: .zips)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.cities, forKey: .cities)
        try container.encode(self.countries, forKey: .countries)
        try container.encode(self.countryGroups, forKey: .countryGroups)
        try container.encode(self.customLocations, forKey: .customLocations)
        try container.encode(self.regions, forKey: .regions)
        try container.encode(self.zips, forKey: .zips)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cities
        case countries
        case countryGroups = "country_groups"
        case customLocations = "custom_locations"
        case regions
        case zips
    }
}