import Foundation

/// How the balance was converted into the payout currency before the payout was sent. `null` when the payout was sent from a balance in its own currency.
public struct CreatePayoutsResponseConversion: Codable, Hashable, Sendable {
    /// The amount the conversion took from the balance, as a decimal string.
    public let fromAmount: String
    /// The currency of the balance the conversion took the amount from.
    public let fromCurrency: String
    /// The conversion rate, in units of the payout currency for each unit of `from_currency`. Any conversion charge is included in this rate.
    public let rate: Float
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fromAmount: String,
        fromCurrency: String,
        rate: Float,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fromAmount = fromAmount
        self.fromCurrency = fromCurrency
        self.rate = rate
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fromAmount = try container.decode(String.self, forKey: .fromAmount)
        self.fromCurrency = try container.decode(String.self, forKey: .fromCurrency)
        self.rate = try container.decode(Float.self, forKey: .rate)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.fromAmount, forKey: .fromAmount)
        try container.encode(self.fromCurrency, forKey: .fromCurrency)
        try container.encode(self.rate, forKey: .rate)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fromAmount = "from_amount"
        case fromCurrency = "from_currency"
        case rate
    }
}