import Foundation

public struct UpdateAdsRequestLeadFormQuestionsItem: Codable, Hashable, Sendable {
    public let format: UpdateAdsRequestLeadFormQuestionsItemFormat?
    public let label: String?
    public let options: [UpdateAdsRequestLeadFormQuestionsItemOptionsItem]?
    public let type: UpdateAdsRequestLeadFormQuestionsItemType?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        format: UpdateAdsRequestLeadFormQuestionsItemFormat? = nil,
        label: String? = nil,
        options: [UpdateAdsRequestLeadFormQuestionsItemOptionsItem]? = nil,
        type: UpdateAdsRequestLeadFormQuestionsItemType? = nil,
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
        self.format = try container.decodeIfPresent(UpdateAdsRequestLeadFormQuestionsItemFormat.self, forKey: .format)
        self.label = try container.decodeIfPresent(String.self, forKey: .label)
        self.options = try container.decodeIfPresent([UpdateAdsRequestLeadFormQuestionsItemOptionsItem].self, forKey: .options)
        self.type = try container.decodeIfPresent(UpdateAdsRequestLeadFormQuestionsItemType.self, forKey: .type)
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