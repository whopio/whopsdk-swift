import Foundation

extension Requests {
    public struct UpdateChannelMembersRequest: Codable, Hashable, Sendable {
        public let notificationPreference: UpdateChannelMembersRequestNotificationPreference
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            notificationPreference: UpdateChannelMembersRequestNotificationPreference,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.notificationPreference = notificationPreference
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.notificationPreference = try container.decode(UpdateChannelMembersRequestNotificationPreference.self, forKey: .notificationPreference)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.notificationPreference, forKey: .notificationPreference)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case notificationPreference = "notification_preference"
        }
    }
}