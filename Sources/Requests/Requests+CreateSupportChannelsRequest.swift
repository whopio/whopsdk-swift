import Foundation

extension Requests {
    public struct CreateSupportChannelsRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the company to create the support channel in.
        public let companyId: String
        /// Optional custom display name for the support channel.
        public let customName: Nullable<String>?
        /// Whether Whop app notifications are enabled for this support channel. Webhooks still fire.
        public let notificationsEnabled: Nullable<Bool>?
        /// The user ID (e.g. 'user_xxxxx') or username of the customer to open a support channel for.
        public let userId: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            companyId: String,
            customName: Nullable<String>? = nil,
            notificationsEnabled: Nullable<Bool>? = nil,
            userId: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.companyId = companyId
            self.customName = customName
            self.notificationsEnabled = notificationsEnabled
            self.userId = userId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.companyId = try container.decode(String.self, forKey: .companyId)
            self.customName = try container.decodeNullableIfPresent(String.self, forKey: .customName)
            self.notificationsEnabled = try container.decodeNullableIfPresent(Bool.self, forKey: .notificationsEnabled)
            self.userId = try container.decode(String.self, forKey: .userId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.companyId, forKey: .companyId)
            try container.encodeNullableIfPresent(self.customName, forKey: .customName)
            try container.encodeNullableIfPresent(self.notificationsEnabled, forKey: .notificationsEnabled)
            try container.encode(self.userId, forKey: .userId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case companyId = "company_id"
            case customName = "custom_name"
            case notificationsEnabled = "notifications_enabled"
            case userId = "user_id"
        }
    }
}