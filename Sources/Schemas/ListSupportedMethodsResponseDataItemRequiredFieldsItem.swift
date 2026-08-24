import Foundation

public struct ListSupportedMethodsResponseDataItemRequiredFieldsItem: Codable, Hashable, Sendable {
    /// Stable field ID (`fld_` + the semantic type), used as the field key when creating the payout method. Safe to hardcode — it never changes for a given field.
    public let id: String
    /// How to collect the value: `text`, `options`, or `date`.
    public let inputType: String
    /// Human-readable field name.
    public let label: String
    public let object: ListSupportedMethodsResponseDataItemRequiredFieldsItemObject
    /// Allowed values for options fields.
    public let options: Nullable<[String]>
    /// Example value.
    public let placeholder: Nullable<String>
    /// Whether the field must be provided.
    public let required: Bool
    /// Whether the value is vaulted in transit and never stored raw.
    public let sensitive: Bool
    /// Semantic field type, for example `bank_account_number` or `swift`.
    public let type: String
    /// Regex the value must match. Null for options fields.
    public let validation: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        inputType: String,
        label: String,
        object: ListSupportedMethodsResponseDataItemRequiredFieldsItemObject,
        options: Nullable<[String]>,
        placeholder: Nullable<String>,
        required: Bool,
        sensitive: Bool,
        type: String,
        validation: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.inputType = inputType
        self.label = label
        self.object = object
        self.options = options
        self.placeholder = placeholder
        self.required = required
        self.sensitive = sensitive
        self.type = type
        self.validation = validation
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.inputType = try container.decode(String.self, forKey: .inputType)
        self.label = try container.decode(String.self, forKey: .label)
        self.object = try container.decode(ListSupportedMethodsResponseDataItemRequiredFieldsItemObject.self, forKey: .object)
        self.options = try container.decode(Nullable<[String]>.self, forKey: .options)
        self.placeholder = try container.decode(Nullable<String>.self, forKey: .placeholder)
        self.required = try container.decode(Bool.self, forKey: .required)
        self.sensitive = try container.decode(Bool.self, forKey: .sensitive)
        self.type = try container.decode(String.self, forKey: .type)
        self.validation = try container.decode(Nullable<String>.self, forKey: .validation)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.inputType, forKey: .inputType)
        try container.encode(self.label, forKey: .label)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.options, forKey: .options)
        try container.encode(self.placeholder, forKey: .placeholder)
        try container.encode(self.required, forKey: .required)
        try container.encode(self.sensitive, forKey: .sensitive)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.validation, forKey: .validation)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case inputType = "input_type"
        case label
        case object
        case options
        case placeholder
        case required
        case sensitive
        case type
        case validation
    }
}