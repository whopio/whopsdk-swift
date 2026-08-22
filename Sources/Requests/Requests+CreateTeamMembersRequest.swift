import Foundation

extension Requests {
    public struct CreateTeamMembersRequest: Codable, Hashable, Sendable {
        /// Account ID, prefixed `biz_`.
        public let accountId: String
        /// Email address to invite. Mutually exclusive with `user_id`. If the email already belongs to a Whop account it is treated the same as passing that account's `user_id`; otherwise a pending invite is created for the email.
        public let email: String?
        /// The system role to grant.
        public let role: CreateTeamMembersRequestRole
        /// The user to add to the team, prefixed `user_`. Mutually exclusive with `email`.
        public let userId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String,
            email: String? = nil,
            role: CreateTeamMembersRequestRole,
            userId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.email = email
            self.role = role
            self.userId = userId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decode(String.self, forKey: .accountId)
            self.email = try container.decodeIfPresent(String.self, forKey: .email)
            self.role = try container.decode(CreateTeamMembersRequestRole.self, forKey: .role)
            self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.email, forKey: .email)
            try container.encode(self.role, forKey: .role)
            try container.encodeIfPresent(self.userId, forKey: .userId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case email
            case role
            case userId = "user_id"
        }
    }
}