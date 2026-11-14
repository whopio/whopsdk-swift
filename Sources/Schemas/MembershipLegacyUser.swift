import Foundation

/// The user who owns this membership. Null if the user account has been deleted.
public struct MembershipLegacyUser: Codable, Hashable, Sendable {
    /// The user's email address. Requires the member:email:read permission to access. Null if not authorized.
    public let email: Nullable<String>
    /// The unique identifier for the user.
    public let id: String
    /// The user's display name shown on their public profile.
    public let name: Nullable<String>
    /// The URL of the user's profile picture. Use profilePicture for the full attachment object.
    public let profilePic: String
    /// The user's unique username shown on their public profile.
    public let username: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        email: Nullable<String>,
        id: String,
        name: Nullable<String>,
        profilePic: String,
        username: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.email = email
        self.id = id
        self.name = name
        self.profilePic = profilePic
        self.username = username
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decode(Nullable<String>.self, forKey: .email)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.profilePic = try container.decode(String.self, forKey: .profilePic)
        self.username = try container.decode(String.self, forKey: .username)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.profilePic, forKey: .profilePic)
        try container.encode(self.username, forKey: .username)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case email
        case id
        case name
        case profilePic = "profile_pic"
        case username
    }
}