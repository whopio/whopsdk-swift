import Foundation

public enum ListReviewsRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case stars
}