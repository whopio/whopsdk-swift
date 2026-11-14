import Foundation

public struct MessageReactionCount: Codable, Hashable, Sendable {
    public let kind: MessageReactionCountKind
    /// Whether you reacted with this value.
    public let reacted: Bool
    public let totalScore: Int
    public let userCount: Int
    /// The Unicode emoji for an emoji reaction. For other reaction kinds, the reaction's value.
    public let value: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        kind: MessageReactionCountKind,
        reacted: Bool,
        totalScore: Int,
        userCount: Int,
        value: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.kind = kind
        self.reacted = reacted
        self.totalScore = totalScore
        self.userCount = userCount
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.kind = try container.decode(MessageReactionCountKind.self, forKey: .kind)
        self.reacted = try container.decode(Bool.self, forKey: .reacted)
        self.totalScore = try container.decode(Int.self, forKey: .totalScore)
        self.userCount = try container.decode(Int.self, forKey: .userCount)
        self.value = try container.decode(Nullable<String>.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.kind, forKey: .kind)
        try container.encode(self.reacted, forKey: .reacted)
        try container.encode(self.totalScore, forKey: .totalScore)
        try container.encode(self.userCount, forKey: .userCount)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case kind
        case reacted
        case totalScore = "total_score"
        case userCount = "user_count"
        case value
    }
}