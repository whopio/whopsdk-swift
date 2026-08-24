import Foundation

public enum RetrieveStatsRequestSnapshotWindow: String, Codable, Hashable, CaseIterable, Sendable {
    case sevenD = "7d"
    case twentyEightD = "28d"
    case thirtyD = "30d"
}