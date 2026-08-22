import Foundation

/// Bucket size for external ad stat rows.
public enum Granularities: String, Codable, Hashable, CaseIterable, Sendable {
    case hourly
    case daily
    case weekly
    case monthly
}