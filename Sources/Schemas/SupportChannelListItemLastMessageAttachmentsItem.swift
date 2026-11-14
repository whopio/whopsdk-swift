import Foundation

/// Represents an image attachment
public struct SupportChannelListItemLastMessageAttachmentsItem: Codable, Hashable, Sendable {
    /// Uploaded file MIME type, such as image/jpeg, video/mp4, or audio/mpeg.
    public let contentType: Nullable<String>
    /// The original filename of the uploaded attachment, including its file extension.
    public let filename: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        contentType: Nullable<String>,
        filename: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.contentType = contentType
        self.filename = filename
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.contentType = try container.decode(Nullable<String>.self, forKey: .contentType)
        self.filename = try container.decode(Nullable<String>.self, forKey: .filename)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.contentType, forKey: .contentType)
        try container.encode(self.filename, forKey: .filename)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case contentType = "content_type"
        case filename
    }
}