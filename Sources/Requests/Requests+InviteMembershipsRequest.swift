import Foundation

extension Requests {
    public struct InviteMembershipsRequest: Codable, Hashable, Sendable {
        /// Recipient email address. Pass exactly one of `user_id` or `email`.
        public let email: String?
        /// Recipient user ID, prefixed `user_`. Pass exactly one of `user_id` or `email`.
        public let userId: String?
        /// Free variant whose membership the recipient is invited to, prefixed `plan_`.
        public let variantId: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            email: String? = nil,
            userId: String? = nil,
            variantId: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.email = email
            self.userId = userId
            self.variantId = variantId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.email = try container.decodeIfPresent(String.self, forKey: .email)
            self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
            self.variantId = try container.decode(String.self, forKey: .variantId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.email, forKey: .email)
            try container.encodeIfPresent(self.userId, forKey: .userId)
            try container.encode(self.variantId, forKey: .variantId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case email
            case userId = "user_id"
            case variantId = "variant_id"
        }
    }
}