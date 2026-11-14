import Foundation

/// A member's account on an outside platform, such as Discord or Telegram.
public struct MembershipLegacyExternalAccountsItem: Codable, Hashable, Sendable {
    /// The member's user ID on the platform, such as a Discord user ID. Prefixed with the platform (`discord_<external_id>`), it is the `external_account` value List Memberships filters by.
    public let externalId: String
    /// The platform the member's account is on: `discord` or `telegram`.
    public let platform: String
    /// The member's username on the platform. Null when Whop doesn't know it, such as for a membership imported with only a Discord ID.
    public let username: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        externalId: String,
        platform: String,
        username: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.externalId = externalId
        self.platform = platform
        self.username = username
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.externalId = try container.decode(String.self, forKey: .externalId)
        self.platform = try container.decode(String.self, forKey: .platform)
        self.username = try container.decode(Nullable<String>.self, forKey: .username)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.externalId, forKey: .externalId)
        try container.encode(self.platform, forKey: .platform)
        try container.encode(self.username, forKey: .username)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case externalId = "external_id"
        case platform
        case username
    }
}