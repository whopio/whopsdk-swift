import Foundation

public struct MemberUser: Codable, Hashable, Sendable {
    /// The user's city, derived from their IP address. `null` when unknown or the user turned off location sharing.
    public let city: Nullable<String>
    /// The user's country as an ISO 3166-1 alpha-2 code, like `US`, derived from their IP address. `null` when unknown or the user turned off location sharing.
    public let country: Nullable<String>
    /// User ID, prefixed `user_`.
    public let id: String
    /// Display name.
    public let name: Nullable<String>
    /// Avatar wrapper. Its `url` is always present, and is a generated placeholder when the user set no picture.
    public let profilePicture: UserProfilePicture
    /// The user's state or region code, like `CA`, derived from their IP address. `null` when unknown or the user turned off location sharing.
    public let state: Nullable<String>
    /// Public username.
    public let username: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        city: Nullable<String>,
        country: Nullable<String>,
        id: String,
        name: Nullable<String>,
        profilePicture: UserProfilePicture,
        state: Nullable<String>,
        username: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.city = city
        self.country = country
        self.id = id
        self.name = name
        self.profilePicture = profilePicture
        self.state = state
        self.username = username
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decode(Nullable<String>.self, forKey: .city)
        self.country = try container.decode(Nullable<String>.self, forKey: .country)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.profilePicture = try container.decode(UserProfilePicture.self, forKey: .profilePicture)
        self.state = try container.decode(Nullable<String>.self, forKey: .state)
        self.username = try container.decode(String.self, forKey: .username)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.city, forKey: .city)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.profilePicture, forKey: .profilePicture)
        try container.encode(self.state, forKey: .state)
        try container.encode(self.username, forKey: .username)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case city
        case country
        case id
        case name
        case profilePicture = "profile_picture"
        case state
        case username
    }
}