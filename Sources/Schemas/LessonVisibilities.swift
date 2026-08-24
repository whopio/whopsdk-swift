import Foundation

/// The available visibilities for a lesson. Determines how / whether a lesson is visible to users.
public enum LessonVisibilities: String, Codable, Hashable, CaseIterable, Sendable {
    case visible
    case hidden
}