import Foundation

/// Which columns can be used to sort.
public enum MembersSortableColumns: String, Codable, Hashable, CaseIterable, Sendable {
    case id
    case usdTotalSpent = "usd_total_spent"
    case createdAt = "created_at"
    case joinedAt = "joined_at"
    case mostRecentAction = "most_recent_action"
}