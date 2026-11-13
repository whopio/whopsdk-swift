import Foundation

public enum ListFinancingProvidersRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case eligible
    case needsAction = "needs_action"
    case inReview = "in_review"
    case active
    case inactive
}