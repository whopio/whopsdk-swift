import Foundation

/// A messaging channel that can be a one-on-one DM, group chat, company support conversation, or platform-level direct message.
public struct DmChannel: Codable, Hashable, Sendable {
    /// The time the entity was created (in milliseconds since Unix epoch)
    public let createdAt: String
    /// The unique identifier for the entity
    public let id: String
    /// The timestamp when the most recent message was sent in this channel. Null if no messages have been sent.
    public let lastMessageAt: Nullable<Date>
    /// A custom display name assigned to this channel by the user. Null if no custom name has been set.
    public let name: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: String,
        id: String,
        lastMessageAt: Nullable<Date>,
        name: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.id = id
        self.lastMessageAt = lastMessageAt
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastMessageAt = try container.decode(Nullable<Date>.self, forKey: .lastMessageAt)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastMessageAt, forKey: .lastMessageAt)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case id
        case lastMessageAt = "last_message_at"
        case name
    }
}