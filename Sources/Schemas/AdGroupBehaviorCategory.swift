import Foundation

public struct AdGroupBehaviorCategory: Codable, Hashable, Sendable {
    /// On ad platforms that scope behavior categories, what this one is measured on. Send back the value the targeting_options endpoint returned alongside the id. Absent on platforms that don't scope them.
    public let behaviorType: AdGroupBehaviorCategoryBehaviorType?
    /// The ad platform's ID for the category in its targeting taxonomy.
    public let id: String
    /// Category name, such as `Frequent travelers`.
    public let name: String?
    /// On ad platforms that scope behavior categories, how many days of activity the category covers. Absent on platforms that don't scope them.
    public let period: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        behaviorType: AdGroupBehaviorCategoryBehaviorType? = nil,
        id: String,
        name: String? = nil,
        period: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.behaviorType = behaviorType
        self.id = id
        self.name = name
        self.period = period
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.behaviorType = try container.decodeIfPresent(AdGroupBehaviorCategoryBehaviorType.self, forKey: .behaviorType)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.period = try container.decodeIfPresent(Double.self, forKey: .period)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.behaviorType, forKey: .behaviorType)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.period, forKey: .period)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case behaviorType = "behavior_type"
        case id
        case name
        case period
    }
}