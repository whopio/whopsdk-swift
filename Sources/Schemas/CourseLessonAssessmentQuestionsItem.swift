import Foundation

/// An assessment question in a course quiz or knowledge check
public struct CourseLessonAssessmentQuestionsItem: Codable, Hashable, Sendable {
    /// The correct answer for the question. Used for short answer questions. Only visible to admins (users with courses:update permission)
    public let correctAnswer: Nullable<String>
    /// The datetime the assessment question was created.
    public let createdAt: Date
    /// The unique identifier for the assessment question.
    public let id: String
    /// Optional image attachment for the question
    public let image: Nullable<CourseLessonAssessmentQuestionsItemImage>
    /// The answer options for multiple choice/select questions
    public let options: [CourseLessonAssessmentQuestionsItemOptionsItem]
    /// The order of the question within its lesson
    public let order: Int
    /// The text of the question
    public let questionText: String
    /// The type of the question
    public let questionType: CoursesAssessmentQuestionTypes
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        correctAnswer: Nullable<String>,
        createdAt: Date,
        id: String,
        image: Nullable<CourseLessonAssessmentQuestionsItemImage>,
        options: [CourseLessonAssessmentQuestionsItemOptionsItem],
        order: Int,
        questionText: String,
        questionType: CoursesAssessmentQuestionTypes,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.correctAnswer = correctAnswer
        self.createdAt = createdAt
        self.id = id
        self.image = image
        self.options = options
        self.order = order
        self.questionText = questionText
        self.questionType = questionType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.correctAnswer = try container.decode(Nullable<String>.self, forKey: .correctAnswer)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.image = try container.decode(Nullable<CourseLessonAssessmentQuestionsItemImage>.self, forKey: .image)
        self.options = try container.decode([CourseLessonAssessmentQuestionsItemOptionsItem].self, forKey: .options)
        self.order = try container.decode(Int.self, forKey: .order)
        self.questionText = try container.decode(String.self, forKey: .questionText)
        self.questionType = try container.decode(CoursesAssessmentQuestionTypes.self, forKey: .questionType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.correctAnswer, forKey: .correctAnswer)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.image, forKey: .image)
        try container.encode(self.options, forKey: .options)
        try container.encode(self.order, forKey: .order)
        try container.encode(self.questionText, forKey: .questionText)
        try container.encode(self.questionType, forKey: .questionType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case correctAnswer = "correct_answer"
        case createdAt = "created_at"
        case id
        case image
        case options
        case order
        case questionText = "question_text"
        case questionType = "question_type"
    }
}