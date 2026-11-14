import Foundation

public struct TradingSpotHolding: Codable, Hashable, Sendable {
    /// The average price paid per unit of what is still held, in USD, counting the oldest units as sold first. `null` when it is not known.
    public let averageEntryPrice: Nullable<Money>
    /// What was paid in USD for the units still held.
    public let costBasis: Money
    /// The spot market's `id` from `GET /trades/markets`, such as `BTC`, `XAUT`, or a tokenized stock's ticker such as `AAPL`.
    public let market: String
    /// Gains and losses already locked in by selling, in USD.
    public let realizedPnl: Money
    /// The value of the units still held minus their `cost_basis`, in USD.
    public let unrealizedPnl: Money
    /// `unrealized_pnl` as a percentage of `cost_basis`, where `2` means up 2%. `null` when it is not known.
    public let unrealizedPnlPercentage: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        averageEntryPrice: Nullable<Money>,
        costBasis: Money,
        market: String,
        realizedPnl: Money,
        unrealizedPnl: Money,
        unrealizedPnlPercentage: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.averageEntryPrice = averageEntryPrice
        self.costBasis = costBasis
        self.market = market
        self.realizedPnl = realizedPnl
        self.unrealizedPnl = unrealizedPnl
        self.unrealizedPnlPercentage = unrealizedPnlPercentage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.averageEntryPrice = try container.decode(Nullable<Money>.self, forKey: .averageEntryPrice)
        self.costBasis = try container.decode(Money.self, forKey: .costBasis)
        self.market = try container.decode(String.self, forKey: .market)
        self.realizedPnl = try container.decode(Money.self, forKey: .realizedPnl)
        self.unrealizedPnl = try container.decode(Money.self, forKey: .unrealizedPnl)
        self.unrealizedPnlPercentage = try container.decode(Nullable<Double>.self, forKey: .unrealizedPnlPercentage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.averageEntryPrice, forKey: .averageEntryPrice)
        try container.encode(self.costBasis, forKey: .costBasis)
        try container.encode(self.market, forKey: .market)
        try container.encode(self.realizedPnl, forKey: .realizedPnl)
        try container.encode(self.unrealizedPnl, forKey: .unrealizedPnl)
        try container.encode(self.unrealizedPnlPercentage, forKey: .unrealizedPnlPercentage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case averageEntryPrice = "average_entry_price"
        case costBasis = "cost_basis"
        case market
        case realizedPnl = "realized_pnl"
        case unrealizedPnl = "unrealized_pnl"
        case unrealizedPnlPercentage = "unrealized_pnl_percentage"
    }
}