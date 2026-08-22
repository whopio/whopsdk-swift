import Foundation

public enum LeaderboardPartnersRequestPeriod: String, Codable, Hashable, CaseIterable, Sendable {
    case day
    case month
    case year
    case last30Days = "last_30_days"
    case allTime = "all_time"
}