import Foundation

public enum ListDomainsRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case uniqueVisitorsLast7Days = "unique_visitors_last_7_days"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case domain
}