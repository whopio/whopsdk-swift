import Foundation

/// Options for a `paypal` payment method.
public struct CreatePaymentsRequestPaymentMethodPaypal: Codable, Hashable, Sendable {
    /// Has PayPal ask the buyer for a shipping address. Tax is recalculated for each address the buyer picks before they approve, so the total they approve is the total charged, and the address they confirm is returned on the payment as `shipping_address`. Cannot be combined with `shipping_address`. Defaults to false.
    public let requestShipping: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        requestShipping: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.requestShipping = requestShipping
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.requestShipping = try container.decodeIfPresent(Bool.self, forKey: .requestShipping)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.requestShipping, forKey: .requestShipping)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case requestShipping = "request_shipping"
    }
}