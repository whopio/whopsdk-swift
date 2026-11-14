import Foundation

extension Requests {
    public struct ApproveAllWaitlistEntriesRequest: Codable, Hashable, Sendable {
        /// The seller account whose pending signups to approve, prefixed `biz_`.
        public let accountId: String
        /// Only approve signups for this variant, prefixed `plan_`. Omit to include every waitlist variant on the account.
        public let variantId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String,
            variantId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.variantId = variantId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decode(String.self, forKey: .accountId)
            self.variantId = try container.decodeIfPresent(String.self, forKey: .variantId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.variantId, forKey: .variantId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case variantId = "variant_id"
        }
    }
}