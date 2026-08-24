import Foundation

extension Requests {
    public struct SetNotificationsRequest: Codable, Hashable, Sendable {
        /// The preferences to set, at most 100 per request.
        public let preferences: [SetNotificationsRequestPreferencesItem]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            preferences: [SetNotificationsRequestPreferencesItem],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.preferences = preferences
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.preferences = try container.decode([SetNotificationsRequestPreferencesItem].self, forKey: .preferences)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.preferences, forKey: .preferences)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case preferences
        }
    }
}