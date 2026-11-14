import Foundation

/// Trading venue that holds the positions and orders.
public enum TradingAccountProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case hyperliquid
}