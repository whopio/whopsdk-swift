import Foundation

public enum RetrieveStatsRequestActivity: String, Codable, Hashable, CaseIterable, Sendable {
    case all
    case earning
    case notEarning = "not_earning"
}