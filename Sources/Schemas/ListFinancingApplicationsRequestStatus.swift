import Foundation

public enum ListFinancingApplicationsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case requiresCollection = "requires_collection"
    case awaitingReview = "awaiting_review"
    case completed
    case approved
    case denied
}