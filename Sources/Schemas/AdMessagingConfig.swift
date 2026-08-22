import Foundation

public struct AdMessagingConfig: Codable, Hashable, Sendable {
    /// Suggested reply the person can tap to start the conversation.
    public let keyword: Nullable<String>
    /// Greeting shown when the conversation opens.
    public let message: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        keyword: Nullable<String>,
        message: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.keyword = keyword
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.keyword = try container.decode(Nullable<String>.self, forKey: .keyword)
        self.message = try container.decode(Nullable<String>.self, forKey: .message)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.keyword, forKey: .keyword)
        try container.encode(self.message, forKey: .message)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case keyword
        case message
    }
}