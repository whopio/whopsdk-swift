import Foundation

public struct PaymentMethodDisplayPreview: Codable, Hashable, Sendable {
    /// Lowercase card brand, such as `visa` or `mastercard`.
    public let brand: String?
    /// Uniquely identifies this particular card number. Matches the `fingerprint` on any payment method saved from this token, so you can recognize a card across attempts. For a wallet, this identifies the network token rather than the underlying card.
    public let fingerprint: String?
    /// The last four digits of the card.
    public let last4: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        brand: String? = nil,
        fingerprint: String? = nil,
        last4: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.brand = brand
        self.fingerprint = fingerprint
        self.last4 = last4
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.brand = try container.decodeIfPresent(String.self, forKey: .brand)
        self.fingerprint = try container.decodeIfPresent(String.self, forKey: .fingerprint)
        self.last4 = try container.decodeIfPresent(String.self, forKey: .last4)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.brand, forKey: .brand)
        try container.encodeIfPresent(self.fingerprint, forKey: .fingerprint)
        try container.encodeIfPresent(self.last4, forKey: .last4)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case brand
        case fingerprint
        case last4
    }
}