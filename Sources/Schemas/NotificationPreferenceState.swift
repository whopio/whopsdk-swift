import Foundation

public struct NotificationPreferenceState: Codable, Hashable, Sendable {
    /// What the user is now notified about in this scope, or `null` if the preference was cleared and the scope inherits its default again.
    public let level: Nullable<NotificationPreferenceStateLevel>
    /// Which kind of preference was written: `experience_notification_preference` for an experience level, `notification_preference` for a topic override.
    public let object: NotificationPreferenceStateObject
    /// The scope that was written, resolved. `null` on a dimension means the preference is not narrowed there.
    public let scope: NotificationPreferenceScope
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        level: Nullable<NotificationPreferenceStateLevel>,
        object: NotificationPreferenceStateObject,
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
        self.level = try container.decode(Nullable<NotificationPreferenceStateLevel>.self, forKey: .level)
        self.object = try container.decode(NotificationPreferenceStateObject.self, forKey: .object)
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