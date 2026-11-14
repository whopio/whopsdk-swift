import Foundation

extension Requests {
    public struct CreatePaypalLinkSessionsRequest: Codable, Hashable, Sendable {
        /// The account that will own the PayPal payout method, prefixed `biz_`. Provide this or `user_id`.
        public let accountId: String?
        /// Currency the PayPal payout method will deliver payouts in.
        public let destinationCurrency: String?
        /// Where to send the holder once the PayPal login finishes. Must be an `https` URL whose host is a domain added to the account, or to its platform, with `POST /domains` and `verification: {}`; the domain doesn't need to finish verifying. Whop's own pages and `https://localhost` are also accepted; they're the only options for a `user_id` session. It receives `paypal_link_token` on success or `error` on failure.
        public let returnUrl: String
        /// The PayPal supported payout method to connect (a `podst_` identifier whose `supports_paypal_login` is true).
        public let supportedPayoutMethodId: String
        /// The user who will own the PayPal payout method, prefixed `user_`. Provide this or `account_id`.
        public let userId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            destinationCurrency: String? = nil,
            returnUrl: String,
            supportedPayoutMethodId: String,
            userId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.destinationCurrency = destinationCurrency
            self.returnUrl = returnUrl
            self.supportedPayoutMethodId = supportedPayoutMethodId
            self.userId = userId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.destinationCurrency = try container.decodeIfPresent(String.self, forKey: .destinationCurrency)
            self.returnUrl = try container.decode(String.self, forKey: .returnUrl)
            self.supportedPayoutMethodId = try container.decode(String.self, forKey: .supportedPayoutMethodId)
            self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.destinationCurrency, forKey: .destinationCurrency)
            try container.encode(self.returnUrl, forKey: .returnUrl)
            try container.encode(self.supportedPayoutMethodId, forKey: .supportedPayoutMethodId)
            try container.encodeIfPresent(self.userId, forKey: .userId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case destinationCurrency = "destination_currency"
            case returnUrl = "return_url"
            case supportedPayoutMethodId = "supported_payout_method_id"
            case userId = "user_id"
        }
    }
}