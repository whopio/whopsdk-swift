import Foundation

public struct MessageLinkFooter: Codable, Hashable, Sendable {
    public let description: Nullable<String>
    public let iconUrl: String
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        description: Nullable<String>,
        iconUrl: String,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.description = description
        self.iconUrl = iconUrl
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.iconUrl = try container.decode(String.self, forKey: .iconUrl)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.iconUrl, forKey: .iconUrl)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case description
        case iconUrl = "icon_url"
        case title
    }
}