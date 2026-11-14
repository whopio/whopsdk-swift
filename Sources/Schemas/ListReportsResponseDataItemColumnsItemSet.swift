import Foundation

/// Properties only. `fixed` breakdowns list every value, zero-filled; `open` ones list values with activity.
public enum ListReportsResponseDataItemColumnsItemSet: String, Codable, Hashable, CaseIterable, Sendable {
    case fixed
    case open
}