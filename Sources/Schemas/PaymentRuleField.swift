import Foundation

public struct PaymentRuleField: Codable, Hashable, Sendable {
    /// The payment attribute this condition reads.
    public let field: PaymentRuleFieldField
    /// The largest value this field accepts, or `null` when the field is not numeric.
    public let maximum: Nullable<Int>
    /// The smallest value this field accepts, or `null` when the field is not numeric.
    public let minimum: Nullable<Int>
    public let operators: [PaymentRuleFieldOperatorsItem]
    public let options: Nullable<[PaymentRuleFieldOption]>
    /// The type of value this field compares against.
    public let type: PaymentRuleFieldType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        field: PaymentRuleFieldField,
        maximum: Nullable<Int>,
        minimum: Nullable<Int>,
        operators: [PaymentRuleFieldOperatorsItem],
        options: Nullable<[PaymentRuleFieldOption]>,
        type: PaymentRuleFieldType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.field = field
        self.maximum = maximum
        self.minimum = minimum
        self.operators = operators
        self.options = options
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.field = try container.decode(PaymentRuleFieldField.self, forKey: .field)
        self.maximum = try container.decode(Nullable<Int>.self, forKey: .maximum)
        self.minimum = try container.decode(Nullable<Int>.self, forKey: .minimum)
        self.operators = try container.decode([PaymentRuleFieldOperatorsItem].self, forKey: .operators)
        self.options = try container.decode(Nullable<[PaymentRuleFieldOption]>.self, forKey: .options)
        self.type = try container.decode(PaymentRuleFieldType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.field, forKey: .field)
        try container.encode(self.maximum, forKey: .maximum)
        try container.encode(self.minimum, forKey: .minimum)
        try container.encode(self.operators, forKey: .operators)
        try container.encode(self.options, forKey: .options)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case field
        case maximum
        case minimum
        case operators
        case options
        case type
    }
}