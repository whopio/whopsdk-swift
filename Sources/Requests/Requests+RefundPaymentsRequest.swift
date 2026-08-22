import Foundation

extension Requests {
    public struct RefundPaymentsRequest: Codable, Hashable, Sendable {
        /// The amount to refund. For multi-currency payments, this is in the charge currency (what the buyer paid). For single-currency, this is in the payment currency. If omitted, the full payment amount is refunded.
        public let partialAmount: Nullable<Double>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            partialAmount: Nullable<Double>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.partialAmount = partialAmount
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.partialAmount = try container.decodeNullableIfPresent(Double.self, forKey: .partialAmount)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.partialAmount, forKey: .partialAmount)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case partialAmount = "partial_amount"
        }
    }
}