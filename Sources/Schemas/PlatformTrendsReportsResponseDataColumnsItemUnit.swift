import Foundation

/// Metrics only. Sets the value's JSON type.
public enum PlatformTrendsReportsResponseDataColumnsItemUnit: String, Codable, Hashable, CaseIterable, Sendable {
    case money
    case count
    case rate
    case months
    case years
}