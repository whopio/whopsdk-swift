import Foundation

public struct ExperienceNotificationPreference: Codable, Hashable, Sendable {
    /// What the user is notified about in the experience: `all` notifications, only `mentions`, or `nothing`.
    public let level: ExperienceNotificationPreferenceLevel
    /// The type of object. Always `experience_notification_preference`.
    public let object: ExperienceNotificationPreferenceObject
    /// What the preference applies to. Echo it back to `PATCH /users/me/preferences/notifications` to change this preference.
    public let scope: NotificationPreferenceScope
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        level: ExperienceNotificationPreferenceLevel,
        object: ExperienceNotificationPreferenceObject,
        scope: NotificationPreferenceScope,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.level = level
        self.object = object
        self.scope = scope
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.level = try container.decode(ExperienceNotificationPreferenceLevel.self, forKey: .level)
        self.object = try container.decode(ExperienceNotificationPreferenceObject.self, forKey: .object)
        self.scope = try container.decode(NotificationPreferenceScope.self, forKey: .scope)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.level, forKey: .level)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.scope, forKey: .scope)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case level
        case object
        case scope
    }
}