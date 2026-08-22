import Foundation

extension Requests {
    public struct UpdateForumsRequest: Codable, Hashable, Sendable {
        /// A list of words that are automatically blocked from posts in this forum. For example, ['spam', 'scam'].
        public let bannedWords: Nullable<[String]>?
        /// The banner image displayed at the top of the forum page. Pass null to remove the existing banner.
        public let bannerImage: Nullable<UpdateForumsRequestBannerImage>?
        /// Controls how email notifications are sent to members when new posts are created in this forum.
        public let emailNotificationPreference: Nullable<ForumEmailNotificationPreferences>?
        /// Controls which roles are allowed to comment on posts in this forum.
        public let whoCanComment: Nullable<ForumWhoCanCommentTypes>?
        /// Controls which roles are allowed to create new posts in this forum.
        public let whoCanPost: Nullable<ForumWhoCanPostTypes>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            bannedWords: Nullable<[String]>? = nil,
            bannerImage: Nullable<UpdateForumsRequestBannerImage>? = nil,
            emailNotificationPreference: Nullable<ForumEmailNotificationPreferences>? = nil,
            whoCanComment: Nullable<ForumWhoCanCommentTypes>? = nil,
            whoCanPost: Nullable<ForumWhoCanPostTypes>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.bannedWords = bannedWords
            self.bannerImage = bannerImage
            self.emailNotificationPreference = emailNotificationPreference
            self.whoCanComment = whoCanComment
            self.whoCanPost = whoCanPost
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.bannedWords = try container.decodeNullableIfPresent([String].self, forKey: .bannedWords)
            self.bannerImage = try container.decodeNullableIfPresent(UpdateForumsRequestBannerImage.self, forKey: .bannerImage)
            self.emailNotificationPreference = try container.decodeNullableIfPresent(ForumEmailNotificationPreferences.self, forKey: .emailNotificationPreference)
            self.whoCanComment = try container.decodeNullableIfPresent(ForumWhoCanCommentTypes.self, forKey: .whoCanComment)
            self.whoCanPost = try container.decodeNullableIfPresent(ForumWhoCanPostTypes.self, forKey: .whoCanPost)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.bannedWords, forKey: .bannedWords)
            try container.encodeNullableIfPresent(self.bannerImage, forKey: .bannerImage)
            try container.encodeNullableIfPresent(self.emailNotificationPreference, forKey: .emailNotificationPreference)
            try container.encodeNullableIfPresent(self.whoCanComment, forKey: .whoCanComment)
            try container.encodeNullableIfPresent(self.whoCanPost, forKey: .whoCanPost)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case bannedWords = "banned_words"
            case bannerImage = "banner_image"
            case emailNotificationPreference = "email_notification_preference"
            case whoCanComment = "who_can_comment"
            case whoCanPost = "who_can_post"
        }
    }
}