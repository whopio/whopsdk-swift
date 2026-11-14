import Foundation

/// The kind of issue: information about delivery, a warning, or an error requiring attention.
public enum AdPlatformIssueCategory: String, Codable, Hashable, CaseIterable, Sendable {
    case information
    case warning
    case error
}