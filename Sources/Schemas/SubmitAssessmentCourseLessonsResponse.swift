import Foundation

/// The result of a user's assessment attempt
public struct SubmitAssessmentCourseLessonsResponse: Codable, Hashable, Sendable {
    /// The datetime the assessment result was created.
    public let createdAt: Date
    /// The unique identifier for the assessment result.
    public let id: String
    /// The lesson this assessment result is for
    public let lesson: SubmitAssessmentCourseLessonsResponseLesson
    /// The number of correct answers
    public let resultCorrect: Int
    /// The grade achieved on the assessment
    public let resultGrade: Double
    /// Array of graded questions with details
    public let resultGradedQuestions: [String: JSONValue]
    /// Whether the user achieved a passing grade
    public let resultPassingGrade: Bool
    /// The total number of questions in the assessment
    public let resultQuestionCount: Int
    /// The percentage score achieved on the assessment
    public let scorePercent: Double
    /// The datetime the assessment result was last updated.
    public let updatedAt: Date
    /// The user who took the assessment
    public let user: SubmitAssessmentCourseLessonsResponseUser
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: Date,
        id: String,
        lesson: SubmitAssessmentCourseLessonsResponseLesson,
        resultCorrect: Int,
        resultGrade: Double,
        resultGradedQuestions: [String: JSONValue],
        resultPassingGrade: Bool,
        resultQuestionCount: Int,
        scorePercent: Double,
        updatedAt: Date,
        user: SubmitAssessmentCourseLessonsResponseUser,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.id = id
        self.lesson = lesson
        self.resultCorrect = resultCorrect
        self.resultGrade = resultGrade
        self.resultGradedQuestions = resultGradedQuestions
        self.resultPassingGrade = resultPassingGrade
        self.resultQuestionCount = resultQuestionCount
        self.scorePercent = scorePercent
        self.updatedAt = updatedAt
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.lesson = try container.decode(SubmitAssessmentCourseLessonsResponseLesson.self, forKey: .lesson)
        self.resultCorrect = try container.decode(Int.self, forKey: .resultCorrect)
        self.resultGrade = try container.decode(Double.self, forKey: .resultGrade)
        self.resultGradedQuestions = try container.decode([String: JSONValue].self, forKey: .resultGradedQuestions)
        self.resultPassingGrade = try container.decode(Bool.self, forKey: .resultPassingGrade)
        self.resultQuestionCount = try container.decode(Int.self, forKey: .resultQuestionCount)
        self.scorePercent = try container.decode(Double.self, forKey: .scorePercent)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.user = try container.decode(SubmitAssessmentCourseLessonsResponseUser.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lesson, forKey: .lesson)
        try container.encode(self.resultCorrect, forKey: .resultCorrect)
        try container.encode(self.resultGrade, forKey: .resultGrade)
        try container.encode(self.resultGradedQuestions, forKey: .resultGradedQuestions)
        try container.encode(self.resultPassingGrade, forKey: .resultPassingGrade)
        try container.encode(self.resultQuestionCount, forKey: .resultQuestionCount)
        try container.encode(self.scorePercent, forKey: .scorePercent)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case id
        case lesson
        case resultCorrect = "result_correct"
        case resultGrade = "result_grade"
        case resultGradedQuestions = "result_graded_questions"
        case resultPassingGrade = "result_passing_grade"
        case resultQuestionCount = "result_question_count"
        case scorePercent = "score_percent"
        case updatedAt = "updated_at"
        case user
    }
}