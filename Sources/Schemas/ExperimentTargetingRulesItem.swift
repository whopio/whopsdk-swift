import Foundation

public struct ExperimentTargetingRulesItem: Codable, Hashable, Sendable {
    /// Conditions within this rule, all of which must match.
    public let conditions: [ExperimentTargetingRulesItemConditionsItem]
    /// Percentage of matching subjects that this rule lets in, from 0 to 100. Absent when the rule lets in every matching subject. Raising it keeps every subject that the rule already lets in.
    public let passPercentage: Double?
    /// `include` — users matching this rule qualify; `exclude` — users matching this rule are always excluded, overriding any include rule.
    public let type: ExperimentTargetingRulesItemType?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        conditions: [ExperimentTargetingRulesItemConditionsItem],
        passPercentage: Double? = nil,
        type: ExperimentTargetingRulesItemType? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.conditions = conditions
        self.passPercentage = passPercentage
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.conditions = try container.decode([ExperimentTargetingRulesItemConditionsItem].self, forKey: .conditions)
        self.passPercentage = try container.decodeIfPresent(Double.self, forKey: .passPercentage)
        self.type = try container.decodeIfPresent(ExperimentTargetingRulesItemType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.conditions, forKey: .conditions)
        try container.encodeIfPresent(self.passPercentage, forKey: .passPercentage)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case conditions
        case passPercentage = "pass_percentage"
        case type
    }
}