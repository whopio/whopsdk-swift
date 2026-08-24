import Foundation

public struct LocationTargetingOption: Codable, Hashable, Sendable {
    /// The standardized code the ad-group `regions` field takes: an ISO 3166-1 code for countries (`US`) or an ISO 3166-2 code for states and provinces (`US-CA`, `CA-ON`). Null for a location that has no standard code, such as a city or a metro area — target those by `key` in the `regions` cities list instead.
    public let code: Nullable<String>
    /// ISO 3166-1 code of the country the location sits in.
    public let countryCode: Nullable<String>
    /// Name of the country the location sits in.
    public let countryName: Nullable<String>
    /// The ad platform's key for the location in its location taxonomy. Use it as the `key` of a `regions` city or zip entry.
    public let key: String
    /// Granularity of the location. Which of these an ad platform reports depends on how finely it divides its location taxonomy.
    public let locationType: LocationTargetingOptionLocationType
    /// Display name, such as `California`.
    public let name: String
    /// Name of the state or province a city sits in. Null for everything but cities.
    public let region: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        code: Nullable<String>,
        countryCode: Nullable<String>,
        countryName: Nullable<String>,
        key: String,
        locationType: LocationTargetingOptionLocationType,
        name: String,
        region: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.code = code
        self.countryCode = countryCode
        self.countryName = countryName
        self.key = key
        self.locationType = locationType
        self.name = name
        self.region = region
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(Nullable<String>.self, forKey: .code)
        self.countryCode = try container.decode(Nullable<String>.self, forKey: .countryCode)
        self.countryName = try container.decode(Nullable<String>.self, forKey: .countryName)
        self.key = try container.decode(String.self, forKey: .key)
        self.locationType = try container.decode(LocationTargetingOptionLocationType.self, forKey: .locationType)
        self.name = try container.decode(String.self, forKey: .name)
        self.region = try container.decode(Nullable<String>.self, forKey: .region)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.countryCode, forKey: .countryCode)
        try container.encode(self.countryName, forKey: .countryName)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.locationType, forKey: .locationType)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.region, forKey: .region)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case countryCode = "country_code"
        case countryName = "country_name"
        case key
        case locationType = "location_type"
        case name
        case region
    }
}