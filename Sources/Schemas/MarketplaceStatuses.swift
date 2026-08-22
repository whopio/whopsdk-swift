import Foundation

/// The available marketplace statuses to choose from.
public enum MarketplaceStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case notAvailable = "not_available"
    case pendingReview = "pending_review"
    case liveMarketplace = "live_marketplace"
}