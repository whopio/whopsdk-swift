import Foundation

/// Metrics only. How to combine the metric across rows.
public enum PlatformTrendsReportsResponseDataColumnsItemAggregate: String, Codable, Hashable, CaseIterable, Sendable {
    case sum
    case average
    case none
}