import Foundation

extension Requests {
    public struct CreateAuthorizedUsersRequest: Codable, Hashable, Sendable {
        /// The ID of the company to add the authorized user to.
        public let accountId: String
        /// Re-authentication proof required to perform this sensitive action.
        public let elevation: Nullable<CreateAuthorizedUsersRequestElevation>?
        /// The role to assign to the authorized user within the company. Supported roles: 'moderator', 'sales_manager'.
        public let role: GrantableAuthorizedUserRoles
        /// Whether to send notification emails to the user on creation.
        public let sendEmails: Nullable<Bool>?
        /// The ID of the user to add as an authorized user.
        public let userId: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String,
            elevation: Nullable<CreateAuthorizedUsersRequestElevation>? = nil,
            role: GrantableAuthorizedUserRoles,
            sendEmails: Nullable<Bool>? = nil,
            userId: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.elevation = elevation
            self.role = role
            self.sendEmails = sendEmails
            self.userId = userId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decode(String.self, forKey: .accountId)
            self.elevation = try container.decodeNullableIfPresent(CreateAuthorizedUsersRequestElevation.self, forKey: .elevation)
            self.role = try container.decode(GrantableAuthorizedUserRoles.self, forKey: .role)
            self.sendEmails = try container.decodeNullableIfPresent(Bool.self, forKey: .sendEmails)
            self.userId = try container.decode(String.self, forKey: .userId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.accountId, forKey: .accountId)
            try container.encodeNullableIfPresent(self.elevation, forKey: .elevation)
            try container.encode(self.role, forKey: .role)
            try container.encodeNullableIfPresent(self.sendEmails, forKey: .sendEmails)
            try container.encode(self.userId, forKey: .userId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case elevation
            case role
            case sendEmails = "send_emails"
            case userId = "user_id"
        }
    }
}