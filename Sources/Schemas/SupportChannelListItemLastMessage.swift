import Foundation

/// The most recent message in this channel. Null if no messages have been sent, or when listing support channels without `include_last_message`.
public struct SupportChannelListItemLastMessage: Codable, Hashable, Sendable {
    /// A list of all attachments on this message, including files and media.
    public let attachments: [SupportChannelListItemLastMessageAttachmentsItem]
    /// The message content formatted as Markdown. Null if the message has no text content.
    public let content: Nullable<String>
    /// The timestamp when this message was originally created.
    public let createdAt: Date
    /// A list of GIF animations attached to this message.
    public let gifs: [SupportChannelListItemLastMessageGifsItem]
    /// Represents a unique identifier that is Base64 obfuscated. It is often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `"VXNlci0xMA=="`) or integer (such as `4`) input value will be accepted as an ID.
    public let id: String
    /// A poll attached to this message. Null if the message does not contain a poll.
    public let poll: Nullable<SupportChannelListItemLastMessagePoll>
    /// The unique identifier of the user who authored this message.
    public let userId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        attachments: [SupportChannelListItemLastMessageAttachmentsItem],
        content: Nullable<String>,
        createdAt: Date,
        gifs: [SupportChannelListItemLastMessageGifsItem],
        id: String,
        poll: Nullable<SupportChannelListItemLastMessagePoll>,
        userId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.attachments = attachments
        self.content = content
        self.createdAt = createdAt
        self.gifs = gifs
        self.id = id
        self.poll = poll
        self.userId = userId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attachments = try container.decode([SupportChannelListItemLastMessageAttachmentsItem].self, forKey: .attachments)
        self.content = try container.decode(Nullable<String>.self, forKey: .content)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.gifs = try container.decode([SupportChannelListItemLastMessageGifsItem].self, forKey: .gifs)
        self.id = try container.decode(String.self, forKey: .id)
        self.poll = try container.decode(Nullable<SupportChannelListItemLastMessagePoll>.self, forKey: .poll)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.attachments, forKey: .attachments)
        try container.encode(self.content, forKey: .content)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.gifs, forKey: .gifs)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.poll, forKey: .poll)
        try container.encode(self.userId, forKey: .userId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case attachments
        case content
        case createdAt = "created_at"
        case gifs
        case id
        case poll
        case userId = "user_id"
    }
}