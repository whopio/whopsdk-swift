import Foundation

public enum TradingOrderOrderType: String, Codable, Hashable, CaseIterable, Sendable {
    case limit
    case market
    case takeProfit = "take_profit"
    case stopLoss = "stop_loss"
}