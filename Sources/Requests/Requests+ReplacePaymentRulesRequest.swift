import Foundation

extension Requests {
    public struct ReplacePaymentRulesRequest: Codable, Hashable, Sendable {
        /// What this account's rule requests when every condition matches. One applicable account-rule action wins, in this order: `allow`, `block`, `review`, `enforce_3ds`. An `allow` overrides this account's other rules, never Whop's own fraud controls. A `review` requests authorization without capture for an eligible on-session card payment through Whop Payments. Automatic capture is scheduled for 48 hours after authorization; capture or void the payment before then to decide sooner. Capture may complete later or fail. Review is skipped for unsupported methods, off-session payments, and payments already configured for manual capture. An `enforce_3ds` is skipped when the account rule cannot apply a challenge. Other 3DS requirements still apply.
        public let action: ReplacePaymentRulesRequestAction
        /// The conditions a payment is matched against. Up to 10 conditions, and 8 KiB once serialized.
        public let conditions: ReplacePaymentRulesRequestConditions
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            action: ReplacePaymentRulesRequestAction,
            conditions: ReplacePaymentRulesRequestConditions,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.action = action
            self.conditions = conditions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.action = try container.decode(ReplacePaymentRulesRequestAction.self, forKey: .action)
            self.conditions = try container.decode(ReplacePaymentRulesRequestConditions.self, forKey: .conditions)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.action, forKey: .action)
            try container.encode(self.conditions, forKey: .conditions)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case action
            case conditions
        }
    }
}