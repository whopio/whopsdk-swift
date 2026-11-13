import Foundation

/// Only for a perpetual limit order. `good_til_canceled` rests on the book until it fills; `add_liquidity_only` is canceled instead of filling at once; `immediate_or_cancel` fills what it can now and cancels the rest. Defaults to `good_til_canceled`. The trade stays `processing` while the order rests.
public enum CreateTradesRequestTimeInForce: String, Codable, Hashable, CaseIterable, Sendable {
    case addLiquidityOnly = "add_liquidity_only"
    case goodTilCanceled = "good_til_canceled"
    case immediateOrCancel = "immediate_or_cancel"
}