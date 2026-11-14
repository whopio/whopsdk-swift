import Foundation

public struct ChatMessage: Codable, Hashable, Sendable {
    public let attachments: [File]
    public let author: Nullable<UserSummary>
    /// `true` if the author is a team member of the account that owns this community channel. `false` for partners, private and support channels, and deleted messages.
    public let authorIsTeamMember: Bool
    public let authorUserId: Nullable<String>
    public let channelId: String
    /// Markdown content. `null` for a deleted message.
    public let content: Nullable<String>
    /// Creation time as an ISO 8601 timestamp.
    public let createdAt: String
    public let customAuthor: Nullable<MessageCustomAuthor>
    /// Deletion time, or null for a live message.
    public let deletedAt: Nullable<String>
    public let edited: Bool
    public let embeds: [Embed]
    public let gifs: [Gif]
    /// Message ID, prefixed `post_`. Matches the `id` sent on create, when one was sent.
    public let id: String
    public let linkPreviews: [MessageLinkPreview]
    public let mentionedUserIds: [String]
    public let messageType: ChatMessageMessageType
    public let pinned: Bool
    /// Unformatted message text. null when the text is absent or the message is deleted
    public let plainContent: Nullable<String>
    public let poll: Nullable<ChatMessagePoll>
    public let reactionCounts: [MessageReactionCount]
    public let replyingToMessageId: Nullable<String>
    /// User ID of the replied-to message's author, prefixed `user_`. `null` without a reply in this channel, or when either message is deleted.
    public let replyingToUserId: Nullable<String>
    /// Last message change as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Experience view count. `null` for DM-backed channels.
    public let viewCount: Nullable<Int>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        attachments: [File],
        author: Nullable<UserSummary>,
        authorIsTeamMember: Bool,
        authorUserId: Nullable<String>,
        channelId: String,
        content: Nullable<String>,
        createdAt: String,
        customAuthor: Nullable<MessageCustomAuthor>,
        deletedAt: Nullable<String>,
        edited: Bool,
        embeds: [Embed],
        gifs: [Gif],
        id: String,
        linkPreviews: [MessageLinkPreview],
        mentionedUserIds: [String],
        messageType: ChatMessageMessageType,
        pinned: Bool,
        plainContent: Nullable<String>,
        poll: Nullable<ChatMessagePoll>,
        reactionCounts: [MessageReactionCount],
        replyingToMessageId: Nullable<String>,
        replyingToUserId: Nullable<String>,
        updatedAt: String,
        viewCount: Nullable<Int>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.attachments = attachments
        self.author = author
        self.authorIsTeamMember = authorIsTeamMember
        self.authorUserId = authorUserId
        self.channelId = channelId
        self.content = content
        self.createdAt = createdAt
        self.customAuthor = customAuthor
        self.deletedAt = deletedAt
        self.edited = edited
        self.embeds = embeds
        self.gifs = gifs
        self.id = id
        self.linkPreviews = linkPreviews
        self.mentionedUserIds = mentionedUserIds
        self.messageType = messageType
        self.pinned = pinned
        self.plainContent = plainContent
        self.poll = poll
        self.reactionCounts = reactionCounts
        self.replyingToMessageId = replyingToMessageId
        self.replyingToUserId = replyingToUserId
        self.updatedAt = updatedAt
        self.viewCount = viewCount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attachments = try container.decode([File].self, forKey: .attachments)
        self.author = try container.decode(Nullable<UserSummary>.self, forKey: .author)
        self.authorIsTeamMember = try container.decode(Bool.self, forKey: .authorIsTeamMember)
        self.authorUserId = try container.decode(Nullable<String>.self, forKey: .authorUserId)
        self.channelId = try container.decode(String.self, forKey: .channelId)
        self.content = try container.decode(Nullable<String>.self, forKey: .content)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.customAuthor = try container.decode(Nullable<MessageCustomAuthor>.self, forKey: .customAuthor)
        self.deletedAt = try container.decode(Nullable<String>.self, forKey: .deletedAt)
        self.edited = try container.decode(Bool.self, forKey: .edited)
        self.embeds = try container.decode([Embed].self, forKey: .embeds)
        self.gifs = try container.decode([Gif].self, forKey: .gifs)
        self.id = try container.decode(String.self, forKey: .id)
        self.linkPreviews = try container.decode([MessageLinkPreview].self, forKey: .linkPreviews)
        self.mentionedUserIds = try container.decode([String].self, forKey: .mentionedUserIds)
        self.messageType = try container.decode(ChatMessageMessageType.self, forKey: .messageType)
        self.pinned = try container.decode(Bool.self, forKey: .pinned)
        self.plainContent = try container.decode(Nullable<String>.self, forKey: .plainContent)
        self.poll = try container.decode(Nullable<ChatMessagePoll>.self, forKey: .poll)
        self.reactionCounts = try container.decode([MessageReactionCount].self, forKey: .reactionCounts)
        self.replyingToMessageId = try container.decode(Nullable<String>.self, forKey: .replyingToMessageId)
        self.replyingToUserId = try container.decode(Nullable<String>.self, forKey: .replyingToUserId)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.viewCount = try container.decode(Nullable<Int>.self, forKey: .viewCount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.attachments, forKey: .attachments)
        try container.encode(self.author, forKey: .author)
        try container.encode(self.authorIsTeamMember, forKey: .authorIsTeamMember)
        try container.encode(self.authorUserId, forKey: .authorUserId)
        try container.encode(self.channelId, forKey: .channelId)
        try container.encode(self.content, forKey: .content)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.customAuthor, forKey: .customAuthor)
        try container.encode(self.deletedAt, forKey: .deletedAt)
        try container.encode(self.edited, forKey: .edited)
        try container.encode(self.embeds, forKey: .embeds)
        try container.encode(self.gifs, forKey: .gifs)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.linkPreviews, forKey: .linkPreviews)
        try container.encode(self.mentionedUserIds, forKey: .mentionedUserIds)
        try container.encode(self.messageType, forKey: .messageType)
        try container.encode(self.pinned, forKey: .pinned)
        try container.encode(self.plainContent, forKey: .plainContent)
        try container.encode(self.poll, forKey: .poll)
        try container.encode(self.reactionCounts, forKey: .reactionCounts)
        try container.encode(self.replyingToMessageId, forKey: .replyingToMessageId)
        try container.encode(self.replyingToUserId, forKey: .replyingToUserId)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.viewCount, forKey: .viewCount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case attachments
        case author
        case authorIsTeamMember = "author_is_team_member"
        case authorUserId = "author_user_id"
        case channelId = "channel_id"
        case content
        case createdAt = "created_at"
        case customAuthor = "custom_author"
        case deletedAt = "deleted_at"
        case edited
        case embeds
        case gifs
        case id
        case linkPreviews = "link_previews"
        case mentionedUserIds = "mentioned_user_ids"
        case messageType = "message_type"
        case pinned
        case plainContent = "plain_content"
        case poll
        case reactionCounts = "reaction_counts"
        case replyingToMessageId = "replying_to_message_id"
        case replyingToUserId = "replying_to_user_id"
        case updatedAt = "updated_at"
        case viewCount = "view_count"
    }
}