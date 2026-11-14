import Foundation

public struct ReferredUsersPartnersResponseDataItemUser: Codable, Hashable, Sendable {
    public let city: Nullable<String>?
    public let country: Nullable<String>?
    /// The referred user's email address, so a partner can follow up with someone they brought onto Whop. Requires the `partner:email:read` scope; `null` without it, or while the account has no reachable address of its own.
    public let email: Nullable<String>
    public let id: String
    public let name: Nullable<String>?
    public let profilePicture: ReferredUsersPartnersResponseDataItemUserProfilePicture?
    public let username: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        city: Nullable<String>? = nil,
        country: Nullable<String>? = nil,
        email: Nullable<String>,
        id: String,
        name: Nullable<String>? = nil,
        profilePicture: ReferredUsersPartnersResponseDataItemUserProfilePicture? = nil,
        username: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.city = city
        self.country = country
        self.email = email
        self.id = id
        self.name = name
        self.profilePicture = profilePicture
        self.username = username
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decodeNullableIfPresent(String.self, forKey: .city)
        self.country = try container.decodeNullableIfPresent(String.self, forKey: .country)
        self.email = try container.decode(Nullable<String>.self, forKey: .email)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
        self.profilePicture = try container.decodeIfPresent(ReferredUsersPartnersResponseDataItemUserProfilePicture.self, forKey: .profilePicture)
        self.username = try container.decode(String.self, forKey: .username)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.city, forKey: .city)
        try container.encodeNullableIfPresent(self.country, forKey: .country)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.profilePicture, forKey: .profilePicture)
        try container.encode(self.username, forKey: .username)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case city
        case country
        case email
        case id
        case name
        case profilePicture = "profile_picture"
        case username
    }
}