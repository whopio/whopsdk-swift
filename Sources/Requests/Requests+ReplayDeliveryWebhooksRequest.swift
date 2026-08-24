import Foundation

extension Requests {
    public struct ReplayDeliveryWebhooksRequest: Codable, Hashable, Sendable {
        /// Re-send the delivery under a freshly generated `webhook-id` (in both the envelope and the signed headers) instead of the original one. Defaults to false. Use this when your endpoint deduplicates on `webhook-id` and you want it to process the replay as a new message.
        public let regenerateId: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            regenerateId: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.regenerateId = regenerateId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.regenerateId = try container.decodeIfPresent(Bool.self, forKey: .regenerateId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.regenerateId, forKey: .regenerateId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case regenerateId = "regenerate_id"
        }
    }
}