import Foundation

/// The company member associated with this setup intent. Null if the user is not a member.
public struct SetupIntentListItemMember: Codable, Hashable, Sendable {
    /// The unique identifier for the company member.
    public let id: String
    /// The user for this member, if any.
    public let user: Nullable<SetupIntentListItemMemberUser>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        user: Nullable<SetupIntentListItemMemberUser>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.user = try container.decode(Nullable<SetupIntentListItemMemberUser>.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case user
    }
}