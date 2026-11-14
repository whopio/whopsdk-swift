import Foundation

public struct MessageLinkPreview: Codable, Hashable, Sendable {
    /// Page description, or null while unavailable.
    public let description: Nullable<String>
    /// Site icon URL, or null when unavailable.
    public let faviconUrl: Nullable<String>
    /// Additional preview information, or null when unavailable.
    public let footer: Nullable<MessageLinkFooter>
    /// Preview image URL, or null when unavailable.
    public let imageUrl: Nullable<String>
    /// Whether the server is still generating this preview.
    public let processing: Bool
    /// Page title, or null while unavailable.
    public let title: Nullable<String>
    /// URL being previewed.
    public let url: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        description: Nullable<String>,
        faviconUrl: Nullable<String>,
        footer: Nullable<MessageLinkFooter>,
        imageUrl: Nullable<String>,
        processing: Bool,
        title: Nullable<String>,
        url: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.description = description
        self.faviconUrl = faviconUrl
        self.footer = footer
        self.imageUrl = imageUrl
        self.processing = processing
        self.title = title
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.faviconUrl = try container.decode(Nullable<String>.self, forKey: .faviconUrl)
        self.footer = try container.decode(Nullable<MessageLinkFooter>.self, forKey: .footer)
        self.imageUrl = try container.decode(Nullable<String>.self, forKey: .imageUrl)
        self.processing = try container.decode(Bool.self, forKey: .processing)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.url = try container.decode(String.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.faviconUrl, forKey: .faviconUrl)
        try container.encode(self.footer, forKey: .footer)
        try container.encode(self.imageUrl, forKey: .imageUrl)
        try container.encode(self.processing, forKey: .processing)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case description
        case faviconUrl = "favicon_url"
        case footer
        case imageUrl = "image_url"
        case processing
        case title
        case url
    }
}