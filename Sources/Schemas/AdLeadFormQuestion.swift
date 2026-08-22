import Foundation

public struct AdLeadFormQuestion: Codable, Hashable, Sendable {
    /// Answer format for `custom` questions: `short_answer`, `multiple_choice`, or `appointment`. Absent otherwise.
    public let format: String?
    /// Question text for `custom` questions. Absent for standard prefill questions.
    public let label: String?
    public let options: [AdLeadFormQuestionOption]?
    /// Question type: a standard prefill type such as `email`, `phone`, or `full_name`, or `custom` for your own question.
    public let type: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        format: String? = nil,
        label: String? = nil,
        options: [AdLeadFormQuestionOption]? = nil,
        type: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.format = format
        self.label = label
        self.options = options
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.format = try container.decodeIfPresent(String.self, forKey: .format)
        self.label = try container.decodeIfPresent(String.self, forKey: .label)
        self.options = try container.decodeIfPresent([AdLeadFormQuestionOption].self, forKey: .options)
        self.type = try container.decode(String.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.format, forKey: .format)
        try container.encodeIfPresent(self.label, forKey: .label)
        try container.encodeIfPresent(self.options, forKey: .options)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case format
        case label
        case options
        case type
    }
}