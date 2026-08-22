import Foundation

/// The available types for an assessment question
public enum CoursesAssessmentQuestionTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case shortAnswer = "short_answer"
    case trueFalse = "true_false"
    case multipleChoice = "multiple_choice"
    case multipleSelect = "multiple_select"
}