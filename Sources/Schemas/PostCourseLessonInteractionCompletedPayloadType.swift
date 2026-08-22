import Foundation

/// The webhook event type
public enum PostCourseLessonInteractionCompletedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case courseLessonInteractionCompleted = "course_lesson_interaction.completed"
}