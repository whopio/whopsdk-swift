import Foundation

public struct UpdateAdsRequestLeadFormDisclaimerCheckboxesItem: Codable, Hashable, Sendable {
    public let checkedByDefault: Bool?
    public let key: String?
    public let required: Bool?
    public let text: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        checkedByDefault: Bool? = nil,
        key: String? = nil,
        required: Bool? = nil,
        text: String? = nil,
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
        self.checkedByDefault = try container.decodeIfPresent(Bool.self, forKey: .checkedByDefault)
        self.key = try container.decodeIfPresent(String.self, forKey: .key)
        self.required = try container.decodeIfPresent(Bool.self, forKey: .required)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.checkedByDefault, forKey: .checkedByDefault)
        try container.encodeIfPresent(self.key, forKey: .key)
        try container.encodeIfPresent(self.required, forKey: .required)
        try container.encodeIfPresent(self.text, forKey: .text)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case checkedByDefault = "checked_by_default"
        case key
        case required
        case text
    }
}