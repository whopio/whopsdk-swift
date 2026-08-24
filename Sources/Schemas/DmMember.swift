import Foundation

/// A user's membership record in a messaging channel, including notification preferences and read state.
public struct DmMember: Codable, Hashable, Sendable {
    /// The unique identifier of the messaging channel this membership belongs to.
    public let channelId: String
    /// The unique identifier for the entity
    public let id: String
    /// The timestamp when this member last viewed the channel, as a Unix timestamp in milliseconds. Null if the member has never viewed the channel.
    public let lastViewedAt: Nullable<String>
    /// The notification level for this channel: all, mentions, or none.
    public let notificationPreference: DmsFeedMemberNotificationPreferences
    /// The current state of this membership: requested, accepted, hidden, closed, or archived.
    public let status: DmsFeedMemberStatuses
    /// The unique identifier of the user who holds this channel membership.
    public let userId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        channelId: String,
        id: String,
        lastViewedAt: Nullable<String>,
        notificationPreference: DmsFeedMemberNotificationPreferences,
        status: DmsFeedMemberStatuses,
        userId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.channelId = channelId
        self.id = id
        self.lastViewedAt = lastViewedAt
        self.notificationPreference = notificationPreference
        self.status = status
        self.userId = userId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.channelId = try container.decode(String.self, forKey: .channelId)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastViewedAt = try container.decode(Nullable<String>.self, forKey: .lastViewedAt)
        self.notificationPreference = try container.decode(DmsFeedMemberNotificationPreferences.self, forKey: .notificationPreference)
        self.status = try container.decode(DmsFeedMemberStatuses.self, forKey: .status)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.channelId, forKey: .channelId)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastViewedAt, forKey: .lastViewedAt)
        try container.encode(self.notificationPreference, forKey: .notificationPreference)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.userId, forKey: .userId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case channelId = "channel_id"
        case id
        case lastViewedAt = "last_viewed_at"
        case notificationPreference = "notification_preference"
        case status
        case userId = "user_id"
    }
}