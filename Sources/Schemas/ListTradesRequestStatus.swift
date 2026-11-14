import Foundation

public enum ListTradesRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case processing
    case inReview = "in_review"
    case completed
    case failed
}