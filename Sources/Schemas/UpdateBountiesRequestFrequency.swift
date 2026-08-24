import Foundation

/// Scheduled drafts only. How often the schedule creates a new bounty.
public enum UpdateBountiesRequestFrequency: String, Codable, Hashable, CaseIterable, Sendable {
    case once
    case hourly
    case daily
    case weekly
    case monthly
}