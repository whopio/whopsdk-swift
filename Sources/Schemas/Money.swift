import Foundation

public struct Money: Codable, Hashable, Sendable {
    /// The amount in major units, as an exact decimal string. For example, `"10.00"` is ten dollars. It is a string so that no float rounds it in transit.
    public let amount: String
    /// Three-letter ISO 4217 currency code, lowercase.
    public let currency: String
    /// How many decimal places the amount carries. This is the precision the charge itself runs at.
    public let decimals: Int
    /// How many decimal places to SHOW. Usually equal to `decimals`, and deliberately not always: COP is charged in centavos but written in whole pesos, so it is `2` and `0`. Format the number in your own locale using this.
    public let displayDecimals: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: String,
        currency: String,
        decimals: Int,
        displayDecimals: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.currency = currency
        self.decimals = decimals
        self.displayDecimals = displayDecimals
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(String.self, forKey: .amount)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.decimals = try container.decode(Int.self, forKey: .decimals)
        self.displayDecimals = try container.decode(Int.self, forKey: .displayDecimals)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.decimals, forKey: .decimals)
        try container.encode(self.displayDecimals, forKey: .displayDecimals)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case currency
        case decimals
        case displayDecimals = "display_decimals"
    }
}