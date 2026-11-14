import Foundation

extension Requests {
    public struct UpdateFinancingApplicationsRequest: Codable, Hashable, Sendable {
        public let answers: [UpdateFinancingApplicationsRequestAnswersItem]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            answers: [UpdateFinancingApplicationsRequestAnswersItem],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.answers = answers
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.answers = try container.decode([UpdateFinancingApplicationsRequestAnswersItem].self, forKey: .answers)
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