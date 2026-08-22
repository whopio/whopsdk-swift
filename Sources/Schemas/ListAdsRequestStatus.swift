import Foundation

public enum ListAdsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case paused
    case inReview = "in_review"
    case rejected
}