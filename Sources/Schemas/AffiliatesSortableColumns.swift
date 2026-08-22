import Foundation

/// Which columns can be used to sort.
public enum AffiliatesSortableColumns: String, Codable, Hashable, CaseIterable, Sendable {
    case id
    case createdAt = "created_at"
    case cachedTotalReferrals = "cached_total_referrals"
    case cachedTotalRewards = "cached_total_rewards"
}