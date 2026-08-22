import Foundation

public struct NotificationTopicSummary: Codable, Hashable, Sendable {
    /// Whether notifications for this topic are enabled by default when the user has not set a preference.
    public let defaultPreferenceValue: Bool
    /// Notification topic ID, prefixed `topic_`.
    public let id: String
    /// Whether this topic exclusively handles mention-based notifications.
    public let isMention: Bool
    /// Scope of the topic: whether it applies to an account, a user, or an account's team.
    public let topicType: NotificationTopicSummaryTopicType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        defaultPreferenceValue: Bool,
        id: String,
        isMention: Bool,
        topicType: NotificationTopicSummaryTopicType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.defaultPreferenceValue = defaultPreferenceValue
        self.id = id
        self.isMention = isMention
        self.topicType = topicType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.defaultPreferenceValue = try container.decode(Bool.self, forKey: .defaultPreferenceValue)
        self.id = try container.decode(String.self, forKey: .id)
        self.isMention = try container.decode(Bool.self, forKey: .isMention)
        self.topicType = try container.decode(NotificationTopicSummaryTopicType.self, forKey: .topicType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.defaultPreferenceValue, forKey: .defaultPreferenceValue)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.isMention, forKey: .isMention)
        try container.encode(self.topicType, forKey: .topicType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case defaultPreferenceValue = "default_preference_value"
        case id
        case isMention = "is_mention"
        case topicType = "topic_type"
    }
}