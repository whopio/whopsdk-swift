import Foundation

/// Why the trade failed, or `null`.
public enum TradeFailureCode: String, Codable, Hashable, CaseIterable, Sendable {
    case marketUnavailable = "market_unavailable"
    case leverageTooHigh = "leverage_too_high"
    case amountTooSmall = "amount_too_small"
    case isolatedPositionOpen = "isolated_position_open"
    case tradingPaused = "trading_paused"
    case fundingFailed = "funding_failed"
    case marginUnavailable = "margin_unavailable"
    case builderFeeUnapproved = "builder_fee_unapproved"
    case leverageRejected = "leverage_rejected"
    case leverageUnconfirmed = "leverage_unconfirmed"
    case orderRejected = "order_rejected"
    case closeRejected = "close_rejected"
    case returnFailed = "return_failed"
    case withdrawFailed = "withdraw_failed"
}