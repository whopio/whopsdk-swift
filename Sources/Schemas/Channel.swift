import Foundation

public struct Channel: Codable, Hashable, Sendable {
    public let accountId: Nullable<String>
    /// Creation time as an ISO 8601 timestamp.
    public let createdAt: String
    /// When the channel was deleted or removed from your channel list, as an ISO 8601 timestamp. Null for a live channel.
    public let deletedAt: Nullable<String>
    public let experienceId: Nullable<String>
    /// The channel icon. Community channels show the experience logo, falling back to the app icon. Support channels show the account logo. Group private channels show their own icon. Null for one-to-one private channels or when no image is set.
    public let icon: Nullable<File>
    /// Existing public channel ID, preserved across REST and chat clients.
    public let id: String
    public let kind: ChannelKind
    /// When the channel last recorded message activity, as an ISO 8601 timestamp. Null when no message activity is recorded.
    public let lastMessageAt: Nullable<String>
    public let lastMessageId: Nullable<String>
    public let membership: Nullable<ChannelMember>
    public let moderation: Nullable<ChannelModeration>
    public let name: Nullable<String>
    /// Whether app notifications are on. Webhooks fire either way.
    public let notificationsEnabled: Bool
    public let support: Nullable<ChannelSupportState>
    /// Last channel change as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        createdAt: String,
        deletedAt: Nullable<String>,
        experienceId: Nullable<String>,
        icon: Nullable<File>,
        id: String,
        kind: ChannelKind,
        lastMessageAt: Nullable<String>,
        lastMessageId: Nullable<String>,
        membership: Nullable<ChannelMember>,
        moderation: Nullable<ChannelModeration>,
        name: Nullable<String>,
        notificationsEnabled: Bool,
        support: Nullable<ChannelSupportState>,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.createdAt = createdAt
        self.deletedAt = deletedAt
        self.experienceId = experienceId
        self.icon = icon
        self.id = id
        self.kind = kind
        self.lastMessageAt = lastMessageAt
        self.lastMessageId = lastMessageId
        self.membership = membership
        self.moderation = moderation
        self.name = name
        self.notificationsEnabled = notificationsEnabled
        self.support = support
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.deletedAt = try container.decode(Nullable<String>.self, forKey: .deletedAt)
        self.experienceId = try container.decode(Nullable<String>.self, forKey: .experienceId)
        self.icon = try container.decode(Nullable<File>.self, forKey: .icon)
        self.id = try container.decode(String.self, forKey: .id)
        self.kind = try container.decode(ChannelKind.self, forKey: .kind)
        self.lastMessageAt = try container.decode(Nullable<String>.self, forKey: .lastMessageAt)
        self.lastMessageId = try container.decode(Nullable<String>.self, forKey: .lastMessageId)
        self.membership = try container.decode(Nullable<ChannelMember>.self, forKey: .membership)
        self.moderation = try container.decode(Nullable<ChannelModeration>.self, forKey: .moderation)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.notificationsEnabled = try container.decode(Bool.self, forKey: .notificationsEnabled)
        self.support = try container.decode(Nullable<ChannelSupportState>.self, forKey: .support)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.deletedAt, forKey: .deletedAt)
        try container.encode(self.experienceId, forKey: .experienceId)
        try container.encode(self.icon, forKey: .icon)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.kind, forKey: .kind)
        try container.encode(self.lastMessageAt, forKey: .lastMessageAt)
        try container.encode(self.lastMessageId, forKey: .lastMessageId)
        try container.encode(self.membership, forKey: .membership)
        try container.encode(self.moderation, forKey: .moderation)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.notificationsEnabled, forKey: .notificationsEnabled)
        try container.encode(self.support, forKey: .support)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case createdAt = "created_at"
        case deletedAt = "deleted_at"
        case experienceId = "experience_id"
        case icon
        case id
        case kind
        case lastMessageAt = "last_message_at"
        case lastMessageId = "last_message_id"
        case membership
        case moderation
        case name
        case notificationsEnabled = "notifications_enabled"
        case support
        case updatedAt = "updated_at"
    }
}