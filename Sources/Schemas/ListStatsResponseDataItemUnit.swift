import Foundation

/// How to read the metric's values: count is an integer, currency is a decimal amount, and percent is a number where 1.6 means 1.6%.
public enum ListStatsResponseDataItemUnit: String, Codable, Hashable, CaseIterable, Sendable {
    case count
    case currency
    case percent
}