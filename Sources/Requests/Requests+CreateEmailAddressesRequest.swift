import Foundation

extension Requests {
    public struct CreateEmailAddressesRequest: Codable, Hashable, Sendable {
        /// Account ID, prefixed biz_. Required for user credentials; otherwise defaults to the credential's account.
        public let accountId: String?
        /// The full address, such as support@example.com. The part before the @ can use letters, numbers, dots, dashes, underscores and plus signs.
        public let address: String
        /// ID of the team member who owns the mailbox, prefixed `user_`. Only they can read it or send from it. Leave it out, or pass `null`, to share the mailbox with the account. Giving an owned mailbox to someone else empties it: the owner's mail is never shown to anyone else.
        public let userId: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            address: String,
            userId: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.address = address
            self.userId = userId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.address = try container.decode(String.self, forKey: .address)
            self.userId = try container.decodeNullableIfPresent(String.self, forKey: .userId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encode(self.address, forKey: .address)
            try container.encodeNullableIfPresent(self.userId, forKey: .userId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case address
            case userId = "user_id"
        }
    }
}