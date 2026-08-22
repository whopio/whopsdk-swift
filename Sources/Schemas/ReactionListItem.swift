import Foundation

/// A single reaction left by a user on a feed post, such as a like or emoji.
public struct ReactionListItem: Codable, Hashable, Sendable {
    /// The emoji used for this reaction in shortcode format. Null if the reaction type is not emoji.
    public let emoji: Nullable<String>
    /// The unique identifier for the entity
    public let id: String
    /// The unique identifier of the post this reaction was left on.
    public let resourceId: String
    /// The user who left this reaction on the post.
    public let user: ReactionListItemUser
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        emoji: Nullable<String>,
        id: String,
        resourceId: String,
        user: ReactionListItemUser,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.emoji = emoji
        self.id = id
        self.resourceId = resourceId
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.emoji = try container.decode(Nullable<String>.self, forKey: .emoji)
        self.id = try container.decode(String.self, forKey: .id)
        self.resourceId = try container.decode(String.self, forKey: .resourceId)
        self.user = try container.decode(ReactionListItemUser.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.emoji, forKey: .emoji)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.resourceId, forKey: .resourceId)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case emoji
        case id
        case resourceId = "resource_id"
        case user
    }
}