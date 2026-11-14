import Foundation

/// `partial_fill` when the order filled only part of its size. `null` otherwise.
public enum TradeStatusDetail: String, Codable, Hashable, CaseIterable, Sendable {
    case partialFill = "partial_fill"
}