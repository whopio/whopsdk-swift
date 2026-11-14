import Foundation

public struct ChannelModeration: Codable, Hashable, Sendable {
    /// Prevent members from posting media.
    public let banMedia: Bool
    /// Prevent members from posting links.
    public let banUrls: Bool
    public let bannedWords: Nullable<[String]>
    /// Seconds a member must wait between messages. `0` or `null` turns the cooldown off.
    public let userPostsCooldownSeconds: Nullable<Int>
    /// Who can post messages.
    public let whoCanPost: ChannelModerationWhoCanPost
    /// Who can react to messages.
    public let whoCanReact: ChannelModerationWhoCanReact
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        banMedia: Bool,
        banUrls: Bool,
        bannedWords: Nullable<[String]>,
        userPostsCooldownSeconds: Nullable<Int>,
        whoCanPost: ChannelModerationWhoCanPost,
        whoCanReact: ChannelModerationWhoCanReact,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.banMedia = banMedia
        self.banUrls = banUrls
        self.bannedWords = bannedWords
        self.userPostsCooldownSeconds = userPostsCooldownSeconds
        self.whoCanPost = whoCanPost
        self.whoCanReact = whoCanReact
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.banMedia = try container.decode(Bool.self, forKey: .banMedia)
        self.banUrls = try container.decode(Bool.self, forKey: .banUrls)
        self.bannedWords = try container.decode(Nullable<[String]>.self, forKey: .bannedWords)
        self.userPostsCooldownSeconds = try container.decode(Nullable<Int>.self, forKey: .userPostsCooldownSeconds)
        self.whoCanPost = try container.decode(ChannelModerationWhoCanPost.self, forKey: .whoCanPost)
        self.whoCanReact = try container.decode(ChannelModerationWhoCanReact.self, forKey: .whoCanReact)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.banMedia, forKey: .banMedia)
        try container.encode(self.banUrls, forKey: .banUrls)
        try container.encode(self.bannedWords, forKey: .bannedWords)
        try container.encode(self.userPostsCooldownSeconds, forKey: .userPostsCooldownSeconds)
        try container.encode(self.whoCanPost, forKey: .whoCanPost)
        try container.encode(self.whoCanReact, forKey: .whoCanReact)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case banMedia = "ban_media"
        case banUrls = "ban_urls"
        case bannedWords = "banned_words"
        case userPostsCooldownSeconds = "user_posts_cooldown_seconds"
        case whoCanPost = "who_can_post"
        case whoCanReact = "who_can_react"
    }
}