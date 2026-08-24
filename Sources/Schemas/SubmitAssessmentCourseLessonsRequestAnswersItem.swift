import Foundation

/// Input for a single question's answer in an assessment submission
public struct SubmitAssessmentCourseLessonsRequestAnswersItem: Codable, Hashable, Sendable {
    /// The text answer provided by the user (for short answer questions)
    public let answerText: Nullable<String>?
    /// The ID of the question being answered
    public let questionId: String
    /// The IDs of the selected options (for multiple choice/select questions)
    public let selectedOptionIds: Nullable<[String]>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        answerText: Nullable<String>? = nil,
        questionId: String,
        selectedOptionIds: Nullable<[String]>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.answerText = answerText
        self.questionId = questionId
        self.selectedOptionIds = selectedOptionIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.answerText = try container.decodeNullableIfPresent(String.self, forKey: .answerText)
        self.questionId = try container.decode(String.self, forKey: .questionId)
        self.selectedOptionIds = try container.decodeNullableIfPresent([String].self, forKey: .selectedOptionIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.answerText, forKey: .answerText)
        try container.encode(self.questionId, forKey: .questionId)
        try container.encodeNullableIfPresent(self.selectedOptionIds, forKey: .selectedOptionIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case answerText = "answer_text"
        case questionId = "question_id"
        case selectedOptionIds = "selected_option_ids"
    }
}