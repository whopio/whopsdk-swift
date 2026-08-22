import Foundation

public struct UserBalanceToken: Codable, Hashable, Sendable {
    /// Amount held in native token units, as a decimal string.
    public let balance: String
    /// Balance split into available, pending, in-transit, and reserve amounts, as native-unit decimal strings. Transfers between the user's own wallet and card are reported in `in_transit` until they arrive.
    public let breakdown: AccountBalanceBreakdown
    /// Token icon URL.
    public let iconUrl: Nullable<String>
    /// The token's display name.
    public let name: Nullable<String>
    /// USD price per token, or `null` when unknown.
    public let priceUsd: Nullable<Double>
    /// Token display symbol, such as `USDT`, `XAUT`, or `cbBTC`.
    public let symbol: String
    /// Holding USD value.
    public let valueUsd: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        balance: String,
        breakdown: AccountBalanceBreakdown,
        iconUrl: Nullable<String>,
        name: Nullable<String>,
        priceUsd: Nullable<Double>,
        symbol: String,
        valueUsd: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.balance = balance
        self.breakdown = breakdown
        self.iconUrl = iconUrl
        self.name = name
        self.priceUsd = priceUsd
        self.symbol = symbol
        self.valueUsd = valueUsd
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.balance = try container.decode(String.self, forKey: .balance)
        self.breakdown = try container.decode(AccountBalanceBreakdown.self, forKey: .breakdown)
        self.iconUrl = try container.decode(Nullable<String>.self, forKey: .iconUrl)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.priceUsd = try container.decode(Nullable<Double>.self, forKey: .priceUsd)
        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.valueUsd = try container.decode(Double.self, forKey: .valueUsd)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.balance, forKey: .balance)
        try container.encode(self.breakdown, forKey: .breakdown)
        try container.encode(self.iconUrl, forKey: .iconUrl)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.priceUsd, forKey: .priceUsd)
        try container.encode(self.symbol, forKey: .symbol)
        try container.encode(self.valueUsd, forKey: .valueUsd)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case balance
        case breakdown
        case iconUrl = "icon_url"
        case name
        case priceUsd = "price_usd"
        case symbol
        case valueUsd = "value_usd"
    }
}