import Foundation

extension Requests {
    public struct UpdatePaymentsRequest: Codable, Hashable, Sendable {
        /// Where the buyer continues after completing an off-site step. An absolute https URL without credentials, at most 2,048 characters. Only for payments created with a `confirmation_token`, and only until the buyer has returned. Omit it to leave it unchanged.
        public let returnUrl: String?
        /// The complete new shipping address. It replaces the current address as a whole and is never merged with it, so send every field the address should have, including the ones that are not changing. Any field you leave out is cleared: sending only `city` leaves an address with nothing but a city. Pass null to remove the address, or omit `shipping_address` to leave it unchanged. It cannot change once a shipment exists for the payment.
        public let shippingAddress: Nullable<UpdatePaymentsRequestShippingAddress>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            returnUrl: String? = nil,
            shippingAddress: Nullable<UpdatePaymentsRequestShippingAddress>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.returnUrl = returnUrl
            self.shippingAddress = shippingAddress
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.returnUrl = try container.decodeIfPresent(String.self, forKey: .returnUrl)
            self.shippingAddress = try container.decodeNullableIfPresent(UpdatePaymentsRequestShippingAddress.self, forKey: .shippingAddress)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.returnUrl, forKey: .returnUrl)
            try container.encodeNullableIfPresent(self.shippingAddress, forKey: .shippingAddress)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case returnUrl = "return_url"
            case shippingAddress = "shipping_address"
        }
    }
}