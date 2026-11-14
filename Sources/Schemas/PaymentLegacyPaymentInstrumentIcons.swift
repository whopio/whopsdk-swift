import Foundation

/// The standard icon set: square and card shapes, each in light and dark colorways.
public struct PaymentLegacyPaymentInstrumentIcons: Codable, Hashable, Sendable {
    /// The credit-card-proportioned tile (48x30).
    public let card: PaymentLegacyPaymentInstrumentIconsCard
    /// The square tile (32x32).
    public let square: PaymentLegacyPaymentInstrumentIconsSquare
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        card: PaymentLegacyPaymentInstrumentIconsCard,
        square: PaymentLegacyPaymentInstrumentIconsSquare,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.card = card
        self.square = square
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.card = try container.decode(PaymentLegacyPaymentInstrumentIconsCard.self, forKey: .card)
        self.square = try container.decode(PaymentLegacyPaymentInstrumentIconsSquare.self, forKey: .square)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.card, forKey: .card)
        try container.encode(self.square, forKey: .square)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case card
        case square
    }
}