import Foundation

extension Requests {
    public struct CreateShipmentsRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the account, prefixed `biz_`.
        public let accountId: String?
        /// The payment to attach the shipment to, prefixed `pay_`.
        public let paymentId: String
        /// The carrier-assigned tracking number.
        public let trackingNumber: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            paymentId: String,
            trackingNumber: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.paymentId = paymentId
            self.trackingNumber = trackingNumber
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.paymentId = try container.decode(String.self, forKey: .paymentId)
            self.trackingNumber = try container.decode(String.self, forKey: .trackingNumber)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encode(self.paymentId, forKey: .paymentId)
            try container.encode(self.trackingNumber, forKey: .trackingNumber)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case paymentId = "payment_id"
            case trackingNumber = "tracking_number"
        }
    }
}