import Foundation

public enum RetrieveTimeSeriesRequestSnapshotWindow: String, Codable, Hashable, CaseIterable, Sendable {
    case sevenD = "7d"
    case fourteenD = "14d"
    case twentyEightD = "28d"
    case thirtyD = "30d"
    case fiftySixD = "56d"
}