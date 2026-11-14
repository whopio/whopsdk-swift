import Foundation

extension Requests {
    public struct ReactMessagesRequest: Codable, Hashable, Sendable {
        /// A single Unicode emoji or a supported shortcode such as `:heart:`.
        public let emoji: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            emoji: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.emoji = emoji
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.emoji = try container.decode(String.self, forKey: .emoji)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.emoji, forKey: .emoji)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case emoji
        }
    }
}