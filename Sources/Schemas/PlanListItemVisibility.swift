import Foundation

/// Controls where this variant can be seen. When `hidden`, the variant is reachable only by its direct link.
public enum PlanListItemVisibility: String, Codable, Hashable, CaseIterable, Sendable {
    case visible
    case hidden
    case archived
    case quickLink = "quick_link"
}