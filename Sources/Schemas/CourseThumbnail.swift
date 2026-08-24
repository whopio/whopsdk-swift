import Foundation

/// The thumbnail image displayed on course cards and previews. Null if no thumbnail has been uploaded.
public struct CourseThumbnail: Codable, Hashable, Sendable {
    /// Uploaded file MIME type, such as image/jpeg, video/mp4, or audio/mpeg.
    public let contentType: Nullable<String>
    /// The original filename of the uploaded attachment, including its file extension.
    public let filename: Nullable<String>
    /// Represents a unique identifier that is Base64 obfuscated. It is often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `"VXNlci0xMA=="`) or integer (such as `4`) input value will be accepted as an ID.
    public let id: String
    /// A pre-optimized URL for rendering this attachment on the client. This should be used for displaying attachments in apps.
    public let optimizedUrl: Nullable<String>
    /// The original source URL of the attachment, such as a direct link to S3. This should never be displayed on the client and should always be passed through an Imgproxy transformer.
    public let sourceUrl: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        contentType: Nullable<String>,
        filename: Nullable<String>,
        id: String,
        optimizedUrl: Nullable<String>,
        sourceUrl: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.contentType = contentType
        self.filename = filename
        self.id = id
        self.optimizedUrl = optimizedUrl
        self.sourceUrl = sourceUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.contentType = try container.decode(Nullable<String>.self, forKey: .contentType)
        self.filename = try container.decode(Nullable<String>.self, forKey: .filename)
        self.id = try container.decode(String.self, forKey: .id)
        self.optimizedUrl = try container.decode(Nullable<String>.self, forKey: .optimizedUrl)
        self.sourceUrl = try container.decode(Nullable<String>.self, forKey: .sourceUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.contentType, forKey: .contentType)
        try container.encode(self.filename, forKey: .filename)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.optimizedUrl, forKey: .optimizedUrl)
        try container.encode(self.sourceUrl, forKey: .sourceUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case contentType = "content_type"
        case filename
        case id
        case optimizedUrl = "optimized_url"
        case sourceUrl = "source_url"
    }
}