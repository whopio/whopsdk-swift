import Foundation

extension Requests {
    public struct UpdateDmMembersRequest: Codable, Hashable, Sendable {
        /// The notification setting for this member, controlling how they receive alerts for new messages in this channel.
        public let notificationPreference: Nullable<DmsFeedMemberNotificationPreferences>?
        /// The membership status for this member in the DM channel.
        public let status: Nullable<DmsFeedMemberStatuses>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            notificationPreference: Nullable<DmsFeedMemberNotificationPreferences>? = nil,
            status: Nullable<DmsFeedMemberStatuses>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.notificationPreference = notificationPreference
            self.status = status
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.notificationPreference = try container.decodeNullableIfPresent(DmsFeedMemberNotificationPreferences.self, forKey: .notificationPreference)
            self.status = try container.decodeNullableIfPresent(DmsFeedMemberStatuses.self, forKey: .status)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.notificationPreference, forKey: .notificationPreference)
            try container.encodeNullableIfPresent(self.status, forKey: .status)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case notificationPreference = "notification_preference"
            case status
        }
    }
}