import Foundation

/// A poll attached to this message. Null if the message does not contain a poll.
public struct MessageListItemPoll: Codable, Hashable, Sendable {
    /// The options for the poll
    public let options: Nullable<[MessageListItemPollOptionsItem]>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        options: Nullable<[MessageListItemPollOptionsItem]>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.options = options
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.options = try container.decode(Nullable<[MessageListItemPollOptionsItem]>.self, forKey: .options)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.options, forKey: .options)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case options
    }
}