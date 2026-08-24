import Foundation

public struct CreateAdsRequestLeadFormQuestionsItem: Codable, Hashable, Sendable {
    public let format: CreateAdsRequestLeadFormQuestionsItemFormat?
    public let label: String?
    public let options: [CreateAdsRequestLeadFormQuestionsItemOptionsItem]?
    public let type: CreateAdsRequestLeadFormQuestionsItemType?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        format: CreateAdsRequestLeadFormQuestionsItemFormat? = nil,
        label: String? = nil,
        options: [CreateAdsRequestLeadFormQuestionsItemOptionsItem]? = nil,
        type: CreateAdsRequestLeadFormQuestionsItemType? = nil,
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
        self.format = try container.decodeIfPresent(CreateAdsRequestLeadFormQuestionsItemFormat.self, forKey: .format)
        self.label = try container.decodeIfPresent(String.self, forKey: .label)
        self.options = try container.decodeIfPresent([CreateAdsRequestLeadFormQuestionsItemOptionsItem].self, forKey: .options)
        self.type = try container.decodeIfPresent(CreateAdsRequestLeadFormQuestionsItemType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.format, forKey: .format)
        try container.encodeIfPresent(self.label, forKey: .label)
        try container.encodeIfPresent(self.options, forKey: .options)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case format
        case label
        case options
        case type
    }
}