import Foundation

/// The visibility types for forum posts
public enum ForumPostVisibilityTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case membersOnly = "members_only"
    case globallyVisible = "globally_visible"
}