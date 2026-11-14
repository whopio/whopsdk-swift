import Foundation

public struct EconomicIntelligenceInput: Codable, Hashable, Sendable {
    /// What the run used: one of the options, or your own text for a `whop_ai` recommendation. `null` until a run starts.
    public let answer: Nullable<String>
    /// Identifies the input when you answer it.
    public let id: String
    /// What you are choosing, such as the daily ad budget.
    public let label: String
    public let options: [String]
    /// A plan sentence with one {answer} blank to fill with the selected answer.
    public let template: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        answer: Nullable<String>,
        id: String,
        label: String,
        options: [String],
        template: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.answer = answer
        self.id = id
        self.label = label
        self.options = options
        self.template = template
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.answer = try container.decode(Nullable<String>.self, forKey: .answer)
        self.id = try container.decode(String.self, forKey: .id)
        self.label = try container.decode(String.self, forKey: .label)
        self.options = try container.decode([String].self, forKey: .options)
        self.template = try container.decode(String.self, forKey: .template)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.answer, forKey: .answer)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.label, forKey: .label)
        try container.encode(self.options, forKey: .options)
        try container.encode(self.template, forKey: .template)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case answer
        case id
        case label
        case options
        case template
    }
}