import Foundation

extension Requests {
    public struct ReactivateMembershipsRequest: Codable, Hashable, Sendable {
        /// Days of access from now (1-1095), which sets `current_period_end`. Omit to keep the original `current_period_end`; required once it has passed. Ignored for lifetime memberships.
        public let days: Int?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            days: Int? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.days = days
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.days = try container.decodeIfPresent(Int.self, forKey: .days)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.days, forKey: .days)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case days
        }
    }
}