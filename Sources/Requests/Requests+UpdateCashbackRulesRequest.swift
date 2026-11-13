import Foundation

extension Requests {
    public struct UpdateCashbackRulesRequest: Codable, Hashable, Sendable {
        /// Description of the rule. Set null to clear it.
        public let description: Nullable<String>?
        /// Exclusive end as an ISO 8601 timestamp, strictly later than the original starts_at. May be in the past to end an active rule. Set null to remove the expiration.
        public let expiresAt: Nullable<Date>?
        /// Four-digit MCC, including leading zeros. Null matches any MCC. When both merchant filters are absent, scoped_account_id is required.
        public let merchantCategoryCode: Nullable<String>?
        /// Raw merchant name reported by the card provider. Set null to match any merchant name. Supplied names must contain a non-whitespace character and match together with any MCC filter. Clearing both filters requires an existing scoped_account_id.
        public let merchantName: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            description: Nullable<String>? = nil,
            expiresAt: Nullable<Date>? = nil,
            merchantCategoryCode: Nullable<String>? = nil,
            merchantName: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.description = description
            self.expiresAt = expiresAt
            self.merchantCategoryCode = merchantCategoryCode
            self.merchantName = merchantName
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
            self.expiresAt = try container.decodeNullableIfPresent(Date.self, forKey: .expiresAt)
            self.merchantCategoryCode = try container.decodeNullableIfPresent(String.self, forKey: .merchantCategoryCode)
            self.merchantName = try container.decodeNullableIfPresent(String.self, forKey: .merchantName)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.description, forKey: .description)
            try container.encodeNullableIfPresent(self.expiresAt, forKey: .expiresAt)
            try container.encodeNullableIfPresent(self.merchantCategoryCode, forKey: .merchantCategoryCode)
            try container.encodeNullableIfPresent(self.merchantName, forKey: .merchantName)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case description
            case expiresAt = "expires_at"
            case merchantCategoryCode = "merchant_category_code"
            case merchantName = "merchant_name"
        }
    }
}