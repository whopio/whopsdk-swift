import Foundation

public struct MemberLastActivityMessage: Codable, Hashable, Sendable {
    /// Who sent the message: the member, or someone on the account's team. `null` when the sender's account no longer exists.
    public let author: Nullable<UserSummary>
    /// The support chat the message was sent in.
    public let channelId: String
    /// When the message was sent, as an ISO 8601 timestamp.
    public let createdAt: String
    /// The message ID.
    public let id: String
    /// Always `message`.
    public let object: MemberLastActivityMessageObject
    /// The message text without formatting. `null` when the message has no text, such as an attachment on its own.
    public let plainContent: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        author: Nullable<UserSummary>,
        channelId: String,
        createdAt: String,
        id: String,
        object: MemberLastActivityMessageObject,
        plainContent: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.author = author
        self.channelId = channelId
        self.createdAt = createdAt
        self.id = id
        self.object = object
        self.plainContent = plainContent
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.author = try container.decode(Nullable<UserSummary>.self, forKey: .author)
        self.channelId = try container.decode(String.self, forKey: .channelId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.object = try container.decode(MemberLastActivityMessageObject.self, forKey: .object)
        self.plainContent = try container.decode(Nullable<String>.self, forKey: .plainContent)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.author, forKey: .author)
        try container.encode(self.channelId, forKey: .channelId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.plainContent, forKey: .plainContent)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case author
        case channelId = "channel_id"
        case createdAt = "created_at"
        case id
        case object
        case plainContent = "plain_content"
    }
}