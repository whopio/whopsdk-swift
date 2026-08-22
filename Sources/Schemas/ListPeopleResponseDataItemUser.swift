import Foundation

/// The person's primary whop user, when one of their identities is a whop account.
public struct ListPeopleResponseDataItemUser: Codable, Hashable, Sendable {
    public let id: String
    public let name: Nullable<String>?
    public let profilePicUrl: Nullable<String>?
    public let username: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: Nullable<String>? = nil,
        profilePicUrl: Nullable<String>? = nil,
        username: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.profilePicUrl = profilePicUrl
        self.username = username
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
        self.profilePicUrl = try container.decodeNullableIfPresent(String.self, forKey: .profilePicUrl)
        self.username = try container.decode(String.self, forKey: .username)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.name, forKey: .name)
        try container.encodeNullableIfPresent(self.profilePicUrl, forKey: .profilePicUrl)
        try container.encode(self.username, forKey: .username)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case profilePicUrl = "profile_pic_url"
        case username
    }
}