import Foundation

/// Why pending funds without a settlement date aren't moving yet. `kyc_incomplete`, `pending_information_request`, and `update_payout_profile` are things the merchant can act on. `compliance_review` means a verification the merchant already submitted is being reviewed, so these funds stay pending until it clears. `withdrawals_disabled` means Whop has blocked withdrawals, so these funds cannot become available. `null` when there's no reason to show — still clearing, or held for a reason that isn't named here.
public enum AccountPaymentControlsUndatedPendingReason: String, Codable, Hashable, CaseIterable, Sendable {
    case kycIncomplete = "kyc_incomplete"
    case pendingInformationRequest = "pending_information_request"
    case updatePayoutProfile = "update_payout_profile"
    case complianceReview = "compliance_review"
    case withdrawalsDisabled = "withdrawals_disabled"
}