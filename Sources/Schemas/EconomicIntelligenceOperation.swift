import Foundation

public struct EconomicIntelligenceOperation: Codable, Hashable, Sendable {
    /// Concise description of the operation and affected resource, or null for older recommendations.
    public let description: Nullable<String>
    /// API operation or assistant tool name.
    public let toolName: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        description: Nullable<String>,
        toolName: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.description = description
        self.toolName = toolName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.toolName = try container.decode(String.self, forKey: .toolName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.toolName, forKey: .toolName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case description
        case toolName = "tool_name"
    }
}