import Foundation

public struct AdLeadFormQuestionOption: Codable, Hashable, Sendable {
    /// Stable identifier the choice's answers are stored under. Absent for simple choices.
    public let key: Nullable<String>?
    /// Where the form goes when this choice is selected. Absent when the form just continues to the next question.
    public let logic: AdLeadFormOptionLogic?
    /// Choice text shown to the person.
    public let value: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        key: Nullable<String>? = nil,
        logic: AdLeadFormOptionLogic? = nil,
        value: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.key = key
        self.logic = logic
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try container.decodeNullableIfPresent(String.self, forKey: .key)
        self.logic = try container.decodeIfPresent(AdLeadFormOptionLogic.self, forKey: .logic)
        self.value = try container.decode(String.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.key, forKey: .key)
        try container.encodeIfPresent(self.logic, forKey: .logic)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case key
        case logic
        case value
    }
}