import Foundation

extension Requests {
    public struct CreateMessagesRequest: Codable, Hashable, Sendable {
        /// A list of file attachments to include with the message, such as images or videos.
        public let attachments: Nullable<[CreateMessagesRequestAttachmentsItem]>?
        /// Automatically detect URLs in the message and generate link previews.
        public let autoDetectLinks: Nullable<Bool>?
        /// The unique identifier of the channel or experience to send the message in. For example, 'exp_xxxxx' or 'feed_xxxxx'.
        public let channelId: String
        /// The body of the message in Markdown format. For example, 'Hello **world**'.
        public let content: String
        /// A poll to attach to this message, allowing recipients to vote on options.
        public let poll: Nullable<CreateMessagesRequestPoll>?
        /// The unique identifier of the message this is replying to, creating a threaded reply.
        public let replyingToMessageId: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            attachments: Nullable<[CreateMessagesRequestAttachmentsItem]>? = nil,
            autoDetectLinks: Nullable<Bool>? = nil,
            channelId: String,
            content: String,
            poll: Nullable<CreateMessagesRequestPoll>? = nil,
            replyingToMessageId: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.attachments = attachments
            self.autoDetectLinks = autoDetectLinks
            self.channelId = channelId
            self.content = content
            self.poll = poll
            self.replyingToMessageId = replyingToMessageId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.attachments = try container.decodeNullableIfPresent([CreateMessagesRequestAttachmentsItem].self, forKey: .attachments)
            self.autoDetectLinks = try container.decodeNullableIfPresent(Bool.self, forKey: .autoDetectLinks)
            self.channelId = try container.decode(String.self, forKey: .channelId)
            self.content = try container.decode(String.self, forKey: .content)
            self.poll = try container.decodeNullableIfPresent(CreateMessagesRequestPoll.self, forKey: .poll)
            self.replyingToMessageId = try container.decodeNullableIfPresent(String.self, forKey: .replyingToMessageId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.attachments, forKey: .attachments)
            try container.encodeNullableIfPresent(self.autoDetectLinks, forKey: .autoDetectLinks)
            try container.encode(self.channelId, forKey: .channelId)
            try container.encode(self.content, forKey: .content)
            try container.encodeNullableIfPresent(self.poll, forKey: .poll)
            try container.encodeNullableIfPresent(self.replyingToMessageId, forKey: .replyingToMessageId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case attachments
            case autoDetectLinks = "auto_detect_links"
            case channelId = "channel_id"
            case content
            case poll
            case replyingToMessageId = "replying_to_message_id"
        }
    }
}