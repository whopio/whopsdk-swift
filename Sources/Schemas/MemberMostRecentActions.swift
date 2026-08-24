import Foundation

/// The different most recent actions a member can have.
public enum MemberMostRecentActions: String, Codable, Hashable, CaseIterable, Sendable {
    case canceling
    case churned
    case finishedSplitPay = "finished_split_pay"
    case paused
    case paidSubscriber = "paid_subscriber"
    case paidOnce = "paid_once"
    case expiring
    case joined
    case drafted
    case left
    case trialing
    case pendingEntry = "pending_entry"
    case renewing
    case pastDue = "past_due"
}