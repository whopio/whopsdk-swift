import Foundation

/// The status of a membership
public enum MembershipStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case trialing
    case active
    case pastDue = "past_due"
    case completed
    case canceled
    case expired
    case unresolved
    case drafted
    case canceling
}