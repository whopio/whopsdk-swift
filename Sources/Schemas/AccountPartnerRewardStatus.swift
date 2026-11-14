import Foundation

/// This account's reward state. Credited requires a posted ledger entry; processing includes a met requirement awaiting fulfillment. Reversing and reversed reflect a subsequent reward reversal.
public enum AccountPartnerRewardStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case inProgress = "in_progress"
    case processing
    case credited
    case reversing
    case reversed
    case unavailable
}