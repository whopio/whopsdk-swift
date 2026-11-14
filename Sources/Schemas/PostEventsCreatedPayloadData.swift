import Foundation

public struct PostEventsCreatedPayloadData: Codable, Hashable, Sendable {
    /// Up to 50 of the account's new events, in the order Whop recorded them.
    public let events: [PostEventsCreatedPayloadDataEventsItem]
    /// The batch id. The same events always carry the same id, so a redelivered batch can be ignored.
    public let id: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        events: [PostEventsCreatedPayloadDataEventsItem],
        id: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.events = events
        self.id = id
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.events = try container.decode([PostEventsCreatedPayloadDataEventsItem].self, forKey: .events)
        self.id = try container.decode(String.self, forKey: .id)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.events, forKey: .events)
        try container.encode(self.id, forKey: .id)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case events
        case id
    }
}