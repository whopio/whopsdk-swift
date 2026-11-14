import Foundation

extension Requests {
    public struct ChargeInvoicesRequest: Codable, Hashable, Sendable {
        /// The saved payment method to charge, prefixed `payt_`. It must belong to the invoice's customer and be chargeable without the customer present. Omit it to charge the invoice's own `payment_method_id`.
        public let paymentMethodId: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            paymentMethodId: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.paymentMethodId = paymentMethodId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.paymentMethodId = try container.decodeNullableIfPresent(String.self, forKey: .paymentMethodId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.paymentMethodId, forKey: .paymentMethodId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case paymentMethodId = "payment_method_id"
        }
    }
}