import Foundation

/// `cross` shares margin across positions. `isolated` limits margin to this position.
public enum TradingPositionLeverageType: String, Codable, Hashable, CaseIterable, Sendable {
    case cross
    case isolated
}