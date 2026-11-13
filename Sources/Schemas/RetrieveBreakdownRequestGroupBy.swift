import Foundation

public enum RetrieveBreakdownRequestGroupBy: String, Codable, Hashable, CaseIterable, Sendable {
    case hour
    case day
    case week
    case month
}