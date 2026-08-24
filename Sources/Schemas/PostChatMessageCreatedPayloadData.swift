import Foundation

public struct PostChatMessageCreatedPayloadData: Codable, Hashable, Sendable {
    public let audience: PostChatMessageCreatedPayloadDataAudience
    public let channel: PostChatMessageCreatedPayloadDataChannel
    public let message: Message
    public let reason: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        audience: PostChatMessageCreatedPayloadDataAudience,
        channel: PostChatMessageCreatedPayloadDataChannel,
        message: Message,
        reason: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.audience = audience
        self.channel = channel
        self.message = message
        self.reason = reason
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.audience = try container.decode(PostChatMessageCreatedPayloadDataAudience.self, forKey: .audience)
        self.channel = try container.decode(PostChatMessageCreatedPayloadDataChannel.self, forKey: .channel)
        self.message = try container.decode(Message.self, forKey: .message)
        self.reason = try container.decode(String.self, forKey: .reason)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.audience, forKey: .audience)
        try container.encode(self.channel, forKey: .channel)
        try container.encode(self.message, forKey: .message)
        try container.encode(self.reason, forKey: .reason)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case audience
        case channel
        case message
        case reason
    }
}