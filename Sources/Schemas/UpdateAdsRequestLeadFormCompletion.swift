import Foundation

/// Optional completion screen shown after submission; url sets the follow-up website button.
public struct UpdateAdsRequestLeadFormCompletion: Codable, Hashable, Sendable {
    public let buttonText: String?
    public let description: String?
    public let headline: String?
    public let url: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        buttonText: String? = nil,
        description: String? = nil,
        headline: String? = nil,
        url: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.buttonText = buttonText
        self.description = description
        self.headline = headline
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.buttonText = try container.decodeIfPresent(String.self, forKey: .buttonText)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.headline = try container.decodeIfPresent(String.self, forKey: .headline)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.buttonText, forKey: .buttonText)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.headline, forKey: .headline)
        try container.encodeIfPresent(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case buttonText = "button_text"
        case description
        case headline
        case url
    }
}