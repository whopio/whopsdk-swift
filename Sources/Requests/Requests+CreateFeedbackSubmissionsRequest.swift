import Foundation

extension Requests {
    public struct CreateFeedbackSubmissionsRequest: Codable, Hashable, Sendable {
        /// The ID of the account the feedback is about (biz_...), if any. Recorded as context only; it does not require or grant access to that account.
        public let accountId: String?
        /// The problem or question in plain text, with enough context to act on. Leave out credentials, personal data, and payment details.
        public let content: String
        /// What kind of submission this is. Use api_report_feedback for an issue or api_ask_question for an unanswered question. The other values are reserved for Whop's own clients: the hosted MCP server, the Whop CLI, and Whop AI chat.
        public let source: CreateFeedbackSubmissionsRequestSource
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            content: String,
            source: CreateFeedbackSubmissionsRequestSource,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.content = content
            self.source = source
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.content = try container.decode(String.self, forKey: .content)
            self.source = try container.decode(CreateFeedbackSubmissionsRequestSource.self, forKey: .source)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encode(self.content, forKey: .content)
            try container.encode(self.source, forKey: .source)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case content
            case source
        }
    }
}