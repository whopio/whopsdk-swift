import Foundation

/// `range` reports measure activity in a period; `as_of` reports measure state at a moment.
public enum ListReportsResponseDataItemWindowKind: String, Codable, Hashable, CaseIterable, Sendable {
    case range
    case asOf = "as_of"
}