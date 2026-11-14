import Foundation

public enum ListDisputesRequestStatusItem: String, Codable, Hashable, CaseIterable, Sendable {
    case needsResponse = "needs_response"
    case warningNeedsResponse = "warning_needs_response"
    case underReview = "under_review"
    case warningUnderReview = "warning_under_review"
    case generatingResponse = "generating_response"
    case won
    case lost
    case prevented
    case warningClosed = "warning_closed"
}