import Foundation

extension Requests {
    public struct UpdateMessagesRequest: Codable, Hashable, Sendable {
        /// A replacement list of file attachments for this message, such as images or videos.
        public let attachments: Nullable<[UpdateMessagesRequestAttachmentsItem]>?
        /// The updated body of the message in Markdown format. For example, 'Hello **world**'.
        public let content: Nullable<String>?
        /// Whether this message should be pinned to the top of the channel.
        public let isPinned: Nullable<Bool>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            attachments: Nullable<[UpdateMessagesRequestAttachmentsItem]>? = nil,
            content: Nullable<String>? = nil,
            isPinned: Nullable<Bool>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.attachments = attachments
            self.content = content
            self.isPinned = isPinned
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.attachments = try container.decodeNullableIfPresent([UpdateMessagesRequestAttachmentsItem].self, forKey: .attachments)
            self.content = try container.decodeNullableIfPresent(String.self, forKey: .content)
            self.isPinned = try container.decodeNullableIfPresent(Bool.self, forKey: .isPinned)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.attachments, forKey: .attachments)
            try container.encodeNullableIfPresent(self.content, forKey: .content)
            try container.encodeNullableIfPresent(self.isPinned, forKey: .isPinned)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case attachments
            case content
            case isPinned = "is_pinned"
        }
    }
}