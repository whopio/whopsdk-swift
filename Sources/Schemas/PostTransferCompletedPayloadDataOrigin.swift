import Foundation

/// Business account or user sending the transfer.
public struct PostTransferCompletedPayloadDataOrigin: Codable, Hashable, Sendable {
    /// Account or user ID.
    public let id: String
    /// Business logo or user avatar URL. Null when no image is available.
    public let logoUrl: Nullable<String>
    /// Business or user display name.
    public let name: Nullable<String>
    /// Whether the profile is a business account or a user.
    public let object: PostTransferCompletedPayloadDataOriginObject
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        logoUrl: Nullable<String>,
        name: Nullable<String>,
        object: PostTransferCompletedPayloadDataOriginObject,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.logoUrl = logoUrl
        self.name = name
        self.object = object
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.logoUrl = try container.decode(Nullable<String>.self, forKey: .logoUrl)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.object = try container.decode(PostTransferCompletedPayloadDataOriginObject.self, forKey: .object)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.logoUrl, forKey: .logoUrl)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.object, forKey: .object)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case logoUrl = "logo_url"
        case name
        case object
    }
}