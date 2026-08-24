import Foundation

extension Requests {
    public struct SubmitAssessmentCourseLessonsRequest: Codable, Hashable, Sendable {
        /// The list of answers to submit for each assessment question.
        public let answers: [SubmitAssessmentCourseLessonsRequestAnswersItem]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            answers: [SubmitAssessmentCourseLessonsRequestAnswersItem],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.answers = answers
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.answers = try container.decode([SubmitAssessmentCourseLessonsRequestAnswersItem].self, forKey: .answers)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.answers, forKey: .answers)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case answers
        }
    }
}