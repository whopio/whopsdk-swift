import Foundation

extension Requests {
    public struct TestWebhooksRequest: Codable, Hashable, Sendable {
        /// The event to test the webhook for, in dot form (for example `payment.succeeded`).
        public let event: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            event: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.event = event
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.event = try container.decode(String.self, forKey: .event)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.event, forKey: .event)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case event
        }
    }
}