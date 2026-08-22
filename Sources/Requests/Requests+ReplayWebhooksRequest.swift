import Foundation

extension Requests {
    public struct ReplayWebhooksRequest: Codable, Hashable, Sendable {
        /// Only replay these event types, in dot form (for example `payment.succeeded`). Omit to include every event.
        public let events: [String]?
        /// Only replay messages whose most recent delivery attempt in the window failed. Defaults to false. Best-effort: a message whose attempts span processing batches can still be re-sent — replays keep the original `webhook-id` by default, so consumers that deduplicate are unaffected.
        public let failedOnly: Bool?
        /// Re-send each replayed message under a freshly generated `webhook-id` (in both the envelope and the signed headers) instead of its original one. Defaults to false. Use this when your endpoint deduplicates on `webhook-id` and you want it to process the replays as new messages.
        public let regenerateIds: Bool?
        /// Start of the delivery window to replay, as an ISO 8601 timestamp. Clamped to the 30-day delivery retention.
        public let sentAfter: String
        /// End of the delivery window to replay, as an ISO 8601 timestamp. Defaults to now.
        public let sentBefore: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            events: [String]? = nil,
            failedOnly: Bool? = nil,
            regenerateIds: Bool? = nil,
            sentAfter: String,
            sentBefore: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.events = events
            self.failedOnly = failedOnly
            self.regenerateIds = regenerateIds
            self.sentAfter = sentAfter
            self.sentBefore = sentBefore
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.events = try container.decodeIfPresent([String].self, forKey: .events)
            self.failedOnly = try container.decodeIfPresent(Bool.self, forKey: .failedOnly)
            self.regenerateIds = try container.decodeIfPresent(Bool.self, forKey: .regenerateIds)
            self.sentAfter = try container.decode(String.self, forKey: .sentAfter)
            self.sentBefore = try container.decodeIfPresent(String.self, forKey: .sentBefore)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.events, forKey: .events)
            try container.encodeIfPresent(self.failedOnly, forKey: .failedOnly)
            try container.encodeIfPresent(self.regenerateIds, forKey: .regenerateIds)
            try container.encode(self.sentAfter, forKey: .sentAfter)
            try container.encodeIfPresent(self.sentBefore, forKey: .sentBefore)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case events
            case failedOnly = "failed_only"
            case regenerateIds = "regenerate_ids"
            case sentAfter = "sent_after"
            case sentBefore = "sent_before"
        }
    }
}