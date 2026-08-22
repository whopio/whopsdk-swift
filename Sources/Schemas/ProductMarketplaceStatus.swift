import Foundation

/// Listing state on the whop.com marketplace. `pending_review` means submitted and awaiting review; `live_marketplace` means approved and discoverable.
public enum ProductMarketplaceStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case notAvailable = "not_available"
    case pendingReview = "pending_review"
    case liveMarketplace = "live_marketplace"
}