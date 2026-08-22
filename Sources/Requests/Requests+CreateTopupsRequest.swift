import Foundation

extension Requests {
    public struct CreateTopupsRequest: Codable, Hashable, Sendable {
        /// The amount to add to the balance in the specified currency. For example, 50.00 for $50.00 USD.
        public let amount: Double
        /// The unique identifier of the company to add funds to, starting with 'biz_'.
        public let companyId: String
        /// The currency for the top-up amount, such as 'usd'.
        public let currency: Currencies
        /// The unique identifier of the stored payment method to charge for the top-up.
        public let paymentMethodId: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            amount: Double,
            companyId: String,
            currency: Currencies,
            paymentMethodId: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.amount = amount
            self.companyId = companyId
            self.currency = currency
            self.paymentMethodId = paymentMethodId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.amount = try container.decode(Double.self, forKey: .amount)
            self.companyId = try container.decode(String.self, forKey: .companyId)
            self.currency = try container.decode(Currencies.self, forKey: .currency)
            self.paymentMethodId = try container.decode(String.self, forKey: .paymentMethodId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.amount, forKey: .amount)
            try container.encode(self.companyId, forKey: .companyId)
            try container.encode(self.currency, forKey: .currency)
            try container.encode(self.paymentMethodId, forKey: .paymentMethodId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case amount
            case companyId = "company_id"
            case currency
            case paymentMethodId = "payment_method_id"
        }
    }
}