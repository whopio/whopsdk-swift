import Foundation

/// The original payment that was disputed.
public struct DisputeListItemPayment: Codable, Hashable, Sendable {
    /// The unique identifier for the payment.
    public let id: String
    /// The instrument this payment was made with, shaped for display: the method type, a buyer-facing name, the standard icon set, and the card facts when it was a card. Null when the receipt names no payment method.
    public let paymentInstrument: Nullable<DisputeListItemPaymentPaymentInstrument>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        paymentInstrument: Nullable<DisputeListItemPaymentPaymentInstrument>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.paymentInstrument = paymentInstrument
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.paymentInstrument = try container.decode(Nullable<DisputeListItemPaymentPaymentInstrument>.self, forKey: .paymentInstrument)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.paymentInstrument, forKey: .paymentInstrument)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case paymentInstrument = "payment_instrument"
    }
}