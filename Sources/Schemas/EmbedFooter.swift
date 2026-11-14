import Foundation

public struct EmbedFooter: Codable, Hashable, Sendable {
    /// Small image shown beside the footer text. Null when the footer has no icon.
    public let icon: Nullable<EmbedImage>
    public let text: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        icon: Nullable<EmbedImage>,
        text: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.icon = icon
        self.text = text
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.icon = try container.decode(Nullable<EmbedImage>.self, forKey: .icon)
        self.text = try container.decode(String.self, forKey: .text)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.icon, forKey: .icon)
        try container.encode(self.text, forKey: .text)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case icon
        case text
    }
}