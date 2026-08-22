import Foundation

public struct NotificationTopic: Codable, Hashable, Sendable {
    /// Whether notifications for this topic are enabled by default when the user has not set a preference.
    public let defaultPreferenceValue: Bool
    /// Human-readable explanation of what notifications in this topic are about. `null` when no description has been set.
    public let description: Nullable<String>
    /// Notification topic ID, prefixed `topic_`. This is the value the notification preference endpoints take as `topic_id`.
    public let id: String
    /// Stable, human-readable name for the category, such as `new-follower`. Unlike `id`, it is the same in every environment, which makes it the value to match on in code and to read in logs. Treat it as an opaque string: the set is open and the casing is historical rather than normalized.
    public let identifier: String
    /// Whether this topic exclusively handles mention-based notifications.
    public let isMention: Bool
    /// Display name shown in notification preference settings.
    public let name: String
    /// Scope of the topic: whether it applies to an account, a user, or an account's team.
    public let topicType: NotificationTopicTopicType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        defaultPreferenceValue: Bool,
        description: Nullable<String>,
        id: String,
        identifier: String,
        isMention: Bool,
        name: String,
        topicType: NotificationTopicTopicType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.defaultPreferenceValue = defaultPreferenceValue
        self.description = description
        self.id = id
        self.identifier = identifier
        self.isMention = isMention
        self.name = name
        self.topicType = topicType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.defaultPreferenceValue = try container.decode(Bool.self, forKey: .defaultPreferenceValue)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.id = try container.decode(String.self, forKey: .id)
        self.identifier = try container.decode(String.self, forKey: .identifier)
        self.isMention = try container.decode(Bool.self, forKey: .isMention)
        self.name = try container.decode(String.self, forKey: .name)
        self.topicType = try container.decode(NotificationTopicTopicType.self, forKey: .topicType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.defaultPreferenceValue, forKey: .defaultPreferenceValue)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.identifier, forKey: .identifier)
        try container.encode(self.isMention, forKey: .isMention)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.topicType, forKey: .topicType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case defaultPreferenceValue = "default_preference_value"
        case description
        case id
        case identifier
        case isMention = "is_mention"
        case name
        case topicType = "topic_type"
    }
}