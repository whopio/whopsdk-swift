import Foundation

public struct CreateExperimentsRequestTargetingRulesItem: Codable, Hashable, Sendable {
    /// Conditions within this rule. Must be non-empty. All conditions must be satisfied for the rule to match (AND logic). Rules are OR-ed together.
    public let conditions: [CreateExperimentsRequestTargetingRulesItemConditionsItem]
    /// Percentage of matching subjects that this rule lets in, from 0 to 100. Omit it to let in every matching subject. Only `include` rules accept it. Raising it keeps every subject that the rule already lets in.
    public let passPercentage: Double?
    /// `include` — users matching this rule qualify; `exclude` — users matching this rule are always excluded, overriding any include rule. Defaults to `include`.
    public let type: CreateExperimentsRequestTargetingRulesItemType?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        conditions: [CreateExperimentsRequestTargetingRulesItemConditionsItem],
        passPercentage: Double? = nil,
        type: CreateExperimentsRequestTargetingRulesItemType? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.conditions = conditions
        self.passPercentage = passPercentage
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.conditions = try container.decode([CreateExperimentsRequestTargetingRulesItemConditionsItem].self, forKey: .conditions)
        self.passPercentage = try container.decodeIfPresent(Double.self, forKey: .passPercentage)
        self.type = try container.decodeIfPresent(CreateExperimentsRequestTargetingRulesItemType.self, forKey: .type)
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