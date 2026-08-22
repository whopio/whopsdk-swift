import Foundation

public struct DescribeStatsResponseDescribeViewAssociationsItem: Codable, Hashable, Sendable {
    /// The association name.
    public let name: String
    /// The type (belongs_to, has_many, has_one, event, namespace).
    public let type: String
    /// The associated model class name (for model associations).
    public let model: Nullable<String>
    /// The full path (for event associations).
    public let path: Nullable<String>
    /// The event name (for event type).
    public let eventName: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        type: String,
        model: Nullable<String>,
        path: Nullable<String>,
        eventName: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.type = type
        self.model = model
        self.path = path
        self.eventName = eventName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
        self.model = try container.decode(Nullable<String>.self, forKey: .model)
        self.path = try container.decode(Nullable<String>.self, forKey: .path)
        self.eventName = try container.decode(Nullable<String>.self, forKey: .eventName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.model, forKey: .model)
        try container.encode(self.path, forKey: .path)
        try container.encode(self.eventName, forKey: .eventName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case type
        case model
        case path
        case eventName = "event_name"
    }
}