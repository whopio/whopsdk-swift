import Foundation

public struct AdLeadFormCompletion: Codable, Hashable, Sendable {
    /// Text of the follow-up button.
    public let buttonText: Nullable<String>
    /// Body text under the headline.
    public let description: Nullable<String>
    /// Headline of the completion screen.
    public let headline: Nullable<String>
    /// Website the follow-up button opens. `null` when the screen has no button.
    public let url: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        buttonText: Nullable<String>,
        description: Nullable<String>,
        headline: Nullable<String>,
        url: Nullable<String>,
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
        self.buttonText = try container.decode(Nullable<String>.self, forKey: .buttonText)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.headline = try container.decode(Nullable<String>.self, forKey: .headline)
        self.url = try container.decode(Nullable<String>.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.buttonText, forKey: .buttonText)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.headline, forKey: .headline)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case buttonText = "button_text"
        case description
        case headline
        case url
    }
}