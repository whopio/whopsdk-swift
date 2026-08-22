import Foundation

public struct BountySubmissionFile: Codable, Hashable, Sendable {
    /// Broad kind of file.
    public let attachmentType: Nullable<BountySubmissionFileAttachmentType>
    /// MIME type of the file.
    public let contentType: Nullable<String>
    /// Name the file was uploaded with.
    public let filename: Nullable<String>
    /// File ID, prefixed `file_`.
    public let id: String
    /// Temporary download URL for the file.
    public let url: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        attachmentType: Nullable<BountySubmissionFileAttachmentType>,
        contentType: Nullable<String>,
        filename: Nullable<String>,
        id: String,
        url: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.attachmentType = attachmentType
        self.contentType = contentType
        self.filename = filename
        self.id = id
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attachmentType = try container.decode(Nullable<BountySubmissionFileAttachmentType>.self, forKey: .attachmentType)
        self.contentType = try container.decode(Nullable<String>.self, forKey: .contentType)
        self.filename = try container.decode(Nullable<String>.self, forKey: .filename)
        self.id = try container.decode(String.self, forKey: .id)
        self.url = try container.decode(Nullable<String>.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.attachmentType, forKey: .attachmentType)
        try container.encode(self.contentType, forKey: .contentType)
        try container.encode(self.filename, forKey: .filename)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case attachmentType = "attachment_type"
        case contentType = "content_type"
        case filename
        case id
        case url
    }
}