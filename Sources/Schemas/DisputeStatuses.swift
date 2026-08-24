import Foundation

/// The possible statuses of a dispute
public enum DisputeStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case warningNeedsResponse = "warning_needs_response"
    case warningUnderReview = "warning_under_review"
    case warningClosed = "warning_closed"
    case needsResponse = "needs_response"
    case underReview = "under_review"
    case won
    case lost
    case closed
    case other
}