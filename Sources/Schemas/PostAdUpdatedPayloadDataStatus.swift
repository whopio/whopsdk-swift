import Foundation

/// Whether the ad is enabled. `active` and `paused` are set by you; `in_review` and `rejected` come from ad review.
public enum PostAdUpdatedPayloadDataStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case paused
    case inReview = "in_review"
    case rejected
}