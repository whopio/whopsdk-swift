import Foundation

/// How long the order stays active. `null` when the provider omits it or reports a policy outside the supported values.
public enum TradingOrderTimeInForce: String, Codable, Hashable, CaseIterable, Sendable {
    case addLiquidityOnly = "add_liquidity_only"
    case goodTilCanceled = "good_til_canceled"
    case immediateOrCancel = "immediate_or_cancel"
}