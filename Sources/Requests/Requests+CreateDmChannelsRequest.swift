import Foundation

extension Requests {
    public struct CreateDmChannelsRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the company to scope this DM channel to. When set, the channel is visible only within that company context.
        public let accountId: Nullable<String>?
        /// A custom display name for the DM channel. For example, 'Project Discussion'.
        public let customName: Nullable<String>?
        /// Whether Whop app notifications are enabled for this direct message channel. Webhooks still fire.
        public let notificationsEnabled: Nullable<Bool>?
        /// The list of user identifiers to include in the DM channel. Each entry can be an email, username, or user ID (e.g. 'user_xxxxx').
        public let withUserIds: [String]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: Nullable<String>? = nil,
            customName: Nullable<String>? = nil,
            notificationsEnabled: Nullable<Bool>? = nil,
            withUserIds: [String],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.customName = customName
            self.notificationsEnabled = notificationsEnabled
            self.withUserIds = withUserIds
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeNullableIfPresent(String.self, forKey: .accountId)
            self.customName = try container.decodeNullableIfPresent(String.self, forKey: .customName)
            self.notificationsEnabled = try container.decodeNullableIfPresent(Bool.self, forKey: .notificationsEnabled)
            self.withUserIds = try container.decode([String].self, forKey: .withUserIds)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.accountId, forKey: .accountId)
            try container.encodeNullableIfPresent(self.customName, forKey: .customName)
            try container.encodeNullableIfPresent(self.notificationsEnabled, forKey: .notificationsEnabled)
            try container.encode(self.withUserIds, forKey: .withUserIds)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case customName = "custom_name"
            case notificationsEnabled = "notifications_enabled"
            case withUserIds = "with_user_ids"
        }
    }
}