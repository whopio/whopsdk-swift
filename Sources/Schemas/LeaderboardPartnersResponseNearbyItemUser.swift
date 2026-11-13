import Foundation

/// The ranked referrer. Identity fields (id, name, username, profile_picture) are returned only on the caller's own entry; other referrers expose coarse location only.
public struct LeaderboardPartnersResponseNearbyItemUser: Codable, Hashable, Sendable {
    /// The city where the referrer is located, derived from their IP address. Null if location sharing is disabled.
    public let city: Nullable<String>
    /// The country where the referrer is located, derived from their IP address. Null if location sharing is disabled.
    public let country: Nullable<String>
    /// User ID, prefixed `user_`. Present only on the caller's own entry.
    public let id: String?
    /// The user's display name. Present only on the caller's own entry.
    public let name: Nullable<String>?
    /// The user's profile picture. Present only on the caller's own entry.
    public let profilePicture: LeaderboardPartnersResponseNearbyItemUserProfilePicture?
    /// The user's unique username. Present only on the caller's own entry.
    public let username: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        city: Nullable<String>,
        country: Nullable<String>,
        id: String? = nil,
        name: Nullable<String>? = nil,
        profilePicture: LeaderboardPartnersResponseNearbyItemUserProfilePicture? = nil,
        username: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.city = city
        self.country = country
        self.id = id
        self.name = name
        self.profilePicture = profilePicture
        self.username = username
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decode(Nullable<String>.self, forKey: .city)
        self.country = try container.decode(Nullable<String>.self, forKey: .country)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
        self.profilePicture = try container.decodeIfPresent(LeaderboardPartnersResponseNearbyItemUserProfilePicture.self, forKey: .profilePicture)
        self.username = try container.decodeIfPresent(String.self, forKey: .username)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.city, forKey: .city)
        try container.encode(self.country, forKey: .country)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.profilePicture, forKey: .profilePicture)
        try container.encodeIfPresent(self.username, forKey: .username)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case city
        case country
        case id
        case name
        case profilePicture = "profile_picture"
        case username
    }
}