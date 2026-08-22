import Foundation

public struct AdGroupDetailedTargeting: Codable, Hashable, Sendable {
    public let behaviors: [AdGroupBehaviorCategory]
    public let demographics: [AdGroupDemographicCategory]
    public let interests: [AdGroupTargetingCategory]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        behaviors: [AdGroupBehaviorCategory],
        demographics: [AdGroupDemographicCategory],
        interests: [AdGroupTargetingCategory],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.behaviors = behaviors
        self.demographics = demographics
        self.interests = interests
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.behaviors = try container.decode([AdGroupBehaviorCategory].self, forKey: .behaviors)
        self.demographics = try container.decode([AdGroupDemographicCategory].self, forKey: .demographics)
        self.interests = try container.decode([AdGroupTargetingCategory].self, forKey: .interests)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.behaviors, forKey: .behaviors)
        try container.encode(self.demographics, forKey: .demographics)
        try container.encode(self.interests, forKey: .interests)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case behaviors
        case demographics
        case interests
    }
}