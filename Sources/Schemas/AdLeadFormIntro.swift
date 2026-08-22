import Foundation

public struct AdLeadFormIntro: Codable, Hashable, Sendable {
    /// Body text under the headline.
    public let description: Nullable<String>
    /// Headline of the intro screen.
    public let headline: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        description: Nullable<String>,
        headline: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.description = description
        self.headline = headline
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.headline = try container.decode(Nullable<String>.self, forKey: .headline)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.headline, forKey: .headline)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case description
        case headline
    }
}