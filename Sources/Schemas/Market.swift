import Foundation

public struct Market: Codable, Hashable, Sendable {
    /// How much the price moved over the last 24 hours, as a percentage where `2` means up 2%. Set for tokenized stocks; `null` when it is not available.
    public let change24HPercentage: Nullable<Double>
    /// The market's name: a perpetual's Hyperliquid name such as `BTC` or `xyz:TSLA`, which you send as `market` when you create a trade, or a spot asset's symbol such as `BTC`, `XAUT`, or a tokenized stock's ticker such as `AAPL`. A perpetual and a spot market can share an `id`, so `id` and `instrument_type` together identify a market.
    public let id: String
    /// Whether this is a perpetual or a spot market. With `id`, it identifies the market.
    public let instrumentType: MarketInstrumentType
    /// A logo image URL for the asset. Set for tokenized stocks; `null` when there is no logo.
    public let logoUrl: Nullable<String>
    /// The highest cross leverage an order on this perpetual can use. `null` for a spot market, which trades without leverage.
    public let maxLeverage: Nullable<Int>
    /// The current price in USD: the midpoint between the best bid and ask, or a tokenized stock's latest market price. `null` when no price is available.
    public let price: Nullable<Money>
    /// The most decimals an order's `size` can have on this market.
    public let sizeDecimals: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        change24HPercentage: Nullable<Double>,
        id: String,
        instrumentType: MarketInstrumentType,
        logoUrl: Nullable<String>,
        maxLeverage: Nullable<Int>,
        price: Nullable<Money>,
        sizeDecimals: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.change24HPercentage = change24HPercentage
        self.id = id
        self.instrumentType = instrumentType
        self.logoUrl = logoUrl
        self.maxLeverage = maxLeverage
        self.price = price
        self.sizeDecimals = sizeDecimals
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.change24HPercentage = try container.decode(Nullable<Double>.self, forKey: .change24HPercentage)
        self.id = try container.decode(String.self, forKey: .id)
        self.instrumentType = try container.decode(MarketInstrumentType.self, forKey: .instrumentType)
        self.logoUrl = try container.decode(Nullable<String>.self, forKey: .logoUrl)
        self.maxLeverage = try container.decode(Nullable<Int>.self, forKey: .maxLeverage)
        self.price = try container.decode(Nullable<Money>.self, forKey: .price)
        self.sizeDecimals = try container.decode(Int.self, forKey: .sizeDecimals)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.change24HPercentage, forKey: .change24HPercentage)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.instrumentType, forKey: .instrumentType)
        try container.encode(self.logoUrl, forKey: .logoUrl)
        try container.encode(self.maxLeverage, forKey: .maxLeverage)
        try container.encode(self.price, forKey: .price)
        try container.encode(self.sizeDecimals, forKey: .sizeDecimals)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case change24HPercentage = "change_24h_percentage"
        case id
        case instrumentType = "instrument_type"
        case logoUrl = "logo_url"
        case maxLeverage = "max_leverage"
        case price
        case sizeDecimals = "size_decimals"
    }
}