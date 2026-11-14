import Foundation

/// The application's review state. Approval does not by itself indicate that financing payment methods are enabled on the account.
public enum FinancingApplicationStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case requiresCollection = "requires_collection"
    case awaitingReview = "awaiting_review"
    case completed
    case approved
    case denied
}