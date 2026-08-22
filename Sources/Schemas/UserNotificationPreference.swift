import Foundation

public struct UserNotificationPreference: Codable, Hashable, Sendable {
    /// When the preference was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Notification preference ID, prefixed `unpf_`.
    public let id: String
    /// What the user is notified about in this scope: `all` or `nothing`.
    public let level: UserNotificationPreferenceLevel
    /// The type of object. Always `notification_preference`.
    public let object: UserNotificationPreferenceObject
    /// What the preference applies to. Echo it back to `PATCH /users/me/preferences/notifications` to change this preference.
    public let scope: NotificationPreferenceScope
    /// When the preference was last changed, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: String,
        id: String,
        level: UserNotificationPreferenceLevel,
        object: UserNotificationPreferenceObject,
        scope: NotificationPreferenceScope,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.id = id
        self.level = level
        self.object = object
        self.scope = scope
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.level = try container.decode(UserNotificationPreferenceLevel.self, forKey: .level)
        self.object = try container.decode(UserNotificationPreferenceObject.self, forKey: .object)
        self.scope = try container.decode(NotificationPreferenceScope.self, forKey: .scope)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.level, forKey: .level)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.scope, forKey: .scope)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case id
        case level
        case object
        case scope
        case updatedAt = "updated_at"
    }
}