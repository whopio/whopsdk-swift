import Foundation

/// A real-time chat feed attached to an experience, with configurable moderation and posting permissions.
public struct ChatChannelListItem: Codable, Hashable, Sendable {
    /// Whether media uploads such as images and videos are blocked in this chat.
    public let banMedia: Bool
    /// Whether URL links are blocked from being posted in this chat.
    public let banUrls: Bool
    /// A list of words that are automatically filtered from messages in this chat.
    public let bannedWords: [String]
    /// The experience this chat feed is attached to.
    public let experience: ChatChannelListItemExperience
    /// The unique identifier for the entity
    public let id: String
    /// The minimum number of seconds a user must wait between consecutive messages. Null if no cooldown is enforced.
    public let userPostsCooldownSeconds: Nullable<Int>
    /// The permission level controlling which users can send messages in this chat.
    public let whoCanPost: WhoCanPostTypes
    /// The permission level controlling which users can add reactions in this chat.
    public let whoCanReact: WhoCanReactTypes
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        banMedia: Bool,
        banUrls: Bool,
        bannedWords: [String],
        experience: ChatChannelListItemExperience,
        id: String,
        userPostsCooldownSeconds: Nullable<Int>,
        whoCanPost: WhoCanPostTypes,
        whoCanReact: WhoCanReactTypes,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.banMedia = banMedia
        self.banUrls = banUrls
        self.bannedWords = bannedWords
        self.experience = experience
        self.id = id
        self.userPostsCooldownSeconds = userPostsCooldownSeconds
        self.whoCanPost = whoCanPost
        self.whoCanReact = whoCanReact
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.banMedia = try container.decode(Bool.self, forKey: .banMedia)
        self.banUrls = try container.decode(Bool.self, forKey: .banUrls)
        self.bannedWords = try container.decode([String].self, forKey: .bannedWords)
        self.experience = try container.decode(ChatChannelListItemExperience.self, forKey: .experience)
        self.id = try container.decode(String.self, forKey: .id)
        self.userPostsCooldownSeconds = try container.decode(Nullable<Int>.self, forKey: .userPostsCooldownSeconds)
        self.whoCanPost = try container.decode(WhoCanPostTypes.self, forKey: .whoCanPost)
        self.whoCanReact = try container.decode(WhoCanReactTypes.self, forKey: .whoCanReact)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.banMedia, forKey: .banMedia)
        try container.encode(self.banUrls, forKey: .banUrls)
        try container.encode(self.bannedWords, forKey: .bannedWords)
        try container.encode(self.experience, forKey: .experience)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.userPostsCooldownSeconds, forKey: .userPostsCooldownSeconds)
        try container.encode(self.whoCanPost, forKey: .whoCanPost)
        try container.encode(self.whoCanReact, forKey: .whoCanReact)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case banMedia = "ban_media"
        case banUrls = "ban_urls"
        case bannedWords = "banned_words"
        case experience
        case id
        case userPostsCooldownSeconds = "user_posts_cooldown_seconds"
        case whoCanPost = "who_can_post"
        case whoCanReact = "who_can_react"
    }
}