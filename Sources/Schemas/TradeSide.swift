import Foundation

/// `buy` or `sell` for an order. `null` otherwise.
public enum TradeSide: String, Codable, Hashable, CaseIterable, Sendable {
    case buy
    case sell
}