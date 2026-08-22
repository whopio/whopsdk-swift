import Foundation

/// Current payout status, in the same vocabulary as GET /payouts.
public enum CreatePayoutsResponseStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case requested
    case inReview = "in_review"
    case processing
    case completed
    case reversed
    case canceled
    case failed
    case denied
}