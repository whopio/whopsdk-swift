import Foundation

/// `market` fills now within `slippage_bps` of the mid price, and anything unfilled is canceled; `limit` fills at `price` or better, and how long it stays on the book follows `time_in_force`. `take_profit` and `stop_loss` reduce the open perpetual position with a market order once the price crosses `trigger_price`; the trade stays `processing` until then. Required for an order.
public enum CreateTradesRequestOrderType: String, Codable, Hashable, CaseIterable, Sendable {
    case market
    case limit
    case takeProfit = "take_profit"
    case stopLoss = "stop_loss"
}