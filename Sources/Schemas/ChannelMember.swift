import Foundation

public struct ChannelMember: Codable, Hashable, Sendable {
    public let channelId: String
    /// When the stored channel membership was created, as an ISO 8601 timestamp. Null for users whose access does not have a stored membership.
    public let createdAt: Nullable<String>
    /// Stored membership ID, or null for access-derived users.
    public let id: Nullable<String>
    /// Your inbox state for a private channel. `null` for other users and other channel kinds.
    public let inboxStatus: Nullable<ChannelMemberInboxStatus>
    /// Authorized participant read position. Community positions are visible only to the user themselves.
    public let lastViewedAt: Nullable<String>
    public let notificationPreference: Nullable<ChannelMemberNotificationPreference>
    public let pinnedPosition: Nullable<Int>
    /// Your unread state for the channel. `null` for other users.
    public let unread: Nullable<Bool>
    /// When the stored channel membership last changed, as an ISO 8601 timestamp. Null for users whose access does not have a stored membership.
    public let updatedAt: Nullable<String>
    public let user: UserSummary
    /// User ID
    public let userId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        channelId: String,
        createdAt: Nullable<String>,
        id: Nullable<String>,
        inboxStatus: Nullable<ChannelMemberInboxStatus>,
        lastViewedAt: Nullable<String>,
        notificationPreference: Nullable<ChannelMemberNotificationPreference>,
        pinnedPosition: Nullable<Int>,
        unread: Nullable<Bool>,
        updatedAt: Nullable<String>,
        user: UserSummary,
        userId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.channelId = channelId
        self.createdAt = createdAt
        self.id = id
        self.inboxStatus = inboxStatus
        self.lastViewedAt = lastViewedAt
        self.notificationPreference = notificationPreference
        self.pinnedPosition = pinnedPosition
        self.unread = unread
        self.updatedAt = updatedAt
        self.user = user
        self.userId = userId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.channelId = try container.decode(String.self, forKey: .channelId)
        self.createdAt = try container.decode(Nullable<String>.self, forKey: .createdAt)
        self.id = try container.decode(Nullable<String>.self, forKey: .id)
        self.inboxStatus = try container.decode(Nullable<ChannelMemberInboxStatus>.self, forKey: .inboxStatus)
        self.lastViewedAt = try container.decode(Nullable<String>.self, forKey: .lastViewedAt)
        self.notificationPreference = try container.decode(Nullable<ChannelMemberNotificationPreference>.self, forKey: .notificationPreference)
        self.pinnedPosition = try container.decode(Nullable<Int>.self, forKey: .pinnedPosition)
        self.unread = try container.decode(Nullable<Bool>.self, forKey: .unread)
        self.updatedAt = try container.decode(Nullable<String>.self, forKey: .updatedAt)
        self.user = try container.decode(UserSummary.self, forKey: .user)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.channelId, forKey: .channelId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.inboxStatus, forKey: .inboxStatus)
        try container.encode(self.lastViewedAt, forKey: .lastViewedAt)
        try container.encode(self.notificationPreference, forKey: .notificationPreference)
        try container.encode(self.pinnedPosition, forKey: .pinnedPosition)
        try container.encode(self.unread, forKey: .unread)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.userId, forKey: .userId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case channelId = "channel_id"
        case createdAt = "created_at"
        case id
        case inboxStatus = "inbox_status"
        case lastViewedAt = "last_viewed_at"
        case notificationPreference = "notification_preference"
        case pinnedPosition = "pinned_position"
        case unread
        case updatedAt = "updated_at"
        case user
        case userId = "user_id"
    }
}