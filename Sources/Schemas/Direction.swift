import Foundation

/// The direction of the sort.
public enum Direction: String, Codable, Hashable, CaseIterable, Sendable {
    case asc
    case desc
}