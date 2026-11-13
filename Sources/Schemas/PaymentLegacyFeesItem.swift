import Foundation

/// Represents a fee related to a payment
public struct PaymentLegacyFeesItem: Codable, Hashable, Sendable {
    /// The value or amount to display for the fee.
    public let amount: Double
    /// The currency of the fee.
    public let currency: Currencies
    /// The label to display for the fee.
    public let name: String
    /// The specific origin of the fee, if applicable.
    public let type: SpecificFeeOrigins
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Double,
        currency: Currencies,
        name: String,
        type: SpecificFeeOrigins,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.currency = currency
        self.name = name
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(SpecificFeeOrigins.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case currency
        case name
        case type
    }
}