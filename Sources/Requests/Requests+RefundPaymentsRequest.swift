import Foundation

extension Requests {
    public struct RefundPaymentsRequest: Codable, Hashable, Sendable {
        /// Your own key-value data to attach to the refund, returned on it and on its `refund.created` and `refund.updated` webhooks. At most 50 keys; keys up to 100 characters and values up to 500.
        public let metadata: Nullable<[String: Nullable<String>]>?
        /// The amount to refund, stated in this payment's `currency` like every other amount on it. When the buyer was billed in a different currency, it is converted at the payment's own exchange rate before the refund is issued. An amount that covers everything still refundable refunds the rest of the payment — omit it to refund the rest without having to work out what that is.
        public let partialAmount: Nullable<Double>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            metadata: Nullable<[String: Nullable<String>]>? = nil,
            partialAmount: Nullable<Double>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.metadata = metadata
            self.partialAmount = partialAmount
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.metadata = try container.decodeNullableIfPresent([String: Nullable<String>].self, forKey: .metadata)
            self.partialAmount = try container.decodeNullableIfPresent(Double.self, forKey: .partialAmount)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.partialAmount, forKey: .partialAmount)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case metadata
            case partialAmount = "partial_amount"
        }
    }
}