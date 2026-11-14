import Foundation

/// Whether the column is an attribute of the row or a number measured over it.
public enum ListReportsResponseDataItemColumnsItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case property
    case metric
}