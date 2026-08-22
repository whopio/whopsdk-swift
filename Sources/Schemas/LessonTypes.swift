import Foundation

/// The available types for a lesson
public enum LessonTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case text
    case video
    case pdf
    case multi
    case quiz
    case knowledgeCheck = "knowledge_check"
}