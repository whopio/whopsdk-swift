import Foundation

public struct Gif: Codable, Hashable, Sendable {
    /// Height of `original_url`, in pixels.
    public let height: Int
    /// Full-size GIF. HTTPS on a Klipy media host.
    public let originalUrl: String
    /// Smaller version for previews and placeholders. HTTPS on a Klipy media host.
    public let previewUrl: String
    /// Identifier for the GIF.
    public let slug: String
    /// GIF title.
    public let title: String
    /// URL the message renders the GIF from. HTTPS on a Klipy media host.
    public let url: String
    /// Width of `original_url`, in pixels.
    public let width: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        height: Int,
        originalUrl: String,
        previewUrl: String,
        slug: String,
        title: String,
        url: String,
        width: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.height = height
        self.originalUrl = originalUrl
        self.previewUrl = previewUrl
        self.slug = slug
        self.title = title
        self.url = url
        self.width = width
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.height = try container.decode(Int.self, forKey: .height)
        self.originalUrl = try container.decode(String.self, forKey: .originalUrl)
        self.previewUrl = try container.decode(String.self, forKey: .previewUrl)
        self.slug = try container.decode(String.self, forKey: .slug)
        self.title = try container.decode(String.self, forKey: .title)
        self.url = try container.decode(String.self, forKey: .url)
        self.width = try container.decode(Int.self, forKey: .width)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.height, forKey: .height)
        try container.encode(self.originalUrl, forKey: .originalUrl)
        try container.encode(self.previewUrl, forKey: .previewUrl)
        try container.encode(self.slug, forKey: .slug)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.width, forKey: .width)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case height
        case originalUrl = "original_url"
        case previewUrl = "preview_url"
        case slug
        case title
        case url
        case width
    }
}