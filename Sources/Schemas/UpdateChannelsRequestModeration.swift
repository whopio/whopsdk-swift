import Foundation

/// Moderation settings, accepted only for community channels. Requires chat moderation permission. Omitted settings are preserved.
public struct UpdateChannelsRequestModeration: Codable, Hashable, Sendable {
    /// Prevent members from posting media.
    public let banMedia: Bool?
    /// Prevent members from posting links.
    public let banUrls: Bool?
    /// Words blocked in the channel. An empty list clears the blocklist.
    public let bannedWords: [String]?
    /// Seconds a member must wait between messages. `0` or `null` turns the cooldown off.
    public let userPostsCooldownSeconds: Nullable<Int>?
    /// Who can post messages.
    public let whoCanPost: UpdateChannelsRequestModerationWhoCanPost?
    /// Who can react to messages.
    public let whoCanReact: UpdateChannelsRequestModerationWhoCanReact?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        banMedia: Bool? = nil,
        banUrls: Bool? = nil,
        bannedWords: [String]? = nil,
        userPostsCooldownSeconds: Nullable<Int>? = nil,
        whoCanPost: UpdateChannelsRequestModerationWhoCanPost? = nil,
        whoCanReact: UpdateChannelsRequestModerationWhoCanReact? = nil,
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
        self.banMedia = try container.decodeIfPresent(Bool.self, forKey: .banMedia)
        self.banUrls = try container.decodeIfPresent(Bool.self, forKey: .banUrls)
        self.bannedWords = try container.decodeIfPresent([String].self, forKey: .bannedWords)
        self.userPostsCooldownSeconds = try container.decodeNullableIfPresent(Int.self, forKey: .userPostsCooldownSeconds)
        self.whoCanPost = try container.decodeIfPresent(UpdateChannelsRequestModerationWhoCanPost.self, forKey: .whoCanPost)
        self.whoCanReact = try container.decodeIfPresent(UpdateChannelsRequestModerationWhoCanReact.self, forKey: .whoCanReact)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.banMedia, forKey: .banMedia)
        try container.encodeIfPresent(self.banUrls, forKey: .banUrls)
        try container.encodeIfPresent(self.bannedWords, forKey: .bannedWords)
        try container.encodeNullableIfPresent(self.userPostsCooldownSeconds, forKey: .userPostsCooldownSeconds)
        try container.encodeIfPresent(self.whoCanPost, forKey: .whoCanPost)
        try container.encodeIfPresent(self.whoCanReact, forKey: .whoCanReact)
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