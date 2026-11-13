import Foundation

public struct TradingHyperliquidPosition: Codable, Hashable, Sendable {
    /// Funding paid on the position over several windows, in USD.
    public let cumulativeFunding: TradingCumulativeFunding
    /// Margin mode and multiplier for the position.
    public let leverage: TradingPositionLeverage
    /// Estimated liquidation price in USD, or `null` when Hyperliquid reports none.
    public let liquidationPrice: Nullable<Money>
    /// Margin allocated to the position, in USD.
    public let marginUsed: Money
    /// Return on equity as a decimal ratio string, such as `0.1` for 10%.
    public let returnOnEquity: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cumulativeFunding: TradingCumulativeFunding,
        leverage: TradingPositionLeverage,
        liquidationPrice: Nullable<Money>,
        marginUsed: Money,
        returnOnEquity: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cumulativeFunding = cumulativeFunding
        self.leverage = leverage
        self.liquidationPrice = liquidationPrice
        self.marginUsed = marginUsed
        self.returnOnEquity = returnOnEquity
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cumulativeFunding = try container.decode(TradingCumulativeFunding.self, forKey: .cumulativeFunding)
        self.leverage = try container.decode(TradingPositionLeverage.self, forKey: .leverage)
        self.liquidationPrice = try container.decode(Nullable<Money>.self, forKey: .liquidationPrice)
        self.marginUsed = try container.decode(Money.self, forKey: .marginUsed)
        self.returnOnEquity = try container.decode(String.self, forKey: .returnOnEquity)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.cumulativeFunding, forKey: .cumulativeFunding)
        try container.encode(self.leverage, forKey: .leverage)
        try container.encode(self.liquidationPrice, forKey: .liquidationPrice)
        try container.encode(self.marginUsed, forKey: .marginUsed)
        try container.encode(self.returnOnEquity, forKey: .returnOnEquity)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cumulativeFunding = "cumulative_funding"
        case leverage
        case liquidationPrice = "liquidation_price"
        case marginUsed = "margin_used"
        case returnOnEquity = "return_on_equity"
    }
}