import Foundation

extension Requests {
    public struct ApplyPromoCodeMembershipsRequest: Codable, Hashable, Sendable {
        /// The promo code to apply, as customers enter it at checkout (for example `SAVE20`). Its stock, variant eligibility, and expiry are checked as at checkout.
        public let promoCode: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            promoCode: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.promoCode = promoCode
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.promoCode = try container.decode(String.self, forKey: .promoCode)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.promoCode, forKey: .promoCode)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case promoCode = "promo_code"
        }
    }
}