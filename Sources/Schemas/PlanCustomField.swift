import Foundation

public struct PlanCustomField: Codable, Hashable, Sendable {
    /// Custom field input type.
    public let fieldType: PlanCustomFieldFieldType
    /// Custom field ID, prefixed `field_`.
    public let id: String
    /// Field label shown to customer at checkout.
    public let name: String
    /// Field position on checkout form.
    public let order: Double
    /// Placeholder text shown in the empty field. `null` if none is set.
    public let placeholder: Nullable<String>
    /// Whether the customer must complete this field to check out.
    public let required: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fieldType: PlanCustomFieldFieldType,
        id: String,
        name: String,
        order: Double,
        placeholder: Nullable<String>,
        required: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fieldType = fieldType
        self.id = id
        self.name = name
        self.order = order
        self.placeholder = placeholder
        self.required = required
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fieldType = try container.decode(PlanCustomFieldFieldType.self, forKey: .fieldType)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.order = try container.decode(Double.self, forKey: .order)
        self.placeholder = try container.decode(Nullable<String>.self, forKey: .placeholder)
        self.required = try container.decode(Bool.self, forKey: .required)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.fieldType, forKey: .fieldType)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.order, forKey: .order)
        try container.encode(self.placeholder, forKey: .placeholder)
        try container.encode(self.required, forKey: .required)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fieldType = "field_type"
        case id
        case name
        case order
        case placeholder
        case required
    }
}