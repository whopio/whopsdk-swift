import Foundation

/// The member's latest lifecycle state on the account, derived from their memberships, such as `paid_subscriber`, `canceling`, or `churned`. `null` until it is first computed.
public enum MemberMostRecentAction: String, Codable, Hashable, CaseIterable, Sendable {
    case canceling
    case churned
    case finishedSplitPay = "finished_split_pay"
    case paused
    case paidSubscriber = "paid_subscriber"
    case paidOnce = "paid_once"
    case expiring
    case joined
    case left
    case trialing
    case pendingEntry = "pending_entry"
    case renewing
    case pastDue = "past_due"
}