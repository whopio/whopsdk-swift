import Foundation

/// Metrics only. How to combine the metric across rows. `none` cannot be rebuilt from rows.
public enum ListReportsResponseDataItemColumnsItemAggregate: String, Codable, Hashable, CaseIterable, Sendable {
    case sum
    case average
    case none
}