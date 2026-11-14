import Foundation

public struct PromoCodeAffiliateUser: Codable, Hashable, Sendable {
    /// Affiliate user ID, prefixed `user_`.
    public let id: String
    /// Display name of the affiliate.
    public let name: Nullable<String>
    /// Affiliate avatar URL, including the generated fallback when no avatar is set.
    public let profilePic: String
    /// Public username of the affiliate.
    public let username: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: Nullable<String>,
        profilePic: String,
        username: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.profilePic = profilePic
        self.username = username
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.profilePic = try container.decode(String.self, forKey: .profilePic)
        self.username = try container.decode(Nullable<String>.self, forKey: .username)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.profilePic, forKey: .profilePic)
        try container.encode(self.username, forKey: .username)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case profilePic = "profile_pic"
        case username
    }
}