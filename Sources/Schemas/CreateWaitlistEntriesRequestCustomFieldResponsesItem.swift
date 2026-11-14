import Foundation

public struct CreateWaitlistEntriesRequestCustomFieldResponsesItem: Codable, Hashable, Sendable {
    /// The buyer's answer.
    public let answer: String
    /// The checkout question being answered, prefixed `field_`.
    public let customFieldId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        answer: String,
        customFieldId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.answer = answer
        self.customFieldId = customFieldId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.answer = try container.decode(String.self, forKey: .answer)
        self.customFieldId = try container.decode(String.self, forKey: .customFieldId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.answer, forKey: .answer)
        try container.encode(self.customFieldId, forKey: .customFieldId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case answer
        case customFieldId = "custom_field_id"
    }
}