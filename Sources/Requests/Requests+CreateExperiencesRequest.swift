import Foundation

extension Requests {
    public struct CreateExperiencesRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the company to create this experience for.
        public let accountId: String
        /// The unique identifier of the app that powers this experience.
        public let appId: String
        /// Whether the experience is publicly accessible without a membership.
        public let isPublic: Nullable<Bool>?
        /// A logo image displayed alongside the experience name.
        public let logo: Nullable<CreateExperiencesRequestLogo>?
        /// The display name of the experience. Defaults to the app's name if not provided.
        public let name: Nullable<String>?
        /// Whether Whop app notifications are enabled for this experience. Webhooks still fire.
        public let notificationsEnabled: Nullable<Bool>?
        /// The unique identifier of the section to place the experience in.
        public let sectionId: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String,
            appId: String,
            isPublic: Nullable<Bool>? = nil,
            logo: Nullable<CreateExperiencesRequestLogo>? = nil,
            name: Nullable<String>? = nil,
            notificationsEnabled: Nullable<Bool>? = nil,
            sectionId: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.appId = appId
            self.isPublic = isPublic
            self.logo = logo
            self.name = name
            self.notificationsEnabled = notificationsEnabled
            self.sectionId = sectionId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decode(String.self, forKey: .accountId)
            self.appId = try container.decode(String.self, forKey: .appId)
            self.isPublic = try container.decodeNullableIfPresent(Bool.self, forKey: .isPublic)
            self.logo = try container.decodeNullableIfPresent(CreateExperiencesRequestLogo.self, forKey: .logo)
            self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
            self.notificationsEnabled = try container.decodeNullableIfPresent(Bool.self, forKey: .notificationsEnabled)
            self.sectionId = try container.decodeNullableIfPresent(String.self, forKey: .sectionId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.accountId, forKey: .accountId)
            try container.encode(self.appId, forKey: .appId)
            try container.encodeNullableIfPresent(self.isPublic, forKey: .isPublic)
            try container.encodeNullableIfPresent(self.logo, forKey: .logo)
            try container.encodeNullableIfPresent(self.name, forKey: .name)
            try container.encodeNullableIfPresent(self.notificationsEnabled, forKey: .notificationsEnabled)
            try container.encodeNullableIfPresent(self.sectionId, forKey: .sectionId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case appId = "app_id"
            case isPublic = "is_public"
            case logo
            case name
            case notificationsEnabled = "notifications_enabled"
            case sectionId = "section_id"
        }
    }
}