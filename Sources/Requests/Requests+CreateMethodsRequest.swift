import Foundation

extension Requests {
    public struct CreateMethodsRequest: Codable, Hashable, Sendable {
        /// The account to add the payout method for, prefixed `biz_`. Provide this or `user_id`.
        public let accountId: String?
        /// Currency the supported payout method delivers payouts in.
        public let destinationCurrency: String?
        /// The supported payout method's required field values, keyed by field id — list them with `GET /payouts/supported_methods?supported_payout_method_id=...`. Field ids are stable `fld_` identifiers you may hardcode; they never change for a given field. A Basis Theory token id may be passed in place of a raw value. For a U.S. bank routing-number field, a raw nine-digit value must also pass the ABA checksum. A validation failure returns the method's full required_fields schema alongside the error. Required whenever the account details are supplied directly.
        public let fields: [String: String]?
        /// Whether to make this the account's default payout method.
        public let isDefault: Bool?
        /// A label for the payout method, unique per destination.
        public let nickname: String?
        /// The supported payout method to save (a podst_ identifier from a previous listing).
        public let supportedPayoutMethodId: String
        /// The user to add the payout method for, prefixed `user_`. Provide this or `account_id`.
        public let userId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            destinationCurrency: String? = nil,
            fields: [String: String]? = nil,
            isDefault: Bool? = nil,
            nickname: String? = nil,
            supportedPayoutMethodId: String,
            userId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.destinationCurrency = destinationCurrency
            self.fields = fields
            self.isDefault = isDefault
            self.nickname = nickname
            self.supportedPayoutMethodId = supportedPayoutMethodId
            self.userId = userId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.destinationCurrency = try container.decodeIfPresent(String.self, forKey: .destinationCurrency)
            self.fields = try container.decodeIfPresent([String: String].self, forKey: .fields)
            self.isDefault = try container.decodeIfPresent(Bool.self, forKey: .isDefault)
            self.nickname = try container.decodeIfPresent(String.self, forKey: .nickname)
            self.supportedPayoutMethodId = try container.decode(String.self, forKey: .supportedPayoutMethodId)
            self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.destinationCurrency, forKey: .destinationCurrency)
            try container.encodeIfPresent(self.fields, forKey: .fields)
            try container.encodeIfPresent(self.isDefault, forKey: .isDefault)
            try container.encodeIfPresent(self.nickname, forKey: .nickname)
            try container.encode(self.supportedPayoutMethodId, forKey: .supportedPayoutMethodId)
            try container.encodeIfPresent(self.userId, forKey: .userId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case destinationCurrency = "destination_currency"
            case fields
            case isDefault = "is_default"
            case nickname
            case supportedPayoutMethodId = "supported_payout_method_id"
            case userId = "user_id"
        }
    }
}