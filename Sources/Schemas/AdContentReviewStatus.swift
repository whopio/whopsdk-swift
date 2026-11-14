import Foundation

/// `reviewed` once Whop content review finishes, `in_review` while it runs, `not_reviewed` when it never ran.
public enum AdContentReviewStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case reviewed
    case inReview = "in_review"
    case notReviewed = "not_reviewed"
}