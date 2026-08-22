import Foundation

public enum ListPayoutsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case requested
    case inReview = "in_review"
    case processing
    case completed
    case reversed
    case canceled
    case failed
    case denied
}