import Foundation

public struct ListLogsResponseDataItem: Codable, Hashable, Sendable {
    public let action: Nullable<String>
    public let actor: Nullable<ListLogsResponseDataItemActor>
    public let createdAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        action: Nullable<String>,
        actor: Nullable<ListLogsResponseDataItemActor>,
        createdAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.action = action
        self.actor = actor
        self.createdAt = createdAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decode(Nullable<String>.self, forKey: .action)
        self.actor = try container.decode(Nullable<ListLogsResponseDataItemActor>.self, forKey: .actor)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.action, forKey: .action)
        try container.encode(self.actor, forKey: .actor)
        try container.encode(self.createdAt, forKey: .createdAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case action
        case actor
        case createdAt = "created_at"
    }
}