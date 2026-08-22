import Foundation

/// The different levels of visibility for resources
public enum VisibilityFilter: String, Codable, Hashable, CaseIterable, Sendable {
    case visible
    case hidden
    case archived
    case quickLink = "quick_link"
    case all
    case notQuickLink = "not_quick_link"
    case notArchived = "not_archived"
}