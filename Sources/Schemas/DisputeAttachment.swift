import Foundation

public struct DisputeAttachment: Codable, Hashable, Sendable {
    /// The uploaded file's MIME type.
    public let contentType: Nullable<String>
    /// The uploaded file's name.
    public let filename: Nullable<String>
    /// The attachment's ID. `null` for a Whop-hosted policy, which is not an uploaded file.
    public let id: Nullable<String>
    /// Whether this is Whop's own hosted policy, standing in because the seller uploaded none. Sending it back on a PATCH changes nothing.
    public let platform: Bool
    /// A URL to download the attachment.
    public let url: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        contentType: Nullable<String>,
        filename: Nullable<String>,
        id: Nullable<String>,
        platform: Bool,
        url: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.contentType = contentType
        self.filename = filename
        self.id = id
        self.platform = platform
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.contentType = try container.decode(Nullable<String>.self, forKey: .contentType)
        self.filename = try container.decode(Nullable<String>.self, forKey: .filename)
        self.id = try container.decode(Nullable<String>.self, forKey: .id)
        self.platform = try container.decode(Bool.self, forKey: .platform)
        self.url = try container.decode(Nullable<String>.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.contentType, forKey: .contentType)
        try container.encode(self.filename, forKey: .filename)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.platform, forKey: .platform)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case contentType = "content_type"
        case filename
        case id
        case platform
        case url
    }
}