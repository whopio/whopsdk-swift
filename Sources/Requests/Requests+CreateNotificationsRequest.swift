import Foundation

extension Requests {
    public struct CreateNotificationsRequest: Codable, Hashable, Sendable {
        /// Account whose team members receive the notification (`biz_` tag). Exactly one of `experience_id` or `account_id` is required.
        public let accountId: String?
        /// Main body text of the notification.
        public let content: String
        /// Experience whose users receive the notification (`exp_` tag). Exactly one of `experience_id` or `account_id` is required.
        public let experienceId: String?
        /// User whose profile picture is used as the notification icon. Defaults to the experience or account avatar.
        public let iconUserId: Nullable<String>?
        /// Path segment appended to the generated deep link that opens your app, for example `/settings/billing`.
        public let restPath: Nullable<String>?
        /// Optional secondary line displayed below the title.
        public let subtitle: Nullable<String>?
        /// Headline text of the notification.
        public let title: String
        /// Optional `user_` tags narrowing the audience. When provided, only these users are notified (as a mention), provided they are in the targeted experience or account.
        public let userIds: [String]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            content: String,
            experienceId: String? = nil,
            iconUserId: Nullable<String>? = nil,
            restPath: Nullable<String>? = nil,
            subtitle: Nullable<String>? = nil,
            title: String,
            userIds: [String]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.content = content
            self.experienceId = experienceId
            self.iconUserId = iconUserId
            self.restPath = restPath
            self.subtitle = subtitle
            self.title = title
            self.userIds = userIds
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.content = try container.decode(String.self, forKey: .content)
            self.experienceId = try container.decodeIfPresent(String.self, forKey: .experienceId)
            self.iconUserId = try container.decodeNullableIfPresent(String.self, forKey: .iconUserId)
            self.restPath = try container.decodeNullableIfPresent(String.self, forKey: .restPath)
            self.subtitle = try container.decodeNullableIfPresent(String.self, forKey: .subtitle)
            self.title = try container.decode(String.self, forKey: .title)
            self.userIds = try container.decodeIfPresent([String].self, forKey: .userIds)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encode(self.content, forKey: .content)
            try container.encodeIfPresent(self.experienceId, forKey: .experienceId)
            try container.encodeNullableIfPresent(self.iconUserId, forKey: .iconUserId)
            try container.encodeNullableIfPresent(self.restPath, forKey: .restPath)
            try container.encodeNullableIfPresent(self.subtitle, forKey: .subtitle)
            try container.encode(self.title, forKey: .title)
            try container.encodeIfPresent(self.userIds, forKey: .userIds)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case content
            case experienceId = "experience_id"
            case iconUserId = "icon_user_id"
            case restPath = "rest_path"
            case subtitle
            case title
            case userIds = "user_ids"
        }
    }
}