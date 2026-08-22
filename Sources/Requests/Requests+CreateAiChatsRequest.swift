import Foundation

extension Requests {
    public struct CreateAiChatsRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the company to set as context for the AI chat (e.g., "biz_XXXXX").
        public let currentCompanyId: Nullable<String>?
        /// A list of previously uploaded file attachments to include with the first message.
        public let messageAttachments: Nullable<[CreateAiChatsRequestMessageAttachmentsItem]>?
        /// The source of the message.
        public let messageSource: Nullable<AiChatMessageSourceTypes>?
        /// The text content of the first message to send to the AI agent.
        public let messageText: String
        /// The type of suggestion prompt that was clicked, when message_source is 'suggestion'.
        public let suggestionType: Nullable<String>?
        /// An optional display title for the AI chat thread (e.g., "Help with billing").
        public let title: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            currentCompanyId: Nullable<String>? = nil,
            messageAttachments: Nullable<[CreateAiChatsRequestMessageAttachmentsItem]>? = nil,
            messageSource: Nullable<AiChatMessageSourceTypes>? = nil,
            messageText: String,
            suggestionType: Nullable<String>? = nil,
            title: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.currentCompanyId = currentCompanyId
            self.messageAttachments = messageAttachments
            self.messageSource = messageSource
            self.messageText = messageText
            self.suggestionType = suggestionType
            self.title = title
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.currentCompanyId = try container.decodeNullableIfPresent(String.self, forKey: .currentCompanyId)
            self.messageAttachments = try container.decodeNullableIfPresent([CreateAiChatsRequestMessageAttachmentsItem].self, forKey: .messageAttachments)
            self.messageSource = try container.decodeNullableIfPresent(AiChatMessageSourceTypes.self, forKey: .messageSource)
            self.messageText = try container.decode(String.self, forKey: .messageText)
            self.suggestionType = try container.decodeNullableIfPresent(String.self, forKey: .suggestionType)
            self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.currentCompanyId, forKey: .currentCompanyId)
            try container.encodeNullableIfPresent(self.messageAttachments, forKey: .messageAttachments)
            try container.encodeNullableIfPresent(self.messageSource, forKey: .messageSource)
            try container.encode(self.messageText, forKey: .messageText)
            try container.encodeNullableIfPresent(self.suggestionType, forKey: .suggestionType)
            try container.encodeNullableIfPresent(self.title, forKey: .title)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case currentCompanyId = "current_company_id"
            case messageAttachments = "message_attachments"
            case messageSource = "message_source"
            case messageText = "message_text"
            case suggestionType = "suggestion_type"
            case title
        }
    }
}