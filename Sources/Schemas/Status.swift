import Foundation

/// Statuses for resources
public enum Status: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case archived
    case deleted
}