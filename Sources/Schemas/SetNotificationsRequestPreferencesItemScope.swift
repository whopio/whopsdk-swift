import Foundation

/// What the preference applies to. `null` on a dimension means the preference is not narrowed there. A scope read back from either list endpoint can be sent as-is. A scope naming an experience with no topic sets that experience's level; any other scope sets a topic override.
public struct SetNotificationsRequestPreferencesItemScope: Codable, Hashable, Sendable {
    /// Account to scope the preference to (member notifications), `biz_` tag.
    public let accountId: Nullable<String>?
    /// Delivery channel the preference applies to. Omit it (or pass `null`) to apply the preference to every channel.
    public let channel: Nullable<SetNotificationsRequestPreferencesItemScopeChannel>?
    /// Experience to scope the preference to (`exp_` tag). Requires `account_id` when a `topic_id` is also given.
    public let experienceId: Nullable<String>?
    /// Account whose team notifications the preference is scoped to, `biz_` tag.
    public let teamAccountId: Nullable<String>?
    /// Notification topic to scope the preference to, `topic_` tag. Topic IDs come from `GET /notifications/topics`.
    public let topicId: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>? = nil,
        channel: Nullable<SetNotificationsRequestPreferencesItemScopeChannel>? = nil,
        experienceId: Nullable<String>? = nil,
        teamAccountId: Nullable<String>? = nil,
        topicId: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.channel = channel
        self.experienceId = experienceId
        self.teamAccountId = teamAccountId
        self.topicId = topicId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decodeNullableIfPresent(String.self, forKey: .accountId)
        self.channel = try container.decodeNullableIfPresent(SetNotificationsRequestPreferencesItemScopeChannel.self, forKey: .channel)
        self.experienceId = try container.decodeNullableIfPresent(String.self, forKey: .experienceId)
        self.teamAccountId = try container.decodeNullableIfPresent(String.self, forKey: .teamAccountId)
        self.topicId = try container.decodeNullableIfPresent(String.self, forKey: .topicId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.accountId, forKey: .accountId)
        try container.encodeNullableIfPresent(self.channel, forKey: .channel)
        try container.encodeNullableIfPresent(self.experienceId, forKey: .experienceId)
        try container.encodeNullableIfPresent(self.teamAccountId, forKey: .teamAccountId)
        try container.encodeNullableIfPresent(self.topicId, forKey: .topicId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case channel
        case experienceId = "experience_id"
        case teamAccountId = "team_account_id"
        case topicId = "topic_id"
    }
}