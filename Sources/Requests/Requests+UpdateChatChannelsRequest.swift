import Foundation

extension Requests {
    public struct UpdateChatChannelsRequest: Codable, Hashable, Sendable {
        /// Whether media uploads such as images and videos are banned in this chat channel.
        public let banMedia: Nullable<Bool>?
        /// Whether URLs and links are banned from being posted in this chat channel.
        public let banUrls: Nullable<Bool>?
        /// A list of words that are automatically blocked from messages in this chat channel. For example, ['spam', 'scam'].
        public let bannedWords: Nullable<[String]>?
        /// The minimum number of seconds a user must wait between sending messages in this chat channel.
        public let userPostsCooldownSeconds: Nullable<Int>?
        /// Controls which roles are allowed to send messages in this chat channel.
        public let whoCanPost: Nullable<WhoCanPostTypes>?
        /// Controls which roles are allowed to add reactions to messages in this chat channel.
        public let whoCanReact: Nullable<WhoCanReactTypes>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            banMedia: Nullable<Bool>? = nil,
            banUrls: Nullable<Bool>? = nil,
            bannedWords: Nullable<[String]>? = nil,
            userPostsCooldownSeconds: Nullable<Int>? = nil,
            whoCanPost: Nullable<WhoCanPostTypes>? = nil,
            whoCanReact: Nullable<WhoCanReactTypes>? = nil,
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
            self.banMedia = try container.decodeNullableIfPresent(Bool.self, forKey: .banMedia)
            self.banUrls = try container.decodeNullableIfPresent(Bool.self, forKey: .banUrls)
            self.bannedWords = try container.decodeNullableIfPresent([String].self, forKey: .bannedWords)
            self.userPostsCooldownSeconds = try container.decodeNullableIfPresent(Int.self, forKey: .userPostsCooldownSeconds)
            self.whoCanPost = try container.decodeNullableIfPresent(WhoCanPostTypes.self, forKey: .whoCanPost)
            self.whoCanReact = try container.decodeNullableIfPresent(WhoCanReactTypes.self, forKey: .whoCanReact)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.banMedia, forKey: .banMedia)
            try container.encodeNullableIfPresent(self.banUrls, forKey: .banUrls)
            try container.encodeNullableIfPresent(self.bannedWords, forKey: .bannedWords)
            try container.encodeNullableIfPresent(self.userPostsCooldownSeconds, forKey: .userPostsCooldownSeconds)
            try container.encodeNullableIfPresent(self.whoCanPost, forKey: .whoCanPost)
            try container.encodeNullableIfPresent(self.whoCanReact, forKey: .whoCanReact)
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
}