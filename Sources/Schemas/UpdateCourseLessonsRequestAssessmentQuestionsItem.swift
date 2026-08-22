import Foundation

/// Input for creating or updating an assessment question
public struct UpdateCourseLessonsRequestAssessmentQuestionsItem: Codable, Hashable, Sendable {
    /// The correct answer for the question. Used for short answer questions
    public let correctAnswer: String
    /// The ID of an existing question. If provided, the question will be updated. If not provided, a new question will be created.
    public let id: Nullable<String>?
    /// Optional image attachment for the question
    public let image: Nullable<UpdateCourseLessonsRequestAssessmentQuestionsItemImage>?
    /// The answer options for multiple choice/select questions
    public let options: Nullable<[UpdateCourseLessonsRequestAssessmentQuestionsItemOptionsItem]>?
    /// The text of the question
    public let questionText: String
    /// The type of the question
    public let questionType: CoursesAssessmentQuestionTypes
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        correctAnswer: String,
        id: Nullable<String>? = nil,
        image: Nullable<UpdateCourseLessonsRequestAssessmentQuestionsItemImage>? = nil,
        options: Nullable<[UpdateCourseLessonsRequestAssessmentQuestionsItemOptionsItem]>? = nil,
        questionText: String,
        questionType: CoursesAssessmentQuestionTypes,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.correctAnswer = correctAnswer
        self.id = id
        self.image = image
        self.options = options
        self.questionText = questionText
        self.questionType = questionType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.correctAnswer = try container.decode(String.self, forKey: .correctAnswer)
        self.id = try container.decodeNullableIfPresent(String.self, forKey: .id)
        self.image = try container.decodeNullableIfPresent(UpdateCourseLessonsRequestAssessmentQuestionsItemImage.self, forKey: .image)
        self.options = try container.decodeNullableIfPresent([UpdateCourseLessonsRequestAssessmentQuestionsItemOptionsItem].self, forKey: .options)
        self.questionText = try container.decode(String.self, forKey: .questionText)
        self.questionType = try container.decode(CoursesAssessmentQuestionTypes.self, forKey: .questionType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.correctAnswer, forKey: .correctAnswer)
        try container.encodeNullableIfPresent(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.image, forKey: .image)
        try container.encodeNullableIfPresent(self.options, forKey: .options)
        try container.encode(self.questionText, forKey: .questionText)
        try container.encode(self.questionType, forKey: .questionType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case correctAnswer = "correct_answer"
        case id
        case image
        case options
        case questionText = "question_text"
        case questionType = "question_type"
    }
}