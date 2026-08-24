import Foundation

/// An answer option for a multiple choice or multiple select assessment question
public struct CourseLessonAssessmentQuestionsItemOptionsItem: Codable, Hashable, Sendable {
    /// The unique identifier for the assessment question option.
    public let id: String
    /// Whether this option is a correct answer. Only visible to admins (users with courses:update permission)
    public let isCorrect: Nullable<Bool>
    /// The text of the answer option
    public let optionText: String
    /// The order of this option within the question
    public let order: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        isCorrect: Nullable<Bool>,
        optionText: String,
        order: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.isCorrect = isCorrect
        self.optionText = optionText
        self.order = order
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.isCorrect = try container.decode(Nullable<Bool>.self, forKey: .isCorrect)
        self.optionText = try container.decode(String.self, forKey: .optionText)
        self.order = try container.decode(Int.self, forKey: .order)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.isCorrect, forKey: .isCorrect)
        try container.encode(self.optionText, forKey: .optionText)
        try container.encode(self.order, forKey: .order)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case isCorrect = "is_correct"
        case optionText = "option_text"
        case order
    }
}