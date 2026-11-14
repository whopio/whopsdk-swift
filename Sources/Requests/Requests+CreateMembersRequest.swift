import Foundation

extension Requests {
    public struct CreateMembersRequest: Codable, Hashable, Sendable {
        /// The account to add the member to (`biz_` tag). Defaults to the account the credential acts as.
        public let accountId: String?
        /// The email address of the person to add. If no Whop user has it, one is created.
        public let email: String
        /// The name of the person to add. Ignored when a user on Whop already exists for this email address.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            email: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.email = email
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.email = try container.decode(String.self, forKey: .email)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encode(self.email, forKey: .email)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case email
            case name
        }
    }
}