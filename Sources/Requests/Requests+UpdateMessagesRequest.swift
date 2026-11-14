import Foundation

extension Requests {
    public struct UpdateMessagesRequest: Codable, Hashable, Sendable {
        /// Replacement attachment list; pass an empty list to remove attachments.
        public let attachments: [UpdateMessagesRequestAttachmentsItem]?
        /// Replacement Markdown content.
        public let content: String?
        /// Up to 10 GIFs to attach. URLs must use HTTPS on static.klipy.com, static1.klipy.com, or static2.klipy.com. Omit to preserve on edit; an empty list clears them.
        public let gifs: [UpdateMessagesRequestGifsItem]?
        /// Replacement preview URLs; pass an empty list to remove previews.
        public let linkPreviews: [UpdateMessagesRequestLinkPreviewsItem]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            attachments: [UpdateMessagesRequestAttachmentsItem]? = nil,
            content: String? = nil,
            gifs: [UpdateMessagesRequestGifsItem]? = nil,
            linkPreviews: [UpdateMessagesRequestLinkPreviewsItem]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.attachments = attachments
            self.content = content
            self.gifs = gifs
            self.linkPreviews = linkPreviews
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.attachments = try container.decodeIfPresent([UpdateMessagesRequestAttachmentsItem].self, forKey: .attachments)
            self.content = try container.decodeIfPresent(String.self, forKey: .content)
            self.gifs = try container.decodeIfPresent([UpdateMessagesRequestGifsItem].self, forKey: .gifs)
            self.linkPreviews = try container.decodeIfPresent([UpdateMessagesRequestLinkPreviewsItem].self, forKey: .linkPreviews)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.attachments, forKey: .attachments)
            try container.encodeIfPresent(self.content, forKey: .content)
            try container.encodeIfPresent(self.gifs, forKey: .gifs)
            try container.encodeIfPresent(self.linkPreviews, forKey: .linkPreviews)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case attachments
            case content
            case gifs
            case linkPreviews = "link_previews"
        }
    }
}