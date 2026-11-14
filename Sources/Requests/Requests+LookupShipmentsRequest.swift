import Foundation

extension Requests {
    public struct LookupShipmentsRequest: Codable, Hashable, Sendable {
        /// The selling account, prefixed `biz_`.
        public let accountId: String
        /// The buyer's current receipt email.
        public let email: String
        /// The payment ID prefixed `pay_`, or the order number printed on the receipt (optional leading `#`). Supply this or `tracking_number`, not both.
        public let orderNumber: String?
        /// The exact carrier tracking number. Supply this or `order_number`, not both.
        public let trackingNumber: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String,
            email: String,
            orderNumber: String? = nil,
            trackingNumber: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.email = email
            self.orderNumber = orderNumber
            self.trackingNumber = trackingNumber
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decode(String.self, forKey: .accountId)
            self.email = try container.decode(String.self, forKey: .email)
            self.orderNumber = try container.decodeIfPresent(String.self, forKey: .orderNumber)
            self.trackingNumber = try container.decodeIfPresent(String.self, forKey: .trackingNumber)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.accountId, forKey: .accountId)
            try container.encode(self.email, forKey: .email)
            try container.encodeIfPresent(self.orderNumber, forKey: .orderNumber)
            try container.encodeIfPresent(self.trackingNumber, forKey: .trackingNumber)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case email
            case orderNumber = "order_number"
            case trackingNumber = "tracking_number"
        }
    }
}