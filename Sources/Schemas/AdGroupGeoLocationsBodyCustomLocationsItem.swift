import Foundation

public struct AdGroupGeoLocationsBodyCustomLocationsItem: Codable, Hashable, Sendable {
    /// ISO 3166-1 alpha-2 country the point falls in, as `DE`. Send it under a special ad category: the campaign must declare the countries its ad sets reach, and a coordinate names none.
    public let countryCode: String?
    /// Unit for `radius`. Defaults to `mile`.
    public let distanceUnit: AdGroupGeoLocationsBodyCustomLocationsItemDistanceUnit?
    /// Latitude of the center point.
    public let latitude: Double
    /// Longitude of the center point.
    public let longitude: Double
    /// Label for the location, such as a city or address.
    public let name: String?
    /// Radius around the center point: 1-50 miles or 1-80 kilometers.
    public let radius: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        countryCode: String? = nil,
        distanceUnit: AdGroupGeoLocationsBodyCustomLocationsItemDistanceUnit? = nil,
        latitude: Double,
        longitude: Double,
        name: String? = nil,
        radius: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.countryCode = countryCode
        self.distanceUnit = distanceUnit
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.radius = radius
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.countryCode = try container.decodeIfPresent(String.self, forKey: .countryCode)
        self.distanceUnit = try container.decodeIfPresent(AdGroupGeoLocationsBodyCustomLocationsItemDistanceUnit.self, forKey: .distanceUnit)
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitude = try container.decode(Double.self, forKey: .longitude)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.radius = try container.decode(Double.self, forKey: .radius)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.countryCode, forKey: .countryCode)
        try container.encodeIfPresent(self.distanceUnit, forKey: .distanceUnit)
        try container.encode(self.latitude, forKey: .latitude)
        try container.encode(self.longitude, forKey: .longitude)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.radius, forKey: .radius)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case countryCode = "country_code"
        case distanceUnit = "distance_unit"
        case latitude
        case longitude
        case name
        case radius
    }
}