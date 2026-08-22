import Foundation

/// The available visibilities for a course. Determines how / whether a course is visible to users.
public enum CourseVisibilities: String, Codable, Hashable, CaseIterable, Sendable {
    case visible
    case hidden
}