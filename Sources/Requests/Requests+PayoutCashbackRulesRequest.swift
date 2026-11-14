import Foundation

extension Requests {
    public struct PayoutCashbackRulesRequest: Codable, Hashable, Sendable {
        /// Pay only this direct subaccount.
        public let accountId: Nullable<String>?
        /// Pay only transactions whose winning cashback rule has this ID and is funded by the authenticated platform.
        public let cashbackRuleId: Nullable<String>?
        /// Pay only this card transaction belonging to a direct subaccount.
        public let transactionId: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: Nullable<String>? = nil,
            cashbackRuleId: Nullable<String>? = nil,
            transactionId: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.cashbackRuleId = cashbackRuleId
            self.transactionId = transactionId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeNullableIfPresent(String.self, forKey: .accountId)
            self.cashbackRuleId = try container.decodeNullableIfPresent(String.self, forKey: .cashbackRuleId)
            self.transactionId = try container.decodeNullableIfPresent(String.self, forKey: .transactionId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.accountId, forKey: .accountId)
            try container.encodeNullableIfPresent(self.cashbackRuleId, forKey: .cashbackRuleId)
            try container.encodeNullableIfPresent(self.transactionId, forKey: .transactionId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case cashbackRuleId = "cashback_rule_id"
            case transactionId = "transaction_id"
        }
    }
}