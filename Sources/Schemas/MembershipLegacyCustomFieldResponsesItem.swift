import Foundation

/// The response from a custom field on checkout
public struct MembershipLegacyCustomFieldResponsesItem: Codable, Hashable, Sendable {
    /// The response a user gave to the specific question or field.
    public let answer: String
    /// The unique identifier for the custom field response.
    public let id: String
    /// The question asked by the custom field
    public let question: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        answer: String,
        id: String,
        question: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.answer = answer
        self.id = id
        self.question = question
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.answer = try container.decode(String.self, forKey: .answer)
        self.id = try container.decode(String.self, forKey: .id)
        self.question = try container.decode(String.self, forKey: .question)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.answer, forKey: .answer)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.question, forKey: .question)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case answer
        case id
        case question
    }
}