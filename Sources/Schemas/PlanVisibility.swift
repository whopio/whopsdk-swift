import Foundation

/// Controls where this plan can be seen. When `hidden`, the plan is reachable only by its direct link.
public enum PlanVisibility: String, Codable, Hashable, CaseIterable, Sendable {
    case visible
    case hidden
    case archived
    case quickLink = "quick_link"
}