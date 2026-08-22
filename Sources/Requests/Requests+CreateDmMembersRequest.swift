import Foundation

extension Requests {
    public struct CreateDmMembersRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the DM channel to add the new member to.
        public let channelId: String
        /// The unique identifier of the user to add to the DM channel. For example, 'user_xxxxx'.
        public let userId: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            channelId: String,
            userId: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.channelId = channelId
            self.userId = userId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.channelId = try container.decode(String.self, forKey: .channelId)
            self.userId = try container.decode(String.self, forKey: .userId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.channelId, forKey: .channelId)
            try container.encode(self.userId, forKey: .userId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case channelId = "channel_id"
            case userId = "user_id"
        }
    }
}