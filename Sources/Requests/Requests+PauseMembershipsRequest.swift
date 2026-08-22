import Foundation

extension Requests {
    public struct PauseMembershipsRequest: Codable, Hashable, Sendable {
        /// ISO 8601 time to automatically resume payment collection. Must be in the future; only supported for memberships billed by Whop.
        public let until: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            until: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.until = until
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.until = try container.decodeIfPresent(String.self, forKey: .until)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.until, forKey: .until)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case until
        }
    }
}