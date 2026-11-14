import Foundation

public enum RetrieveTimeSeriesRequestActivity: String, Codable, Hashable, CaseIterable, Sendable {
    case all
    case earning
    case notEarning = "not_earning"
}