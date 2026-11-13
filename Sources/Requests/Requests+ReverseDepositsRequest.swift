import Foundation

extension Requests {
    public struct ReverseDepositsRequest: Codable, Hashable, Sendable {
        /// The business that received the deposit, prefixed `biz_`. Pass this or `user_id`.
        public let accountId: String?
        /// Custom metadata to store with the reversal.
        public let metadata: Nullable<[String: Nullable<ReverseDepositsRequestMetadataValue>]>?
        /// The user that received the deposit, prefixed `user_`. Pass this or `account_id`.
        public let userId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            metadata: Nullable<[String: Nullable<ReverseDepositsRequestMetadataValue>]>? = nil,
            userId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.metadata = metadata
            self.userId = userId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.metadata = try container.decodeNullableIfPresent([String: Nullable<ReverseDepositsRequestMetadataValue>].self, forKey: .metadata)
            self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
            try container.encodeIfPresent(self.userId, forKey: .userId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case metadata
            case userId = "user_id"
        }
    }
}