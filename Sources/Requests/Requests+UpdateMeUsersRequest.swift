import Foundation

extension Requests {
    public struct UpdateMeUsersRequest: Codable, Hashable, Sendable {
        public let banner: Nullable<UpdateMeUsersRequestBanner>?
        public let bio: String?
        /// The user's date of birth as an ISO 8601 date, like `1998-04-23`. The user must be at least 13. Global profile only; refused with `account_id`.
        public let dateOfBirth: CalendarDate?
        public let name: String?
        public let profilePicture: UpdateMeUsersRequestProfilePicture?
        public let username: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            banner: Nullable<UpdateMeUsersRequestBanner>? = nil,
            bio: String? = nil,
            dateOfBirth: CalendarDate? = nil,
            name: String? = nil,
            profilePicture: UpdateMeUsersRequestProfilePicture? = nil,
            username: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.banner = banner
            self.bio = bio
            self.dateOfBirth = dateOfBirth
            self.name = name
            self.profilePicture = profilePicture
            self.username = username
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.banner = try container.decodeNullableIfPresent(UpdateMeUsersRequestBanner.self, forKey: .banner)
            self.bio = try container.decodeIfPresent(String.self, forKey: .bio)
            self.dateOfBirth = try container.decodeIfPresent(CalendarDate.self, forKey: .dateOfBirth)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.profilePicture = try container.decodeIfPresent(UpdateMeUsersRequestProfilePicture.self, forKey: .profilePicture)
            self.username = try container.decodeIfPresent(String.self, forKey: .username)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.banner, forKey: .banner)
            try container.encodeIfPresent(self.bio, forKey: .bio)
            try container.encodeIfPresent(self.dateOfBirth, forKey: .dateOfBirth)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.profilePicture, forKey: .profilePicture)
            try container.encodeIfPresent(self.username, forKey: .username)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case banner
            case bio
            case dateOfBirth = "date_of_birth"
            case name
            case profilePicture = "profile_picture"
            case username
        }
    }
}