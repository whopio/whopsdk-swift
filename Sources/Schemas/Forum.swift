import Foundation

/// A discussion forum where members can create posts, comment, and react, belonging to an experience.
public struct Forum: Codable, Hashable, Sendable {
    /// A list of words that are automatically filtered from posts in this forum.
    public let bannedWords: [String]
    /// The banner image displayed at the top of the forum page. Null if no banner has been uploaded.
    public let bannerImage: Nullable<ForumBannerImage>
    /// The email notification setting that controls which posts trigger email alerts. One of: all_admin_posts, only_weekly_summary, none.
    public let emailNotificationPreference: ForumEmailNotificationPreferences
    /// The parent experience that this forum belongs to.
    public let experience: ForumExperience
    /// The unique identifier for the entity
    public let id: String
    /// The permission level controlling who can comment on posts. One of: everyone, admins.
    public let whoCanComment: ForumWhoCanCommentTypes
    /// The permission level controlling who can create new posts. One of: everyone, admins.
    public let whoCanPost: ForumWhoCanPostTypes
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bannedWords: [String],
        bannerImage: Nullable<ForumBannerImage>,
        emailNotificationPreference: ForumEmailNotificationPreferences,
        experience: ForumExperience,
        id: String,
        whoCanComment: ForumWhoCanCommentTypes,
        whoCanPost: ForumWhoCanPostTypes,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bannedWords = bannedWords
        self.bannerImage = bannerImage
        self.emailNotificationPreference = emailNotificationPreference
        self.experience = experience
        self.id = id
        self.whoCanComment = whoCanComment
        self.whoCanPost = whoCanPost
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bannedWords = try container.decode([String].self, forKey: .bannedWords)
        self.bannerImage = try container.decode(Nullable<ForumBannerImage>.self, forKey: .bannerImage)
        self.emailNotificationPreference = try container.decode(ForumEmailNotificationPreferences.self, forKey: .emailNotificationPreference)
        self.experience = try container.decode(ForumExperience.self, forKey: .experience)
        self.id = try container.decode(String.self, forKey: .id)
        self.whoCanComment = try container.decode(ForumWhoCanCommentTypes.self, forKey: .whoCanComment)
        self.whoCanPost = try container.decode(ForumWhoCanPostTypes.self, forKey: .whoCanPost)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bannedWords, forKey: .bannedWords)
        try container.encode(self.bannerImage, forKey: .bannerImage)
        try container.encode(self.emailNotificationPreference, forKey: .emailNotificationPreference)
        try container.encode(self.experience, forKey: .experience)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.whoCanComment, forKey: .whoCanComment)
        try container.encode(self.whoCanPost, forKey: .whoCanPost)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bannedWords = "banned_words"
        case bannerImage = "banner_image"
        case emailNotificationPreference = "email_notification_preference"
        case experience
        case id
        case whoCanComment = "who_can_comment"
        case whoCanPost = "who_can_post"
    }
}