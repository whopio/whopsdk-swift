import Foundation

public struct ChatMessagePollOption: Codable, Hashable, Sendable {
    /// Option identifier within the poll.
    public let id: String
    public let text: String
    public let voteCount: Int
    /// Whether you voted for this option.
    public let voted: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        text: String,
        voteCount: Int,
        voted: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.text = text
        self.voteCount = voteCount
        self.voted = voted
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.text = try container.decode(String.self, forKey: .text)
        self.voteCount = try container.decode(Int.self, forKey: .voteCount)
        self.voted = try container.decode(Bool.self, forKey: .voted)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.text, forKey: .text)
        try container.encode(self.voteCount, forKey: .voteCount)
        try container.encode(self.voted, forKey: .voted)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case text
        case voteCount = "vote_count"
        case voted
    }
}