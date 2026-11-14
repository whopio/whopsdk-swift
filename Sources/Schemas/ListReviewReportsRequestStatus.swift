import Foundation

public enum ListReviewReportsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case accepted
    case rejected
}