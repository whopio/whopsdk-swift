import Foundation

/// Approval status of the app's product listing on the Whop app store, or `null` when the app has no associated product.
public enum AppMarketplaceStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case notAvailable = "not_available"
    case pendingReview = "pending_review"
    case liveMarketplace = "live_marketplace"
}