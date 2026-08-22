import Foundation

public struct SocialAccountParent: Codable, Hashable, Sendable {
    /// The platform-specific ID for the parent social account.
    public let externalId: Nullable<String>
    /// Social account ID, prefixed `sacc_`.
    public let id: String
    /// The display name of the parent social account on the platform.
    public let name: Nullable<String>
    /// The platform the parent social account exists on.
    public let platform: SocialAccountParentPlatform
    /// The URL where the profile picture of the parent social account can be accessed.
    public let profilePictureUrl: Nullable<String>
    /// The username of the parent social account on the platform.
    public let username: Nullable<String>
    /// Whether the parent social account is verified on the platform.
    public let verified: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        externalId: Nullable<String>,
        id: String,
        name: Nullable<String>,
        platform: SocialAccountParentPlatform,
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
        self.platform = try container.decode(SocialAccountParentPlatform.self, forKey: .platform)
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