import Foundation

/// An attribute of the row, or a number measured over it.
public enum PlatformTrendsReportsResponseDataColumnsItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case property
    case metric
}