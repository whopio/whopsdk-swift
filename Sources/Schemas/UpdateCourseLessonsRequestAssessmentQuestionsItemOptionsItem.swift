import Foundation

/// Input for creating or updating an assessment question option
public struct UpdateCourseLessonsRequestAssessmentQuestionsItemOptionsItem: Codable, Hashable, Sendable {
    /// The ID of an existing option. If provided, the option will be updated. If not provided, a new option will be created.
    public let id: Nullable<String>?
    /// Whether this option is a correct answer
    public let isCorrect: Bool
    /// The text of the answer option
    public let optionText: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: Nullable<String>? = nil,
        isCorrect: Bool,
        optionText: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.isCorrect = isCorrect
        self.optionText = optionText
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeNullableIfPresent(String.self, forKey: .id)
        self.isCorrect = try container.decode(Bool.self, forKey: .isCorrect)
        self.optionText = try container.decode(String.self, forKey: .optionText)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.id, forKey: .id)
        try container.encode(self.isCorrect, forKey: .isCorrect)
        try container.encode(self.optionText, forKey: .optionText)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case isCorrect = "is_correct"
        case optionText = "option_text"
    }
}