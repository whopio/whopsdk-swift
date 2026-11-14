import Foundation

/// The most recent financing application's review state: `requires_collection` (waiting on the merchant, including after a request for more information), `awaiting_review`, `approved`, `denied`, or `completed`. Whether financing payment methods are enabled is `capabilities.accept_bnpl_payments`.
public enum AccountFinancingStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case requiresCollection = "requires_collection"
    case awaitingReview = "awaiting_review"
    case completed
    case approved
    case denied
}