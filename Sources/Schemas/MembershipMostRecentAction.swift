import Foundation

/// The membership's latest lifecycle event, such as `renewing_on` or `canceled_on`. Pair it with `most_recent_action_at`. `null` when none is recorded.
public enum MembershipMostRecentAction: String, Codable, Hashable, CaseIterable, Sendable {
    case canceledOn = "canceled_on"
    case finishedSplitPayAt = "finished_split_pay_at"
    case cancelingOn = "canceling_on"
    case endingOn = "ending_on"
    case renewingOn = "renewing_on"
    case pastDue = "past_due"
    case nextPaymentAttempt = "next_payment_attempt"
    case pausedAt = "paused_at"
    case trialEndsAt = "trial_ends_at"
    case unresolvedAt = "unresolved_at"
    case trialCancelingOn = "trial_canceling_on"
}