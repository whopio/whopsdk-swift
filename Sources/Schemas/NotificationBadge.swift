import Foundation

public struct NotificationBadge: Codable, Hashable, Sendable {
    /// Account the experience belongs to, prefixed `biz_`.
    public let accountId: Nullable<String>
    /// Experience the badge counts, prefixed `exp_`.
    public let experienceId: String
    /// Whether the caller has unread notifications in this experience.
    public let hasUnread: Bool
    /// Number of unread important (mention) notifications in this experience.
    public let importantCount: Int
    /// When the caller last viewed the experience, as an ISO 8601 timestamp. `null` when never viewed.
    public let lastViewedAt: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        experienceId: String,
        hasUnread: Bool,
        importantCount: Int,
        lastViewedAt: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.experienceId = experienceId
        self.hasUnread = hasUnread
        self.importantCount = importantCount
        self.lastViewedAt = lastViewedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.experienceId = try container.decode(String.self, forKey: .experienceId)
        self.hasUnread = try container.decode(Bool.self, forKey: .hasUnread)
        self.importantCount = try container.decode(Int.self, forKey: .importantCount)
        self.lastViewedAt = try container.decode(Nullable<String>.self, forKey: .lastViewedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.experienceId, forKey: .experienceId)
        try container.encode(self.hasUnread, forKey: .hasUnread)
        try container.encode(self.importantCount, forKey: .importantCount)
        try container.encode(self.lastViewedAt, forKey: .lastViewedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case experienceId = "experience_id"
        case hasUnread = "has_unread"
        case importantCount = "important_count"
        case lastViewedAt = "last_viewed_at"
    }
}