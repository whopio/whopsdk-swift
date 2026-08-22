import Foundation

public struct ProductGalleryImage: Codable, Hashable, Sendable {
    /// Uploaded file MIME type, such as image/jpeg.
    public let contentType: Nullable<String>
    /// Gallery image ID.
    public let id: String
    /// Pre-optimized URL for rendering this image on the client.
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