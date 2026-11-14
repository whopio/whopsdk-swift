import Foundation

/// Why a standard payout cannot move funds right now, or null when the cap is above 0.
public enum ListMethodsResponseLimitsStandardErrorCode: String, Codable, Hashable, CaseIterable, Sendable {
    case accountSuspended = "account_suspended"
    case blockMoveMoneyOutBecauseClawback = "block_move_money_out_because_clawback"
    case cardUsageReviewPayoutStatusHold = "card_usage_review_payout_status_hold"
    case underReview = "under_review"
    case kycCompleted = "kyc_completed"
    case rmiClear = "rmi_clear"
    case identityRfiClear = "identity_rfi_clear"
    case guardianIdClear = "guardian_id_clear"
    case blockMoveMoneyOut = "block_move_money_out"
    case blockMoveMoneyOutSetByParent = "block_move_money_out_set_by_parent"
    case noAvailableBalance = "no_available_balance"
}