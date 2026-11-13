import Foundation

/// The standard icon set: square and card shapes, each in light and dark colorways.
public struct DisputeLegacyPaymentPaymentInstrumentIcons: Codable, Hashable, Sendable {
    /// The square tile (32x32).
    public let square: DisputeLegacyPaymentPaymentInstrumentIconsSquare
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        square: DisputeLegacyPaymentPaymentInstrumentIconsSquare,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.square = square
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.square = try container.decode(DisputeLegacyPaymentPaymentInstrumentIconsSquare.self, forKey: .square)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.square, forKey: .square)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case square
    }
}