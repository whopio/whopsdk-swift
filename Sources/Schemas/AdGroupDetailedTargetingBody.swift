import Foundation

/// Interest, behavior, and demographic targeting, using categories from the ad platform's targeting taxonomy. Entries across interests, behaviors, and demographics are OR'd together (anyone matching any entry is reached), matching Ads Manager's detailed-targeting box. At most 100 entries per section. Can't be combined with demographics.automatic, and unavailable to campaigns with special_ad_categories.
public struct AdGroupDetailedTargetingBody: Codable, Hashable, Sendable {
    /// Behavior categories to target, such as frequent travelers.
    public let behaviors: [AdGroupDetailedTargetingBodyBehaviorsItem]?
    /// Demographic categories to target, such as life events, industries, work employers, job titles, schools, or majors.
    public let demographics: [AdGroupDetailedTargetingBodyDemographicsItem]?
    /// Interest categories to target, such as an interest in movies.
    public let interests: [AdGroupDetailedTargetingBodyInterestsItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        behaviors: [AdGroupDetailedTargetingBodyBehaviorsItem]? = nil,
        demographics: [AdGroupDetailedTargetingBodyDemographicsItem]? = nil,
        interests: [AdGroupDetailedTargetingBodyInterestsItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.behaviors = behaviors
        self.demographics = demographics
        self.interests = interests
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.behaviors = try container.decodeIfPresent([AdGroupDetailedTargetingBodyBehaviorsItem].self, forKey: .behaviors)
        self.demographics = try container.decodeIfPresent([AdGroupDetailedTargetingBodyDemographicsItem].self, forKey: .demographics)
        self.interests = try container.decodeIfPresent([AdGroupDetailedTargetingBodyInterestsItem].self, forKey: .interests)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.behaviors, forKey: .behaviors)
        try container.encodeIfPresent(self.demographics, forKey: .demographics)
        try container.encodeIfPresent(self.interests, forKey: .interests)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case behaviors
        case demographics
        case interests
    }
}