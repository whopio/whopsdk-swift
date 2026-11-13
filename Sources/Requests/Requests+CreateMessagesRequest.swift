import Foundation

extension Requests {
    public struct CreateMessagesRequest: Codable, Hashable, Sendable {
        /// Files to attach to the message.
        public let attachments: [CreateMessagesRequestAttachmentsItem]?
        /// Generate previews for URLs in content. Mutually exclusive with link_previews.
        public let autoDetectLinks: Bool?
        /// Public channel ID, or an experience ID for experience chat.
        public let channelId: String
        /// Markdown content. May be empty when the message contains media or a poll.
        public let content: String
        /// Up to 10 GIFs to attach. URLs must use HTTPS on static.klipy.com, static1.klipy.com, or static2.klipy.com. Omit to preserve on edit; an empty list clears them.
        public let gifs: [CreateMessagesRequestGifsItem]?
        /// Optional, for clients that show a message before the server confirms it. Use `post_` followed by 22 Base58 characters. Omit to generate an ID. Reuse the same ID and `Idempotency-Key` when retrying a send.
        public let id: String?
        /// Explicit URLs for the server to preview.
        public let linkPreviews: [CreateMessagesRequestLinkPreviewsItem]?
        public let poll: CreateMessagesRequestPoll?
        /// A live message in the same channel to reply to.
        public let replyingToMessageId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            attachments: [CreateMessagesRequestAttachmentsItem]? = nil,
            autoDetectLinks: Bool? = nil,
            channelId: String,
            content: String,
            gifs: [CreateMessagesRequestGifsItem]? = nil,
            id: String? = nil,
            linkPreviews: [CreateMessagesRequestLinkPreviewsItem]? = nil,
            poll: CreateMessagesRequestPoll? = nil,
            replyingToMessageId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.attachments = attachments
            self.autoDetectLinks = autoDetectLinks
            self.channelId = channelId
            self.content = content
            self.gifs = gifs
            self.id = id
            self.linkPreviews = linkPreviews
            self.poll = poll
            self.replyingToMessageId = replyingToMessageId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.attachments = try container.decodeIfPresent([CreateMessagesRequestAttachmentsItem].self, forKey: .attachments)
            self.autoDetectLinks = try container.decodeIfPresent(Bool.self, forKey: .autoDetectLinks)
            self.channelId = try container.decode(String.self, forKey: .channelId)
            self.content = try container.decode(String.self, forKey: .content)
            self.gifs = try container.decodeIfPresent([CreateMessagesRequestGifsItem].self, forKey: .gifs)
            self.id = try container.decodeIfPresent(String.self, forKey: .id)
            self.linkPreviews = try container.decodeIfPresent([CreateMessagesRequestLinkPreviewsItem].self, forKey: .linkPreviews)
            self.poll = try container.decodeIfPresent(CreateMessagesRequestPoll.self, forKey: .poll)
            self.replyingToMessageId = try container.decodeIfPresent(String.self, forKey: .replyingToMessageId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.attachments, forKey: .attachments)
            try container.encodeIfPresent(self.autoDetectLinks, forKey: .autoDetectLinks)
            try container.encode(self.channelId, forKey: .channelId)
            try container.encode(self.content, forKey: .content)
            try container.encodeIfPresent(self.gifs, forKey: .gifs)
            try container.encodeIfPresent(self.id, forKey: .id)
            try container.encodeIfPresent(self.linkPreviews, forKey: .linkPreviews)
            try container.encodeIfPresent(self.poll, forKey: .poll)
            try container.encodeIfPresent(self.replyingToMessageId, forKey: .replyingToMessageId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case attachments
            case autoDetectLinks = "auto_detect_links"
            case channelId = "channel_id"
            case content
            case gifs
            case id
            case linkPreviews = "link_previews"
            case poll
            case replyingToMessageId = "replying_to_message_id"
        }
    }
}