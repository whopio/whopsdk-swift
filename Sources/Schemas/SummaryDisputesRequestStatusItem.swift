import Foundation

public enum SummaryDisputesRequestStatusItem: String, Codable, Hashable, CaseIterable, Sendable {
    case needsResponse = "needs_response"
    case underReview = "under_review"
    case won
    case lost
    case closed
}