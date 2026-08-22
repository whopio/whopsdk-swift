import Foundation

/// Represents a reaction count for a feed post
public struct MessageListItemPollVotesItem: Codable, Hashable, Sendable {
    /// The number of users who reacted
    public let count: Int
    /// The reaction that was used
    public let optionId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        count: Int,
        optionId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.count = count
        self.optionId = optionId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decode(Int.self, forKey: .count)
        self.optionId = try container.decode(Nullable<String>.self, forKey: .optionId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.count, forKey: .count)
        try container.encode(self.optionId, forKey: .optionId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case count
        case optionId = "option_id"
    }
}