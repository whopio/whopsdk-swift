import Foundation

public struct AdGroupGeoLocationsBody: Codable, Hashable, Sendable {
    /// Cities, keyed by the location taxonomy.
    public let cities: [AdGroupGeoLocationsBodyCitiesItem]?
    /// Countries, as ISO 3166-1 alpha-2 codes such as `US`.
    public let countries: [String]?
    /// Multi-country groups such as `worldwide` or `europe`. Include-only — groups can't be excluded.
    public let countryGroups: [String]?
    /// Circular areas, each a coordinate plus a radius. At most 200 across include and exclude.
    public let customLocations: [AdGroupGeoLocationsBodyCustomLocationsItem]?
    /// US states and DC, as ISO 3166-2 codes such as `US-CA`. US territories (`PR`, `GU`, `VI`, `AS`, `MP`) and everywhere outside the US are targeted through `countries`.
    public let regions: [String]?
    /// ZIP and postal codes, keyed as `COUNTRY:CODE`, such as `US:78756`. Include the country: a bare code is ambiguous, because the same one exists in several countries.
    public let zips: [AdGroupGeoLocationsBodyZipsItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cities: [AdGroupGeoLocationsBodyCitiesItem]? = nil,
        countries: [String]? = nil,
        countryGroups: [String]? = nil,
        customLocations: [AdGroupGeoLocationsBodyCustomLocationsItem]? = nil,
        regions: [String]? = nil,
        zips: [AdGroupGeoLocationsBodyZipsItem]? = nil,
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
        self.cities = try container.decodeIfPresent([AdGroupGeoLocationsBodyCitiesItem].self, forKey: .cities)
        self.countries = try container.decodeIfPresent([String].self, forKey: .countries)
        self.countryGroups = try container.decodeIfPresent([String].self, forKey: .countryGroups)
        self.customLocations = try container.decodeIfPresent([AdGroupGeoLocationsBodyCustomLocationsItem].self, forKey: .customLocations)
        self.regions = try container.decodeIfPresent([String].self, forKey: .regions)
        self.zips = try container.decodeIfPresent([AdGroupGeoLocationsBodyZipsItem].self, forKey: .zips)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cities, forKey: .cities)
        try container.encodeIfPresent(self.countries, forKey: .countries)
        try container.encodeIfPresent(self.countryGroups, forKey: .countryGroups)
        try container.encodeIfPresent(self.customLocations, forKey: .customLocations)
        try container.encodeIfPresent(self.regions, forKey: .regions)
        try container.encodeIfPresent(self.zips, forKey: .zips)
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