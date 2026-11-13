import Foundation

public struct TradingPosition: Codable, Hashable, Sendable {
    /// Average entry price in USD, or `null` when the provider omits it.
    public let entryPrice: Nullable<Money>
    /// Hyperliquid perpetual details. Present on Hyperliquid positions, otherwise `null`.
    public let hyperliquid: Nullable<TradingHyperliquidPosition>
    /// Trading position ID, prefixed `trdpos_`. Stable for a market within one trading account.
    public let id: String
    /// Market symbol on the provider, such as `ETH`.
    public let market: String
    public let object: TradingPositionObject
    /// Current position value in USD.
    public let positionValue: Money
    public let side: TradingPositionSide
    /// Absolute position size as a decimal string.
    public let size: String
    /// Unrealized profit or loss in USD. Negative for a loss.
    public let unrealizedPnl: Money
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        entryPrice: Nullable<Money>,
        hyperliquid: Nullable<TradingHyperliquidPosition>,
        id: String,
        market: String,
        object: TradingPositionObject,
        positionValue: Money,
        side: TradingPositionSide,
        size: String,
        unrealizedPnl: Money,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.entryPrice = entryPrice
        self.hyperliquid = hyperliquid
        self.id = id
        self.market = market
        self.object = object
        self.positionValue = positionValue
        self.side = side
        self.size = size
        self.unrealizedPnl = unrealizedPnl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.entryPrice = try container.decode(Nullable<Money>.self, forKey: .entryPrice)
        self.hyperliquid = try container.decode(Nullable<TradingHyperliquidPosition>.self, forKey: .hyperliquid)
        self.id = try container.decode(String.self, forKey: .id)
        self.market = try container.decode(String.self, forKey: .market)
        self.object = try container.decode(TradingPositionObject.self, forKey: .object)
        self.positionValue = try container.decode(Money.self, forKey: .positionValue)
        self.side = try container.decode(TradingPositionSide.self, forKey: .side)
        self.size = try container.decode(String.self, forKey: .size)
        self.unrealizedPnl = try container.decode(Money.self, forKey: .unrealizedPnl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.entryPrice, forKey: .entryPrice)
        try container.encode(self.hyperliquid, forKey: .hyperliquid)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.market, forKey: .market)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.positionValue, forKey: .positionValue)
        try container.encode(self.side, forKey: .side)
        try container.encode(self.size, forKey: .size)
        try container.encode(self.unrealizedPnl, forKey: .unrealizedPnl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case entryPrice = "entry_price"
        case hyperliquid
        case id
        case market
        case object
        case positionValue = "position_value"
        case side
        case size
        case unrealizedPnl = "unrealized_pnl"
    }
}