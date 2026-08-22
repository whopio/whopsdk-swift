import Foundation

extension Requests {
    public struct UpdateExperiencesRequest: Codable, Hashable, Sendable {
        /// The access level of the experience.
        public let accessLevel: Nullable<ExperienceAccessLevels>?
        /// Whether the experience is publicly accessible without a membership.
        public let isPublic: Nullable<Bool>?
        /// A logo image displayed alongside the experience name.
        public let logo: Nullable<UpdateExperiencesRequestLogo>?
        /// The display name of the experience.
        public let name: Nullable<String>?
        /// Whether Whop app notifications are enabled for this experience. Webhooks still fire.
        public let notificationsEnabled: Nullable<Bool>?
        /// The position of the experience within its section for display ordering.
        public let order: Nullable<String>?
        /// The unique identifier of the section to move the experience into.
        public let sectionId: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accessLevel: Nullable<ExperienceAccessLevels>? = nil,
            isPublic: Nullable<Bool>? = nil,
            logo: Nullable<UpdateExperiencesRequestLogo>? = nil,
            name: Nullable<String>? = nil,
            notificationsEnabled: Nullable<Bool>? = nil,
            order: Nullable<String>? = nil,
            sectionId: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accessLevel = accessLevel
            self.isPublic = isPublic
            self.logo = logo
            self.name = name
            self.notificationsEnabled = notificationsEnabled
            self.order = order
            self.sectionId = sectionId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accessLevel = try container.decodeNullableIfPresent(ExperienceAccessLevels.self, forKey: .accessLevel)
            self.isPublic = try container.decodeNullableIfPresent(Bool.self, forKey: .isPublic)
            self.logo = try container.decodeNullableIfPresent(UpdateExperiencesRequestLogo.self, forKey: .logo)
            self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
            self.notificationsEnabled = try container.decodeNullableIfPresent(Bool.self, forKey: .notificationsEnabled)
            self.order = try container.decodeNullableIfPresent(String.self, forKey: .order)
            self.sectionId = try container.decodeNullableIfPresent(String.self, forKey: .sectionId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.accessLevel, forKey: .accessLevel)
            try container.encodeNullableIfPresent(self.isPublic, forKey: .isPublic)
            try container.encodeNullableIfPresent(self.logo, forKey: .logo)
            try container.encodeNullableIfPresent(self.name, forKey: .name)
            try container.encodeNullableIfPresent(self.notificationsEnabled, forKey: .notificationsEnabled)
            try container.encodeNullableIfPresent(self.order, forKey: .order)
            try container.encodeNullableIfPresent(self.sectionId, forKey: .sectionId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accessLevel = "access_level"
            case isPublic = "is_public"
            case logo
            case name
            case notificationsEnabled = "notifications_enabled"
            case order
            case sectionId = "section_id"
        }
    }
}