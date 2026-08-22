import Foundation

extension Requests {
    public struct ExtendMembershipsRequest: Codable, Hashable, Sendable {
        /// Number of free days to add (1-1095).
        public let days: Int
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            days: Int,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.days = days
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.days = try container.decode(Int.self, forKey: .days)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.days, forKey: .days)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case days
        }
    }
}