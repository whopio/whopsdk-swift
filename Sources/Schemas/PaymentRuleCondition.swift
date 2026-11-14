import Foundation

public struct PaymentRuleCondition: Codable, Hashable, Sendable {
    /// The payment attribute this condition reads.
    public let field: PaymentRuleConditionField
    /// How the payment attribute is compared to the value.
    public let `operator`: PaymentRuleConditionOperator
    /// The value to compare against.
    public let value: PaymentRuleConditionValue
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        field: PaymentRuleConditionField,
        operator: PaymentRuleConditionOperator,
        value: PaymentRuleConditionValue,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.field = field
        self.operator = `operator`
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.field = try container.decode(PaymentRuleConditionField.self, forKey: .field)
        self.operator = try container.decode(PaymentRuleConditionOperator.self, forKey: .operator)
        self.value = try container.decode(PaymentRuleConditionValue.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.field, forKey: .field)
        try container.encode(self.operator, forKey: .operator)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case field
        case `operator`
        case value
    }
}