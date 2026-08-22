import Foundation

/// The ways a relation of AccessPasses can be ordered
public enum AccessPassOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case activeMembershipsCount = "active_memberships_count"
    case createdAt = "created_at"
    case usdGmv = "usd_gmv"
    case usdGmv30Days = "usd_gmv_30_days"
}