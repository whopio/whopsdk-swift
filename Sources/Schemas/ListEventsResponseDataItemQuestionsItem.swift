import Foundation

public struct ListEventsResponseDataItemQuestionsItem: Codable, Hashable, Sendable {
    public let answer: Nullable<String>?
    public let id: Nullable<String>?
    public let key: Nullable<String>?
    public let options: Nullable<[String]>?
    public let question: Nullable<String>?
    public let type: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        answer: Nullable<String>? = nil,
        id: Nullable<String>? = nil,
        key: Nullable<String>? = nil,
        options: Nullable<[String]>? = nil,
        question: Nullable<String>? = nil,
        type: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.answer = answer
        self.id = id
        self.key = key
        self.options = options
        self.question = question
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.answer = try container.decodeNullableIfPresent(String.self, forKey: .answer)
        self.id = try container.decodeNullableIfPresent(String.self, forKey: .id)
        self.key = try container.decodeNullableIfPresent(String.self, forKey: .key)
        self.options = try container.decodeNullableIfPresent([String].self, forKey: .options)
        self.question = try container.decodeNullableIfPresent(String.self, forKey: .question)
        self.type = try container.decodeNullableIfPresent(String.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.answer, forKey: .answer)
        try container.encodeNullableIfPresent(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.key, forKey: .key)
        try container.encodeNullableIfPresent(self.options, forKey: .options)
        try container.encodeNullableIfPresent(self.question, forKey: .question)
        try container.encodeNullableIfPresent(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case answer
        case id
        case key
        case options
        case question
        case type
    }
}