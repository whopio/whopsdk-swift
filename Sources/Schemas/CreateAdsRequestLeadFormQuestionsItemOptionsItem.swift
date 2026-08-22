import Foundation

public struct CreateAdsRequestLeadFormQuestionsItemOptionsItem: Codable, Hashable, Sendable {
    public let key: String?
    public let logic: CreateAdsRequestLeadFormQuestionsItemOptionsItemLogic?
    public let value: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        key: String? = nil,
        logic: CreateAdsRequestLeadFormQuestionsItemOptionsItemLogic? = nil,
        value: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.key = key
        self.logic = logic
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try container.decodeIfPresent(String.self, forKey: .key)
        self.logic = try container.decodeIfPresent(CreateAdsRequestLeadFormQuestionsItemOptionsItemLogic.self, forKey: .logic)
        self.value = try container.decodeIfPresent(String.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.key, forKey: .key)
        try container.encodeIfPresent(self.logic, forKey: .logic)
        try container.encodeIfPresent(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case key
        case logic
        case value
    }
}