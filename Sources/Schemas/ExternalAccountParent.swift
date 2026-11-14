import Foundation

public struct ExternalAccountParent: Codable, Hashable, Sendable {
    /// The platform-specific ID for the parent external account.
    public let externalId: Nullable<String>
    /// External account ID, prefixed `sacc_`.
    public let id: String
    /// The display name of the parent external account on the platform.
    public let name: Nullable<String>
    /// The platform the parent external account exists on.
    public let platform: ExternalAccountParentPlatform
    /// The URL where the profile picture of the parent external account can be accessed.
    public let profilePictureUrl: Nullable<String>
    /// The username of the parent external account on the platform.
    public let username: Nullable<String>
    /// Whether the parent external account is verified on the platform.
    public let verified: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        externalId: Nullable<String>,
        id: String,
        name: Nullable<String>,
        platform: ExternalAccountParentPlatform,
        profilePictureUrl: Nullable<String>,
        username: Nullable<String>,
        verified: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.externalId = externalId
        self.id = id
        self.name = name
        self.platform = platform
        self.profilePictureUrl = profilePictureUrl
        self.username = username
        self.verified = verified
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.externalId = try container.decode(Nullable<String>.self, forKey: .externalId)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.platform = try container.decode(ExternalAccountParentPlatform.self, forKey: .platform)
        self.profilePictureUrl = try container.decode(Nullable<String>.self, forKey: .profilePictureUrl)
        self.username = try container.decode(Nullable<String>.self, forKey: .username)
        self.verified = try container.decode(Bool.self, forKey: .verified)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.externalId, forKey: .externalId)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.platform, forKey: .platform)
        try container.encode(self.profilePictureUrl, forKey: .profilePictureUrl)
        try container.encode(self.username, forKey: .username)
        try container.encode(self.verified, forKey: .verified)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case externalId = "external_id"
        case id
        case name
        case platform
        case profilePictureUrl = "profile_picture_url"
        case username
        case verified
    }
}