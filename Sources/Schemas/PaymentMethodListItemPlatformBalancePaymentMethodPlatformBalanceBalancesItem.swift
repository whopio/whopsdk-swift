import Foundation

/// An amount of money. Never a bare number, because a bare number cannot answer the two questions a client has to answer to render it: what currency is this, and how many digits do I write? The second is stated twice rather than derived, because the digits the amount CARRIES and the digits to SHOW differ in COP — charged in centavos, written in whole pesos. Formatting is deliberately left to the caller: the number belongs in the buyer's locale, and this API does not know it.
public struct PaymentMethodListItemPlatformBalancePaymentMethodPlatformBalanceBalancesItem: Codable, Hashable, Sendable {
    /// The amount in major units, as an exact decimal string — `"10.00"` is ten dollars. A string so no float rounds it in transit.
    public let amount: String
    /// Three-letter ISO 4217 currency code, lowercase.
    public let currency: Currencies
    /// How many decimal places the amount CARRIES — the precision the charge itself runs at.
    public let decimals: Int
    /// How many decimal places to SHOW. Usually equal to `decimals`, and deliberately not always: COP is charged in centavos but written in whole pesos, so it is `2` and `0`. Format the number in your own locale using this.
    public let displayDecimals: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: String,
        currency: Currencies,
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
        self.currency = try container.decode(Currencies.self, forKey: .currency)
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