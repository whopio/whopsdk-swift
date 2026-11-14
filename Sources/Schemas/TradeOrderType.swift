import Foundation

/// `market`, `limit`, `take_profit` or `stop_loss` for an order. `null` otherwise.
public enum TradeOrderType: String, Codable, Hashable, CaseIterable, Sendable {
    case market
    case limit
    case takeProfit = "take_profit"
    case stopLoss = "stop_loss"
}