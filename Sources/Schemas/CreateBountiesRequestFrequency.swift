import Foundation

/// How often the schedule creates a new bounty. Each occurrence is a separate bounty. Defaults to `once`; only applies with `publish_at`.
public enum CreateBountiesRequestFrequency: String, Codable, Hashable, CaseIterable, Sendable {
    case once
    case hourly
    case daily
    case weekly
    case monthly
}