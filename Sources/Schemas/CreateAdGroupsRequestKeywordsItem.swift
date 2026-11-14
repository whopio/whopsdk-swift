import Foundation

public struct CreateAdGroupsRequestKeywordsItem: Codable, Hashable, Sendable {
    /// How closely a search has to match: `broad` also reaches related searches, `phrase` needs the meaning of the phrase, and `exact` needs the same meaning as the term. Defaults to `broad`.
    public let matchType: CreateAdGroupsRequestKeywordsItemMatchType?
    /// Set to `true` to keep the ads from showing for this term instead. Defaults to `false`.
    public let negative: Bool?
    /// The search term, up to 80 characters and 10 words. Symbols such as ! @ % , * = ^ ; ~ | < > ? ( ) { } and quotes aren't allowed: set the match with match_type instead.
    public let text: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        matchType: CreateAdGroupsRequestKeywordsItemMatchType? = nil,
        negative: Bool? = nil,
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
        self.matchType = try container.decodeIfPresent(CreateAdGroupsRequestKeywordsItemMatchType.self, forKey: .matchType)
        self.negative = try container.decodeIfPresent(Bool.self, forKey: .negative)
        self.text = try container.decode(String.self, forKey: .text)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.matchType, forKey: .matchType)
        try container.encodeIfPresent(self.negative, forKey: .negative)
        try container.encode(self.text, forKey: .text)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case matchType = "match_type"
        case negative
        case text
    }
}