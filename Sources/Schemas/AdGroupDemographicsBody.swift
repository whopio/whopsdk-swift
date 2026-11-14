import Foundation

/// Age, gender, and automatic-audience targeting.
public struct AdGroupDemographicsBody: Codable, Hashable, Sendable {
    /// Turn on automatic audience targeting: delivery can reach beyond the ages and genders you set, treating them as suggestions.
    public let automatic: Bool?
    /// Gender to target.
    public let gender: AdGroupDemographicsBodyGender?
    /// Oldest age to target.
    public let maximumAge: Int?
    /// Youngest age to target.
    public let minimumAge: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        automatic: Bool? = nil,
        gender: AdGroupDemographicsBodyGender? = nil,
        maximumAge: Int? = nil,
        minimumAge: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.automatic = automatic
        self.gender = gender
        self.maximumAge = maximumAge
        self.minimumAge = minimumAge
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.automatic = try container.decodeIfPresent(Bool.self, forKey: .automatic)
        self.gender = try container.decodeIfPresent(AdGroupDemographicsBodyGender.self, forKey: .gender)
        self.maximumAge = try container.decodeIfPresent(Int.self, forKey: .maximumAge)
        self.minimumAge = try container.decodeIfPresent(Int.self, forKey: .minimumAge)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.automatic, forKey: .automatic)
        try container.encodeIfPresent(self.gender, forKey: .gender)
        try container.encodeIfPresent(self.maximumAge, forKey: .maximumAge)
        try container.encodeIfPresent(self.minimumAge, forKey: .minimumAge)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case automatic
        case gender
        case maximumAge = "maximum_age"
        case minimumAge = "minimum_age"
    }
}