import Foundation

public enum ListProductsRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case activeMembershipsCount = "active_memberships_count"
    case usdGmv = "usd_gmv"
    case usdGmv30Days = "usd_gmv_30_days"
    case position
    case discoverableAt = "discoverable_at"
}