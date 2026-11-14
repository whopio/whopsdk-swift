import Foundation

public struct Embed: Codable, Hashable, Sendable {
    public let color: Nullable<Int>
    public let description: Nullable<String>
    public let fields: [EmbedField]
    /// Footer shown at the bottom of the embed. Null when the embed has no footer.
    public let footer: Nullable<EmbedFooter>
    public let image: Nullable<EmbedImage>
    public let thumbnail: Nullable<EmbedImage>
    /// Time supplied by the embed author, as an ISO 8601 timestamp in UTC. Null when missing or invalid.
    public let timestampAt: Nullable<String>
    public let title: Nullable<String>
    public let url: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        color: Nullable<Int>,
        description: Nullable<String>,
        fields: [EmbedField],
        footer: Nullable<EmbedFooter>,
        image: Nullable<EmbedImage>,
        thumbnail: Nullable<EmbedImage>,
        timestampAt: Nullable<String>,
        title: Nullable<String>,
        url: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.color = color
        self.description = description
        self.fields = fields
        self.footer = footer
        self.image = image
        self.thumbnail = thumbnail
        self.timestampAt = timestampAt
        self.title = title
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.color = try container.decode(Nullable<Int>.self, forKey: .color)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.fields = try container.decode([EmbedField].self, forKey: .fields)
        self.footer = try container.decode(Nullable<EmbedFooter>.self, forKey: .footer)
        self.image = try container.decode(Nullable<EmbedImage>.self, forKey: .image)
        self.thumbnail = try container.decode(Nullable<EmbedImage>.self, forKey: .thumbnail)
        self.timestampAt = try container.decode(Nullable<String>.self, forKey: .timestampAt)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.url = try container.decode(Nullable<String>.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.color, forKey: .color)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.fields, forKey: .fields)
        try container.encode(self.footer, forKey: .footer)
        try container.encode(self.image, forKey: .image)
        try container.encode(self.thumbnail, forKey: .thumbnail)
        try container.encode(self.timestampAt, forKey: .timestampAt)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case color
        case description
        case fields
        case footer
        case image
        case thumbnail
        case timestampAt = "timestamp_at"
        case title
        case url
    }
}