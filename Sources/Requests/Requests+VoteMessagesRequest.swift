import Foundation

extension Requests {
    public struct VoteMessagesRequest: Codable, Hashable, Sendable {
        /// The option ID from the poll, not its display text.
        public let pollOptionId: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            pollOptionId: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.pollOptionId = pollOptionId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.pollOptionId = try container.decode(String.self, forKey: .pollOptionId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.pollOptionId, forKey: .pollOptionId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case pollOptionId = "poll_option_id"
        }
    }
}