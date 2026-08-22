import Foundation

/// The credit-card-proportioned tile (48x30).
public struct PaymentMethodListItemSepaDebitPaymentMethodIconsCard: Codable, Hashable, Sendable {
    /// The colorway for dark surfaces.
    public let dark: PaymentMethodListItemSepaDebitPaymentMethodIconsCardDark
    /// The colorway for light surfaces.
    public let light: PaymentMethodListItemSepaDebitPaymentMethodIconsCardLight
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        dark: PaymentMethodListItemSepaDebitPaymentMethodIconsCardDark,
        light: PaymentMethodListItemSepaDebitPaymentMethodIconsCardLight,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.dark = dark
        self.light = light
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dark = try container.decode(PaymentMethodListItemSepaDebitPaymentMethodIconsCardDark.self, forKey: .dark)
        self.light = try container.decode(PaymentMethodListItemSepaDebitPaymentMethodIconsCardLight.self, forKey: .light)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.dark, forKey: .dark)
        try container.encode(self.light, forKey: .light)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case dark
        case light
    }
}