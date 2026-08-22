import Foundation

extension Requests {
    public struct UpdateAiChatsRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the company to set as context for the AI chat (e.g., "biz_XXXXX").
        public let currentCompanyId: Nullable<String>?
        /// The notification preference for the AI chat.
        public let notificationPreference: Nullable<AiChatNotificationPreferences>?
        /// The new display title for the AI chat thread (e.g., "Help with billing").
        public let title: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            currentCompanyId: Nullable<String>? = nil,
            notificationPreference: Nullable<AiChatNotificationPreferences>? = nil,
            title: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.currentCompanyId = currentCompanyId
            self.notificationPreference = notificationPreference
            self.title = title
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.currentCompanyId = try container.decodeNullableIfPresent(String.self, forKey: .currentCompanyId)
            self.notificationPreference = try container.decodeNullableIfPresent(AiChatNotificationPreferences.self, forKey: .notificationPreference)
            self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.currentCompanyId, forKey: .currentCompanyId)
            try container.encodeNullableIfPresent(self.notificationPreference, forKey: .notificationPreference)
            try container.encodeNullableIfPresent(self.title, forKey: .title)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case currentCompanyId = "current_company_id"
            case notificationPreference = "notification_preference"
            case title
        }
    }
}