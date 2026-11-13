import Foundation

/// `buy` or `sell`. Required for an order, except a `take_profit` or `stop_loss`, where it defaults to the side that reduces the position.
public enum CreateTradesRequestSide: String, Codable, Hashable, CaseIterable, Sendable {
    case buy
    case sell
}