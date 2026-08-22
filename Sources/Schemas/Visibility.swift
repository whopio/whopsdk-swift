import Foundation

/// Visibility of a resource
public enum Visibility: String, Codable, Hashable, CaseIterable, Sendable {
    case visible
    case hidden
    case archived
    case quickLink = "quick_link"
}