import Foundation

/// Represents an image attachment
public struct ProductLegacyGalleryImagesItem: Codable, Hashable, Sendable {
    /// Uploaded file MIME type, such as image/jpeg, video/mp4, or audio/mpeg.
    public let contentType: Nullable<String>
    /// Represents a unique identifier that is Base64 obfuscated. It is often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `"VXNlci0xMA=="`) or integer (such as `4`) input value will be accepted as an ID.
    public let id: String
    /// A pre-optimized URL for rendering this attachment on the client. This should be used for displaying attachments in apps.
    public let url: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        contentType: Nullable<String>,
        id: String,
        url: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.contentType = contentType
        self.id = id
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.contentType = try container.decode(Nullable<String>.self, forKey: .contentType)
        self.id = try container.decode(String.self, forKey: .id)
        self.url = try container.decode(Nullable<String>.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.contentType, forKey: .contentType)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case contentType = "content_type"
        case id
        case url
    }
}