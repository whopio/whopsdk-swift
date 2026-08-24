import Foundation

/// The passing criteria for quiz or knowledge check lessons, such as minimum grade or correct answers.
public struct UpdateCourseLessonsRequestAssessmentCompletionRequirement: Codable, Hashable, Sendable {
    /// The minimum grade percentage required to pass (0-100). Cannot be set together with minimum_questions_correct.
    public let minimumGradePercent: Nullable<Double>?
    /// The minimum number of questions that must be answered correctly. Cannot be set together with minimum_grade_percent.
    public let minimumQuestionsCorrect: Nullable<Int>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        minimumGradePercent: Nullable<Double>? = nil,
        minimumQuestionsCorrect: Nullable<Int>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.minimumGradePercent = minimumGradePercent
        self.minimumQuestionsCorrect = minimumQuestionsCorrect
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.minimumGradePercent = try container.decodeNullableIfPresent(Double.self, forKey: .minimumGradePercent)
        self.minimumQuestionsCorrect = try container.decodeNullableIfPresent(Int.self, forKey: .minimumQuestionsCorrect)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.minimumGradePercent, forKey: .minimumGradePercent)
        try container.encodeNullableIfPresent(self.minimumQuestionsCorrect, forKey: .minimumQuestionsCorrect)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case minimumGradePercent = "minimum_grade_percent"
        case minimumQuestionsCorrect = "minimum_questions_correct"
    }
}