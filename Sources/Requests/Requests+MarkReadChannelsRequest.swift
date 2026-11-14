import Foundation

extension Requests {
    public struct MarkReadChannelsRequest: Codable, Hashable, Sendable {
        /// Required for DM-backed kinds; not accepted for experience.
        public let lastViewedAt: Date?
        /// Messages actually seen in this channel. Optional for all channel kinds; up to 100 IDs. Omitted or empty records no message views. Experience view counts update asynchronously.
        public let viewedMessageIds: [String]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            lastViewedAt: Date? = nil,
            viewedMessageIds: [String]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.lastViewedAt = lastViewedAt
            self.viewedMessageIds = viewedMessageIds
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.lastViewedAt = try container.decodeIfPresent(Date.self, forKey: .lastViewedAt)
            self.viewedMessageIds = try container.decodeIfPresent([String].self, forKey: .viewedMessageIds)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.lastViewedAt, forKey: .lastViewedAt)
            try container.encodeIfPresent(self.viewedMessageIds, forKey: .viewedMessageIds)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case lastViewedAt = "last_viewed_at"
            case viewedMessageIds = "viewed_message_ids"
        }
    }
}