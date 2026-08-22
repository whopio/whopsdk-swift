import Foundation

extension Requests {
    public struct AddFreeDaysMembershipRequest: Codable, Hashable, Sendable {
        /// The number of free days to add (1-1095). Extends the billing period, expiration date, or Stripe trial depending on plan type.
        public let freeDays: Int
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            freeDays: Int,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.freeDays = freeDays
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.freeDays = try container.decode(Int.self, forKey: .freeDays)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.freeDays, forKey: .freeDays)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case freeDays = "free_days"
        }
    }
}