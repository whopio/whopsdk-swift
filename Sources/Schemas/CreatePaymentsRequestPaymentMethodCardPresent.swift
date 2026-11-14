import Foundation

/// Required when `type` is `card_present`.
public struct CreatePaymentsRequestPaymentMethodCardPresent: Codable, Hashable, Sendable {
    /// Which Tap to Pay SDK collects the payment. Stripe offers Tap to Pay in different countries per platform, so eligibility is checked for the named one, as it is for the connection-token session.
    public let platform: CreatePaymentsRequestPaymentMethodCardPresentPlatform
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        platform: CreatePaymentsRequestPaymentMethodCardPresentPlatform,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.platform = platform
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.platform = try container.decode(CreatePaymentsRequestPaymentMethodCardPresentPlatform.self, forKey: .platform)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.platform, forKey: .platform)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case platform
    }
}