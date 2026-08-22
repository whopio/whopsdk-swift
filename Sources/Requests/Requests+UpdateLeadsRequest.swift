import Foundation

extension Requests {
    public struct UpdateLeadsRequest: Codable, Hashable, Sendable {
        /// A JSON object of custom metadata to set on the lead, replacing any existing metadata.
        public let metadata: Nullable<[String: JSONValue]>?
        /// The updated referral URL for the lead, such as 'https://example.com/landing'.
        public let referrer: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            metadata: Nullable<[String: JSONValue]>? = nil,
            referrer: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.metadata = metadata
            self.referrer = referrer
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.metadata = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .metadata)
            self.referrer = try container.decodeNullableIfPresent(String.self, forKey: .referrer)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.referrer, forKey: .referrer)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case metadata
            case referrer
        }
    }
}