import Foundation

/// A message sent within an experience chat, direct message, or group chat.
public struct MessageListItem: Codable, Hashable, Sendable {
    /// The message content formatted as Markdown. Null if the message has no text content.
    public let content: Nullable<String>
    /// The timestamp when this message was originally created.
    public let createdAt: Date
    /// Represents a unique identifier that is Base64 obfuscated. It is often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `"VXNlci0xMA=="`) or integer (such as `4`) input value will be accepted as an ID.
    public let id: String
    /// Whether the message content has been edited after it was originally sent.
    public let isEdited: Bool
    /// Whether this message is pinned to the top of the channel for easy access.
    public let isPinned: Bool
    /// A list of user IDs that are explicitly mentioned in this message.
    public let mentions: [String]
    /// Whether the message includes an @everyone mention that notifies all channel members.
    public let mentionsEveryone: Bool
    /// The classification of this message: regular, system, or automated.
    public let messageType: DmsPostTypes
    /// A poll attached to this message. Null if the message does not contain a poll.
    public let poll: Nullable<MessageListItemPoll>
    /// Aggregated reaction counts on this message, filtered to a specific reaction type.
    public let pollVotes: [MessageListItemPollVotesItem]
    /// Aggregated reaction counts on this message, filtered to a specific reaction type.
    public let reactionCounts: [MessageListItemReactionCountsItem]
    /// The unique identifier of the message this post is replying to. Null if this is not a reply.
    public let replyingToMessageId: Nullable<String>
    /// The timestamp when this message was last modified.
    public let updatedAt: Date
    /// The user who authored this message.
    public let user: MessageListItemUser
    /// The number of unique views this message has received. Null if view tracking is not enabled for this channel.
    public let viewCount: Nullable<Int>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        content: Nullable<String>,
        createdAt: Date,
        id: String,
        isEdited: Bool,
        isPinned: Bool,
        mentions: [String],
        mentionsEveryone: Bool,
        messageType: DmsPostTypes,
        poll: Nullable<MessageListItemPoll>,
        pollVotes: [MessageListItemPollVotesItem],
        reactionCounts: [MessageListItemReactionCountsItem],
        replyingToMessageId: Nullable<String>,
        updatedAt: Date,
        user: MessageListItemUser,
        viewCount: Nullable<Int>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.content = content
        self.createdAt = createdAt
        self.id = id
        self.isEdited = isEdited
        self.isPinned = isPinned
        self.mentions = mentions
        self.mentionsEveryone = mentionsEveryone
        self.messageType = messageType
        self.poll = poll
        self.pollVotes = pollVotes
        self.reactionCounts = reactionCounts
        self.replyingToMessageId = replyingToMessageId
        self.updatedAt = updatedAt
        self.user = user
        self.viewCount = viewCount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decode(Nullable<String>.self, forKey: .content)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.isEdited = try container.decode(Bool.self, forKey: .isEdited)
        self.isPinned = try container.decode(Bool.self, forKey: .isPinned)
        self.mentions = try container.decode([String].self, forKey: .mentions)
        self.mentionsEveryone = try container.decode(Bool.self, forKey: .mentionsEveryone)
        self.messageType = try container.decode(DmsPostTypes.self, forKey: .messageType)
        self.poll = try container.decode(Nullable<MessageListItemPoll>.self, forKey: .poll)
        self.pollVotes = try container.decode([MessageListItemPollVotesItem].self, forKey: .pollVotes)
        self.reactionCounts = try container.decode([MessageListItemReactionCountsItem].self, forKey: .reactionCounts)
        self.replyingToMessageId = try container.decode(Nullable<String>.self, forKey: .replyingToMessageId)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.user = try container.decode(MessageListItemUser.self, forKey: .user)
        self.viewCount = try container.decode(Nullable<Int>.self, forKey: .viewCount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.content, forKey: .content)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.isEdited, forKey: .isEdited)
        try container.encode(self.isPinned, forKey: .isPinned)
        try container.encode(self.mentions, forKey: .mentions)
        try container.encode(self.mentionsEveryone, forKey: .mentionsEveryone)
        try container.encode(self.messageType, forKey: .messageType)
        try container.encode(self.poll, forKey: .poll)
        try container.encode(self.pollVotes, forKey: .pollVotes)
        try container.encode(self.reactionCounts, forKey: .reactionCounts)
        try container.encode(self.replyingToMessageId, forKey: .replyingToMessageId)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.viewCount, forKey: .viewCount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case content
        case createdAt = "created_at"
        case id
        case isEdited = "is_edited"
        case isPinned = "is_pinned"
        case mentions
        case mentionsEveryone = "mentions_everyone"
        case messageType = "message_type"
        case poll
        case pollVotes = "poll_votes"
        case reactionCounts = "reaction_counts"
        case replyingToMessageId = "replying_to_message_id"
        case updatedAt = "updated_at"
        case user
        case viewCount = "view_count"
    }
}