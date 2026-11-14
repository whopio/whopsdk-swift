import Foundation

/// Billing state of the membership, as on the membership resource. `null` while the membership is a draft: during checkout before its first payment settles, or while its waitlist entry is pending.
public enum SearchRecordMembershipStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case trialing
    case active
    case pastDue = "past_due"
    case completed
    case canceled
    case expired
    case unresolved
}