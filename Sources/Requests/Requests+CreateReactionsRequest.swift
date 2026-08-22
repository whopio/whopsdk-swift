import Foundation

extension Requests {
    public struct CreateReactionsRequest: Codable, Hashable, Sendable {
        /// The emoji to react with, in shortcode or unicode format. For example, ':heart:' or a unicode emoji. Ignored in forums where reactions are always likes.
        public let emoji: Nullable<String>?
        /// The unique identifier of a poll option to vote for. Only valid when the target message or post contains a poll.
        public let pollOptionId: Nullable<String>?
        /// The unique identifier of the message or forum post to react to.
        public let resourceId: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            emoji: Nullable<String>? = nil,
            pollOptionId: Nullable<String>? = nil,
            resourceId: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.emoji = emoji
            self.pollOptionId = pollOptionId
            self.resourceId = resourceId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.emoji = try container.decodeNullableIfPresent(String.self, forKey: .emoji)
            self.pollOptionId = try container.decodeNullableIfPresent(String.self, forKey: .pollOptionId)
            self.resourceId = try container.decode(String.self, forKey: .resourceId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.emoji, forKey: .emoji)
            try container.encodeNullableIfPresent(self.pollOptionId, forKey: .pollOptionId)
            try container.encode(self.resourceId, forKey: .resourceId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case emoji
            case pollOptionId = "poll_option_id"
            case resourceId = "resource_id"
        }
    }
}