import Foundation

/// An AI-powered chat conversation belonging to a user, with optional scheduled automation.
public struct AiChat: Codable, Hashable, Sendable {
    /// The AI agent that handles this chat. Set when the chat is created and fixed for its lifetime.
    public let agentIdentifier: AiChatAgentIdentifiers
    /// The total number of tokens consumed across all messages in this conversation.
    public let blendedTokenUsage: String
    /// The datetime the ai chat was created.
    public let createdAt: Date
    /// The unique identifier for the ai chat.
    public let id: String
    /// The timestamp of the most recent message in this conversation. Null if no messages have been sent yet.
    public let lastMessageAt: Nullable<Date>
    /// The total number of messages exchanged in this conversation.
    public let messageCount: Int
    /// The notification preference for this AI chat. `all` delivers AI chat notifications and badges, while `none` mutes them.
    public let notificationPreference: AiChatNotificationPreferences
    /// A short descriptive title for this AI chat conversation. Null if no title has been set.
    public let title: Nullable<String>
    /// The datetime the ai chat was last updated.
    public let updatedAt: Date
    /// The user who owns this AI chat conversation.
    public let user: AiChatUser
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        agentIdentifier: AiChatAgentIdentifiers,
        blendedTokenUsage: String,
        createdAt: Date,
        id: String,
        lastMessageAt: Nullable<Date>,
        messageCount: Int,
        notificationPreference: AiChatNotificationPreferences,
        title: Nullable<String>,
        updatedAt: Date,
        user: AiChatUser,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.agentIdentifier = agentIdentifier
        self.blendedTokenUsage = blendedTokenUsage
        self.createdAt = createdAt
        self.id = id
        self.lastMessageAt = lastMessageAt
        self.messageCount = messageCount
        self.notificationPreference = notificationPreference
        self.title = title
        self.updatedAt = updatedAt
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.agentIdentifier = try container.decode(AiChatAgentIdentifiers.self, forKey: .agentIdentifier)
        self.blendedTokenUsage = try container.decode(String.self, forKey: .blendedTokenUsage)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastMessageAt = try container.decode(Nullable<Date>.self, forKey: .lastMessageAt)
        self.messageCount = try container.decode(Int.self, forKey: .messageCount)
        self.notificationPreference = try container.decode(AiChatNotificationPreferences.self, forKey: .notificationPreference)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.user = try container.decode(AiChatUser.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.agentIdentifier, forKey: .agentIdentifier)
        try container.encode(self.blendedTokenUsage, forKey: .blendedTokenUsage)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastMessageAt, forKey: .lastMessageAt)
        try container.encode(self.messageCount, forKey: .messageCount)
        try container.encode(self.notificationPreference, forKey: .notificationPreference)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case agentIdentifier = "agent_identifier"
        case blendedTokenUsage = "blended_token_usage"
        case createdAt = "created_at"
        case id
        case lastMessageAt = "last_message_at"
        case messageCount = "message_count"
        case notificationPreference = "notification_preference"
        case title
        case updatedAt = "updated_at"
        case user
    }
}