import Foundation

public struct NotificationPreferenceScope: Codable, Hashable, Sendable {
    /// Account the preference is scoped to (member notifications), prefixed `biz_`.
    public let accountId: Nullable<String>
    /// Delivery channel the preference applies to. `null` applies to every channel.
    public let channel: Nullable<NotificationPreferenceScopeChannel>
    /// Experience the preference is scoped to, prefixed `exp_`.
    public let experienceId: Nullable<String>
    /// Account whose team notifications the preference is scoped to, prefixed `biz_`.
    public let teamAccountId: Nullable<String>
    /// Notification topic the preference is scoped to, prefixed `topic_`.
    public let topicId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        channel: Nullable<NotificationPreferenceScopeChannel>,
        experienceId: Nullable<String>,
        teamAccountId: Nullable<String>,
        topicId: Nullable<String>,
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
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.channel = try container.decode(Nullable<NotificationPreferenceScopeChannel>.self, forKey: .channel)
        self.experienceId = try container.decode(Nullable<String>.self, forKey: .experienceId)
        self.teamAccountId = try container.decode(Nullable<String>.self, forKey: .teamAccountId)
        self.topicId = try container.decode(Nullable<String>.self, forKey: .topicId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.channel, forKey: .channel)
        try container.encode(self.experienceId, forKey: .experienceId)
        try container.encode(self.teamAccountId, forKey: .teamAccountId)
        try container.encode(self.topicId, forKey: .topicId)
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