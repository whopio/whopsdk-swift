import Foundation

public struct CreatePlansRequestCustomFieldsItem: Codable, Hashable, Sendable {
    public let fieldType: CreatePlansRequestCustomFieldsItemFieldType?
    public let id: String?
    public let name: String?
    public let order: Int?
    public let placeholder: Nullable<String>?
    public let required: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fieldType: CreatePlansRequestCustomFieldsItemFieldType? = nil,
        id: String? = nil,
        name: String? = nil,
        order: Int? = nil,
        placeholder: Nullable<String>? = nil,
        required: Bool? = nil,
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
        self.fieldType = try container.decodeIfPresent(CreatePlansRequestCustomFieldsItemFieldType.self, forKey: .fieldType)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.order = try container.decodeIfPresent(Int.self, forKey: .order)
        self.placeholder = try container.decodeNullableIfPresent(String.self, forKey: .placeholder)
        self.required = try container.decodeIfPresent(Bool.self, forKey: .required)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.fieldType, forKey: .fieldType)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.order, forKey: .order)
        try container.encodeNullableIfPresent(self.placeholder, forKey: .placeholder)
        try container.encodeIfPresent(self.required, forKey: .required)
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