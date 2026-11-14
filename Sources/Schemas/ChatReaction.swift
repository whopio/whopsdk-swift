import Foundation

public struct ChatReaction: Codable, Hashable, Sendable {
    /// When the user reacted, as an ISO 8601 timestamp.
    public let createdAt: String
    /// The Unicode emoji, including any skin tone or variation selectors.
    public let emoji: String
    /// Public profile of the user who reacted.
    public let user: UserSummary
    /// ID of the user who reacted, prefixed `user_`.
    public let userId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: String,
        emoji: String,
        user: UserSummary,
        userId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.emoji = emoji
        self.user = user
        self.userId = userId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.emoji = try container.decode(String.self, forKey: .emoji)
        self.user = try container.decode(UserSummary.self, forKey: .user)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.emoji, forKey: .emoji)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.userId, forKey: .userId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case emoji
        case user
        case userId = "user_id"
    }
}