import Foundation

public enum TradingOrderStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case open
    case filled
    case canceled
    case triggered
    case rejected
}