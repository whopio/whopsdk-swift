import Foundation

/// Optional intro screen shown before the questions.
public struct UpdateAdsRequestLeadFormIntro: Codable, Hashable, Sendable {
    public let description: String?
    public let headline: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        description: String? = nil,
        headline: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.description = description
        self.headline = headline
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.headline = try container.decodeIfPresent(String.self, forKey: .headline)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.headline, forKey: .headline)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case description
        case headline
    }
}