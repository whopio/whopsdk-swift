import Foundation

public struct SetNotificationsRequestPreferencesItem: Codable, Hashable, Sendable {
    /// What the user is notified about in this scope. `mentions` is only valid for an experience level; a topic override is `all` or `nothing`. `null` clears the preference, so the scope inherits its default again rather than being switched off.
    public let level: Nullable<SetNotificationsRequestPreferencesItemLevel>
    /// What the preference applies to. `null` on a dimension means the preference is not narrowed there. A scope read back from either list endpoint can be sent as-is. A scope naming an experience with no topic sets that experience's level; any other scope sets a topic override.
    public let scope: SetNotificationsRequestPreferencesItemScope
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        level: Nullable<SetNotificationsRequestPreferencesItemLevel>,
        scope: SetNotificationsRequestPreferencesItemScope,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.level = level
        self.scope = scope
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.level = try container.decode(Nullable<SetNotificationsRequestPreferencesItemLevel>.self, forKey: .level)
        self.scope = try container.decode(SetNotificationsRequestPreferencesItemScope.self, forKey: .scope)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.level, forKey: .level)
        try container.encode(self.scope, forKey: .scope)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case level
        case scope
    }
}