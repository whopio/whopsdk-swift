import Foundation

public struct UpdateInvoicesRequestPlanCustomFieldsItem: Codable, Hashable, Sendable {
    /// The type of the custom field.
    public let fieldType: CustomFieldTypes
    /// The ID of the custom field (if being updated)
    public let id: Nullable<String>?
    /// The name of the custom field.
    public let name: String
    /// The order of the field.
    public let order: Nullable<Int>?
    /// The placeholder value of the field.
    public let placeholder: Nullable<String>?
    /// Whether or not the field is required.
    public let required: Nullable<Bool>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fieldType: CustomFieldTypes,
        id: Nullable<String>? = nil,
        name: String,
        order: Nullable<Int>? = nil,
        placeholder: Nullable<String>? = nil,
        required: Nullable<Bool>? = nil,
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
        self.fieldType = try container.decode(CustomFieldTypes.self, forKey: .fieldType)
        self.id = try container.decodeNullableIfPresent(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.order = try container.decodeNullableIfPresent(Int.self, forKey: .order)
        self.placeholder = try container.decodeNullableIfPresent(String.self, forKey: .placeholder)
        self.required = try container.decodeNullableIfPresent(Bool.self, forKey: .required)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.fieldType, forKey: .fieldType)
        try container.encodeNullableIfPresent(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encodeNullableIfPresent(self.order, forKey: .order)
        try container.encodeNullableIfPresent(self.placeholder, forKey: .placeholder)
        try container.encodeNullableIfPresent(self.required, forKey: .required)
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