import Foundation

public struct AdGroupKeyword: Codable, Hashable, Sendable {
    /// How closely a search has to match: `broad` also reaches related searches, `phrase` needs the meaning of the phrase, and `exact` needs the same meaning as the term. Defaults to `broad`.
    public let matchType: AdGroupKeywordMatchType
    /// Whether this term keeps the ads from showing instead of making them eligible. Defaults to `false`.
    public let negative: Bool
    /// The search term, up to 80 characters and 10 words.
    public let text: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        matchType: AdGroupKeywordMatchType,
        negative: Bool,
        text: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.matchType = matchType
        self.negative = negative
        self.text = text
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.matchType = try container.decode(AdGroupKeywordMatchType.self, forKey: .matchType)
        self.negative = try container.decode(Bool.self, forKey: .negative)
        self.text = try container.decode(String.self, forKey: .text)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.matchType, forKey: .matchType)
        try container.encode(self.negative, forKey: .negative)
        try container.encode(self.text, forKey: .text)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case matchType = "match_type"
        case negative
        case text
    }
}