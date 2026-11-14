import Foundation

/// The partner whose blueprint the business deployed. Null unless this is a blueprint referral.
public struct RetrieveBusinessesResponseBlueprintPartner: Codable, Hashable, Sendable {
    /// User ID, prefixed `user_`.
    public let id: String
    /// The user's display name.
    public let name: Nullable<String>
    /// The user's profile picture.
    public let profilePicture: RetrieveBusinessesResponseBlueprintPartnerProfilePicture
    /// The user's unique username.
    public let username: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: Nullable<String>,
        profilePicture: RetrieveBusinessesResponseBlueprintPartnerProfilePicture,
        username: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.profilePicture = profilePicture
        self.username = username
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.profilePicture = try container.decode(RetrieveBusinessesResponseBlueprintPartnerProfilePicture.self, forKey: .profilePicture)
        self.username = try container.decode(String.self, forKey: .username)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.profilePicture, forKey: .profilePicture)
        try container.encode(self.username, forKey: .username)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case profilePicture = "profile_picture"
        case username
    }
}