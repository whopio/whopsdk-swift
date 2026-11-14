import Foundation

extension Requests {
    public struct CreatePaymentRulesRequest: Codable, Hashable, Sendable {
        /// The account to create the rule on. Defaults to the account the request is acting for.
        public let accountId: String?
        /// What this account's rule requests when every condition matches. One applicable account-rule action wins, in this order: `allow`, `block`, `review`, `enforce_3ds`. An `allow` overrides this account's other rules, never Whop's own fraud controls. A `review` requests authorization without capture for an eligible on-session card payment through Whop Payments. Automatic capture is scheduled for 48 hours after authorization; capture or void the payment before then to decide sooner. Capture may complete later or fail. Review is skipped for unsupported methods, off-session payments, and payments already configured for manual capture. An `enforce_3ds` is skipped when the account rule cannot apply a challenge. Other 3DS requirements still apply.
        public let action: CreatePaymentRulesRequestAction
        /// The conditions a payment is matched against. Up to 10 conditions, and 8 KiB once serialized.
        public let conditions: CreatePaymentRulesRequestConditions
        /// Custom string-to-string values for your integration. Maximum 50 keys, 40 characters per key, 500 characters per value.
        public let metadata: [String: String]?
        /// A name for this rule. Up to 255 characters.
        public let name: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            action: CreatePaymentRulesRequestAction,
            conditions: CreatePaymentRulesRequestConditions,
            metadata: [String: String]? = nil,
            name: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.action = action
            self.conditions = conditions
            self.metadata = metadata
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.action = try container.decode(CreatePaymentRulesRequestAction.self, forKey: .action)
            self.conditions = try container.decode(CreatePaymentRulesRequestConditions.self, forKey: .conditions)
            self.metadata = try container.decodeIfPresent([String: String].self, forKey: .metadata)
            self.name = try container.decode(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encode(self.action, forKey: .action)
            try container.encode(self.conditions, forKey: .conditions)
            try container.encodeIfPresent(self.metadata, forKey: .metadata)
            try container.encode(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case action
            case conditions
            case metadata
            case name
        }
    }
}