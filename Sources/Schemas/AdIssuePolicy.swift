import Foundation

/// The policy a `content_rejected` ad broke, or `null` when none was reported.
public enum AdIssuePolicy: String, Codable, Hashable, CaseIterable, Sendable {
    case misleading
    case financial
    case health
    case adult
    case gambling
    case spam
    case copyright
    case politics
    case other
}