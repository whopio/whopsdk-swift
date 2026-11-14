import Foundation

public struct CreateExperimentsRequestTargetingRulesItemConditionsItem: Codable, Hashable, Sendable {
    /// Property name to read from the user context. Required when `type` is `property`.
    public let field: Nullable<String>?
    /// Comparison to apply: `any`/`none` — inclusion/exclusion list; `eq`/`neq` — equality; `gt`/`gte`/`lt`/`lte` — numeric range.
    public let `operator`: CreateExperimentsRequestTargetingRulesItemConditionsItemOperator
    /// `user_id` — match on subject user ID; `account_id` — match on account ID (prefixed `biz_`); `property` — match on a named user property (requires `field`).
    public let type: CreateExperimentsRequestTargetingRulesItemConditionsItemType
    public let value: JSONValue
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        field: Nullable<String>? = nil,
        operator: CreateExperimentsRequestTargetingRulesItemConditionsItemOperator,
        type: CreateExperimentsRequestTargetingRulesItemConditionsItemType,
        value: JSONValue,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.field = field
        self.operator = `operator`
        self.type = type
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.field = try container.decodeNullableIfPresent(String.self, forKey: .field)
        self.operator = try container.decode(CreateExperimentsRequestTargetingRulesItemConditionsItemOperator.self, forKey: .operator)
        self.type = try container.decode(CreateExperimentsRequestTargetingRulesItemConditionsItemType.self, forKey: .type)
        self.value = try container.decode(JSONValue.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.field, forKey: .field)
        try container.encode(self.operator, forKey: .operator)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case field
        case `operator`
        case type
        case value
    }
}