import Foundation

extension Requests {
    public struct CreateDepositsRequest: Codable, Hashable, Sendable {
        /// Amount to prefill on hosted deposit page. Crypto deposits require a $10 minimum. With `payment_method_id`, the amount in USD to charge, and required.
        public let amount: Double?
        /// Account ID to fund, `biz_` or `user_`. Any business resolves without authentication; a user account resolves only for that same authenticated user.
        public let destination: String
        /// Custom metadata to attach to the payment the charge creates. Ignored unless `payment_method_id` is provided.
        public let metadata: Nullable<[String: Nullable<CreateDepositsRequestMetadataValue>]>?
        /// SWIFT/BIC of the bank the funds are sent from, 8 or 11 characters. Fills each bank currency's `swift_bic` with the intermediary bank to route the wire through.
        public let originBic: String?
        /// A saved payment method of the business to charge for `amount`, prefixed `payt_`. Save one with Create setup intent and `owner_id` set to the account. Only for a `biz_` destination, and requires authentication with the `payment:charge` scope. A declined charge fails the request with 400.
        public let paymentMethodId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            amount: Double? = nil,
            destination: String,
            metadata: Nullable<[String: Nullable<CreateDepositsRequestMetadataValue>]>? = nil,
            originBic: String? = nil,
            paymentMethodId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.amount = amount
            self.destination = destination
            self.metadata = metadata
            self.originBic = originBic
            self.paymentMethodId = paymentMethodId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.amount = try container.decodeIfPresent(Double.self, forKey: .amount)
            self.destination = try container.decode(String.self, forKey: .destination)
            self.metadata = try container.decodeNullableIfPresent([String: Nullable<CreateDepositsRequestMetadataValue>].self, forKey: .metadata)
            self.originBic = try container.decodeIfPresent(String.self, forKey: .originBic)
            self.paymentMethodId = try container.decodeIfPresent(String.self, forKey: .paymentMethodId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.amount, forKey: .amount)
            try container.encode(self.destination, forKey: .destination)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
            try container.encodeIfPresent(self.originBic, forKey: .originBic)
            try container.encodeIfPresent(self.paymentMethodId, forKey: .paymentMethodId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case amount
            case destination
            case metadata
            case originBic = "origin_bic"
            case paymentMethodId = "payment_method_id"
        }
    }
}