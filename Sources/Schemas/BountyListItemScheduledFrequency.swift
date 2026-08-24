import Foundation

/// How often the schedule creates a new bounty. Each occurrence is a separate bounty; the original is not republished.
public enum BountyListItemScheduledFrequency: String, Codable, Hashable, CaseIterable, Sendable {
    case once
    case hourly
    case daily
    case weekly
    case monthly
}