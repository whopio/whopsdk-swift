import Foundation

/// Metrics only. `money` is a Money object, `rate` a decimal fraction, the rest numbers.
public enum ListReportsResponseDataItemColumnsItemUnit: String, Codable, Hashable, CaseIterable, Sendable {
    case money
    case count
    case rate
    case months
    case years
}