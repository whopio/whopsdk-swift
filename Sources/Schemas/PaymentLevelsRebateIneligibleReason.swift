import Foundation

/// Why the payment can't earn a rebate: `not_card_payment`, `before_levels` (made before Whop Levels started), `not_in_levels` (its account wasn't in Whop Levels that month), `fee_not_posted`, `fee_at_level_rate` (its fee was already at or below the level's rate) or `no_level_rate` (its fee matched no level rate). `null` unless `status` is `ineligible`.
public enum PaymentLevelsRebateIneligibleReason: String, Codable, Hashable, CaseIterable, Sendable {
    case notCardPayment = "not_card_payment"
    case beforeLevels = "before_levels"
    case notInLevels = "not_in_levels"
    case feeNotPosted = "fee_not_posted"
    case feeAtLevelRate = "fee_at_level_rate"
    case noLevelRate = "no_level_rate"
}