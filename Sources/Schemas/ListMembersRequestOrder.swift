import Foundation

public enum ListMembersRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case joinedAt = "joined_at"
    case lastAccessedAt = "last_accessed_at"
    case lastActivityAt = "last_activity_at"
    case mostRecentActionAt = "most_recent_action_at"
    case usdTotalSpent = "usd_total_spent"
}