import Foundation

public enum RetrieveStatsRequestInterval: String, Codable, Hashable, CaseIterable, Sendable {
    case minute
    case fiveMinutes = "five_minutes"
    case fifteenMinutes = "fifteen_minutes"
    case thirtyMinutes = "thirty_minutes"
    case hour
    case day
    case week
    case month
    case year
}