import Foundation

public struct AdLeadFormDisclaimerCheckbox: Codable, Hashable, Sendable {
    /// Whether the checkbox starts ticked.
    public let checkedByDefault: Nullable<Bool>
    /// Stable identifier consent responses are stored under.
    public let key: Nullable<String>
    /// Whether the checkbox must be ticked to submit the form.
    public let required: Nullable<Bool>
    /// Consent text next to the checkbox.
    public let text: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        checkedByDefault: Nullable<Bool>,
        key: Nullable<String>,
        required: Nullable<Bool>,
        text: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.checkedByDefault = checkedByDefault
        self.key = key
        self.required = required
        self.text = text
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.checkedByDefault = try container.decode(Nullable<Bool>.self, forKey: .checkedByDefault)
        self.key = try container.decode(Nullable<String>.self, forKey: .key)
        self.required = try container.decode(Nullable<Bool>.self, forKey: .required)
        self.text = try container.decode(String.self, forKey: .text)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.checkedByDefault, forKey: .checkedByDefault)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.required, forKey: .required)
        try container.encode(self.text, forKey: .text)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case checkedByDefault = "checked_by_default"
        case key
        case required
        case text
    }
}