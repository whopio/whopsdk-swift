import Foundation

extension Requests {
    public struct UpdateChannelsRequest: Codable, Hashable, Sendable {
        /// Channel icon as a file reference, for community channels and group private channels. Image files only. Group icons can be up to 5 MB. For community channels it sets the experience logo, and `null` restores the app icon. For group private channels it sets the channel's own icon, and `null` clears it. Omit to keep the current icon.
        public let icon: Nullable<UpdateChannelsRequestIcon>?
        /// Moderation settings, accepted only for community channels. Requires chat moderation permission. Omitted settings are preserved.
        public let moderation: UpdateChannelsRequestModeration?
        /// Replacement display name for any channel kind. Send `null` to clear a private or support channel name. Community channels require a name and also rename the experience.
        public let name: Nullable<String>?
        /// Whether app notifications are on for any channel kind. Webhooks fire either way. Omit to preserve the current setting.
        public let notificationsEnabled: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            icon: Nullable<UpdateChannelsRequestIcon>? = nil,
            moderation: UpdateChannelsRequestModeration? = nil,
            name: Nullable<String>? = nil,
            notificationsEnabled: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.icon = icon
            self.moderation = moderation
            self.name = name
            self.notificationsEnabled = notificationsEnabled
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.icon = try container.decodeNullableIfPresent(UpdateChannelsRequestIcon.self, forKey: .icon)
            self.moderation = try container.decodeIfPresent(UpdateChannelsRequestModeration.self, forKey: .moderation)
            self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
            self.notificationsEnabled = try container.decodeIfPresent(Bool.self, forKey: .notificationsEnabled)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.icon, forKey: .icon)
            try container.encodeIfPresent(self.moderation, forKey: .moderation)
            try container.encodeNullableIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.notificationsEnabled, forKey: .notificationsEnabled)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case icon
            case moderation
            case name
            case notificationsEnabled = "notifications_enabled"
        }
    }
}