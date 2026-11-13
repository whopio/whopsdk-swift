import Foundation

public struct AdText: Codable, Hashable, Sendable {
    /// Always `null`. Translations are no longer available.
    public let language: Nullable<String>
    /// The text shown to viewers.
    public let text: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        language: Nullable<String>,
        text: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.language = language
        self.text = text
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.language = try container.decode(Nullable<String>.self, forKey: .language)
        self.text = try container.decode(String.self, forKey: .text)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.language, forKey: .language)
        try container.encode(self.text, forKey: .text)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case language
        case text
    }
}