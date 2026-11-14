import Foundation

public struct AdGroupDemographics: Codable, Hashable, Sendable {
    /// Whether automatic audience targeting is on. When `true`, delivery can reach beyond the ages and genders you set, treating them as suggestions.
    public let automatic: Bool
    /// Gender targeted.
    public let gender: AdGroupDemographicsGender
    /// Oldest age targeted. `null` when no maximum is set.
    public let maximumAge: Nullable<Double>
    /// Youngest age targeted. `null` when no minimum is set.
    public let minimumAge: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        automatic: Bool,
        gender: AdGroupDemographicsGender,
        maximumAge: Nullable<Double>,
        minimumAge: Nullable<Double>,
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
        self.automatic = try container.decode(Bool.self, forKey: .automatic)
        self.gender = try container.decode(AdGroupDemographicsGender.self, forKey: .gender)
        self.maximumAge = try container.decode(Nullable<Double>.self, forKey: .maximumAge)
        self.minimumAge = try container.decode(Nullable<Double>.self, forKey: .minimumAge)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.automatic, forKey: .automatic)
        try container.encode(self.gender, forKey: .gender)
        try container.encode(self.maximumAge, forKey: .maximumAge)
        try container.encode(self.minimumAge, forKey: .minimumAge)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case automatic
        case gender
        case maximumAge = "maximum_age"
        case minimumAge = "minimum_age"
    }
}