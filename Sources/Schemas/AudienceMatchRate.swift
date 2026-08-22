import Foundation

public struct AudienceMatchRate: Codable, Hashable, Sendable {
    /// Lower bound of the estimated match rate percentage. `null` until available.
    public let lowerBound: Nullable<Double>
    /// The ad platform that provided the match-rate estimate.
    public let platform: AudienceMatchRatePlatform
    /// Availability of the estimated match rate.
    public let status: Nullable<AudienceMatchRateStatus>
    /// Upper bound of the estimated match rate percentage. `null` until available.
    public let upperBound: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        lowerBound: Nullable<Double>,
        platform: AudienceMatchRatePlatform,
        status: Nullable<AudienceMatchRateStatus>,
        upperBound: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.lowerBound = lowerBound
        self.platform = platform
        self.status = status
        self.upperBound = upperBound
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lowerBound = try container.decode(Nullable<Double>.self, forKey: .lowerBound)
        self.platform = try container.decode(AudienceMatchRatePlatform.self, forKey: .platform)
        self.status = try container.decode(Nullable<AudienceMatchRateStatus>.self, forKey: .status)
        self.upperBound = try container.decode(Nullable<Double>.self, forKey: .upperBound)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.lowerBound, forKey: .lowerBound)
        try container.encode(self.platform, forKey: .platform)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.upperBound, forKey: .upperBound)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case lowerBound = "lower_bound"
        case platform
        case status
        case upperBound = "upper_bound"
    }
}