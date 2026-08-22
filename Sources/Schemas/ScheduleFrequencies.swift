import Foundation

/// How often a scheduled bounty republishes a new bounty.
public enum ScheduleFrequencies: String, Codable, Hashable, CaseIterable, Sendable {
    case once
    case hourly
    case daily
    case weekly
    case monthly
}